//
//  ViewController.m
//  TextViewAutoFrame
//
//  Created by xly on 2018/8/7.
//  Copyright © 2018年 Xly. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellHeight = 50;
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    cell.textView.delegate = self;
    cell.textView.scrollEnabled = NO;
//    cell.textViewH.constant = _cellHeight;
//    dispatch_async(dispatch_get_main_queue(), ^{//这行代码一定要加上
//        [cell.textView becomeFirstResponder];
//    });
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeight;
}

-(void)textViewDidChange:(UITextView *)textView{
    float textViewHeight =  [textView sizeThatFits:CGSizeMake(textView.frame.size.width, MAXFLOAT)].height;
    if (textViewHeight != _cellHeight) {
        _cellHeight = textViewHeight;
        [_tableView reloadData];
        MyTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.textViewH.constant = _cellHeight;
        [cell.textView becomeFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
