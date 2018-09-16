//
//  ViewController.m
//  ViewLayout
//
//  Created by LianLeven on 2018/9/15.
//  Copyright © 2018年 lianleven. All rights reserved.
//

#import "ViewController.h"
#import "UIView+layout.h"
#import "LLExampleViewController.h"
#import "LLExampleBasicView.h"
#import "LLExampleUpdateView.h"
#import "LLExampleRemakeView.h"

static NSString * const kLLCellReuseIdentifier = @"kLLCellReuseIdentifier";

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *exampleControllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView layout_fill];
    
    self.exampleControllers = @[
        [[LLExampleViewController alloc] initWithTitle:@"Basic" viewClass:LLExampleBasicView.class],
        [[LLExampleViewController alloc] initWithTitle:@"Update Constraints" viewClass:LLExampleUpdateView.class],
        [[LLExampleViewController alloc] initWithTitle:@"Remake Constraints" viewClass:LLExampleRemakeView.class],
        
    ];
    
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLLCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        view.tableFooterView = [UIView new];
        view.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        view.delegate = self;
        view.dataSource = self;
        view.rowHeight = 44;
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:kLLCellReuseIdentifier];
        _tableView = view;
    }
    return _tableView;
}


@end
