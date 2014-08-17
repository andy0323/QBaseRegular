# JXRegular

JXRegular是一个封装正则表达式的小组件, 可以简单准确的匹配到用户需要的信息.

### 1. 准备工作

1. 将src中的文件导入项目

### 2. 如何匹配正则表达式

####2.1 通过自定义正则表达式, 进行字符串匹配 (以下方法均为NSString类别)

**(1) 是否匹配正则表达式**

    BOOL isMatching = [@"Hello World" isRegexMatching:@"^.*$"];
	
**(2) 替换正则表达式匹配到的字符串**

	    NSString *replaceStr = [@"Hello World" regex:@"^.*$" replaceStr:@"Thanks"];

**(3) 正则表达式匹配子字符串**

	    NSString *subStr = [@"Hello World" regexMatching:@"\\w* \\w*"];

####2.2 通过JXRegular快速判断是否满足用户所想要的信息

> 未完成..


### 3. 不了解正则表达式怎么办.?

**demo中有一个AboutRegex.h 里面对所有正则表达式有着详细的说明...**

## Contact
**Email:** andy_ios@163.com


##Licenses

All source code is licensed under the [MIT License](https://github.com/andy0323/JXRegular/blob/master/LICENSE).

