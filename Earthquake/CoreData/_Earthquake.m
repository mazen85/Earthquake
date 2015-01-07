// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Earthquake.m instead.

#import "_Earthquake.h"

const struct EarthquakeAttributes EarthquakeAttributes = {
	.count = @"count",
};

const struct EarthquakeRelationships EarthquakeRelationships = {
	.earthquakes = @"earthquakes",
};

@implementation EarthquakeID
@end

@implementation _Earthquake

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Earthquake" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Earthquake";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Earthquake" inManagedObjectContext:moc_];
}

- (EarthquakeID*)objectID {
	return (EarthquakeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"countValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"count"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic count;

- (int64_t)countValue {
	NSNumber *result = [self count];
	return [result longLongValue];
}

- (void)setCountValue:(int64_t)value_ {
	[self setCount:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveCountValue {
	NSNumber *result = [self primitiveCount];
	return [result longLongValue];
}

- (void)setPrimitiveCountValue:(int64_t)value_ {
	[self setPrimitiveCount:[NSNumber numberWithLongLong:value_]];
}

@dynamic earthquakes;

- (NSMutableSet*)earthquakesSet {
	[self willAccessValueForKey:@"earthquakes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"earthquakes"];

	[self didAccessValueForKey:@"earthquakes"];
	return result;
}

@end

