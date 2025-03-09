################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
Clock.o: G:/Other\ computers/My\ Laptop/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Clock.d_raw" -MT"Clock.o" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

I2C.o: G:/Other\ computers/My\ Laptop/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/I2C.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"I2C.d_raw" -MT"I2C.o" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: G:/Other\ computers/My\ Laptop/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"LaunchPad.d_raw" -MT"LaunchPad.o" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/I2C/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


