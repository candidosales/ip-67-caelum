//
//  ContatoDao.m
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

static ContatoDao *defaultDao = nil;

- (id) init {
    self = [ super init ];
    if (self) {
        _contatos = [NSMutableArray new];
    }
    return self;
}

- (void) adicionaContato:(Contato *)contato {
    [self.contatos addObject:contato];
    NSLog(@"Contatos: %@", self.contatos);
}

- (void) removeContatoDaPosicao:(NSInteger)posicao {
    [self.contatos removeObjectAtIndex:posicao];
}

+ (id) contatoDaoInstance {
    if(!defaultDao) {
        defaultDao = [ContatoDao new];
    }
    return defaultDao;
}

- (Contato *) buscaContatoDaPosicao: (NSInteger)posicao {
    return self.contatos[posicao];
}

- (NSInteger) buscaPosicaoDoContato:(Contato *) contato {
    return [self.contatos indexOfObject:contato];
}

@end
