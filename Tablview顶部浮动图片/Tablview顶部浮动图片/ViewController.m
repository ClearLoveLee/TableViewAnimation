//
//  ViewController.m
//  Tablview顶部浮动图片
//
//  Created by CoderDoctorLee on 16/6/15.
//  Copyright © 2016年 CoderDoctorLee. All rights reserved.
//

#import "ViewController.h"
#import "CPKenburnsView.h"
#import "UIImage+GIF.h"
#define MyWidth [UIScreen mainScreen].bounds.size.width
#define MyHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)CPKenburnsView *imageViewHeader;
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(240, 0, 0, 0);//设定初始偏移量
    [self.view addSubview:_tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //上方浮动图片
    self.imageViewHeader = [[CPKenburnsView alloc]initWithFrame:CGRectMake(0, -240 ,414, 240)];
    [self.tableView addSubview:_imageViewHeader];//将图片加到tableview上
    self.imageViewHeader.image = [UIImage imageNamed:@"加载.gif"];
//     [UIImage imageNamed:@"加载.gif"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"得救之道，便在其中";
    return cell;
}
//滚动触发
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat content = scrollView.contentOffset.y;
    if (content < - 240 * MyHeight / 568) {
        CGRect newFrame = self.imageViewHeader.frame;
        newFrame.origin.y = content;
        newFrame.size.height = -content;
        self.imageViewHeader.frame = newFrame;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
