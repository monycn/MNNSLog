//
//  MONYNSLog.m
//  MONYNSLog
//
//  Created by Mony on 15/8/17.
//  Copyright (c) 2015年 Mony. All rights reserved.
//

#import "MONYNSLog.h"

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *retString = [[NSMutableString alloc]init];
    
    [retString appendString:@"\n(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != 0) {
            [retString appendFormat:@",\n"];
        }
        [retString appendFormat:@"\t%@",obj];
    }];
    [retString appendString:@"\n)\n"];
    [retString appendFormat:@"Total %zd item(s).",self.count];
    return retString;
}

@end

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale {
    __block NSInteger count = 0;
    NSMutableString *retString = [[NSMutableString alloc]init];
    
    [retString appendString:@"\n{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [retString appendFormat:@"\t%@ = %@;\n",[self checkNSStringWithObj:key],[self checkNSStringWithObj:obj]];
        count ++;
    }];
    [retString appendString:@"}\n"];
    [retString appendFormat:@"Total %zd Key-Value(s).",count];
    return retString;
}

-(NSString *)checkNSStringWithObj:(id)obj {
    if ([obj isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"\"%@\"",obj];
    }
    else {
        return [NSString stringWithFormat:@"%@",obj];
    }
}

@end