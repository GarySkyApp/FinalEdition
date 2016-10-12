
//
//  DBManager.m
//  DelFMDB
//
//  Created by hehai on 16/10/10.
//  Copyright © 2016年 J. All rights reserved.
//

#import "DBManager.h"


@interface DBManager ()

@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;
@end

@implementation DBManager


- (void)insertData:(int)fromIndex useTransaction:(BOOL)useTransaction
{
    if (useTransaction) {
        
        __block BOOL flag;
        [self.databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
           
                @try {
//                    for (int i = fromIndex; i<500+fromIndex; i++) {
                    for (int i = 0; i<fromIndex+1000; i++) {
                        NSString *nId = [NSString stringWithFormat:@"%d",i];
                        NSString *phone= [[NSString alloc] initWithFormat:@"phone_%d",i];
                        NSString *strName = [[NSString alloc] initWithFormat:@"name_%d",i];
                        NSString *roomID= [[NSString alloc] initWithFormat:@"roomid_%d",i];
                        NSString *sql = @"INSERT INTO GroupPersonInfo(uid,phone,name,groupRoomId) VALUES (?,?,?,?)";
                        
                        /*BOOL success = [db executeUpdate:@"delete from GroupPersonInfo where uid = ?",nId];
                        if (success) {
                            NSLog(@"删除重复成功");
                        } else {
                            NSLog(@"删除重复失败");
                        }*/
                        
                        
                        flag = [db executeUpdate:sql,nId,phone,strName,roomID];
                        *rollback = !flag;
                        if (!flag) {
                            NSLog(@"插入失败2");
                        }
                    }
                }
                @catch (NSException *exception) {
                    *rollback = YES;
                }
                @finally {
                }
            
        }];
    }else{
        [self.databaseQueue inDatabase:^(FMDatabase *db) {
//            for (int i = fromIndex; i<500+fromIndex; i++) {
            for (int i = 0; i<fromIndex; i++) {
                NSString *nId = [NSString stringWithFormat:@"%d",i];
                NSString *phone= [[NSString alloc] initWithFormat:@"phone_%d",i];
                NSString *strName = [[NSString alloc] initWithFormat:@"name_%d",i];
                NSString *roomID= [[NSString alloc] initWithFormat:@"roomid_%d",i];
                NSString *sql = @"INSERT INTO GroupPersonInfo(uid,phone,name,groupRoomId) VALUES (?,?,?,?)";
                BOOL a = [db executeUpdate:sql,nId,phone,strName,roomID];
                if (!a) {
                    NSLog(@"插入失败2");
                }
            }

        }];
    }
}

-(BOOL)openDB
{
    NSFileManager *filaManager = [NSFileManager defaultManager];
    BOOL isFile = NO;
    //判断有没有数据库文件
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    //dbPath： 数据库路径，在Document中。
    NSString* uidPath = documentDirectory;
    
    BOOL isDir = FALSE;
    
    BOOL isDirExist = [filaManager fileExistsAtPath:uidPath isDirectory:&isDir];
    
    if(!(isDirExist && isDir))
    {
        BOOL bCreateDir = [filaManager createDirectoryAtPath:uidPath withIntermediateDirectories:YES attributes:nil error:nil];
        if(!bCreateDir)
        {
            NSLog(@"Create MsgPic Directory Failed.");
        }
    }
    
    NSString* DBFilePath = [uidPath stringByAppendingPathComponent:@"DBInfo.db"];
    _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:DBFilePath];
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", @"GroupPersonInfo"];
        while ([rs next]) {
            NSInteger count = [rs intForColumn:@"count"];
            if (count == 0) {
                BOOL success = [db executeUpdate:@"CREATE TABLE GroupPersonInfo(uid text,phone text,name text,groupRoomId text);"];
                if (success) {
                    NSLog(@"表创建成功");
                } else {
                    NSLog(@"表创建失败");
                }
                
                BOOL csuccess = [db executeUpdate:@"CREATE trigger fk_Update before insert on GroupPersonInfo for each row begin delete from GroupPersonInfo where uid = new.uid; end;"];
                if (csuccess) {
                    NSLog(@"创建触发器成功");
                } else {
                    NSLog(@"创建触发器失败");
                }
                
            }else{
                /*BOOL success =  [db executeUpdate:@"DELETE FROM GroupPersonInfo"];
                if (success) {
                    NSLog(@"清除表数据成功");
                }else{
                    NSLog(@"清除表数据失败");
                }*/
            }
        }
        
    }];
    
    return YES;
}

-(void)testDBSpeed
{
    [self openDB];

    NSDate *date1 = [NSDate date];
   // [self insertData:500 useTransaction:NO];
    NSDate *date2 = [NSDate date];
    NSTimeInterval a = [date2 timeIntervalSince1970] - [date1 timeIntervalSince1970];
    NSLog(@"不使用事务插入500条数据用时%.3f秒",a);
    [self insertData:1000 useTransaction:YES];
    NSDate *date3 = [NSDate date];
    NSTimeInterval b = [date3 timeIntervalSince1970] - [date2 timeIntervalSince1970];
    NSLog(@"使用事务插入500条数据用时%.3f秒",b);
    
}

@end
