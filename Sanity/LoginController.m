//
//  LoginController.m
//  Sanity
//
//  Created by Tianmu on 10/14/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "LoginController.h"

@implementation LoginController


- (id) initWithClass:(client *)myClient{
    self = [super initWithClass: myClient];
    if (self) {
        // self.client=myClient;
    }
    
   // [self signup:@"tianmule@usc.edu" username:@"tianmule" password:@"baobao"];
    
    return self;
    
}


-(int) hash1:(NSString*) password{
    int hash = 7;
    for (int i = 0; i < password.length; i++) {
        hash = hash*31 + [password characterAtIndex:i];
    }
    return hash;
}

-(int) hash2:(NSString*) password{
    int hash = 10;
    for (int i = 0; i < password.length; i++) {
        hash = hash*41 + [password characterAtIndex:i];
        
    }
    return hash;
}

-(void) login: (NSString*) email password:(NSString*) password{
    int p1=[self hash1:password];
    int p2=[self hash2:password];
    NSString *password1 = [NSString stringWithFormat:@"%d", p1];
    NSString *password2 = [NSString stringWithFormat:@"%d", p2];
    
    
    self.client.myUser.email=email;
   
    
    NSDictionary *info=@{@"email":email,@"username":@"",@"password1":password1,@"password2":password2};
    
    NSDictionary *message=@{@"function":@"login",@"information":info};
    
    [self.client sendMessage:message];

    
    
    
}


-(void) fail{
    [self.delegate loginFailed:@"username and password is incorrect"];
}
-(void) success: (NSArray*) budgetList{
    NSMutableArray *name = [[NSMutableArray alloc]init];
    NSMutableArray *amount = [[NSMutableArray alloc]init];
    NSMutableArray *color = [[NSMutableArray alloc]init];
    for(int i=0;i<budgetList.count;i++){
        NSDictionary* budget=[budgetList objectAtIndex:i];
        NSString* nameString=[budget objectForKey:@"name"];
        //[name addObject:nameString];
        NSNumber* spent=[budget objectForKey:@"budgetSpent"];
        NSNumber* total=[budget objectForKey:@"budgetTotal"];
       // NSString* amountString= [NSString stringWithFormat:@"%d/%d",[spent integerValue],[total integerValue]];
        //[amount addObject:@"10/10"];
        NSString* black=@"black";
        [name addObject:@"chenggongba"];
        [amount addObject:@"10/10"];
        [color addObject:@"black"];
        //[color addObject:black];
        
        
        
    }
    NSArray * nameArray= [name copy];
    NSArray * spentArray= [amount copy];
    NSArray * colorArray= [color copy];
    
    NSLog(@"%@", nameArray);
    NSLog(@"%@", spentArray);
     NSLog(@"%@", colorArray);
    

    [self.delegate loginSucceeded:nameArray withAmount:spentArray withColor:colorArray];

    
}




@end
