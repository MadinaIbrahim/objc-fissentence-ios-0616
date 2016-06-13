//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Madina Ibrahim on 6/13/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (readwrite) NSString *sentence;

@end

@implementation FISSentence


-(void)assembleSentence; {
    
    
    self.sentence = [[self.words componentsJoinedByString:@" "]stringByAppendingString:self.punctuation];
    
}

-(BOOL)validWord:(NSString *)word; {
    
    if ((word != nil) && (![word isEqual:@""]) && (![word isEqual:@""])) {
        
    
    return YES;
    
    } else {
        
        return NO;
    }
    
}

-(BOOL)validPunctuation:(NSString *)punctuation; {
    
    if ([@".?!,;:-" containsString:punctuation] && (punctuation != nil)) {
        return YES;
    } else
        

    return NO;
    
}

-(BOOL)validIndex:(NSUInteger)index; {
    
    if (index < [self.words count]) {
        return YES;
    } else {
    
    return NO;
}
    
}

    -(void)addWord:(NSString *)word {
        if ([self validWord:word]) {
            [self.words addObject:word];
        }
        [self assembleSentence];
        
    }
-(void)addWords:(NSArray *)words
withPunctuation:(NSString *)punctuation {
    
    for (NSString *word in words)
        
    if ([self validPunctuation:punctuation]) {
            if ([self validWord:word]) {
                [self.words addObject:word];
                
            }
    }
    [self assembleSentence];
}

-(void)removeWordAtIndex:(NSUInteger)index {

    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];

            }
        [self assembleSentence];
    }
    
    -(void)insertWord:(NSString *)word
              atIndex:(NSUInteger)index {
        
            if ([self validIndex:index]) {
                [self.words insertObject:word
                                 atIndex:index];
            
                }
            [self assembleSentence];
        }
    
    -(void)replacePunctuationWithPunctuation:(NSString *)punctuation {
        
            if ([self validPunctuation:punctuation] &&(punctuation != nil)) {
                self.punctuation = punctuation;
            
                }
            [self assembleSentence];
        }
    
    -(void)replaceWordAtIndex:(NSUInteger)index
                     withWord:(NSString *)word {
        
            if ([self validIndex:index] && [self validWord:word]) {
                [self.words replaceObjectAtIndex:index withObject:word];
                
                }
            [self assembleSentence];


    }
@end
