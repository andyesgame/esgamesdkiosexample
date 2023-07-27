//
//  Product.m
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import "Product.h"

@implementation Product

-(id) init {
    self = [super init];
    self.productId = @"";
    self.productName = @"";
    self.price = @"";
    
    return  self;
}

+ (BOOL)supportsSecureCoding {
   return YES;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.productId forKey:@"product_id"];
    [coder encodeObject:self.productName forKey:@"product_name"];
    [coder encodeObject:self.price forKey:@"price"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    
    if (self = [super init]) {
        self.productId = [coder decodeObjectForKey:@"product_id"];
        self.productName = [coder decodeObjectForKey:@"product_name"];
        self.price = [coder decodeObjectForKey:@"price"];
    }
    
    return  self;
}

@end
