# Redis — Artigo e Referências de Estudo

## Visão Geral

Redis é um servidor de estruturas de dados em memória, usado para cache, filas, sessões, rankings e processamento de eventos. Ele oferece tipos nativos (strings, hashes, lists, sets, sorted sets, streams, etc.) para modelar dados de forma eficiente e com comandos simples.

## Arquitetura e Conceitos-Chave

- **Modelo in-memory**: baixa latência, com suporte a persistência para recuperação após reinícios.
- **Estruturas de dados nativas**: resolvem problemas comuns sem precisar de camada extra no app.
- **Escalabilidade**: replicação, Sentinel e Cluster resolvem HA e escala horizontal.
- **Mensageria**: Pub/Sub para tempo real; Streams para logs persistentes.

## Persistência (RDB e AOF)

Redis permite gravar dados em disco para recuperar o estado após falhas. Há dois mecanismos principais:

- **RDB (snapshot)**: dumps periódicos do estado do banco. Mais leve para backups.
- **AOF (append-only file)**: registra comandos de escrita; maior durabilidade, porém arquivo maior.
- **Combinação**: usar RDB + AOF equilibra desempenho e segurança.

## Alta Disponibilidade

- **Replicação**: modelo master-replica (leader-follower). Réplicas são cópias e recebem o fluxo de comandos do master.
- **Sentinel**: monitoramento, notificação e failover automático em ambientes sem Cluster.
- **Cluster**: sharding automático entre nós e tolerância a falhas em um subconjunto do cluster.

## Mensageria: Pub/Sub vs Streams

- **Pub/Sub**: mensagens são entregues em tempo real aos inscritos; não há persistência.
- **Streams**: log append-only, com possibilidade de replay e consumer groups.

## Transações e Scripts

- **Transações**: `MULTI`, `EXEC`, `DISCARD`, `WATCH` garantem execução sequencial e isolada.
- **Lua**: `EVAL` permite lógica mais complexa no servidor (cuidado com chaves em Cluster).

## Memória e Evicção

Redis tem limite de memória configurável. Ao atingir `maxmemory`, ele aplica uma política de evicção (LRU, LFU, etc.) para remover chaves e abrir espaço.

## Segurança

- **AUTH e ACL**: controle de autenticação e permissões por usuário.
- **TLS**: criptografia em trânsito (quando habilitado na configuração).

## Checklist de Estudo

1. Modelagem com Strings, Hashes, Lists, Sets e Sorted Sets
2. Persistência (RDB/AOF) e trade-offs
3. Replicação e comportamento em falhas
4. Sentinel para HA
5. Cluster para sharding
6. Pub/Sub x Streams
7. Transações e scripts
8. Evicção e limites de memória
9. ACL e boas práticas de segurança

## Referências

1. [Redis Data Types — Docs](https://redis.io/docs/latest/develop/data-types/)
2. [Redis Persistence (RDB/AOF) — Docs](https://redis.io/tutorials/operate/redis-at-scale/persistence-and-durability/persistence-options-in-redis/)
3. [Redis Replication — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/replication/)
4. [Redis Sentinel — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/sentinel/)
5. [Scale with Redis Cluster — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/scaling/)
6. [Redis Cluster Specification — Docs](https://redis.io/docs/latest/operate/oss_and_stack/reference/cluster-spec/)
7. [Redis Pub/Sub — Docs](https://redis.io/docs/latest/develop/pubsub/)
8. [Redis Streams — Docs](https://redis.io/docs/latest/develop/data-types/streams/)
9. [Redis Transactions — Docs](https://redis.io/docs/latest/develop/using-commands/transactions/)
10. [Redis Key Eviction — Docs](https://redis.io/docs/latest/develop/reference/eviction/)
11. [Redis ACL — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/security/acl/)
