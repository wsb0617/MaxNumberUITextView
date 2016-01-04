//
//  ViewController.m
//  NumberTextView
//
//  Created by wsb0617 on 15/12/29.
//  Copyright © 2015年 wsb0617. All rights reserved.
//

#import "ViewController.h"
#import "NumberofwordsTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NumberofwordsTextView *numberTextView = [[NumberofwordsTextView alloc] init];
    numberTextView.frame = CGRectMake(15, 20 , self.view.frame.size.width - 30 , 80);
    numberTextView.wordsMaxNumer = 5;
    numberTextView.placeHolder = @"只需要传入一个最大值wordsMaxNumer";
    numberTextView.textFont = [UIFont systemFontOfSize:12];
    [self.view addSubview:numberTextView];
    
    
    
    
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(0,110,self.view.frame.size.width ,20 );
    textField.placeholder = @"欢迎光临";
    [self.view addSubview:textField];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
