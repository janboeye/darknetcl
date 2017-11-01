
#/*
# * Copyright:
# * ----------------------------------------------------------------------------
# * This confidential and proprietary software may be used only as authorized
# * by a licensing agreement from ARM Limited.
# *      (C) COPYRIGHT 2014-2015 ARM Limited, ALL RIGHTS RESERVED
# * The entire notice above must be reproduced on all authorized copies and
# * copies may only be made to the extent permitted by a licensing agreement
# * from ARM Limited.
# * ----------------------------------------------------------------------------
# */


LOCAL_PATH := $(call my-dir)


# Configure these paths if you move the source or Khronos headers
#
OPENCL_HEADER_PATH := $(LOCAL_PATH)/../vendor/pinecone/arm/gles/khronos/original/CL_1_2
OPENCL_STUB_PATH := ../vendor/pinecone/arm/gles/cl/tests/sdk


#-----------------
# mali_cl_simple_opencl_example

include $(CLEAR_VARS)

LOCAL_C_INCLUDES :=  \
	$(OPENCL_HEADER_PATH) \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../CLBlast/include \
	$(LOCAL_PATH)/src

LOCAL_CFLAGS := \
          -DGPU -DOPENCL -Wall -Wfatal-errors -Wno-unused-result -std=c99 -D_BSD_SOURCE -Ofast -DGPU -DOPENCL


LOCAL_SRC_FILES :=  \
    src/connected_layer.c  \
    src/activations.c  \
    src/option_list.c  \
    src/blas_kernels.c  \
    src/rnn_layer.c  \
    src/layer.c  \
    src/batchnorm_layer.c  \
    src/crop_layer.c  \
    src/parser.c  \
    src/image.c  \
    src/utils.c  \
    src/deconvolutional_layer.c  \
    src/col2im_kernels.c  \
    src/dropout_layer_kernels.c  \
    src/list.c  \
    src/tree.c  \
    src/shortcut_layer.c  \
    src/reorg_layer.c  \
    src/local_layer.c  \
    src/im2col_kernels.c  \
    src/matrix.c  \
    src/normalization_layer.c  \
    src/route_layer.c  \
    src/crnn_layer.c  \
    src/convolutional_layer.c  \
    src/maxpool_layer_kernels.c  \
    src/crop_layer_kernels.c  \
    src/convolutional_kernels.c  \
    src/opencl.c  \
    src/demo.c  \
    src/maxpool_layer.c  \
    src/col2im.c  \
    src/dropout_layer.c  \
    src/softmax_layer.c  \
    src/data.c  \
    src/gemm.c  \
    src/detection_layer.c  \
    src/activation_kernels.c  \
    src/activation_layer.c  \
    src/avgpool_layer.c  \
    src/cost_layer.c  \
    src/avgpool_layer_kernels.c  \
    src/gru_layer.c  \
    src/deconvolutional_kernels.c  \
    src/region_layer.c  \
    src/network_kernels.c  \
    src/network.c  \
    src/box.c  \
    src/blas.c  \
    src/im2col.c

LOCAL_SHARED_LIBRARIES :=  \
	libOpenCL \
	libclblast

LOCAL_MODULE := libdarknetcl

LOCAL_MODULE_TAGS := eng optional tests

# Mark source files as dependent on Android.mk
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_C_INCLUDES :=  \
	$(OPENCL_HEADER_PATH) \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../CLBlast/include \
	$(LOCAL_PATH)/src

LOCAL_CFLAGS := \
          -DGPU -DOPENCL -Wall -Wfatal-errors -Wno-unused-result -std=c99 -D_BSD_SOURCE -Ofast -DGPU -DOPENCL


LOCAL_SRC_FILES :=  \
    src/darknet.c  \
    src/nightmare.c  \
    src/writing.c  \
    src/detector.c  \
    src/dice.c  \
    src/classifier.c  \
    src/regressor.c  \
    src/compare.c  \
    src/rnn_vid.c  \
    src/rnn.c  \
    src/go.c  \
    src/cifar.c  \
    src/art.c  \
    src/super.c  \
    src/captcha.c  \
    src/swag.c  \
    src/yolo.c  \
    src/lsd.c  \
    src/coco.c  \
    src/tag.c  \
    src/voxel.c  \

LOCAL_SHARED_LIBRARIES :=  \
	libdarknetcl

LOCAL_MULTILIB := 32

LOCAL_MODULE := darknetcl

LOCAL_MODULE_PATH_32 := $(TARGET_OUT_EXECUTABLES)/darcknetcl32

LOCAL_MODULE_TAGS := eng optional tests

include $(BUILD_EXECUTABLE)
#-----------------
# libOpenCL (stub)

include $(CLEAR_VARS)



LOCAL_PRELINK_MODULE := false

LOCAL_C_INCLUDES :=  \
	$(OPENCL_HEADER_PATH)

LOCAL_CFLAGS := \
	-Wno-unused-parameter

LOCAL_SRC_FILES :=  \
	$(OPENCL_STUB_PATH)/opencl_stubs.c


LOCAL_MODULE := libOpenCL

LOCAL_MULTILIB := both

LOCAL_MODULE_TAGS := eng optional

LOCAL_ARM_MODE := arm

LOCAL_PROPRIETARY_MODULE := true

LOCAL_MODULE_RELATIVE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/cl_stub

LOCAL_MODULE_PATH_64 := $(TARGET_OUT_SHARED_LIBRARIES)/cl_stub64

LOCAL_MODULE_PATH_32 := $(TARGET_OUT_SHARED_LIBRARIES)/cl_stub32

# Mark source files as dependent on Android.mk
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk

include $(BUILD_SHARED_LIBRARY)



