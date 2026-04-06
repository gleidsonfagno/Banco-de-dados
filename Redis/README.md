# REDIS — Mapa de Estudos

<p align="center">
<img src="assets/image/redis-study-overview.svg" alt="Mapa de estudos Redis"><br>
<a href="https://redis.io/docs/latest/">Documentação Oficial do Redis</a>
</p>

Documentação Oficial do Redis: https://redis.io/docs/latest/

- O Redis é um banco de dados em memória e servidor de estruturas de dados, ideal para cache, filas e processamento de eventos.
- Ele oferece vários tipos nativos (strings, hashes, lists, sets, sorted sets, streams, etc.), cada um com comandos próprios e casos de uso específicos.
- A durabilidade pode ser configurada com RDB (snapshots) e/ou AOF (log de comandos), equilibrando desempenho e segurança.
- Para alta disponibilidade, usa-se replicação, Redis Sentinel (failover automático) e Redis Cluster (sharding + disponibilidade).
- Pub/Sub entrega mensagens com semântica at-most-once; Streams são persistentes e suportam consumer groups.
- Evicção de chaves é controlada por `maxmemory` e políticas como LRU/LFU.
- Segurança inclui autenticação (`AUTH`) e ACLs para restringir comandos e padrões de chaves.

> ##### Redis é rápido porque opera em memória, mas precisa de persistência/replicação quando a segurança dos dados é prioridade.

> ##### Redis Cluster divide dados em hash slots (16.384), distribuindo a carga entre nós e garantindo escala horizontal.

> ##### Pub/Sub é excelente para notificações em tempo real, enquanto Streams serve para processamento confiável e replay de eventos.

## O Que Estou Estudando Aqui

- Estruturas de dados e padrões de modelagem
- Persistência (RDB/AOF) e trade-offs
- Replicação e consistência
- Alta disponibilidade com Sentinel
- Escala horizontal com Cluster
- Mensageria com Pub/Sub e Streams
- Transações e scripts Lua
- Políticas de memória e evicção
- Segurança (AUTH, ACL, TLS)

## Estruturas de Dados (Resumo Rápido)

- **String**: cache simples, contadores, flags
- **Hash**: objetos e registros com campos
- **List**: filas, pilhas, logs
- **Set**: coleções únicas
- **Sorted Set**: rankings e prioridades
- **Stream**: eventos persistentes
- **Bitmap/Bitfield**: flags compactas
- **Geo**: buscas por distância
- **Probabilísticos**: cardinalidade e estatísticas aproximadas

## Fixando os Conhecimentos

Exercícios:

1. Cache de Sessões
2. Fila de Processamento
3. Ranking de Pontuação
4. Timeline de Eventos

### 1. Cache de Sessões

<p>
Crie um conjunto de comandos que salve sessões com TTL usando `SETEX`/`EXPIRE`.
- Defina uma chave por usuário: `session:<userId>`
- Atualize o TTL a cada acesso
- Remova a sessão ao fazer logout
</p>

### 2. Fila de Processamento

<p>
Modele uma fila usando List:
- Produtor com `LPUSH` e consumidor com `RPOP`
- Considere `BRPOP` para espera bloqueante
</p>

### 3. Ranking de Pontuação

<p>
Use Sorted Set:
- `ZADD` para pontuações
- `ZREVRANGE` para top N
- `ZRANK` para posição do jogador
</p>

### 4. Timeline de Eventos

<p>
Use Streams:
- `XADD` para publicar eventos
- `XREADGROUP` com consumer groups
- Use `XTRIM` para limitar crescimento
</p>

---

## Pastas de Apoio

- Documentos detalhados em `docs/`
  - `docs/redis-referencias.md`
  - `docs/diagrama-excalidraw.md`
  - `docs/diagrama-mermaid.md`

## Referências

1. [Redis Data Types — Docs](https://redis.io/docs/latest/develop/data-types/)
2. [Redis Replication — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/replication/)
3. [Redis Sentinel — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/sentinel/)
4. [Scale with Redis Cluster — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/scaling/)
5. [Redis Pub/Sub — Docs](https://redis.io/docs/latest/develop/pubsub/)
6. [Redis Streams — Docs](https://redis.io/docs/latest/develop/data-types/streams/)
7. [Redis Transactions — Docs](https://redis.io/docs/latest/develop/using-commands/transactions/)
8. [Redis Key Eviction — Docs](https://redis.io/docs/latest/develop/reference/eviction/)
9. [Redis ACL — Docs](https://redis.io/docs/latest/operate/oss_and_stack/management/security/acl/)

### Dúvidas e Suporte

Caso você tenha alguma dúvida, problema ou sugestão, fique à vontade para abrir uma issue no repositório. Vamos evoluir esse estudo juntos.
