//
//  NSObject+WriteFile.h
//
//
//  Created by iSongWei on 2017/7/26.
//  Copyright © 2017年 iSong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WriteFile)

-(BOOL)saveData:(NSData * )data FileName:(NSString *)fileName;
-(NSData *)getDataWithFileName:(NSString *)fileName;

-(BOOL)saveDic:(NSDictionary * )dic FileName:(NSString *)fileName;
-(NSDictionary *)getDicWithFileName:(NSString *)fileName;





@end
