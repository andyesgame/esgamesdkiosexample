#import "ViewController.h"
#import "ESGameSDK.h"
#import "SdkDelegate.h"
#import "ListItemsViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
    ESGameSDK *esgameSdk = [ESGameSDK sharedObject];
  esgameSdk.delegate = self;
  [esgameSdk init:self];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)btnLogin:(id)sender {
  ESGameSDK *esgameSdk = [ESGameSDK sharedObject];
  [esgameSdk login:self];
}
- (IBAction)btnLogout:(id)sender {
  ESGameSDK *esgameSdk = [ESGameSDK sharedObject];
  [esgameSdk logout];
   /** [esgameSdk deleteAccount:^(bool ok) {
        
    }];
    */
}

- (IBAction)btnBuyItem:(id)sender {
  ESGameSDK *esgameSdk = [ESGameSDK sharedObject];
  NSArray *products = [esgameSdk getListProductId];
  
    NSString *productId = @"com.userjoy.sgc.vinn_yuanbao06";
    NSString *serverId = @"1";
    NSString *playerId = @"123";
    NSString *extraData = @"";
    
    [esgameSdk buyProduct:productId :serverId :playerId :extraData :self];
    
//    ListItemsViewController * vc = [[ListItemsViewController alloc] initWithNibName:@"ListItemsViewController" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
    
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
-(void)paymentSuccess:(SKPaymentTransaction*)transaction{
    NSLog(@"buyProduct return: %@", transaction.payment.productIdentifier);
}
    
- (void)deleteUserCallback:(BOOL)isSuccess {
    NSLog(@"deleteUserCallback %d",isSuccess);
}

- (void)onFireBaseTokenChange:(nonnull NSString *)token {
    NSLog(@"Token %@", token);
}

@end
