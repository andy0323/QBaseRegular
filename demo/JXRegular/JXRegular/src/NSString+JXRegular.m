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

@end
