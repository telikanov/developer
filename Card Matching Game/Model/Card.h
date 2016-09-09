//
//  Card.h
//  Card Matching Game
//
//  Created by Алексей Теликанов on 06.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString *contents;

@property(nonatomic, getter=isChoosen) BOOL choose;
@property(nonatomic, getter=isMatched) BOOL metched;

-(int)match:(NSArray *)otherCards;

@end
