################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../Generated_Code/Cpu.c" \
"../Generated_Code/canCom1.c" \
"../Generated_Code/can_pal1.c" \
"../Generated_Code/clockMan1.c" \
"../Generated_Code/dmaController1.c" \
"../Generated_Code/flexTimer_ic1.c" \
"../Generated_Code/flexTimer_pwm1.c" \
"../Generated_Code/lpit1.c" \
"../Generated_Code/lpuart1.c" \
"../Generated_Code/pin_mux.c" \

C_SRCS += \
../Generated_Code/Cpu.c \
../Generated_Code/canCom1.c \
../Generated_Code/can_pal1.c \
../Generated_Code/clockMan1.c \
../Generated_Code/dmaController1.c \
../Generated_Code/flexTimer_ic1.c \
../Generated_Code/flexTimer_pwm1.c \
../Generated_Code/lpit1.c \
../Generated_Code/lpuart1.c \
../Generated_Code/pin_mux.c \

OBJS_OS_FORMAT += \
./Generated_Code/Cpu.o \
./Generated_Code/canCom1.o \
./Generated_Code/can_pal1.o \
./Generated_Code/clockMan1.o \
./Generated_Code/dmaController1.o \
./Generated_Code/flexTimer_ic1.o \
./Generated_Code/flexTimer_pwm1.o \
./Generated_Code/lpit1.o \
./Generated_Code/lpuart1.o \
./Generated_Code/pin_mux.o \

C_DEPS_QUOTED += \
"./Generated_Code/Cpu.d" \
"./Generated_Code/canCom1.d" \
"./Generated_Code/can_pal1.d" \
"./Generated_Code/clockMan1.d" \
"./Generated_Code/dmaController1.d" \
"./Generated_Code/flexTimer_ic1.d" \
"./Generated_Code/flexTimer_pwm1.d" \
"./Generated_Code/lpit1.d" \
"./Generated_Code/lpuart1.d" \
"./Generated_Code/pin_mux.d" \

OBJS += \
./Generated_Code/Cpu.o \
./Generated_Code/canCom1.o \
./Generated_Code/can_pal1.o \
./Generated_Code/clockMan1.o \
./Generated_Code/dmaController1.o \
./Generated_Code/flexTimer_ic1.o \
./Generated_Code/flexTimer_pwm1.o \
./Generated_Code/lpit1.o \
./Generated_Code/lpuart1.o \
./Generated_Code/pin_mux.o \

OBJS_QUOTED += \
"./Generated_Code/Cpu.o" \
"./Generated_Code/canCom1.o" \
"./Generated_Code/can_pal1.o" \
"./Generated_Code/clockMan1.o" \
"./Generated_Code/dmaController1.o" \
"./Generated_Code/flexTimer_ic1.o" \
"./Generated_Code/flexTimer_pwm1.o" \
"./Generated_Code/lpit1.o" \
"./Generated_Code/lpuart1.o" \
"./Generated_Code/pin_mux.o" \

C_DEPS += \
./Generated_Code/Cpu.d \
./Generated_Code/canCom1.d \
./Generated_Code/can_pal1.d \
./Generated_Code/clockMan1.d \
./Generated_Code/dmaController1.d \
./Generated_Code/flexTimer_ic1.d \
./Generated_Code/flexTimer_pwm1.d \
./Generated_Code/lpit1.d \
./Generated_Code/lpuart1.d \
./Generated_Code/pin_mux.d \


# Each subdirectory must supply rules for building sources it contributes
Generated_Code/Cpu.o: ../Generated_Code/Cpu.c
	@echo 'Building file: $<'
	@echo 'Executing target #1 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/Cpu.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/Cpu.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/canCom1.o: ../Generated_Code/canCom1.c
	@echo 'Building file: $<'
	@echo 'Executing target #2 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/canCom1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/canCom1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/can_pal1.o: ../Generated_Code/can_pal1.c
	@echo 'Building file: $<'
	@echo 'Executing target #3 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/can_pal1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/can_pal1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/clockMan1.o: ../Generated_Code/clockMan1.c
	@echo 'Building file: $<'
	@echo 'Executing target #4 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/clockMan1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/clockMan1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/dmaController1.o: ../Generated_Code/dmaController1.c
	@echo 'Building file: $<'
	@echo 'Executing target #5 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/dmaController1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/dmaController1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/flexTimer_ic1.o: ../Generated_Code/flexTimer_ic1.c
	@echo 'Building file: $<'
	@echo 'Executing target #6 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/flexTimer_ic1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/flexTimer_ic1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/flexTimer_pwm1.o: ../Generated_Code/flexTimer_pwm1.c
	@echo 'Building file: $<'
	@echo 'Executing target #7 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/flexTimer_pwm1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/flexTimer_pwm1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/lpit1.o: ../Generated_Code/lpit1.c
	@echo 'Building file: $<'
	@echo 'Executing target #8 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/lpit1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/lpit1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/lpuart1.o: ../Generated_Code/lpuart1.c
	@echo 'Building file: $<'
	@echo 'Executing target #9 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/lpuart1.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/lpuart1.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Generated_Code/pin_mux.o: ../Generated_Code/pin_mux.c
	@echo 'Building file: $<'
	@echo 'Executing target #10 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Generated_Code/pin_mux.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Generated_Code/pin_mux.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


