// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Earthquake.h instead.

#import <CoreData/CoreData.h>

extern const struct EarthquakeAttributes {
	__unsafe_unretained NSString *count;
} EarthquakeAttributes;

extern const struct EarthquakeRelationships {
	__unsafe_unretained NSString *earthquakes;
} EarthquakeRelationships;

@class Quake;

@interface EarthquakeID : NSManagedObjectID {}
@end

@interface _Earthquake : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) EarthquakeID* objectID;

@property (nonatomic, strong) NSNumber* count;

@property (atomic) int64_t countValue;
- (int64_t)countValue;
- (void)setCountValue:(int64_t)value_;

//- (BOOL)validateCount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *earthquakes;

- (NSMutableSet*)earthquakesSet;

@end

@interface _Earthquake (EarthquakesCoreDataGeneratedAccessors)
- (void)addEarthquakes:(NSSet*)value_;
- (void)removeEarthquakes:(NSSet*)value_;
- (void)addEarthquakesObject:(Quake*)value_;
- (void)removeEarthquakesObject:(Quake*)value_;

@end

@interface _Earthquake (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCount;
- (void)setPrimitiveCount:(NSNumber*)value;

- (int64_t)primitiveCountValue;
- (void)setPrimitiveCountValue:(int64_t)value_;

- (NSMutableSet*)primitiveEarthquakes;
- (void)setPrimitiveEarthquakes:(NSMutableSet*)value;

@end
