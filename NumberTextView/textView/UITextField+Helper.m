//
//  UITextField+Helper.m
//  Orimuse
//
//  Created by weijohn on 15/12/22.
//  Copyright © 2015年 Bingjie. All rights reserved.
//

#import "UITextField+Helper.h"
#import <objc/runtime.h>

@interface UITextField ()

@property (assign , nonatomic) NSInteger     subWordNumber;
@property (assign , nonatomic) NSInteger     emojiNumer;
@property (assign , nonatomic) NSInteger     inputWordNumber;

@end

@implementation UITextField (Helper)


static void *subWordNumberKey = &subWordNumberKey;
static void *emojiNumerKey = &emojiNumerKey;
static void *inputWordNumberKey  = &inputWordNumberKey;
static void *maxLengthKey  = &maxLengthKey;

#pragma mark get/set
-(NSInteger)subWordNumber {
    NSNumber *number = objc_getAssociatedObject(self, &subWordNumberKey);
    return [number integerValue];
}
- (void)setSubWordNumber:(NSInteger)subWordNumber {
    objc_setAssociatedObject(self, &subWordNumberKey, [NSNumber numberWithInteger:subWordNumber], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSInteger)emojiNumer {
    NSNumber *number = objc_getAssociatedObject(self, &emojiNumerKey);
    return [number integerValue];
}
- (void)setEmojiNumer:(NSInteger)emojiNumer{
    objc_setAssociatedObject(self, &emojiNumerKey, [NSNumber numberWithInteger:emojiNumer], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSInteger)inputWordNumber {
    NSNumber *number = objc_getAssociatedObject(self, &inputWordNumberKey);
    return [number integerValue];
}
- (void)setInputWordNumber:(NSInteger)inputWordNumber {
    objc_setAssociatedObject(self, &inputWordNumberKey, [NSNumber numberWithInteger:inputWordNumber], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSInteger)maxLength {
    NSNumber *number = objc_getAssociatedObject(self, &maxLengthKey);
    return [number integerValue];
}
- (void)setMaxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, &maxLengthKey, [NSNumber numberWithInteger:maxLength], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self dealMax];
}


- (void)dealMax {
    
    [self.rac_textSignal subscribeNext:^(NSString *text) {
        if (text.length == 0) {
            return ;
        }
 
        self.emojiNumer = [text emojiNumberOfSting];
        self.inputWordNumber = [text convertToInt] - self.emojiNumer;
        
//        NSLog(@"text is %@", text);
//        NSLog(@"inputWordNumber is %ld", self.inputWordNumber);
//        NSLog(@"subWordNumber is ---- %ld", self.subWordNumber);
        
        if (![self isCanInput]) {
            if (self.text.length >= self.subWordNumber) {
                self.text = [text substringToIndex:self.subWordNumber];
//                [HUDController showTextOnly:@"字数超过限制"];
            }
        }
    }];

}

- (BOOL)isCanInput{
    
    BOOL isCan = YES;
    
    if (self.inputWordNumber < self.maxLength){
        isCan = YES;
    }else if (self.inputWordNumber == self.maxLength) {
        self.subWordNumber = self.text.length;
        isCan = NO;
    }else if(self.inputWordNumber == self.maxLength - 1){
        self.subWordNumber = self.text.length + 1;
        isCan = NO;
    }else if(self.inputWordNumber == self.maxLength + 1){
        self.subWordNumber = self.text.length - 1;
        isCan = NO;
    }else{
        isCan = NO;
    }
    return isCan;
    
}


#pragma mark test



//
//- (void)textFiledEditBymaxLength:(NSUInteger)maxLength block:(void (^)())block
//{
//    
//    NSString *toBeString = self.text;
//    self.emojiNumber = [NSNumber numberWithInteger:[toBeString emojiNumberOfSting]];
//    self.textFieldInputTextLength  = [toBeString convertToInt] - [self.emojiNumber integerValue];
//    
////    DLog(@"textViewInputTextLength is %ld emojiNum  is %ld",self.textFieldInputTextLength ,[toBeString emojiNumberOfSting]);
//    
//    
//    if (self.textFieldInputTextLength == maxLength){
//        self.subLength = [NSNumber numberWithInteger:self.text.length];
//    }else if (self.textFieldInputTextLength == maxLength - 1){
//        self.subLength = [NSNumber numberWithInteger:self.text.length + 1];
//    }else if (self.textFieldInputTextLength == maxLength + 1) {
//        self.subLength = [NSNumber numberWithInteger:self.text.length - 1];
//    }
////    DLog(@"111111   ========nnnnnnn%ld",[self.subLength integerValue]);
//    NSString *lang = [self.textInputMode primaryLanguage]; // 键盘输入模式
//    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
//        UITextRange *selectedRange = [self markedTextRange];
//        //获取高亮部分
//        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
//        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
//        if(!position) {
//            if (self.textFieldInputTextLength >= maxLength) {
//                //                DLog(@"22222   ========nnnnnnn%ld",[self.subLength integerValue]);
//                self.text = [toBeString substringToIndex:[self.subLength integerValue]];
//                block();
//            }
//            
//        }
//        //有高亮选择的字符串，则暂不对文字进行统计和限制
//        else{
//            
//        }
//    }
//    //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
//    else{
//        if (self.textFieldInputTextLength >= maxLength) {
//            //            DLog(@"3333333   ========nnnnnnn%ld",[self.subLength integerValue]);
//            self.text = [toBeString substringToIndex:[self.subLength integerValue]];
//            block();
//        }
//    }
//}


@end
