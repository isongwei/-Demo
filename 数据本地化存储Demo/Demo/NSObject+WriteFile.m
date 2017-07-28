//
//  NSObject+WriteFile.m
//  
//
//  Created by iSongWei on 2017/7/26.
//  Copyright © 2017年 iSong. All rights reserved.
//

#import "NSObject+WriteFile.h"

@implementation NSObject (WriteFile)


-(BOOL)saveData:(NSData * )data FileName:(NSString *)fileName{

    //往文件中写入数据：
    return  [data writeToFile:[self getSystemPathWithPath:fileName] atomically:YES];
    

}

-(NSData *)getDataWithFileName:(NSString *)fileName{
    if (![self getSystemPathWithPath:fileName]) {
        return nil;
    }
    
    if (/* DISABLES CODE */ (0)) {
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:[self getLastWithFileDate:[self getSystemPathWithPath:fileName]]];
        if (timeInterval > 3) {
            return nil;
        }
    }
    //从FileName中读取出数据
    return [NSData dataWithContentsOfFile:[self getSystemPathWithPath:fileName] options:0 error:NULL];

}


-(BOOL)saveDic:(NSDictionary * )dic FileName:(NSString *)fileName{

    return  [dic writeToFile:[self getSystemPathWithPath:fileName] atomically:YES];
  
}
-(NSDictionary *)getDicWithFileName:(NSString *)fileName{
    if (![self getSystemPathWithPath:fileName]) {
        return nil;
    }
    
    
    if (/* DISABLES CODE */ (0)) {
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:[self getLastWithFileDate:[self getSystemPathWithPath:fileName]]];
        if (timeInterval > 3) {
            return nil;
        }
    }

    
    return [NSDictionary dictionaryWithContentsOfFile:[self getSystemPathWithPath:fileName]];
}

#pragma mark - ===============获取本地缓存文件的最后写入时间===============

- (NSDate *)getLastWithFileDate:(NSString *)path{
    NSFileManager * manager = [NSFileManager defaultManager];
    // 获取制定的路径的下面的文件的最后修改时间属性,并返回
    NSDictionary * dic = [manager attributesOfItemAtPath:path error:nil];
    return dic[NSFileModificationDate];
}

#pragma mark - ===============获取路径===============

-(NSString *)getSystemPathWithPath:(NSString * )path{
    
    
    NSString * pathStr = [NSString stringWithFormat:@"%@/Documents/Cache/",NSHomeDirectory()];
    // 根据路径创建文件
    NSFileManager * mangager = [NSFileManager defaultManager];
    BOOL ret = [mangager createDirectoryAtPath:pathStr withIntermediateDirectories:YES attributes:nil error:nil];
    if (ret) {
        NSLog(@"创建缓存路径成功");
        return [NSString stringWithFormat:@"%@%@",pathStr,path];
    }else{
        NSLog(@"创建缓存路径失败");
        return nil;
    }
    
    
    
    
    
    
    
    
    
    
    
//    NSString * pathStr = [NSString stringWithFormat:@"%@/Documents/Cache/%@",NSHomeDirectory(),path];
//    // 判断路径是否存在
//    NSFileManager * manager = [NSFileManager defaultManager];
//    if (![manager fileExistsAtPath:pathStr]) {
//        return nil;
//    }
    
    
    
    
    
    
    //NSCachesDirectory  Caches目录
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    
    NSString *ourDocumentPath =[documentPaths objectAtIndex:0];
    //第二步：生成在该路径下的文件：

    return  [ourDocumentPath stringByAppendingPathComponent:path];//fileName就是保存文件的文件名
    
}



@end
