################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
Clock.o: C:/Users/Jpabusleme/Documents/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Clock.d_raw" -MT"Clock.o" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Dump.o: C:/Users/Jpabusleme/Documents/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/Dump.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Dump.d_raw" -MT"Dump.o" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.s $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: C:/Users/Jpabusleme/Documents/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"LaunchPad.d_raw" -MT"LaunchPad.o" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Timer.o: C:/Users/Jpabusleme/Documents/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/Timer.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Timer.d_raw" -MT"Timer.o" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UART.o: C:/Users/Jpabusleme/Documents/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/UART.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"UART.d_raw" -MT"UART.o" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UARTbusywait.o: C:/Users/Jpabusleme/Documents/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/UARTbusywait.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"UARTbusywait.d_raw" -MT"UARTbusywait.o" -I"C:/Users/Jpabusleme/Documents/UT AUSTIN/Spring 2025/319K/Valvanoware/ECE319K_Lab2H/Debug/syscfg" -std=c99 $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


