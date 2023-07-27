//
//  ListItemsViewController.m
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import "ListItemsViewController.h"
#import "Product.h"
#import "ProductItemCell.h"
#import "IAPManager.h"

@interface ListItemsViewController () {
    
}


@end

@implementation ListItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.products = [[NSMutableArray alloc] init];
    
    NSMutableArray * ids = [[NSMutableArray alloc] init];
    [ids addObject:@"com.userjoy.sgc.vinn_yuanbao06"];
    [ids addObject:@"com.userjoy.sgc.vinn_yuanbao02"];
    [ids addObject:@"com.userjoy.sgc.vinn_yuanbao07"];
    [IAPManager.shared configProductIds:ids];
    [IAPManager.shared setParmamsIfNeed:@"1" :@"123" :@""];
    
    __weak ListItemsViewController * weakSelf = self ;
    [IAPManager.shared fetchAvailableProducts:^(NSArray<SKProduct *> * products) {
        [weakSelf.products addObjectsFromArray:products];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf bindDataToItem];
        });
        
    }];
    
}

-(void)bindDataToItem {
    for (int i = 0; i < self.products.count; i ++) {
        UIButton * btnItem = _stvContent.arrangedSubviews[i];
        btnItem.tag = i;
        SKProduct * product = self.products[i];
        [btnItem setTitle:product.productIdentifier forState:UIControlStateNormal];
        //[btnItem setExclusiveTouch:YES];
        
        [btnItem addTarget:self action:@selector(didTapItem:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)didTapItem: (UIButton *) sender {
    NSLog(@"OnTap...: %ld", (long)sender.tag);
    
    SKProduct * p = self.products[sender.tag];
    
    [IAPManager.shared purchase:p];
}

- (void)responseLogin:(BOOL)isSuccess :(nonnull NSString *)message :(NSInteger)errorCode :(nonnull User *)user {
  printf("----------------callback--login");
  NSLog(@"%@", message);
  NSLog(isSuccess ? @"YES" : @"NO");
  NSLog(@"%ld",(long)errorCode);
  NSLog(@"%@",user);
}

- (void)responseLogout {
  printf("----------------callback--logout");
}

#pragma In-app Purchase Delegate:

-(void)paymentSuccess:(SKPaymentTransaction*)transaction{
    NSLog(@"buyProduct return: %@", transaction.payment.productIdentifier);
}

@end
