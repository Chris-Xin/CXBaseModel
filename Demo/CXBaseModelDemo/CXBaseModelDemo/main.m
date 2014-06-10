//
//  main.m
//  CXBaseModelDemo
//
//  Created by Chris on 14-6-10.
//  Copyright (c) 2014年 Chris.Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModel.h"

#define URLString   @"http://www.weather.com.cn/data/sk/101010100.html"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:URLString];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"GET"];
        [request setURL:url];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:request queue:queue  completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
            
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary *dic = [jsonDic objectForKey:@"weatherinfo"];
            
            WeatherModel *model = [[WeatherModel alloc] init];
            [model setDictionary:dic];
            
            NSLog(@"%@", model);
        }];
        
        [[NSRunLoop mainRunLoop] run];
        
    }
    return 0;
}

