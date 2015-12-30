//
//  NumberofwordsTextView.h
//  Orimuse
//
//  Created by weijohn on 15/12/25.
//  Copyright © 2015年 Bingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberofwordsTextView : UIView


@property(assign, nonatomic)BOOL          isHideNumberLabel;//是否显示数字label 默认不隐藏
@property(assign, nonatomic)NSInteger     wordsMaxNumer; // 默认值设置最大值
@property(strong, nonatomic)NSString      *text;//输入框输入的值
@property(strong, nonatomic)NSString      *placeHolder;
@property(strong, nonatomic)UIFont        *textFont;

@end
