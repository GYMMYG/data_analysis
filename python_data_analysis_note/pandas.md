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