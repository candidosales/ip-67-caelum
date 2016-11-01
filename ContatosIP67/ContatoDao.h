//
//  ContatoDao.h
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property (strong, readonly) NSMutableArray *contatos;

- (void) adicionaContato:(Contato *) contato;
+ (id) contatoDaoInstance;
- (Contato *) buscaContatoDaPosicao: (NSInteger)posicao;
- (void) removeContatoDaPosicao:(NSInteger)posicao;
- (NSInteger) buscaPosicaoDoContato:(Contato *) contato;
@end
