//
//  BudgetListController.m
//  Sanity
//
//  Created by Tianmu on 10/15/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "BudgetListController.h"
#include "Category.h"
#include "Budget.h"

@implementation BudgetListController

-(void) requestBudgetList{
    NSMutableArray* budgetList=self.client.budgetListDataDic;
    NSMutableArray *name = [[NSMutableArray alloc]init];
    NSMutableArray *amount = [[NSMutableArray alloc]init];
    NSMutableArray *color = [[NSMutableArray alloc]init];
    for(int i=0;i<budgetList.count;i++){
        NSDictionary* budget=[budgetList objectAtIndex:i];
        [name addObject:[budget objectForKey:@"name"]];
        NSNumber* spent=[budget objectForKey:@"budgetSpent"];
        NSNumber* total=[budget objectForKey:@"budgetTotal"];
        NSString* amountString= [NSString stringWithFormat:@"%@/%@",spent,total];
        [amount addObject:amountString];
        [color addObject:@"black"];
        
        
        //NSString *spendT = [NSNumber stringValue];
        
    }
    [self.delegate setBudget:name amount:amount colors:color];
    
}


-(void) requestBudget:(NSString*) name{
    Budget* single=[self.client getBudget:name];
    NSMutableArray *name1 = [[NSMutableArray alloc]init];
    NSMutableArray *amount = [[NSMutableArray alloc]init];
    for(int j=0;j<single.categories.count;j++){
        Category* cat=  [single.categories objectAtIndex:j];
        NSString* Catname=cat.name;
        double Catspent=cat.spent;
        double Cattotal=cat.limit;
        NSString* amountString= [NSString stringWithFormat:@"%f/%f",Catspent,Cattotal];
        [amount addObject:amountString];
        [name1 addObject:Catname];
        
    }
    NSLog(@"%@", name1);
     NSLog(@"%@", amount);
    [self.delegate setTexts:name1 slices:amount];

}



@end
