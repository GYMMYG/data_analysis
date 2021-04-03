# pandas使用笔记

## 三个基本数据结构

### series

data = pd.Series([0,1])

可以通过data.index和data.values访问索引和数据

可以通过data[1],data[1:3]访问

data.tail()访问最后面数据

#### series是一种显示的numpy数组

data = pd.Series([1,1],index = ['a','b'])

也支持data['a':'b']的索引

#### series是特殊的字典

pdic = {。。。}

data = pd.Series(pdic)

#### 创建series对象

pd.Series(data,index = index)

index默认为整数序列

data对象：

数组：pd.Series([2,3,4])

标量：pd.Series(5，index = [100,200])会得到两个值，值都是5

字典：pd.Series(dic，index = ...)也可以显示索引，相当于筛选，只保留后面定义的键

## dataframe

类比于series，dataframe相当于有灵活行列索引的二维数组

也可以看成多个有序排列的series对象的组合

data = pd.DataFrame({'a' = series_a,'b' = series_b})

访问行列名：data.columns,data.index

重命名column：province.rename(columns={'ID':'id','code':'编码'})

也可以看成字典

data['a']返回‘a'列

#### 创建dataframe

通过单个series创建

pd.DataFrame(population,columns = ['population'])

通过字典列表创建

data = [{},{},{}]

data = [{'a':i} for i in range(3)]

pd.dataframe(data)

字典键不存在时会自动补缺失值NaN

如：

pd.dataframe([{'a':1,'b':1},{'b':1,'c':1}])

out:

a b c

1 1 nan

nan 1 1

通过series对象字典创建

通过numpy二维数组创建，不指定columns，和index时默认是整数索引



### index

Index可以看作不可变数组

ind = pd.Index([2,3,4])

ind.size .dim .shape .ndim .dtype

因为它不可变，所以在索引多个dataframe时更加安全



index看作有序集合

ind1 & ind2

ind1 | ind2

ind1 ^ ind2



## 数值选取

### series

data['a']

显式：data['a':'c']  包含c   

隐式：data[0:2]   不包含2

掩码：data[(data > 3) &(data < 5)]

花哨的索引：data[['a','c']]

为了区别显式和隐式：

.loc:显示

.iloc:隐式

### dataframe

按列：data['a'],data.a(不推荐使用)

按行：data.values[0]  data[0:3]   (这里是直接按行)

隐式索引：data.iloc[:2,:3]

显式：data.loc[:'a',:'c']

混合：data.ix[:3,:'pop']

结合掩码与花哨索引：data.loc[data.'a'>1 , ['a','c']]

掩码：data[data.'a' > 3]



## pandas数值运算

### 索引保留

因为pandas是建立在numpy的基础上

使用np中的运算后仍是一个保留索引的pandas对象

s = pd.series()

s = np.sin(s)

### 索引对齐

两个series计算返回的是index的并集，里面的缺失值为NaN

也可以自定义每个series中的缺失 ：A.add(B,fill_value = 0)

dataframe也一样

fill = A.stack().mean()  (计算A的所有值的均值时要先压缩)

A.add(B,fill_value = fill)

### dataframe与series运算

广播原则

pandas默认是按行：df - df.iloc[0]

按列得利用运算符并指定axis：df.subtract(df['r'],axis = 0)

## 处理缺失值

忽略nan：

np.nansum,np.nanmin

None在pandas中会被转换成NaN



isnull:返回bool掩码

notnull：



dropna：剔除  按行剔除

按列时，axis = 'columns'

剔除全为nan时：dropna(how = 'all')  any时为只要有就剔除

通过thresh = x可以设置非缺失值的最小个数



fillna：填充

.fillna(0)

.fillna(method = 'ffill/bfill'):从前往后填充/从后往前，dataframe加上axis

## 层级索引

![image-20210402145748987](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145748987.png)

![image-20210402145810529](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145810529.png)

![image-20210402145821422](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145821422.png)![image-20210402145830858](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145830858.png)

![image-20210402145852596](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145852596.png)

![image-20210402145908848](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145908848.png)

![image-20210402145925128](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145925128.png)

![image-20210402145949831](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402145949831.png)

![image-20210402150126919](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402150126919.png)

![image-20210402150147584](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402150147584.png)

![image-20210402150225025](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402150225025.png)

![image-20210402150355585](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402150355585.png)

## 多级索引的切片

![image-20210402150921272](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402150921272.png)

![image-20210402151231655](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402151231655.png)

![image-20210402151417868](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402151417868.png)

![image-20210402151525793](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402151525793.png)

![image-20210402151917873](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402151917873.png)

![image-20210402151929042](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402151929042.png)

![image-20210402152420655](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402152420655.png)

![image-20210402152555983](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402152555983.png)

![image-20210402152924186](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402152924186.png)





### 合并数据集

![image-20210402154325103](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402154325103.png)



pd.contact():默认是按行

按列时:axis = 0或'col'

![image-20210402155145770](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402155145770.png)



![image-20210402155208275](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402155208275.png)



![image-20210402155249590](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402155249590.png)



![image-20210402155324965](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402155324965.png)

![image-20210402155414275](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402155414275.png)

![image-20210402160728382](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402160728382.png)

![image-20210402160828512](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402160828512.png)

![image-20210402162005311](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402162005311.png)

![image-20210402163806064](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402163806064.png)

![image-20210402163815445](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402163815445.png)

![image-20210402175713376](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402175713376.png)

![image-20210402175850660](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402175850660.png)

![image-20210402180105116](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402180105116.png)

![image-20210402180504335](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402180504335.png)

![image-20210402181012276](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402181012276.png)

![image-20210402181636876](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402181636876.png)



## 累计与分组

![image-20210402182012818](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402182012818.png)

.describle()可以得出每行各项统计



![image-20210402182228198](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402182228198.png)

![image-20210402183454121](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402183454121.png)



![image-20210402183730096](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402183730096.png)

![image-20210402184056446](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402184056446.png)

![image-20210402184414208](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402184414208.png)

![image-20210402184531512](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402184531512.png)

![image-20210402184659615](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402184659615.png)



![image-20210402185205753](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402185205753.png)

![image-20210402185538447](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402185538447.png)

![image-20210402190040272](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402190040272.png)

![image-20210402190148038](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402190148038.png)

![image-20210402190610537](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402190610537.png)

![image-20210402190928637](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402190928637.png)



![image-20210402191249642](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402191249642.png)

![image-20210402191329853](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402191329853.png)

![image-20210402191454039](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402191454039.png)

![image-20210402191541864](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402191541864.png)



## 向量化字符串操作

![image-20210402192213619](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402192213619.png)

![image-20210402192349210](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402192349210.png)



![image-20210402193122296](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402193122296.png)

![image-20210402193256599](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402193256599.png)

![image-20210402193405541](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402193405541.png)

## 时间数据

![image-20210402195711318](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402195711318.png)



![image-20210402195947551](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402195947551.png)

![image-20210402200216239](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402200216239.png)

![image-20210402200351292](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402200351292.png)

![image-20210402200633120](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402200633120.png)

![image-20210402200819040](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402200819040.png)

![image-20210402200928061](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402200928061.png)

![image-20210402201417874](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402201417874.png)

![image-20210402201607708](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402201607708.png)

## eval,query



![image-20210402202709104](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402202709104.png)

![image-20210402204215406](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402204215406.png)

![image-20210402204331777](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402204331777.png)

![image-20210402204435268](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402204435268.png)



![image-20210402204620694](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402204620694.png)

![image-20210402204834294](C:\Users\gym\AppData\Roaming\Typora\typora-user-images\image-20210402204834294.png)









```python
cshf ={
    '一线城市' :['北京', '上海', '广州', '深圳'],
    '二线城市' :['昆明', '福州', '无锡', '厦门', '哈尔滨', '长春', '南昌', '济南', '宁波', '大连', '贵阳', '温州', '石家庄', '泉州', '南宁', '金华', '常州', '珠海', '惠州', '嘉兴', '南通', '中山', '保定', '兰州', '台州', '徐州', '太原', '绍兴', '烟台', '海口', '乌鲁木齐', '呼和浩特'],
    '新一线城市' :['成都', '重庆', '杭州', '武汉', '西安', '郑州', '青岛', '长沙', '天津', '苏州', '南京', '东莞', '沈阳', '合肥', '佛山'],

}

for key,value in cshf.items():
    df.loc[df['医生所在城市'].isin(value),['城市等级']] = key
```







```python
g_data.drop(['患者投票数','感谢信数','心意礼物数','Unnamed: 0'], axis=1, inplace=True)
```





```python
x = [0,2,5,6,8,13,14,15]
origin_data.drop(origin_data.columns[x], axis=1, inplace=True)
```





```python
g_data['profession_encoding'] = g_data['医生职称'].apply(lambda x:profession_transform(x))
```