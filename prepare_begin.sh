#!/bin/bash

GPU_ID="10de 1c30"
GPU_AUDIO_ID="10de 10f1"
GPU=09:00

echo -n "0000:${GPU}.0" > /sys/bus/pci/drivers/nvidia/unbind || echo "Failed to unbind gpu from nvidia"
echo -n "0000:${GPU}.1" > /sys/bus/pci/drivers/snd_hda_intel/unbind || echo "Failed to unbind hdmi audio in gpu"

#in case not loaded yet
modprobe vfio-pci

echo -n "$GPU_ID" > /sys/bus/pci/drivers/vfio-pci/new_id
echo -n "$GPU_AUDIO_ID" > /sys/bus/pci/drivers/vfio-pci/new_id

