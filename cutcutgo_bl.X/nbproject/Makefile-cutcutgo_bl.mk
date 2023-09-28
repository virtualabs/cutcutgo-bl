#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-cutcutgo_bl.mk)" "nbproject/Makefile-local-cutcutgo_bl.mk"
include nbproject/Makefile-local-cutcutgo_bl.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=cutcutgo_bl
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/config/pic32mx470_curiosity/bsp/bsp.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c src/config/pic32mx470_curiosity/stdio/xc32_monitor.c src/config/pic32mx470_curiosity/system/int/src/sys_int.c src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c src/config/pic32mx470_curiosity/usb/src/usb_device.c src/config/pic32mx470_curiosity/initialization.c src/config/pic32mx470_curiosity/interrupts.c src/config/pic32mx470_curiosity/exceptions.c src/config/pic32mx470_curiosity/usb_device_init_data.c src/config/pic32mx470_curiosity/tasks.c src/main.c src/app.c src/fat12.c src/buttons.c src/led.c src/reset.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/app.o ${OBJECTDIR}/src/fat12.o ${OBJECTDIR}/src/buttons.o ${OBJECTDIR}/src/led.o ${OBJECTDIR}/src/reset.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/app.o.d ${OBJECTDIR}/src/fat12.o.d ${OBJECTDIR}/src/buttons.o.d ${OBJECTDIR}/src/led.o.d ${OBJECTDIR}/src/reset.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/app.o ${OBJECTDIR}/src/fat12.o ${OBJECTDIR}/src/buttons.o ${OBJECTDIR}/src/led.o ${OBJECTDIR}/src/reset.o

# Source Files
SOURCEFILES=src/config/pic32mx470_curiosity/bsp/bsp.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c src/config/pic32mx470_curiosity/stdio/xc32_monitor.c src/config/pic32mx470_curiosity/system/int/src/sys_int.c src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c src/config/pic32mx470_curiosity/usb/src/usb_device.c src/config/pic32mx470_curiosity/initialization.c src/config/pic32mx470_curiosity/interrupts.c src/config/pic32mx470_curiosity/exceptions.c src/config/pic32mx470_curiosity/usb_device_init_data.c src/config/pic32mx470_curiosity/tasks.c src/main.c src/app.c src/fat12.c src/buttons.c src/led.c src/reset.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-cutcutgo_bl.mk ${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX470F512L
MP_LINKER_FILE_OPTION=,--script="src/config/pic32mx470_curiosity/p32MX470F512H.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o: src/config/pic32mx470_curiosity/bsp/bsp.c  .generated_files/flags/cutcutgo_bl/ca4b4304f508ab01e4bb2239c1d280ec359dc169 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o src/config/pic32mx470_curiosity/bsp/bsp.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c  .generated_files/flags/cutcutgo_bl/40eacaa54e53267a5a2cbb6f9624e42f335f057f .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c  .generated_files/flags/cutcutgo_bl/467a55bf0478f765f68032ae9a3bc50a31cba71d .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/cutcutgo_bl/dae707985ac1703e6aaef1fd4223b82dcb96f623 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/cutcutgo_bl/e7a8592694f48083fb5ee75a5d61834aeed78673 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o: src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c  .generated_files/flags/cutcutgo_bl/b7dc64215298e8074d76a42be50ad0b10162f4d0 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o: src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c  .generated_files/flags/cutcutgo_bl/575a10375f5ba329fadd960c25cde84cdddd6d8 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o: src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c  .generated_files/flags/cutcutgo_bl/f0019cc8dee821fe930d406af4c725107448f79d .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o: src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c  .generated_files/flags/cutcutgo_bl/fa4a246d60fffeaa03118cd7a5f690b67a0a483c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o: src/config/pic32mx470_curiosity/stdio/xc32_monitor.c  .generated_files/flags/cutcutgo_bl/4a55e8c0b03ce50561c905b7f45d59a2d7e9882e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o src/config/pic32mx470_curiosity/stdio/xc32_monitor.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o: src/config/pic32mx470_curiosity/system/int/src/sys_int.c  .generated_files/flags/cutcutgo_bl/d59828e4846b1cc3c383e6dd24de9514dacf2950 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o src/config/pic32mx470_curiosity/system/int/src/sys_int.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o: src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c  .generated_files/flags/cutcutgo_bl/cc522f9b8d48bb1beb1bfa126e378b1e9a6397cc .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o: src/config/pic32mx470_curiosity/usb/src/usb_device.c  .generated_files/flags/cutcutgo_bl/97b0f0ecd05f5d45c9340c69ef0beb37e7eea5bf .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o src/config/pic32mx470_curiosity/usb/src/usb_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o: src/config/pic32mx470_curiosity/initialization.c  .generated_files/flags/cutcutgo_bl/4869a2ae5ef930e2aec3cef5b58f592c830130b .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o src/config/pic32mx470_curiosity/initialization.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o: src/config/pic32mx470_curiosity/interrupts.c  .generated_files/flags/cutcutgo_bl/6c289420365e550b936a78c7da235c86924ed490 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o src/config/pic32mx470_curiosity/interrupts.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o: src/config/pic32mx470_curiosity/exceptions.c  .generated_files/flags/cutcutgo_bl/ba3e97d5aceb86a39b446c2c6a999aa5c79b661e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o src/config/pic32mx470_curiosity/exceptions.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o: src/config/pic32mx470_curiosity/usb_device_init_data.c  .generated_files/flags/cutcutgo_bl/323cc26a1642dd01ad8ea4d4abd83cd15379c27b .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o src/config/pic32mx470_curiosity/usb_device_init_data.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o: src/config/pic32mx470_curiosity/tasks.c  .generated_files/flags/cutcutgo_bl/aae80799b2787f4ccb7508d81539a32e81027b8 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o src/config/pic32mx470_curiosity/tasks.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/cutcutgo_bl/690957c04ef0402c9ad6aec7937ebcac67c09be9 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/app.o: src/app.c  .generated_files/flags/cutcutgo_bl/7f25352db26a1ba2046092706ba78b917e4e139 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/app.o.d 
	@${RM} ${OBJECTDIR}/src/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/app.o.d" -o ${OBJECTDIR}/src/app.o src/app.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/fat12.o: src/fat12.c  .generated_files/flags/cutcutgo_bl/da6b6a15e1f4de888a1c200e22aa9fdb1c2bfbb4 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fat12.o.d 
	@${RM} ${OBJECTDIR}/src/fat12.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/fat12.o.d" -o ${OBJECTDIR}/src/fat12.o src/fat12.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/buttons.o: src/buttons.c  .generated_files/flags/cutcutgo_bl/b631d90db256e67796e3ddf044c11fadfcad6e61 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/buttons.o.d 
	@${RM} ${OBJECTDIR}/src/buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/buttons.o.d" -o ${OBJECTDIR}/src/buttons.o src/buttons.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/led.o: src/led.c  .generated_files/flags/cutcutgo_bl/c370705d39cf9ab380099244a7216bfbd9e5044 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/led.o.d 
	@${RM} ${OBJECTDIR}/src/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/led.o.d" -o ${OBJECTDIR}/src/led.o src/led.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/reset.o: src/reset.c  .generated_files/flags/cutcutgo_bl/8ef9488bceb7b337114d8b35a993fe8c4d5bdf25 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/reset.o.d 
	@${RM} ${OBJECTDIR}/src/reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/reset.o.d" -o ${OBJECTDIR}/src/reset.o src/reset.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o: src/config/pic32mx470_curiosity/bsp/bsp.c  .generated_files/flags/cutcutgo_bl/f57c85fb398c4c30359b664871f9c7b055744439 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o src/config/pic32mx470_curiosity/bsp/bsp.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c  .generated_files/flags/cutcutgo_bl/c6c86087ae4ffba0535fe881e7e721f527a49713 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c  .generated_files/flags/cutcutgo_bl/11e4390545f9fb62003519fb032f7f9c1851c803 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/cutcutgo_bl/5186b60f23eb0cb4c3cf11fd289fb3a8239c170 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/cutcutgo_bl/67179f424a71c4bd8a7e46a57752f4c472653781 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o: src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c  .generated_files/flags/cutcutgo_bl/d45acd0b179de488aac8866c6b6adda0728b7c09 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o: src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c  .generated_files/flags/cutcutgo_bl/85f60c661a00581ef014701130da6b1871230684 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o: src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c  .generated_files/flags/cutcutgo_bl/84e4a86aec402f2946408458f1fefd7d7ec0c209 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o: src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c  .generated_files/flags/cutcutgo_bl/116c3aaacff9bf1031bc4bd52305e30bd45fc94 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o: src/config/pic32mx470_curiosity/stdio/xc32_monitor.c  .generated_files/flags/cutcutgo_bl/a8247d0063088c2f8b92dda55129d74f8107d42c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o src/config/pic32mx470_curiosity/stdio/xc32_monitor.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o: src/config/pic32mx470_curiosity/system/int/src/sys_int.c  .generated_files/flags/cutcutgo_bl/6d1446593aac3da6a647a929e71935def4cca42f .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o src/config/pic32mx470_curiosity/system/int/src/sys_int.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o: src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c  .generated_files/flags/cutcutgo_bl/b4884e139f5b241ccc44711a3e20696ff5daad98 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o: src/config/pic32mx470_curiosity/usb/src/usb_device.c  .generated_files/flags/cutcutgo_bl/acc0ad6ae3873741c24d1041a7244bbb57fc64e2 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o src/config/pic32mx470_curiosity/usb/src/usb_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o: src/config/pic32mx470_curiosity/initialization.c  .generated_files/flags/cutcutgo_bl/72ed0dbe904c21dd082630324bcf90709ebe5491 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o src/config/pic32mx470_curiosity/initialization.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o: src/config/pic32mx470_curiosity/interrupts.c  .generated_files/flags/cutcutgo_bl/b3b8ebf917cd2da1c0749a52660cb53cc9a69bab .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o src/config/pic32mx470_curiosity/interrupts.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o: src/config/pic32mx470_curiosity/exceptions.c  .generated_files/flags/cutcutgo_bl/c702ef943cd4bfae8cd937225d99ff0859db9f5e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o src/config/pic32mx470_curiosity/exceptions.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o: src/config/pic32mx470_curiosity/usb_device_init_data.c  .generated_files/flags/cutcutgo_bl/4812dc313d09c36bb340aa4396e02a489f60ed54 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o src/config/pic32mx470_curiosity/usb_device_init_data.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o: src/config/pic32mx470_curiosity/tasks.c  .generated_files/flags/cutcutgo_bl/a2bff123ab4e1901bafcd10f486dd40cefbd70af .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o src/config/pic32mx470_curiosity/tasks.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/cutcutgo_bl/77b77c8ecffcdc1b0cdca596a069b0cdd795bd13 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/app.o: src/app.c  .generated_files/flags/cutcutgo_bl/8cb782166a57028534ae3f49369ea5a0df83385c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/app.o.d 
	@${RM} ${OBJECTDIR}/src/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/app.o.d" -o ${OBJECTDIR}/src/app.o src/app.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/fat12.o: src/fat12.c  .generated_files/flags/cutcutgo_bl/872f3a57c3c8f5c25fd68c11ae4b6341ffcb04bf .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fat12.o.d 
	@${RM} ${OBJECTDIR}/src/fat12.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/fat12.o.d" -o ${OBJECTDIR}/src/fat12.o src/fat12.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/buttons.o: src/buttons.c  .generated_files/flags/cutcutgo_bl/7d63c698bfc47ea867c107c60a1640644ae8d82e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/buttons.o.d 
	@${RM} ${OBJECTDIR}/src/buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/buttons.o.d" -o ${OBJECTDIR}/src/buttons.o src/buttons.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/led.o: src/led.c  .generated_files/flags/cutcutgo_bl/2d594f15e9dcad433c6e1c709d06ad84aecafcae .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/led.o.d 
	@${RM} ${OBJECTDIR}/src/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/led.o.d" -o ${OBJECTDIR}/src/led.o src/led.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/reset.o: src/reset.c  .generated_files/flags/cutcutgo_bl/4788dab74009052e7fc062a3f9fdde041b07103c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/reset.o.d 
	@${RM} ${OBJECTDIR}/src/reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/reset.o.d" -o ${OBJECTDIR}/src/reset.o src/reset.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    src/config/pic32mx470_curiosity/p32MX470F512H.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC0275F  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   src/config/pic32mx470_curiosity/p32MX470F512H.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/cutcutgo_bl.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}
