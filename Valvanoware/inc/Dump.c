// Dump.c
// Your solution to ECE319K Lab 3 Spring 2025
// Author: Juan Abusleme
// Last Modified: February 9th, 2025


//#include <algorithm>
#include <ti/devices/msp/msp.h>
#include "../inc/Timer.h"
#define MAXBUF 50
uint32_t DataBuffer[MAXBUF];
uint32_t TimeBuffer[MAXBUF];
uint32_t DebugCnt; // 0 to MAXBUF (0 is empty, MAXBUF is full)

// *****Debug_Init******
// Initializes your index or pointer.
// Input: none
// Output:none
void Debug_Init(void){
// students write this for Lab 3
// This function should also initialize Timer G12, call TimerG12_Init.
  TimerG12_Init();
  for(int i = 0; i < MAXBUF; i++)
  {
    DataBuffer[i] = 0;
    TimeBuffer[i] = 0;
  }
  DebugCnt = 0;
 
}


// *****Debug_Dump******
// Records one data and one time into the two arrays.
// Input: data is value to store in DataBuffer
// Output: 1 for success, 0 for failure (buffers full)
uint32_t Debug_Dump(uint32_t data){
// students write this for Lab 3
// The software simply reads TIMG12->COUNTERREGS.CTR to get the current time in bus cycles.
  
  if(DebugCnt >= MAXBUF)
  {
    return 0;
  }
  uint32_t time = TIMG12->COUNTERREGS.CTR;
  DataBuffer[DebugCnt] = data;
  TimeBuffer[DebugCnt] = time;
  DebugCnt++;

  return 1; // success
}
// *****Debug_Dump2******
// Always record data and time on the first call to Debug_Dump2
// However, after the first call
//    Records one data and one time into the two arrays, only if the data is different from the previous call.
//    Do not record data or time if the data is the same as the data from the previous call
// Input: data is value to store in DataBuffer
// Output: 1 for success (saved or skipped), 0 for failure (buffers full)
uint32_t Debug_Dump2(uint32_t data){
// students write this for Lab 3
// The software simply reads TIMG12->COUNTERREGS.CTR to get the current time in bus cycles.
  if(DebugCnt >= MAXBUF)
  {
    return 0;
  }

  if(DebugCnt == 0)
  {
    uint32_t time = TIMG12->COUNTERREGS.CTR;
    DataBuffer[DebugCnt] = data;
    TimeBuffer[DebugCnt] = time;
    return 1;
  }

  if(data == DataBuffer[DebugCnt-1])
  {
    return 1;
  }
  uint32_t time = TIMG12->COUNTERREGS.CTR;
  DataBuffer[DebugCnt] = data;
  TimeBuffer[DebugCnt] = time;

  DebugCnt++;

  return 1; // success
}

// *****Debug_Period******
// Calculate period of the recorded data using mask
// Input: mask specifies which bit(s) to observe
// Output: period in bus cycles
// Period is defined as rising edge (low to high) to the next rising edge.
// Return 0 if there is not enough collected data to calculate period .
uint32_t Debug_Period(uint32_t mask){
// students write this for Lab 3
// This function should not alter the recorded data.
// AND each recorded data with mask,
//    if nonzero the signal is considered high.
//    if zero, the signal is considered low.
  uint32_t startPeriod = 0;
  uint32_t endPeriod = 0;
  uint32_t accumulatedPeriods = 0;
  uint32_t periodCnt = 0;
  _Bool wasRisingEdge = 0; // was there a rising edge before?
  _Bool isZeroBefore = 0; // was it 0 before?

  for(int i = 0; (i < DebugCnt) && (i < 50); i++)
  {

    uint32_t tempVal = DataBuffer[i];
    tempVal &= mask; // masks tempVal, which is the data we're reading

    if(tempVal > 0 && wasRisingEdge && isZeroBefore)
    {
      endPeriod = TimeBuffer[i]; // saving the end of the period only if it's a new rising edge
      accumulatedPeriods += startPeriod - endPeriod;
      periodCnt++;

      startPeriod = TimeBuffer[i];
      endPeriod = 0; // reset period
      isZeroBefore = 0;
    }

    else if(tempVal > 0 && isZeroBefore){ // so if first rising edge
      startPeriod = TimeBuffer[i];
      wasRisingEdge = 1;
      isZeroBefore = 0;
    }

    else if(tempVal == 0)
    {
      isZeroBefore = 1;
    }
  } 

  if(periodCnt == 0)
  {
    return 0;
  }
  //UART_OutString("\nPERIOD IN MS: "); UART_OutUDec((int) ((accumulatedPeriods/periodCnt)*12.5/1000000.0));

  return accumulatedPeriods/periodCnt; // average period
}


// *****Debug_Duty******
// Calculate duty cycle of the recorded data using mask
// Input: mask specifies which bit(s) to observe
// Output: period in percent (0 to 100)
// Period is defined as rising edge (low to high) to the next rising edge.
// High is defined as rising edge (low to high) to the next falling edge.
// Duty cycle is (100*High)/Period
// Return 0 if there is not enough collected data to calculate duty cycle.
uint32_t Debug_Duty(uint32_t mask){
// students write this for Lab 3
// This function should not alter the recorded data.
// AND each recorded data with mask,
//    if nonzero the signal is considered high.
//    if zero, the signal is considered low.

  uint32_t startPeriod = 0;
  uint32_t endPeriod = 0;
  uint32_t endPulse = 0;
  double accDuty = 0;
  uint32_t dutyCnt = 0;
  _Bool wasRisingEdge = 0; // was there a rising edge before?
  _Bool isZeroBefore = 1; // was it 0 before?
  double period = 0;
  double pulseWidth = 0;

  for(int i = 0; (i < DebugCnt) && (i < 50); i++)
  {

    uint32_t tempVal = DataBuffer[i];
    tempVal &= mask; // masks tempVal, which is the data we're reading

    if(tempVal > 0 && wasRisingEdge && isZeroBefore)
    {
      endPeriod = TimeBuffer[i]; // saving the end of the period only if it's a new rising edge
      period = (startPeriod - endPeriod)*12.5/1000000.0; // time of period in ms
      pulseWidth = (startPeriod-endPulse)*12.5/1000000.0;

      accDuty += 100*pulseWidth/period;

      dutyCnt++;

      startPeriod = TimeBuffer[i];
      endPeriod = 0; // reset period
      endPulse = 0; // just in case
      isZeroBefore = 0;
    }

    else if(tempVal > 0 && isZeroBefore){ // so if first rising edge
      startPeriod = TimeBuffer[i];
      wasRisingEdge = 1;
      isZeroBefore = 0;
    }

    else if(tempVal == 0 && !(isZeroBefore)) // falling edge
    {
      endPulse = TimeBuffer[i];
      isZeroBefore = 1;
    }

    else if(tempVal == 0)
    {
      isZeroBefore = 1;
    }
  } 
  startPeriod = 0;
  if(dutyCnt == 0)
  {
    return 0;
  }
  //printf("%d percent\n", accDuty);
  UART_OutString("\nDUTY IN PERCENT: "); UART_OutUDec((int) accDuty/dutyCnt);

  return accDuty/dutyCnt; // average duty cycle

}

// Lab2 specific debugging code
uint32_t Theperiod;
void Dump(void){
  uint32_t out = GPIOB->DOUT31_0&0x0070000; // PB18-PB16 outputs
  uint32_t in = GPIOB->DIN31_0&0x0F;        // PB3-PB0 inputs
  uint32_t data = out|in;                   // PB18-PB16, PB3-PB0
  uint32_t result = Debug_Dump(data);       // calls your Lab3 function
  if(result == 0){ // 0 means full
    Theperiod = Debug_Period(1<<16);        // calls your Lab3 function
   __asm volatile("bkpt; \n"); // breakpoint here
// observe Theperiod
  }
}




