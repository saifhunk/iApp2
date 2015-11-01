

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface iOSRequest : NSObject

+(void)getJSONRespone :(NSString *)urlStr : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure ;

+(void)postMutliPartData : (NSString *)urlStr : (NSDictionary *)parameters : (NSData *)data : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;
//
//+(void)postEmoticons : (NSString *)url parameters:(NSDictionary *)dparameters  success: (void (^) (NSDictionary *responseStr))success failure: (void (^) (NSError *error))failure;

+(void)postData : (NSString *)urlStr : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;

@end