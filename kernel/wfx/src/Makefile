# SPDX-License-Identifier: GPL-2.0-only

# Necessary for CREATE_TRACE_POINTS
CFLAGS_debug.o = -I$(src)

wfx-objs := \
	bh.o \
	hwio.o \
	fwio.o \
	hif_tx_mib.o \
	hif_tx.o \
	hif_rx.o \
	queue.o \
	data_tx.o \
	data_rx.o \
	scan.o \
	sta.o \
	key.o \
	main.o \
	debug.o \
	bus_spi.o \
	bus_sdio.o



obj-m += wfx.o
