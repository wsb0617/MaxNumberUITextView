//
//  NSString+EmojiNumber.h
//  Orimuse
//
//  Created by wsb0617 on 15/12/29.
//  Copyright © 2015年 wsb0617. All rights reserved.
//

#import "NSString+EmojiNumber.h"

@implementation NSString (EmojiNumber)

- (NSInteger)emojiNumberOfSting{

    __block NSInteger emojiNum = 0;
    if (![NSString stringContainsEmoji:self]) {
        return emojiNum;
    }
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                                  options:NSStringEnumerationByComposedCharacterSequences
                               usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                   if ([NSString stringContainsEmoji:substring]) {
                                       emojiNum += 1;
                                   }
                               }];
    return emojiNum;
    
}


//得到中英文混合字符串长度
- (NSInteger)convertToInt{
    
    //    NSInteger strlength = 0;
    //    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    //    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
    //        if (*p) {
    //            p++;
    //            strlength++;
    //        }
    //        else {
    //            p++;
    //        }
    //    }
    //    return (strlength+1)/2;
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data = [self dataUsingEncoding:enc];
    NSUInteger dataLength = [data length];
    return (dataLength+1)/2;
    
}

@end
