#import "NSString+JXRegular.h"

@implementation NSString (JXRegular)


/**
 *  是否匹配正则表达式
 */
- (BOOL)isRegexMatching:(NSString *)regex;
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:self];
}

/**
 *  替换正则表达式匹配到的字符串
 */
- (NSString *)regex:(NSString *)regex replaceStr:(NSString *)replaceStr
{
    NSError* error = NULL;
    NSRegularExpression* regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
    
    return [regexExpression stringByReplacingMatchesInString:self
                                                     options:0
                                                       range:NSMakeRange(0, self.length)
                                                withTemplate:replaceStr];
}

/**
 *  正则表达式匹配子字符串
 */
- (NSString *)regexMatching:(NSString *)regex;
{
    NSError *error;
    NSRegularExpression *regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
    if (regexExpression) {
        NSTextCheckingResult *firstMatch=[regexExpression firstMatchInString:self
                                                                     options:0
                                                                       range:NSMakeRange(0, [self length])];
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result=[self substringWithRange:resultRange];
            return result;
        }
    }
    return nil;
}

/**
 *  匹配是否符合某种类型的正则
 */
- (BOOL)isRegexType:(JXRegexType)regexType
{
    NSString *regexStr;
    switch (regexType) {
        case regexType_QQ:
            regexStr = @"[1-9][0-9]{4,}";
            break;
        case regexType_Email:
            regexStr = @"w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)*";
            break;
        case regexType_PhoneNumber:
            regexStr = @"d{3}-d{8}|d{4}-d{7}";
            break;
        case regexType_Ip:
            regexStr = @"d+.d+.d+.d+";
            break;
        default:
            break;
    }
    return [self isRegexMatching:regexStr];
}

@end
