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
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NumberofwordsTextView *numberTextView = [[NumberofwordsTextView alloc] init];
    numberTextView.frame = CGRectMake(15, 50 , 300 , 80);
    numberTextView.wordsMaxNumer = 36;
    numberTextView.placeHolder = @"亲，写点什么吧，向大家介绍下自己呗～";
    numberTextView.textFont = [UIFont systemFontOfSize:12];
    [self.view addSubview:numberTextView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
