//
//  ListItemsViewController.h
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import <UIKit/UIKit.h>
#import "IAPManager.h"
@import ESSDK;

@interface ListItemsViewController : UIViewController<SdkDelegate, IAPDelegate>
@property (weak, nonatomic) IBOutlet UIStackView *stvContent;
@property (strong, nonatomic) NSMutableArray * products;

@end

