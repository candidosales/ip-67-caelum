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
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (id) init {
    self = [ super init ];
    if (self) {
        _contatos = [NSMutableArray new];
        [self inserirDadosIniciais];
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

- (NSURL *) applicationDocumentsDirectory {
    return nil;
}

- (NSManagedObjectModel *)managedObjectModel {
    return nil;
}

- (NSManagedObjectContext *)managedObjectContext {
    return nil;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    return nil;
}

- (void) saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if(managedObjectContext != nil) {
        NSError *error = nil;
        if([managedObjectContext hasChanges] &&![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (void) inserirDadosIniciais {
    NSUserDefaults *configuracoes = [NSUserDefaults standardUserDefaults];
    BOOL dadosInseridos = [configuracoes boolForKey:@"dados_inseridos"];
    if (!dadosInseridos) {
        Contato *caelumSP = [NSEntityDescription insertNewObjectForEntityForName:@"Contato"
                                                          inManagedObjectContext:self.managedObjectContext];
        
        caelumSP.nome = @"Caelum Unidade SP";
        caelumSP.email = @"caelum@gamil.com";
        caelumSP.endereco = @"Sao Paulo, SP, Rua Vergueiro, 3185";
        caelumSP.telefone = @"01155712751";
        caelumSP.site = @"http://www.caelum.com.br";
        caelumSP.latitude = [NSNumber numberWithDouble:-23.5883034];
        caelumSP.longitude = [NSNumber numberWithDouble:-46.632369];
    
        [self saveContext];
        [configuracoes setBool:YES forKey:@"dados_inseridos"];
        [configuracoes synchronize];
    }
}

- (void)carregarContatos {
    NSFetchRequest *buscaContatos = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    NSSortDescriptor *ordernarPorNome = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    
    buscaContatos.sortDescriptors = @[ordernarPorNome];
    NSArray *contatosImutaveis = [self.managedObjectContext executeFetchRequest:buscaContatos error:nil];
    _contatos = [contatosImutaveis mutableCopy];
}

-(Contato *)novoContato {
    return [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.managedObjectContext];
}

@end
