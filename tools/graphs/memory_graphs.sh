#!/bin/bash
# Large
php adjust_average.php ../logs/openfire_nolog_large_1/last_run/ memory > charts/memory/large/openfire_nolog_large_1_memory.log
php adjust_average.php ../logs/openfire_nolog_large_2/last_run/ memory > charts/memory/large/openfire_nolog_large_2_memory.log
php adjust_average.php ../logs/openfire_nolog_large_4/last_run/ memory > charts/memory/large/openfire_nolog_large_4_memory.log
php adjust_average.php ../logs/openfire_nolog_large_8/last_run/ memory > charts/memory/large/openfire_nolog_large_8_memory.log

php adjust_average.php ../logs/ejabberd_nolog_large_1/last_run/ memory > charts/memory/large/ejabberd_nolog_large_1_memory.log
php adjust_average.php ../logs/ejabberd_nolog_large_2/last_run/ memory > charts/memory/large/ejabberd_nolog_large_2_memory.log

php adjust_average.php ../logs/openfire_log_large_1/last_run/ memory > charts/memory/large/openfire_log_large_1_memory.log
php adjust_average.php ../logs/openfire_log_large_2/last_run/ memory > charts/memory/large/openfire_log_large_2_memory.log
php adjust_average.php ../logs/openfire_log_large_4/last_run/ memory > charts/memory/large/openfire_log_large_4_memory.log
php adjust_average.php ../logs/openfire_log_large_8/last_run/ memory > charts/memory/large/openfire_log_large_8_memory.log

# XLarge
php adjust_average.php ../logs/openfire_nolog_xlarge_1/last_run/ memory > charts/memory/xlarge/openfire_nolog_xlarge_1_memory.log
php adjust_average.php ../logs/openfire_nolog_xlarge_2/last_run/ memory > charts/memory/xlarge/openfire_nolog_xlarge_2_memory.log
php adjust_average.php ../logs/openfire_nolog_xlarge_4/last_run/ memory > charts/memory/xlarge/openfire_nolog_xlarge_4_memory.log
php adjust_average.php ../logs/openfire_nolog_xlarge_8/last_run/ memory > charts/memory/xlarge/openfire_nolog_xlarge_8_memory.log

php adjust_average.php ../logs/ejabberd_nolog_xlarge_1/last_run/ memory > charts/memory/xlarge/ejabberd_nolog_xlarge_1_memory.log
php adjust_average.php ../logs/ejabberd_nolog_xlarge_2/last_run/ memory > charts/memory/xlarge/ejabberd_nolog_xlarge_2_memory.log

php adjust_average.php ../logs/openfire_log_xlarge_1/last_run/ memory > charts/memory/xlarge/openfire_log_xlarge_1_memory.log
php adjust_average.php ../logs/openfire_log_xlarge_2/last_run/ memory > charts/memory/xlarge/openfire_log_xlarge_2_memory.log
php adjust_average.php ../logs/openfire_log_xlarge_4/last_run/ memory > charts/memory/xlarge/openfire_log_xlarge_4_memory.log
php adjust_average.php ../logs/openfire_log_xlarge_8/last_run/ memory > charts/memory/xlarge/openfire_log_xlarge_8_memory.log

# 2XLarge
php adjust_average.php ../logs/openfire_nolog_2xlarge_1/last_run/ memory > charts/memory/2xlarge/openfire_nolog_2xlarge_1_memory.log
php adjust_average.php ../logs/openfire_nolog_2xlarge_2/last_run/ memory > charts/memory/2xlarge/openfire_nolog_2xlarge_2_memory.log
php adjust_average.php ../logs/openfire_nolog_2xlarge_4/last_run/ memory > charts/memory/2xlarge/openfire_nolog_2xlarge_4_memory.log
php adjust_average.php ../logs/openfire_nolog_2xlarge_8/last_run/ memory > charts/memory/2xlarge/openfire_nolog_2xlarge_8_memory.log

php adjust_average.php ../logs/ejabberd_nolog_2xlarge_1/last_run/ memory > charts/memory/2xlarge/ejabberd_nolog_2xlarge_1_memory.log
php adjust_average.php ../logs/ejabberd_nolog_2xlarge_2/last_run/ memory > charts/memory/2xlarge/ejabberd_nolog_2xlarge_2_memory.log

php adjust_average.php ../logs/openfire_log_2xlarge_1/last_run/ memory > charts/memory/2xlarge/openfire_log_2xlarge_1_memory.log
php adjust_average.php ../logs/openfire_log_2xlarge_2/last_run/ memory > charts/memory/2xlarge/openfire_log_2xlarge_2_memory.log
php adjust_average.php ../logs/openfire_log_2xlarge_4/last_run/ memory > charts/memory/2xlarge/openfire_log_2xlarge_4_memory.log
php adjust_average.php ../logs/openfire_log_2xlarge_8/last_run/ memory > charts/memory/2xlarge/openfire_log_2xlarge_8_memory.log
