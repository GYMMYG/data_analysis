[TOC]



# note of numpy

## 小知识

numpy当数组中对象类型不一致时，会向上转化。如int，float会转换为float

如果数组原本是int，将某个值改成float，它将被阶段

numpy标准数据类型见python数据科学手册p35

numpy也支持复合类型

设置随机数：np.random.seed(0)

## 创建数组

全0：np.zeros(10,dtype = int)

全1：np.ones(**size =** (3,5),dtype = float)

全x：np.full((3,5),3.14)

线性：np.arange(0,20,2)

均匀分配（包括首尾）：np.linspace(0,1,5)

0-1随机：np.random.random((3,3))

正态分布：np.random.normal(0,1,(3,3))

随机整型(不包括尾)：np.random.randint(0,10,(3,3))

单位矩阵：np.eye(3)

## 数组基础

### 属性

ndim:维度

shape:每个维度大小

size:总大小

dtype:类型

### 索引

一维：x[i]

二维：x[i,j]

### 切片

一维：x[i:j:1]

二维：x[i:j,m:n]

逆序：x[::-1,::-1]

返回的切片修改后，原数组也修改

不修改需要.copy

### 变形

x.reshape((3,3))

或者用np.newaxis

x[:,np.newaxis]  列向量

### 拼接

np.concatenate(x,y,axis = 0) 

axis  = 0：第一个维度拼接（行增加）

axis  = 1：第二个维度拼接（列增加）

np.vstack  (行增加)

np.hstack (列增加)

np.dstack (第三个维度)

### 分裂

一维(可以分多段)：np.split(x,[3,5])

多维：np.vsplit,np.hsplit



### 通用函数

加减乘除某个数都对整个数组操作

绝对值：np.abs()

三角：np.sin,np.cos.....

np.exp(),2^x:np.exp2()

np.log(),np.log2()

x的值很少时更精确用法：exp(x) - 1:np.expm1(),log(1+x):np.log1p()

其余查询scipy库和numpy库



import  numpy as np
a=np.array([[1,1],
			[0,1]])
b=np.arange(4).reshape((2,2))
c=a*b#两个同型矩阵对应元素的乘积
c_dot=np.dot(a,b)#矩阵的乘法运算
c_dot_2=a.dot(b) #矩阵ab的乘积
print(c)
print(c_dot)
print(c_dot_2)



a=np.array([[1,2,3],[2,3,4]])#shape=2x4
print(a)                
print(np.sum(a)) #15       
print(np.max(a)) #4      
print(np.min(a)) #1       
print(np.sum(a,axis=1)) #行求和[6,9]
print(np.sum(a,axis=0)) #列求和[3,5,7]
print(np.max(a,axis=0)) #列最大[2,3,4]
print(np.min(a,axis=1)) #行最小[1,2]


### 高级通用函数特性

#### 指定输出

(间隔的插入y)：np.multiply(x,10,out = y[::2])

#### 聚合

加起来变成一个值：np.add.reduce()

储存中间值：np.add.accumlate()

x.min(axis = 0) 延第一维度聚合，返回每列最小

np.percentile(x,25) 分位数

忽略nan时，用np.nansum等

其他见python数据科学手册p53（如寻找最小值索引（np.argmin()）等）

#### 外积

得到一个x*x的array：np.multiply.out(x,x)



#### 广播规则

1.如果两个数组的维度数不相同，那么小维度数组的形状会在最左边补一（如果希望右边补一，可以先转置）

2.如果两个数组在任何一个维度上都不匹配，则会沿着维度为1的维度扩展为另一个数组的形状

3.如果任一维度都不匹配且都不等于1，则出现异常

##### 应用

归一化

画二维函数

x = 

y = 

z = f(x,y)

k紧邻（点距离矩阵p78）

#### 比较，掩码，布尔逻辑

x > 3

返回的是一个bool类型的array

可以与数字比较也可以与其他数组比较

np.sum(x > 3,axis = 1)   false当成0

np.any(x > 3) 存在返回true

np.all(x > 3,axis = 0)每列情况



以上都可以通过bool运算符（^,&,|,~）连接



bool数组作为掩码

x[x < 5]



#### 花哨索引

得到的数组和索引数组的形式一致

一维：

ind = [0,1]

x[ind] = 。。。。（修改值）

二维

x = [[0,1],[1,2]]

row = [0,1]

col = [0,1]

x[row,col] = [x[0,0],x[1,1]]

遵循广播原则，如果row变为列向量

则得到2 * 2



可与简单索引（1：）共用，此时简单索引按行，花哨索引取出其中每行的各个数值



x[[0,0]] = [4,6] - > x[0] = 6

会发生覆盖

x[0] = 6

i = [0,0,0]

x[i] += 1 -> x[0] = 7(计算号每一次值后赋值，不会一致累加)

如果要累加：

x = np.zeros(10)

np.add.at(x,i,1)

应用：p73

**np.searchsorted(a, v, side='left', sorter=None)**

在数组a中插入数组v（并不执行插入操作），返回一个下标列表，这个列表指明了v中对应元素应该插入在a中那个位置上



#### 排序

np.sort(x，axis = 0)

x.sort() 改变x

np.argsort(x) 返回索引

