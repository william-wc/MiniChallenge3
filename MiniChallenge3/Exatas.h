//
//  Exatas.h
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Exatas : NSManagedObject

@property (nonatomic, retain) NSString * descricao;
@property (nonatomic, retain) NSString * linkImg;
@property (nonatomic, retain) NSString * linkMateria;
@property (nonatomic, retain) NSString * linkVideo;
@property (nonatomic, retain) NSString * materia;
@property (nonatomic, retain) NSSet *contem;
@end

@interface Exatas (CoreDataGeneratedAccessors)

- (void)addContemObject:(NSManagedObject *)value;
- (void)removeContemObject:(NSManagedObject *)value;
- (void)addContem:(NSSet *)values;
- (void)removeContem:(NSSet *)values;

@end
