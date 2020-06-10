#!/usr/bin/env python3
#-*- coding:utf-8 -*-
#Author: zengxl
#Date: 2020-05-29

import os
import sys
import time
import sys
import requests
import pymysql
from threading import Thread

####get local device ip_address
ip_addr = os.popen("ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}' | head -1").read()

####从DB 获取 日志等级，日志特征，日志文件路径
host="121.9.13.185"
db = pymysql.connect(host, "log_mon", "Rjkj#efly@123", "log_feature", charset='utf8' )
cursor = db.cursor()
tables = "feature"

sql = "select * from " + tables
#sql = "select id,file_dir,warn_log_level,log_feature,remarks from " + tables

try:
    cursor.execute(sql)
    db.commit()
    res = cursor.fetchall()
    #print(type(res))
except:
    db.rollback()

db.close()



####syslog file cacth log feature
####在日志文件中，找定义的特征
def catch_feature(x):
    if x[2] == "critical":
        #cmd1 = "grep -rin '" + x[3] + "' " + x[1] + " | tail -100"
        #res = os.popen(cmd1).read()
        #print("###########################################")
        #print(cmd1)
        with open(x[1],"r") as f :
            all_lines = f.readlines()
            if len(all_lines) > 200 :
                last_100_lines = all_lines[-200:-1]
                #print(last_100_lines)
            elif len(all_lines) >= 1 and len(all_lines) < 200:
                last_100_lines = all_lines[-1]
                #print(last_100_lines)
            else:
                pass
        #print(last_100_lines)
        for ii in last_100_lines :
            if x[3] in ii:
                ii = str(ii)
                level0_critical_warn(ii)
            else:
                pass

    elif x[2] == "error":
        #cmd1 = "grep -rin '" + x[3] + "' " + x[1] + " | tail -3"
        #res = os.popen(cmd1).read()
        #print("###########################################")
        #print(cmd1)
        #if len(res) == 0:
        #    pass
        #else:
        #    level1_errors_warn(res)
        with open(x[1],"r") as f:
            all_lines = f.readlines()
            if len(all_lines) > 200 :
                last_100_lines = all_lines[-200:-1]
                #print(last_100_lines)
            elif len(all_lines) > 1 and len(all_lines) < 200:
                last_100_lines = all_lines[-1]
                #print(last_100_lines)
            else:
                pass
        for ii in last_100_lines :
            if x[3] in ii:
                ii = str(ii)
                level1_errors_warn(ii)
            else:
                pass

    else:
        pass

#####log must be deal with , at once
####发送到 skynet 告警平台
###http://skynet.efly.cc/Skynet/webroot/syslogic/callback/alarmlist/alarm_cb.php?keyset=BigData&project=BigData&type=TestType&message=TestMessage&data=TestData&repeat=check
###level 1 : red 危急
###level 2 : orange 警告
###务必马上修复处理
def level0_critical_warn(criti):
    #print("critical")
    mc = str(criti) + "_" + str(ip_addr)
    url_criti = "http://skynet.efly.cc/Skynet/webroot/syslogic/callback/alarmlist/alarm_cb.php?level=1&keyset=falcon_log_feature&project=falcon_monitor_log&type=ciritcal_log&message=危急的日志&data=" + str(mc) + "&repeat=update"
    #print(url_criti)
    out = requests.get(url_criti)
    del out
    


####根据情况修复
def level1_errors_warn(error):
    #print("error")
    mc = str(error) + "_" + str(ip_addr)
    url_error = "http://skynet.efly.cc/Skynet/webroot/syslogic/callback/alarmlist/alarm_cb.php?level=2&keyset=falcon_log_feature&project=falcon_monitor_log&type=error_log&message=警告日志&data=" + str(mc) + "&repeat=insert" 
    #url_error = "wget " + ' "' + "http://skynet.efly.cc/Skynet/webroot/syslogic/callback/alarmlist/alarm_cb.php?level=2&keyset=falcon_log_feature&project=falcon_monitor_log&type=error_log&message=警告日志&data=" + str(mc) + "&repeat=update" + '" -O /dev/null -o /dev/null'
    #print(url_error)
    out = requests.get(url_error)
    #out = os.popen(url_error).read()
    del out



if __name__ == "__main__":
    #######开始分析本地设备的 日志文件 哪些符合 定义的特征
    #t1 = time.time()
    #def main(x):
        #####see the file exists,and check log feature
        #print(x[1])
        #catch_feature(x)
        #print(x)
        #print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        #time.sleep(1)
    #######多线程处理，并发提速
    for x in res:
        res1 = os.path.exists(x[1])
        #print(res1,x[1])
        if res1 is True:
            res2 = os.path.getsize(x[1])
            res2 = int(res2)
            if res2 > 0:
                thread_num = Thread(target=catch_feature,args=(x,))
                thread_num.start()
                #print(thread_num,x)
                #print("##########################")
            else:
                pass
        else:
            pass
    #t2 = time.time()
    #total = t2 - t1
    #print(total)
