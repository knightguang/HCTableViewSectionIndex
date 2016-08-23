# HCTableViewSectionIndex
实现iOS通讯录侧边栏的A~Z排序与其点击事件
<br/>
<br/>

    实现效果：
    1、UITableView的侧边栏显示A~Z字母
    2、对dataSource进行排序
    3、点击侧边栏，跳转对应section
    
<br/>具体使用：
<br/>1.添加JSONModel第三方库
<br/>2.添加Tool中的文件
<br/>3.根据实际需求，建立model.h文件，并声明pinyin属性
<br/>`@property (nonatomic,strong) NSString<Ignore>* pinyin;`
<br/>4.实现UITableViewDataSource中两个关于侧边栏设置的方法
<br/>`- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;`
<br/>`- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;`

<br/>效果图如下：
<br/>
![](https://github.com/knightguang/HCTableViewSectionIndex/blob/master/HCTableViewSectionIndex/1.png)
<br/>
<br/>
<br/>
