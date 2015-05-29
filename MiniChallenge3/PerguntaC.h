//
//  PerguntaC.h
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exatas, NSManagedObject;

@interface PerguntaC : NSManagedObject

@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * questao;
@property (nonatomic, retain) NSString * resolucao;
@property (nonatomic, retain) NSSet *alternativas;
@property (nonatomic, retain) Exatas *relationship;
@end

@interface PerguntaC (CoreDataGeneratedAccessors)

- (void)addAlternativasObject:(NSManagedObject *)value;
- (void)removeAlternativasObject:(NSManagedObject *)value;
- (void)addAlternativas:(NSSet *)values;
- (void)removeAlternativas:(NSSet *)values;

@end
