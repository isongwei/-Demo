//
//  ViewController.m
//  数据本地化存储Demo
//
//  Created by iSongWei on 2017/7/28.
//  Copyright © 2017年 iSong. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+WriteFile.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getInfoBtn;
@property (weak, nonatomic) IBOutlet UITextView *tv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
}

-(void)Demo1{
    
    if ([self saveDic:@{@"ssss":@"ssss"}.mutableCopy FileName:@"dic"]) {
        
    }

    
    
    
}
- (IBAction)saveInfo:(UIButton *)sender {
    
    [self Demo1];
    
    
}

- (IBAction)getInfo:(UIButton *)sender {
    
    _tv.text = [[self getDicWithFileName:@"dic"] description];
    
}

@end
