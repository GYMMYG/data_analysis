# pandas使用笔记

## 三个基本数据结构

### series

data = pd.Series([0,1])

可以通过data.index和data.values访问索引和数据

可以通过data[1],data[1:3]访问

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