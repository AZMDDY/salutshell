#!/bin/bash

# --------------------------------------------------------------------------- #
# 获取文件名后缀
# Parameter1: 文件名
# output: 后缀名
# return: None
# --------------------------------------------------------------------------- #
function FileSuffix() {
    local filename="$1"
    if [ -n "$filename" ]; then
        echo "${filename##*.}"
    fi
}

# --------------------------------------------------------------------------- #
# 获取文件名前缀
# Parameter1: 文件名
# output: 前缀名
# return: None
# --------------------------------------------------------------------------- #
function FilePrefix() {
    local filename="$1"
    if [ -n "$filename" ]; then
        echo "${filename%.*}"
    fi
}

# --------------------------------------------------------------------------- #
# 判断文件后缀是否是指定后缀
# Parameter1: 文件名
# parameter2: 后缀名
# output: None
# return: 0: 表示文件后缀是指定后缀；1: 表示文件后缀不是指定后缀
# --------------------------------------------------------------------------- #
function IsSuffix() {
    local filename="$1"
    local suffix="$2"
    if [ "$(FileSuffix $filename)" = "$suffix" ]; then
        return 0
    else
        return 1
    fi
}

# --------------------------------------------------------------------------- #
# 判断进程是否正在运行
# Parameter1: 进程名
# output: 进程ID
# return: 0: 进程正在运行；1: 进程不存在；2：进程存在，但没有在运行
# --------------------------------------------------------------------------- #
function ProcessIsRunning() {
    local process="$1"
    local pid=$(ps -ef | grep $process | grep -v grep | awk '{print $2}')
    if [ -z "$pid" ]; then
        return 1
    fi
    if ps -p $pid > /dev/null; then
        echo "$pid"
        return 0
    fi
    return 2
}