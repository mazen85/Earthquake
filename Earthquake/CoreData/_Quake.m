// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quake.m instead.

#import "_Quake.h"

const struct QuakeAttributes QuakeAttributes = {
	.depth = @"depth",
	.eqid = @"eqid",
	.lat = @"lat",
	.lon = @"lon",
	.magnitude = @"magnitude",
	.region = @"region",
	.src = @"src",
	.timedate = @"timedate",
};

const struct QuakeRelationships QuakeRelationships = {
	.earthquake = @"earthquake",
};

@implementation QuakeID
@end

@implementation _Quake

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Quake" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Quake";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Quake" inManagedObjectContext:moc_];
}

- (QuakeID*)objectID {
	return (QuakeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"eqidValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"eqid"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"magnitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"magnitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic depth;

@dynamic eqid;

- (int16_t)eqidValue {
	NSNumber *result = [self eqid];
	return [result shortValue];
}

- (void)setEqidValue:(int16_t)value_ {
	[self setEqid:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEqidValue {
	NSNumber *result = [self primitiveEqid];
	return [result shortValue];
}

- (void)setPrimitiveEqidValue:(int16_t)value_ {
	[self setPrimitiveEqid:[NSNumber numberWithShort:value_]];
}

@dynamic lat;

@dynamic lon;

@dynamic magnitude;

- (float)magnitudeValue {
	NSNumber *result = [self magnitude];
	return [result floatValue];
}

- (void)setMagnitudeValue:(float)value_ {
	[self setMagnitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveMagnitudeValue {
	NSNumber *result = [self primitiveMagnitude];
	return [result floatValue];
}

- (void)setPrimitiveMagnitudeValue:(float)value_ {
	[self setPrimitiveMagnitude:[NSNumber numberWithFloat:value_]];
}

@dynamic region;

@dynamic src;

@dynamic timedate;

@dynamic earthquake;

@end

