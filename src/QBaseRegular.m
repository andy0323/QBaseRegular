#import "QBaseRegular.h"

NSString *const QBaseRegularMatchesQQ = @"[1-9][0-9]{4,}";
NSString *const QBaseRegularMatchesMail = @"^([a-z0-9]*[-_]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[.][a-z]{2,3}([.][a-z]{2})?$";
NSString *const QBaseRegularMatchesPhoneNumber = @"[0-9]{3}-[0-9]{8}|[0-9]{4}-[0-9]{7}";
NSString *const QBaseRegularMatchesIpAddress = @"((25[0-5]|2[0-4][0-9]|((1[0-9]{2})|([1-9]?[0-9]))).){3}(25[0-5]|2[0-4][0-9]|((1[0-9]{2})|([1-9]?[0-9])))";
NSString *const QBaseRegularMatchesURL = @"(https?|ftp|mms)://([A-z0-9]+[_-]?[A-z0-9]+.)*[A-z0-9]+-?[A-z0-9]+.[A-z]{2,}(.*)*";

@implementation NSString (QBaseRegular)

#pragma mark -
#pragma mark isMatches

- (BOOL)isMatches:(NSString *)regex
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:self];
}

- (BOOL)isQQ
{
    return [self isMatches:QBaseRegularMatchesQQ];
}

- (BOOL)isMail
{
    return [self isMatches:QBaseRegularMatchesMail];
}

- (BOOL)isIpAddress
{
    return [self isMatches:QBaseRegularMatchesIpAddress];
}

- (BOOL)isURL
{
    return [self isMatches:QBaseRegularMatchesURL];
}

- (BOOL)isPhoneNumber
{
    return [self isMatches:QBaseRegularMatchesPhoneNumber];
}

#pragma mark -
#pragma mark Mathes

- (NSArray *)matchesAll:(NSString *)regex
{
    NSMutableArray *ret = [NSMutableArray array];;
    
    NSError *error;
    NSRegularExpression *regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
    if (regexExpression) {
        NSArray *allMatch = [regexExpression matchesInString:self
                                                     options:0
                                                       range:NSMakeRange(0, [self length])];
        if (allMatch.count) {
            for (NSTextCheckingResult *result in allMatch) {
                NSRange resultRange = [result rangeAtIndex:0];
                NSString *str = [self substringWithRange:resultRange];
                [ret addObject:str];
            }
        }
    }
    return ret;
}

- (NSString *)matchesFirstOne:(NSString *)regex
{
    NSError *error;
    NSRegularExpression *regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
    if (regexExpression) {
        NSTextCheckingResult *firstMatch = [regexExpression firstMatchInString:self
                                                                       options:0
                                                                         range:NSMakeRange(0, [self length])];
        if (firstMatch) {
            NSRange resultRange = [firstMatch rangeAtIndex:0];
            NSString *result = [self substringWithRange:resultRange];
            return result;
        }
    }
    return nil;
}

- (NSString *)replaceStringWithRegex:(NSString *)regex
                     replaceTemplate:(NSString *)replaceTemplate
{
    NSError* error = NULL;
    NSRegularExpression* regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:&error];
    
    return [regexExpression stringByReplacingMatchesInString:self
                                                     options:0
                                                       range:NSMakeRange(0, self.length)
                                                withTemplate:replaceTemplate];
}

@end