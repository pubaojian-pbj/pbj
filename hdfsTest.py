#!/usr/local/Cellar/python
# -*- coding:utf-8 -*-
# Author:pbj
import sys
sys.path.append('/opt/work/script/solution_template/job_template_19/PyHDFS-0.2.2.zip')

from pyhdfs import HdfsClient
import time
import logging.config


class DeleteHdfsData():

    # 初始化
    def __init__(self):
        self.host = "172.27.133.18"
        self.port = "8020"
        self.userName = "work"
        self.remotePath = "/user/shiyouguandao"
        self.fs = HdfsClient(self.host, self.userName)
        self.ReadHdfsFile()

    # 读取文件
    def ReadHdfsFile(self):
        count = self.HdfsFileList(self.remotePath)
        localtime = time.asctime(time.localtime(time.time()))
        log.info(localtime+"\t共删除/user/shiyouguandao下\t"+str(count)+"个csv文件...")

    # 文件删除
    def DeleteHdfsFile(self, hdfsPath):
        # self.fs.delete(hdfsPath, skip_trash=False)
        self.fs.delete("/user/shiyouguandao/feature_ZSY-69_2019-09-24_23411.csv", skip_trash = False)

    #文件目录列表遍历判定
    def HdfsFileList(self, path):
        count=0;
        for root, dirs, files in self.fs.walk(path):
            for file in files:
                is_csv = self.hdfsFileHandler(file)
                if is_csv:
                    self.DeleteHdfsFile(path+"/"+file)
                    count+=1
        return count
    #文件过滤
    def hdfsFileHandler(self, fileName):
        if fileName.endswith(".csv"):
            temp = 60*60*24;
            index = fileName.rfind("_")
            str = fileName[index-len(fileName)-10:index-len(fileName)]
            current = int(time.time())
            fileTime = int(time.mktime(time.strptime(str,"%Y-%m-%d")))
            if(current-fileTime) >= temp:
                return True
            else:
                return False

#创建对象
logging.basicConfig(level=logging.INFO)
log = logging.getLogger()
process = DeleteHdfsData()
