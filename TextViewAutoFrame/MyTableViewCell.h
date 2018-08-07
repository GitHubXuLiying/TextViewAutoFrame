//
//  MyTableViewCell.h
//  TextViewAutoFrame
//
//  Created by xly on 2018/8/7.
//  Copyright © 2018年 Xly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewH;

@end
