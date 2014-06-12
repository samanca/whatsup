#!/bin/bash

# =================== CPU =======================
echo "CPU charts ..."
cd cpu && gnuplot charts.dem

# ================= Memory ======================
echo "Memory charts ..."
cd ../memory && gnuplot charts.dem

# =============== TCP Queue =====================

# ================ File Handlers ================

# ================ Thread Count =================
echo "Thread count charts ..."
cd ../thread && gnuplot charts.dem

# ============== Virtual Memory =================
