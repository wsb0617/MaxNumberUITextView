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

/**
 Returns a NSString in which any occurrences that match the cheat codes
 from Emoji Cheat Sheet <http://www.emoji-cheat-sheet.com> are replaced by the
 corresponding unicode characters.
 
 Example:
 "This is a smiley face :smiley:"
 
 Will be replaced with:
 "This is a smiley face \U0001F604"
 */
- (NSString *)stringByReplacingEmojiCheatCodesWithUnicode;

/**
 Returns a NSString in which any occurrences that match the unicode characters
 of the emoji emoticons are replaced by the corresponding cheat codes from
 Emoji Cheat Sheet <http://www.emoji-cheat-sheet.com>.
 
 Example:
 "This is a smiley face \U0001F604"
 
 Will be replaced with:
 "This is a smiley face :smiley:"
 */
- (NSString *)stringByReplacingEmojiUnicodeWithCheatCodes;


+ (BOOL)stringContainsEmoji:(NSString *)string;

@end
