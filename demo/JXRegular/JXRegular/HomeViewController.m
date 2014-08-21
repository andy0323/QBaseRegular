//    // 判断是否为中文
//    BOOL isMatching = [@"匹配是否含有中文" isRegexMatching:@"[^x00-xff]*"];
//    NSLog(@"匹配是否含有中文结果: %d", isMatching);
//
//    // 查找匹配正则的子串
//    NSString *subStr = [@"我的手机号码是010-88888888" regexMatching:@"\\d{3}-\\d{8}|\\d{4}-\\d{7}"];
//    NSLog(@"%@", subStr);
//
//    // 替换匹配正的的子串
//    NSString *replaceStr = [@"HAHAHA,我有一个的好东西" regex:@"HA" replaceStr:@"哈"];
//    NSLog(@"%@", replaceStr);
//
//
//    // 匹配某种业务
//    isMatching = [@"http://www.baidu.com" isRegexType:regexType_URL];
//    NSLog(@"%d", isMatching);


#import "HomeViewController.h"
#import "NSString+JXRegular.h"
@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    
    UITextField *_inputTF;
    
    NSArray *_typeArray;

    JXRegexType _currentType;
}
@end

@implementation HomeViewController

- (void)configBarItems
{
    _inputTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    _inputTF.borderStyle = UITextBorderStyleRoundedRect;
    _inputTF.autocapitalizationType = UITextAutocorrectionTypeNo;
    _inputTF.autocorrectionType = UITextAutocorrectionTypeNo;
    self.navigationItem.titleView = _inputTF;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(matchingRegex)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)matchingRegex
{
    if (_currentType==(JXRegexType)NSNotFound) {
        NSLog(@"请先设置正则匹配类型");
    }else if(_inputTF.text && ![_inputTF.text isEqualToString:@""]){
        
        BOOL res = [_inputTF.text isRegexType:_currentType];
        NSLog(@"%d", res);
    }else {
        NSLog(@"输入要匹配的字符");
    }
}

- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _currentType = (JXRegexType)NSNotFound;
    _typeArray = @[@"QQ",@"Email",@"PhoneNumber",@"Ip",@"URL"];
    
    [self configBarItems];
    [self createTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _typeArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"UITableViewCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = _typeArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    static UITableViewCell *cell;
    if (cell) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell = [_tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

    _currentType = (JXRegexType)indexPath.row;
}

@end
