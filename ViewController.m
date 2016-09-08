//
//  ViewController.m
//  Cell的折叠
//
//  Created by 云卷云舒丶 on 16/6/12.
//  Copyright © 2016年 sc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,assign)BOOL Display;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0 && self.Display == YES)
    {
        return 2;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = @"SC";
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 20;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    view.backgroundColor = [UIColor cyanColor];
    view.userInteractionEnabled = YES;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, (44-20)/2, 100, 20)];
    
    [view addSubview:label];
    
    view.tag = section;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(display1:)]];
    return view;
    
    
    
}
- (void)display1:(UITapGestureRecognizer *)tap
{
    
    self.Display = !self.Display;
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:0];
    
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
}

@end
