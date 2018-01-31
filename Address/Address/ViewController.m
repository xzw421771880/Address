//
//  ViewController.m
//  Address
//
//  Created by mc on 2018/1/31.
//  Copyright © 2018年 肖中旺. All rights reserved.
//

#import "ViewController.h"
//#import <Contacts/Contacts.h>
#import <ContactsUI/CNContactPickerViewController.h>

@interface ViewController ()<CNContactPickerDelegate>
{
    UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 150, 30)];
    label.backgroundColor=[UIColor grayColor];
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [label addGestureRecognizer:tap];
    label.userInteractionEnabled=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tapAction {
//    [self.navigationController pushViewController: vc animated:true];
    CNContactPickerViewController *pickerViewController=[[CNContactPickerViewController alloc]init];
    
    pickerViewController.delegate=self;
    
    //设置联系人展示哪些属性
    pickerViewController.displayedPropertyKeys=[NSArray arrayWithObject:CNContactPhoneNumbersKey];
    [self presentViewController:pickerViewController animated:YES completion:nil];
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{
    NSString*selectPhoneNum= [contactProperty.value stringValue];
    NSLog(@"selectPhoneNum===%@",selectPhoneNum);
    selectPhoneNum = [selectPhoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    selectPhoneNum = [selectPhoneNum stringByReplacingOccurrencesOfString:@"(" withString:@""];
    selectPhoneNum = [selectPhoneNum stringByReplacingOccurrencesOfString:@")" withString:@""];
    selectPhoneNum = [selectPhoneNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSLog(@"11selectPhoneNum===%@",selectPhoneNum);
    selectPhoneNum = [selectPhoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"22selectPhoneNum===%@",selectPhoneNum);
    label.text=selectPhoneNum;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
