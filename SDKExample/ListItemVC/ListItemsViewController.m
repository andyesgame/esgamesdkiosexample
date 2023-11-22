//
//  ListItemsViewController.m
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import "ListItemsViewController.h"
#import "Product.h"
#import "ProductItemCell.h"

@interface ListItemsViewController () {
    
}


@end

@implementation ListItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        

    
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
//    NSLog(@"OnTap...: %ld", (long)sender.tag);
//    
//    SKProduct * p = self.products[sender.tag];
//    
//    [IAPManager.shared purchase:p];
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
