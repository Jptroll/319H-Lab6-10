################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
Clock.o: G:/Other\ computers/My\ Laptop/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"Clock.d_raw" -MT"Clock.o" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: G:/Other\ computers/My\ Laptop/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"LaunchPad.d_raw" -MT"LaunchPad.o" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.s $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug/syscfg" $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

msp.o: G:/Other\ computers/My\ Laptop/UT\ AUSTIN/Spring\ 2025/319K/Valvanoware/inc/msp.s $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"C:/ti/ccs2000/ccs/tools/compiler/ti-cgt-armllvm_4.0.1.LTS/bin/tiarmclang.exe" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm" -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug" -I"C:/ti/mspm0_sdk_2_03_00_07/source/third_party/CMSIS/Core/Include" -I"C:/ti/mspm0_sdk_2_03_00_07/source" -D__MSPM0G3507__ -gdwarf-3 -I"G:/Other computers/My Laptop/UT AUSTIN/Spring 2025/319K/Valvanoware/NotGateAsm/Debug/syscfg" $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


