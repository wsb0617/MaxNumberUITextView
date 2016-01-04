//
//  NSString+EmojiAdditions.h
//  Orimuse
//
//  Created by wsb0617 on 15/12/29.
//  Copyright © 2015年 wsb0617. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EmojiAdditions)


- (BOOL)isIncludingEmoji;

- (instancetype)removedEmojiString;


- (NSString *)stringByReplacingEmojiCheatCodesWithUnicode;


- (NSString *)stringByReplacingEmojiUnicodeWithCheatCodes;


+ (BOOL)stringContainsEmoji:(NSString *)string;

@end
