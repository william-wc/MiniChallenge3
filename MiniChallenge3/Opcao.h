//
//  Opcao.h
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PerguntaC;

@interface Opcao : NSManagedObject

@property (nonatomic, retain) NSString * texto;
@property (nonatomic, retain) PerguntaC *relationship;

@end
