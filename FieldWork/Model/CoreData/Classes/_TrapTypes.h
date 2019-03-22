// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TrapTypes.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface TrapTypesID : NSManagedObjectID {}
@end

@interface _TrapTypes : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TrapTypesID *objectID;

@property (nonatomic, strong, nullable) NSNumber* entity_id;

@property (atomic) int32_t entity_idValue;
- (int32_t)entity_idValue;
- (void)setEntity_idValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSString* trap_type_name;

@end

@interface _TrapTypes (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSNumber*)primitiveEntity_id;
- (void)setPrimitiveEntity_id:(nullable NSNumber*)value;

- (int32_t)primitiveEntity_idValue;
- (void)setPrimitiveEntity_idValue:(int32_t)value_;

- (nullable NSString*)primitiveTrap_type_name;
- (void)setPrimitiveTrap_type_name:(nullable NSString*)value;

@end

@interface TrapTypesAttributes: NSObject 
+ (NSString *)entity_id;
+ (NSString *)trap_type_name;
@end

NS_ASSUME_NONNULL_END