# CustomSwitch
自定义实现一个系统的UISwitch
- 实现效果
![CustomSwitch-swift.gif](http://upload-images.jianshu.io/upload_images/3286073-f2ecd955bdcf43d1.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 实现思路
1. UI包括底部背景View和开关View
2. 在点击过程中对底部背景和开关坐颜色渐变动画和开关的位移动画

- 怎么调用？
1. 默认创建
```
        self.customSwitch = CustomSwitch()
        self.view.addSubview(customSwitch)
        customSwitch.center = self.view.center
        customSwitch.bounds = CGRect(x: 0, y: 0, width: 40, height: 30)
        customSwitch.valueChangedHandle = {(isOn) in
            print(isOn)
        }
```
2. 改变UI
![A144C001-7335-4C00-A635-247A4FCE6804.png](http://upload-images.jianshu.io/upload_images/3286073-621291031cdfe4c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


> 详情请点击：[简书地址](https://www.jianshu.com/p/6e653d95d79d)
