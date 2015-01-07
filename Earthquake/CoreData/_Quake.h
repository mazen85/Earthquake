// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quake.h instead.

#import <CoreData/CoreData.h>

extern const struct QuakeAttributes {
	__unsafe_unretained NSString *depth;
	__unsafe_unretained NSString *eqid;
	__unsafe_unretained NSString *lat;
	__unsafe_unretained NSString *lon;
	__unsafe_unretained NSString *magnitude;
	__unsafe_unretained NSString *region;
	__unsafe_unretained NSString *src;
	__unsafe_unretained NSString *timedate;
} QuakeAttributes;

extern const struct QuakeRelationships {
	__unsafe_unretained NSString *earthquake;
} QuakeRelationships;

@class Earthquake;

@interface QuakeID : NSManagedObjectID {}
@end

@interface _Quake : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuakeID* objectID;

@property (nonatomic, strong) NSDecimalNumber* depth;

//- (BOOL)validateDepth:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* eqid;

@property (atomic) int16_t eqidValue;
- (int16_t)eqidValue;
- (void)setEqidValue:(int16_t)value_;

//- (BOOL)validateEqid:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDecimalNumber* lat;

//- (BOOL)validateLat:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDecimalNumber* lon;

//- (BOOL)validateLon:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* magnitude;

@property (atomic) float magnitudeValue;
- (float)magnitudeValue;
- (void)setMagnitudeValue:(float)value_;

//- (BOOL)validateMagnitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* region;

//- (BOOL)validateRegion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* src;

//- (BOOL)validateSrc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* timedate;

//- (BOOL)validateTimedate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Earthquake *earthquake;

//- (BOOL)validateEarthquake:(id*)value_ error:(NSError**)error_;

@end

@interface _Quake (CoreDataGeneratedPrimitiveAccessors)

- (NSDecimalNumber*)primitiveDepth;
- (void)setPrimitiveDepth:(NSDecimalNumber*)value;

- (NSNumber*)primitiveEqid;
- (void)setPrimitiveEqid:(NSNumber*)value;

- (int16_t)primitiveEqidValue;
- (void)setPrimitiveEqidValue:(int16_t)value_;

- (NSDecimalNumber*)primitiveLat;
- (void)setPrimitiveLat:(NSDecimalNumber*)value;

- (NSDecimalNumber*)primitiveLon;
- (void)setPrimitiveLon:(NSDecimalNumber*)value;

- (NSNumber*)primitiveMagnitude;
- (void)setPrimitiveMagnitude:(NSNumber*)value;

- (float)primitiveMagnitudeValue;
- (void)setPrimitiveMagnitudeValue:(float)value_;

- (NSString*)primitiveRegion;
- (void)setPrimitiveRegion:(NSString*)value;

- (NSString*)primitiveSrc;
- (void)setPrimitiveSrc:(NSString*)value;

- (NSDate*)primitiveTimedate;
- (void)setPrimitiveTimedate:(NSDate*)value;

- (Earthquake*)primitiveEarthquake;
- (void)setPrimitiveEarthquake:(Earthquake*)value;

@end
