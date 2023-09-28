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
SOURCEFILES_QUOTED_IF_SPACED=src/config/pic32mx470_curiosity/bsp/bsp.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c src/config/pic32mx470_curiosity/stdio/xc32_monitor.c src/config/pic32mx470_curiosity/system/int/src/sys_int.c src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c src/config/pic32mx470_curiosity/usb/src/usb_device.c src/config/pic32mx470_curiosity/initialization.c src/config/pic32mx470_curiosity/interrupts.c src/config/pic32mx470_curiosity/exceptions.c src/config/pic32mx470_curiosity/usb_device_init_data.c src/config/pic32mx470_curiosity/tasks.c src/main.c src/app.c src/fat12.c src/buttons.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/app.o ${OBJECTDIR}/src/fat12.o ${OBJECTDIR}/src/buttons.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/app.o.d ${OBJECTDIR}/src/fat12.o.d ${OBJECTDIR}/src/buttons.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/app.o ${OBJECTDIR}/src/fat12.o ${OBJECTDIR}/src/buttons.o

# Source Files
SOURCEFILES=src/config/pic32mx470_curiosity/bsp/bsp.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c src/config/pic32mx470_curiosity/stdio/xc32_monitor.c src/config/pic32mx470_curiosity/system/int/src/sys_int.c src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c src/config/pic32mx470_curiosity/usb/src/usb_device.c src/config/pic32mx470_curiosity/initialization.c src/config/pic32mx470_curiosity/interrupts.c src/config/pic32mx470_curiosity/exceptions.c src/config/pic32mx470_curiosity/usb_device_init_data.c src/config/pic32mx470_curiosity/tasks.c src/main.c src/app.c src/fat12.c src/buttons.c



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
${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o: src/config/pic32mx470_curiosity/bsp/bsp.c  .generated_files/flags/cutcutgo_bl/a7e39fc88a2fbdaf3d7e679e5465caec65a08d22 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o src/config/pic32mx470_curiosity/bsp/bsp.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c  .generated_files/flags/cutcutgo_bl/e12f5fcd106041c9a0504d25e1a5ba6be21a8875 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c  .generated_files/flags/cutcutgo_bl/8ca6524bb224fb082aa826d38fa416f7b2bf1dc4 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/cutcutgo_bl/c0710276768431ce2b421e541bdd714e7c42798e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/cutcutgo_bl/46d52841fb8369441362039a7d316466048f2bea .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o: src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c  .generated_files/flags/cutcutgo_bl/8e617a3045e240cb1ac856743121b7ac10af593a .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o: src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c  .generated_files/flags/cutcutgo_bl/f3cdbf35be787ba26bcd646e8d6c21506e194098 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o: src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c  .generated_files/flags/cutcutgo_bl/b0f88191013cc01debe391ab24e8aeb7ea4c1386 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o: src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c  .generated_files/flags/cutcutgo_bl/c924832058fcef8089123d6aef87cd4704a448fc .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o: src/config/pic32mx470_curiosity/stdio/xc32_monitor.c  .generated_files/flags/cutcutgo_bl/966d914907141d3731accae64e359a6aa6b33866 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o src/config/pic32mx470_curiosity/stdio/xc32_monitor.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o: src/config/pic32mx470_curiosity/system/int/src/sys_int.c  .generated_files/flags/cutcutgo_bl/4f20eecb8cdc2025af57c58b073340b2ee1b3d8b .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o src/config/pic32mx470_curiosity/system/int/src/sys_int.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o: src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c  .generated_files/flags/cutcutgo_bl/babf8f212a86bbe73474eab72d8b78be86558e6a .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o: src/config/pic32mx470_curiosity/usb/src/usb_device.c  .generated_files/flags/cutcutgo_bl/868a627cf03ecf61a8dfe4cbb3b659dd4d5248f4 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o src/config/pic32mx470_curiosity/usb/src/usb_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o: src/config/pic32mx470_curiosity/initialization.c  .generated_files/flags/cutcutgo_bl/45312af6a2eb792db8f116564d9b82399e1f57eb .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o src/config/pic32mx470_curiosity/initialization.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o: src/config/pic32mx470_curiosity/interrupts.c  .generated_files/flags/cutcutgo_bl/a8e254db9c8e679560d973beeeb5a635670881f4 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o src/config/pic32mx470_curiosity/interrupts.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o: src/config/pic32mx470_curiosity/exceptions.c  .generated_files/flags/cutcutgo_bl/fa52a31ffc294a16e94dca130a322cfc0f286489 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o src/config/pic32mx470_curiosity/exceptions.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o: src/config/pic32mx470_curiosity/usb_device_init_data.c  .generated_files/flags/cutcutgo_bl/4f2095cbd5e3b904dceaedb8b1f8fe7f28c85da4 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o src/config/pic32mx470_curiosity/usb_device_init_data.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o: src/config/pic32mx470_curiosity/tasks.c  .generated_files/flags/cutcutgo_bl/bd12e54780aaee95928c036183fabe6c4a82335c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o src/config/pic32mx470_curiosity/tasks.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/cutcutgo_bl/5e84b62c8dd4191b6f29e76bc2085193df5eea27 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/app.o: src/app.c  .generated_files/flags/cutcutgo_bl/abf550161694df9b0a919b0a1228dbf643de8d25 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/app.o.d 
	@${RM} ${OBJECTDIR}/src/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/app.o.d" -o ${OBJECTDIR}/src/app.o src/app.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/fat12.o: src/fat12.c  .generated_files/flags/cutcutgo_bl/dc5cdfb86fd2fc55565cbc88d1c00d0f1fe8c285 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fat12.o.d 
	@${RM} ${OBJECTDIR}/src/fat12.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/fat12.o.d" -o ${OBJECTDIR}/src/fat12.o src/fat12.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/buttons.o: src/buttons.c  .generated_files/flags/cutcutgo_bl/ea60f023a4086ca0201f0ea51c254fc43a2a29e0 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/buttons.o.d 
	@${RM} ${OBJECTDIR}/src/buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/buttons.o.d" -o ${OBJECTDIR}/src/buttons.o src/buttons.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o: src/config/pic32mx470_curiosity/bsp/bsp.c  .generated_files/flags/cutcutgo_bl/a9e96c52161b0f7632ed132959dddfb77f7778ef .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/bsp/bsp.o src/config/pic32mx470_curiosity/bsp/bsp.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c  .generated_files/flags/cutcutgo_bl/a69c65c071a842c049bee3b294e75b124c61a87e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o: src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c  .generated_files/flags/cutcutgo_bl/10ab2fbb8ee93089add54c80932cabbcc56fc3fd .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.o src/config/pic32mx470_curiosity/driver/memory/src/drv_memory.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c  .generated_files/flags/cutcutgo_bl/f0e5210a271de3d51df9e3982e28c2f8616fd584 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o: src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c  .generated_files/flags/cutcutgo_bl/97a4d243724cfb49bc361e8c6ccfa4dffcb219d6 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.o src/config/pic32mx470_curiosity/driver/usb/usbfs/src/drv_usbfs_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o: src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c  .generated_files/flags/cutcutgo_bl/833b6c2307cdb4883ca652c5f917738a99fbf3da .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.o src/config/pic32mx470_curiosity/peripheral/clk/plib_clk.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o: src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c  .generated_files/flags/cutcutgo_bl/435f854198a4270789613c7ea9a7355bc388ca5c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.o src/config/pic32mx470_curiosity/peripheral/evic/plib_evic.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o: src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c  .generated_files/flags/cutcutgo_bl/bf6067eaf50a1ff22874a6e0afddc725c8bc21c0 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.o src/config/pic32mx470_curiosity/peripheral/gpio/plib_gpio.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o: src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c  .generated_files/flags/cutcutgo_bl/5f8172d8e17ad625fb208d2875730a31bcf01e2b .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.o src/config/pic32mx470_curiosity/peripheral/nvm/plib_nvm.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o: src/config/pic32mx470_curiosity/stdio/xc32_monitor.c  .generated_files/flags/cutcutgo_bl/ea81dea35cf30fb9ab3134b3cd50298db90267fe .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/stdio/xc32_monitor.o src/config/pic32mx470_curiosity/stdio/xc32_monitor.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o: src/config/pic32mx470_curiosity/system/int/src/sys_int.c  .generated_files/flags/cutcutgo_bl/c06c35ffdf1ca38ee47b95f222afdf3a39237a0d .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/system/int/src/sys_int.o src/config/pic32mx470_curiosity/system/int/src/sys_int.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o: src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c  .generated_files/flags/cutcutgo_bl/b4ff51775229da6c5f1a9d570c54daa08e705e51 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device_msd.o src/config/pic32mx470_curiosity/usb/src/usb_device_msd.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o: src/config/pic32mx470_curiosity/usb/src/usb_device.c  .generated_files/flags/cutcutgo_bl/43ad62472fd4f7070c71769c7fe3c1043bb4a9c0 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb/src/usb_device.o src/config/pic32mx470_curiosity/usb/src/usb_device.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o: src/config/pic32mx470_curiosity/initialization.c  .generated_files/flags/cutcutgo_bl/b08d8758022902da38fa511ba1e1634237fc3ae7 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/initialization.o src/config/pic32mx470_curiosity/initialization.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o: src/config/pic32mx470_curiosity/interrupts.c  .generated_files/flags/cutcutgo_bl/f9a9e60b9c228275bcac4893d35e72cbaa31dd2c .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/interrupts.o src/config/pic32mx470_curiosity/interrupts.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o: src/config/pic32mx470_curiosity/exceptions.c  .generated_files/flags/cutcutgo_bl/31966057ad12f725cd61e6b80c11fa9f8124f500 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/exceptions.o src/config/pic32mx470_curiosity/exceptions.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o: src/config/pic32mx470_curiosity/usb_device_init_data.c  .generated_files/flags/cutcutgo_bl/f57926e85d02850c325d13931bdd9fb1c05f5407 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/usb_device_init_data.o src/config/pic32mx470_curiosity/usb_device_init_data.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o: src/config/pic32mx470_curiosity/tasks.c  .generated_files/flags/cutcutgo_bl/e471e4f6542fe1a5e8d1aeba7d75bf8d734c442e .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src/config/pic32mx470_curiosity" 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o.d" -o ${OBJECTDIR}/src/config/pic32mx470_curiosity/tasks.o src/config/pic32mx470_curiosity/tasks.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/main.o: src/main.c  .generated_files/flags/cutcutgo_bl/f409ee9a06acc05ed0576f22cffe2157367c495b .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/app.o: src/app.c  .generated_files/flags/cutcutgo_bl/87423054ccb7fa7b9d2d7257e482edae9b2e5c87 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/app.o.d 
	@${RM} ${OBJECTDIR}/src/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/app.o.d" -o ${OBJECTDIR}/src/app.o src/app.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/fat12.o: src/fat12.c  .generated_files/flags/cutcutgo_bl/df353ff057555aa8985722f1089537ba5951cbe6 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/fat12.o.d 
	@${RM} ${OBJECTDIR}/src/fat12.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/fat12.o.d" -o ${OBJECTDIR}/src/fat12.o src/fat12.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/src/buttons.o: src/buttons.c  .generated_files/flags/cutcutgo_bl/428c514f76047083d9acabb180e68f2547a59930 .generated_files/flags/cutcutgo_bl/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/buttons.o.d 
	@${RM} ${OBJECTDIR}/src/buttons.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"src" -I"src/config/pic32mx470_curiosity" -MP -MMD -MF "${OBJECTDIR}/src/buttons.o.d" -o ${OBJECTDIR}/src/buttons.o src/buttons.c    -DXPRJ_cutcutgo_bl=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
