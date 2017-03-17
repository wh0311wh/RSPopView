//
//  ViewController.m
//  DemoForRSPopView
//
//  Created by hehai on 18/03/2017.
//  Copyright © 2017 hehai. All rights reserved.
//

#import "ViewController.h"
#import <RSPopView/RSPopViewHeader.h>

static NSString *const cellIdentifier = @"cellIdentifier";

@interface ViewController ()<RSCoverDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIButton *popBtn;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.view addSubview:self.popBtn];
}

#pragma mark - Private Method

- (void)clickPopBtn:(UIButton *)sender {
	// 创建蒙板
	RSCover *cover = [RSCover show];
	cover.delegate = self;
	
	// 创建弹出视图
	CGFloat popW = 180;
	CGFloat popH = 300;
	CGFloat popX = (self.view.frame.size.width - popW) * 0.5;
	CGFloat popY = 55;
	RSPopView *menu = [RSPopView showInRect:CGRectMake(popX, popY, popW, popH) withLocation:RSLocationMiddle];
	
	// 创建PopView底部的button，如果不需要，可以不设置，默认为nil
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
	[btn setTitle:@"编辑我的分组" forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(editGroup:) forControlEvents:UIControlEventTouchUpInside];
	menu.bottomBtn = btn;
	
	// 设置内容视图
	UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
	tableView.backgroundColor = [UIColor lightGrayColor];
	tableView.dataSource = self;
	tableView.delegate = self;
	menu.contentView = tableView;
}

- (void)editGroup:(UIButton *)sender {
	[RSPopView hide];
	_popBtn.selected = NO;
}

#pragma mark - RSCoverDelegate

- (void)coverDidClickCover:(RSCover *)cover {
	[RSPopView hide];
	_popBtn.selected = NO;
}

#pragma mark - UITableView Datasource & gelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.textLabel.text = [NSString stringWithFormat:@"测试%ld", indexPath.row];
	
	return cell;
}

#pragma mark - Setter & Getter

- (UIButton *)popBtn {
	if (!_popBtn) {
		_popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
		_popBtn.frame = CGRectMake(0, 300, 50, 50);
		_popBtn.backgroundColor = [UIColor redColor];
		[_popBtn addTarget:self action:@selector(clickPopBtn:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _popBtn;
}

@end
