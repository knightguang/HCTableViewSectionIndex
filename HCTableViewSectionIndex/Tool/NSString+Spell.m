//
//  NSString+Spell.m
//  HCTableViewSectionIndex
//
//  Created by 光 on 16/8/22.
//  Copyright © 2016年 光. All rights reserved.
//

#import "NSString+Spell.h"

@implementation NSString (Spell)

- (NSString *)spellPrefixForChinese
{
    NSMutableString *string = [self mutableCopy];
    
    /**
     *  kCFStringTransformMandarinLatin将汉字转为拼音
     *  kCFStringTransformStripDiacritics去掉声调
     */
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    
    // 部分字会被转成错误的拼音
    if ([[(NSString *)self substringToIndex:1] compare:@"长"] ==NSOrderedSame)
    {
        [string replaceCharactersInRange:NSMakeRange(0, 5)withString:@"chang"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"沈"] ==NSOrderedSame)
    {
        [string replaceCharactersInRange:NSMakeRange(0, 4)withString:@"shen"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"厦"] ==NSOrderedSame)
    {
        [string replaceCharactersInRange:NSMakeRange(0, 3)withString:@"xia"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"地"] ==NSOrderedSame)
    {
        [string replaceCharactersInRange:NSMakeRange(0, 3)withString:@"di"];
    }
    
    if ([[(NSString *)self substringToIndex:1] compare:@"重"] ==NSOrderedSame)
    {
        [string replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chong"];
    }
    
    
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return nil;
}




@end
