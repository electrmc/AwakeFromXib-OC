# AwakeFromXib-OC
 Xib文件的设计是符合MVC模式的
 File's Owner --> Controller;View --> View
 File's Owner != nil的xib是不适合复用的
 awakeFromNib的方法只有interface objects可以接受，File's Owner是不接受这个方法的

 当xib中的view'class != nil时，是不用initWithFrame这个方法的，因为从xib文件加载出来
 view的大小已定。

 以下的情形有分为4种：
 1,File's Owner!=nil，view==nil.这种一般要在File's Owner的类中添加IBOutlet或IBAction
   这种情况，在调用loadView方法时，会把IBOutlet和IBAction关联起来。
   这里又分三种情况：1，File's Owner == self(当前控制器);
                  2，File's Owner == CustomClass(任意NSObjectClass)
                  3，File's Owner == CustomViewController(定制的视图控制器)
 2,File's Owner==nil，view!=nil.这种情况就是自定义View，与手写代码定义View功能相同。
   好处:view的声明，布局等工作省去了，可以在view对应的class中进行其他view的定制
 3，File's Owner==nil，view==nil.与2的情况相同。
   但是只能当一个视图用，不能有事件，因为没有对应的类。
   如果要实现递给你只就要在加载的类中实现，不适合复用，最好用2的代替3
 4，File's Owner!=nil，view!=nil,这种类型很少。
   类比就相当于在CustomViewController中加了CustomView
   特殊情况：File's Owner == view的class == CustomView
   view的class中也可以响应事件，就如同定制View可以响应UIButton的事件一样
   但是，这样就不遵循MVC规则了，视图的功能是显示，而事件的响应应该给控制器处理。
   像响应事件这种最多要用block，delegate或是SEL来实现。
