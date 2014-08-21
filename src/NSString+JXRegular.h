//
//  NSString+JXRegular.h
//  JXRegular
//
//  Created by andy on 8/17/14.
//  Copyright (c) 2014 JianXiang Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    regexType_QQ = 0,
    regexType_Email ,
    regexType_PhoneNumber,
    regexType_Ip,
    regexType_URL
}JXRegexType;

@interface NSString (JXRegular)

/**
 *  是否匹配正则表达式
 *
 *  @param regex 正则表达式
 *
 *  @return 匹配结果
 */
- (BOOL)isRegexMatching:(NSString *)regex;

/**
 *  替换正则表达式匹配到的字符串
 *
 *  @param regex      正则表达式
 *  @param replaceStr 需要替换的字符串
 *
 *  @return 替换完成的结果
 */
- (NSString *)regex:(NSString *)regex replaceStr:(NSString *)replaceStr;

/**
 *  正则表达式匹配子字符串
 *
 *  @param regex 正则表达式
 *
 *  @return 匹配正则表达式的子字符串
 */
- (NSString *)regexMatching:(NSString *)regex;

/**
 *  匹配是否符合某种类型的正则
 *
 *  @param regexType 某种正则规则
 *
 *  @return 是否匹配
 */
- (BOOL)isRegexType:(JXRegexType)regexType;

@end
