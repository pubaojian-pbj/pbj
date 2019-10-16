
your="shiyouguandao"
echo $your
echo ${your}
#结果定向只文件
echo "It is a test" > myfile
echo `date`
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
#循环输出
for skill in Ada Coffe Action Java; do
    echo "I am good at ${skill}Script"
done
for index in a b c d; do
    echo $index
done
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
for((i=1;i<=5;i++));do
    echo "这是第 $i 次调用";
done;

#使用了 Bash let 命令，它用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
#只读变量
myUrl="http://www.google.com"
readonly myUrl
#删除变量
# unset your
echo $your
#字符串
str="hello world \"${your}\"" 
echo -e $str
#字符串长度
echo ${#str}
#截取字符串
echo ${str:1:4}
#查找字符串位置
# echo `expr index "$str" io`
# echo `expr index "$str" or`
#定义数组 获取数组长度
array_name=(value0 value1 value2 value3)
echo "数组长度为：${#array_name[@]}"
echo "${#array_name[*]}"
for index in ${array_name[@]}; do
    echo $index
done

#shell基本运算符
#expr表达式求值工具,表达式和运算符之间要有空格,完整的表达式要被 ` ` 包含
val=`expr 2 + 2`
echo "两数之和为：$val"

a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

#乘号(*)前边必须加反斜杠(\)才能实现乘法运算
val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

#符号之间必须有空格 == != -eq -ne -gt -lt -ge -le
if [ $a == $b ]
then
    echo "a等于b"
fi
if [ $a != $b ]
then
    echo  "a不等于b"
fi
if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi
#!= -a && -o ||
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi

#test命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试
num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi
num1="ru1noob"
num2="runoob"
if test $num1 = $num2
then
    echo '两个字符串相等!'
else
    echo '两个字符串不相等!'
fi
if test -e ./bash
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi
result=$[a+b] # 注意等号两边不能有空格
echo "result 为： $result"
#case-in
echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac
#break
while :
do
    echo -n "输入 1 到 5 之间的数字:"
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
            break
        ;;
    esac
done
#continue
while :
do
    echo -n "输入 1 到 5 之间的数字: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的!"
            continue
            echo "游戏结束"
        ;;
    esac
done
#shell函数，函数返回值在调用该函数后通过 $? 来获得。
funWithReturn(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: "
    read aNum
    echo "输入第二个数字: "
    read anotherNum
    echo "两个数字分别为 $aNum 和 $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn 1 2
echo "输入的两个数字之和为 $? !"
#输入输出重定向
# $ echo "菜鸟教程：www.runoob.com" > users
# $ cat users
# 菜鸟教程：www.runoob.com
# $ echo "菜鸟教程：www.runoob.com" >> users
# $ cat users
# 菜鸟教程：www.runoob.com
# 菜鸟教程：www.runoob.com
#文件资源引入
#!/bin/bash
# author:菜鸟教程
# url:www.runoob.com

#使用 . 号来引用test1.sh 文件
. ./test1.sh

# 或者使用以下包含文件代码
# source ./test1.sh

echo "菜鸟教程官网地址：$url"



