//
//  Usuario.h
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSNumber * acertos;
@property (nonatomic, retain) NSNumber * erros;
@property (nonatomic, retain) NSString * nome;

@end
