#import <Foundation/Foundation.h>

extern NSString *const QBaseRegularMatchesQQ;
extern NSString *const QBaseRegularMatchesMail;
extern NSString *const QBaseRegularMatchesIpAddress;
extern NSString *const QBaseRegularMatchesURL;
extern NSString *const QBaseRegularMatchesPhoneNumber;

@interface NSString (QBaseRegular)

- (BOOL)isMatches:(NSString *)regex;

- (BOOL)isQQ;
- (BOOL)isMail;
- (BOOL)isIpAddress;
- (BOOL)isURL;
- (BOOL)isPhoneNumber;

- (NSArray *)matchesAll:(NSString *)regex;
- (NSString *)matchesFirstOne:(NSString *)regex;

- (NSString *)replaceStringWithRegex:(NSString *)regex
                     replaceTemplate:(NSString *)replaceTemplate;

@end