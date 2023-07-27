//
//  Product.h
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject<NSSecureCoding, NSCoding>
@property(nonatomic, readwrite) NSString * productId;
@property(nonatomic, readwrite) NSString * productName;
@property(nonatomic, readwrite) NSString * price;

@end

NS_ASSUME_NONNULL_END
