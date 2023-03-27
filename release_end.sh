#!/bin/bash

GPU_ID="10de 1c30"
GPU_AUDIO_ID="10de 10f1"
GPU=09:00

echo -n "0000:${GPU}.0" > /sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind gpu from vfio-pci"
echo -n "0000:${GPU}.1" > /sys/bus/pci/drivers/vfio-pci/unbind || echo "Failed to unbind gpu-audio from vfio-pci"

echo -n "$GPU_ID" > /sys/bus/pci/drivers/vfio-pci/remove_id
echo -n "$GPU_AUDIO_ID" > /sys/bus/pci/drivers/vfio-pci/remove_id

#finally not necessary
#modprobe -r vfio-pci

echo -n "0000:${GPU}.0" > /sys/bus/pci/drivers/nvidia/bind || echo "Failed to bind nvidia"
echo -n "0000:${GPU}.1" > /sys/bus/pci/drivers/snd_hda_intel/bind || echo "Failed to bind nvidia hdmi audio"
