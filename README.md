

    Charlin出框架的目标：简单、易用、高度封装、绝对解耦！

#CoreLabel
####为图文混排而设计，超轻量级的Label，轻度使用下是TTTLabel的最佳替换选择。

<br /><br />

组织信息 Charlin Feng：
===============
<br />
#### 特别群：请西部省市朋友实名加入组织。其他地区朋友请添加2-4群：谢谢。
<br />
【西部区域】西部大开发群号： 473185026  -追赶北上广！为振兴西部IT而努力！<br />
热烈欢迎中国西部各省市的从事iOS开发朋友实名进群！本群为是聚集西部零散开发者，大家齐心协力共进退！ <br /><br />

【全国可加】四群： 347446259<br />
新开，可加！欢迎全国朋友加入组织 <br /><br />

【全国可加】三群： 474377358<br />
新开，可加！欢迎全国朋友加入组织 <br /><br />

【全国可加】二群： 369870753<br />
可加<br /><br />

【全国可加】一群：163865401<br />
已爆满，加不上了<br /><br />

<br /><br />
#效果图：
![image](./CoreLabel/label.png)

<br /><br />

####框架特性：<br />
>1.封装并简化了NSMutableAttributedString及NSMutableParagraphStyle！<br />
>2.添加了常用的功能：垂直对齐<br />
>3.支持区域样式，你无需关心实现过程，只需要设置对应的值以及range即可<br />
>4.支持代码创建，xib创建。<br />
>5.代码简洁，属于轻量级。<br />
>6.新增多种样式，主要增加了图文混排，让添加图片更新简单。<br />


<br /><br />

####使用说明：<br />
<br />
###### 对齐方式
        //修改对齐
        label.cl_verticalAlignment=CoreLabelVerticalAlignmentBottom;
<br />

###### 基本属性
        //设置行间距
        label.cl_lineSpacing=20;
        
        //设置首行缩进
        label.cl_firstLineHeadIndent = 30;

<br />
###### 颜色 value：颜色值
     [label addAttr:CoreLabelAttrColor value:[UIColor redColor] range:NSMakeRange(5, 5)];   
    
<br />
###### 字体及加粗 value：字体
     [label addAttr:CoreLabelAttrFont value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(16,6)];
<br />
###### 倾斜 value：倾斜度数，请封装为NSValue，且可以使用度数宏定义
     [label addAttr:CoreLabelAttrObliqueness value:@(degree(-45)) range:NSMakeRange(15, 2)];

<br />
###### 字间距 value：间距值，请封装为NSValue
     [label addAttr:CoreLabelAttrKern value:@(10) range:NSMakeRange(40, 8)];

<br />
###### 删除线 value：删除线颜色
     [label addAttr:CoreLabelAttrDeleteLine value:[UIColor redColor] range:NSMakeRange(30, 3)];

<br />
###### 下划线 value：下划线颜色
     [label addAttr:CoreLabelAttrUnderLine value:[UIColor redColor] range:NSMakeRange(50, 3)];


<br />
###### 图文混排  size：图片大小，如果为CGSizeZero，由自动算为行高大小，offset为偏移量 location为你想插入的位置
        //添加一张图片
        [label addImage:[UIImage imageNamed:@"d_aini"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, -3) location:1];
        
        //添加一张图片
        [label addImage:[UIImage imageNamed:@"d_chijing"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, -3) location:5];
        
        //添加一张图片
        [label addImage:[UIImage imageNamed:@"d_chanzui"] size:CGSizeMake(0, 0) offset:UIOffsetMake(0, -3) location:12];

<br />
######  更新样式，请最后再调用
        //更新
        [label updateLabelStyle];

<br /><br /><br /><br />

-----
    CoreLabel 为图文混排而设计，超轻量级的Label，轻度使用下是TTTLabel的最佳替换选择。
-----

<br /><br />

#### 版权说明 RIGHTS <br />
作品说明：本框架由iOS开发攻城狮Charlin制作。<br />
作品时间： 2015.03.26 17:00<br />
更新时间： 2015.06.3 17:00<br />

#### 关于Chariln INTRODUCE <br />
作者简介：Charlin-四川成都华西都市报旗下华西都市网络有限公司技术部iOS工程师！<br /><br />


#### 联系方式 CONTACT <br />
Q    Q：1761904945（请注明缘由）<br />
Mail：1761904945@qq.com<br />
