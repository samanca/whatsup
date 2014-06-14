#!/bin/bash
# Large
php adjust_average.php ../logs/openfire_nolog_large_1/last_run/ cpu > charts/cpu/large/openfire_nolog_large_1_cpu.log
php adjust_average.php ../logs/openfire_nolog_large_2/last_run/ cpu > charts/cpu/large/openfire_nolog_large_2_cpu.log
php adjust_average.php ../logs/openfire_nolog_large_4/last_run/ cpu > charts/cpu/large/openfire_nolog_large_4_cpu.log
php adjust_average.php ../logs/openfire_nolog_large_8/last_run/ cpu > charts/cpu/large/openfire_nolog_large_8_cpu.log

php adjust_average.php ../logs/ejabberd_nolog_large_1/last_run/ cpu > charts/cpu/large/ejabberd_nolog_large_1_cpu.log
php adjust_average.php ../logs/ejabberd_nolog_large_2/last_run/ cpu > charts/cpu/large/ejabberd_nolog_large_2_cpu.log

php adjust_average.php ../logs/openfire_log_large_1/last_run/ cpu > charts/cpu/large/openfire_log_large_1_cpu.log
php adjust_average.php ../logs/openfire_log_large_2/last_run/ cpu > charts/cpu/large/openfire_log_large_2_cpu.log
php adjust_average.php ../logs/openfire_log_large_4/last_run/ cpu > charts/cpu/large/openfire_log_large_4_cpu.log
php adjust_average.php ../logs/openfire_log_large_8/last_run/ cpu > charts/cpu/large/openfire_log_large_8_cpu.log

# XLarge
php adjust_average.php ../logs/openfire_nolog_xlarge_1/last_run/ cpu > charts/cpu/xlarge/openfire_nolog_xlarge_1_cpu.log
php adjust_average.php ../logs/openfire_nolog_xlarge_2/last_run/ cpu > charts/cpu/xlarge/openfire_nolog_xlarge_2_cpu.log
php adjust_average.php ../logs/openfire_nolog_xlarge_4/last_run/ cpu > charts/cpu/xlarge/openfire_nolog_xlarge_4_cpu.log
php adjust_average.php ../logs/openfire_nolog_xlarge_8/last_run/ cpu > charts/cpu/xlarge/openfire_nolog_xlarge_8_cpu.log

php adjust_average.php ../logs/ejabberd_nolog_xlarge_1/last_run/ cpu > charts/cpu/xlarge/ejabberd_nolog_xlarge_1_cpu.log
php adjust_average.php ../logs/ejabberd_nolog_xlarge_2/last_run/ cpu > charts/cpu/xlarge/ejabberd_nolog_xlarge_2_cpu.log

php adjust_average.php ../logs/openfire_log_xlarge_1/last_run/ cpu > charts/cpu/xlarge/openfire_log_xlarge_1_cpu.log
php adjust_average.php ../logs/openfire_log_xlarge_2/last_run/ cpu > charts/cpu/xlarge/openfire_log_xlarge_2_cpu.log
php adjust_average.php ../logs/openfire_log_xlarge_4/last_run/ cpu > charts/cpu/xlarge/openfire_log_xlarge_4_cpu.log
php adjust_average.php ../logs/openfire_log_xlarge_8/last_run/ cpu > charts/cpu/xlarge/openfire_log_xlarge_8_cpu.log

# 2XLarge
php adjust_average.php ../logs/openfire_nolog_2xlarge_1/last_run/ cpu > charts/cpu/2xlarge/openfire_nolog_2xlarge_1_cpu.log
php adjust_average.php ../logs/openfire_nolog_2xlarge_2/last_run/ cpu > charts/cpu/2xlarge/openfire_nolog_2xlarge_2_cpu.log
php adjust_average.php ../logs/openfire_nolog_2xlarge_4/last_run/ cpu > charts/cpu/2xlarge/openfire_nolog_2xlarge_4_cpu.log
php adjust_average.php ../logs/openfire_nolog_2xlarge_8/last_run/ cpu > charts/cpu/2xlarge/openfire_nolog_2xlarge_8_cpu.log

php adjust_average.php ../logs/ejabberd_nolog_2xlarge_1/last_run/ cpu > charts/cpu/2xlarge/ejabberd_nolog_2xlarge_1_cpu.log
php adjust_average.php ../logs/ejabberd_nolog_2xlarge_2/last_run/ cpu > charts/cpu/2xlarge/ejabberd_nolog_2xlarge_2_cpu.log

php adjust_average.php ../logs/openfire_log_2xlarge_1/last_run/ cpu > charts/cpu/2xlarge/openfire_log_2xlarge_1_cpu.log
php adjust_average.php ../logs/openfire_log_2xlarge_2/last_run/ cpu > charts/cpu/2xlarge/openfire_log_2xlarge_2_cpu.log
php adjust_average.php ../logs/openfire_log_2xlarge_4/last_run/ cpu > charts/cpu/2xlarge/openfire_log_2xlarge_4_cpu.log
php adjust_average.php ../logs/openfire_log_2xlarge_8/last_run/ cpu > charts/cpu/2xlarge/openfire_log_2xlarge_8_cpu.log
