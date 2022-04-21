#import "ViewController.h"
#import "ESGameSDK.h"
#import "SdkDelegate.h"

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
}

- (IBAction)btnBuyItem:(id)sender {
  ESGameSDK *esgameSdk = [ESGameSDK sharedObject];
  NSArray *products = [esgameSdk getListProductId];
  
  if ((int)[products count] > 0) {
      
      NSString *productId = @"1";
    NSString *serverId = @"1";
    NSString *playerId = @"123";
    NSString *extraData = @"";
    
    [esgameSdk buyProduct:productId :serverId :playerId :extraData :self];
  } else {
    NSLog(@"productId not found");
  }
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

@end
