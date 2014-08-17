# JXRegular

JXRegular是一个封装正则表达式的小组件, 可以简单准确的匹配到用户需要的信息.

### 1. 准备工作

1. 将src中的文件导入项目

### 2. 如何匹配正则表达式 

**是否匹配正则表达式**

    // 判断是否为中文
    BOOL isMatching = [@"匹配是否含有中文" isRegexMatching:@"[^x00-xff]*"];
    NSLog(@"匹配是否含有中文结果: %d", isMatching);
	
**替换正则表达式匹配到的字符串**

	// 替换匹配正的的子串
    NSString *replaceStr = [@"HAHAHA,我有一个的好东西" regex:@"HA" replaceStr:@"哈"];
    NSLog(@"%@", replaceStr);

**正则表达式匹配子字符串**

	// 查找匹配正则的子串
    NSString *subStr = [@"我的手机号码是010-88888888" regexMatching:@"\\d{3}-\\d{8}|\\d{4}-\\d{7}"];
    NSLog(@"%@", subStr);

### 3. 不了解正则表达式怎么办.?

**demo中有一个AboutRegex.h 里面对所有正则表达式有着详细的说明...**

## Contact
**Email:** andy_ios@163.com


##Licenses

All source code is licensed under the [MIT License](https://github.com/andy0323/JXRegular/blob/master/LICENSE).

