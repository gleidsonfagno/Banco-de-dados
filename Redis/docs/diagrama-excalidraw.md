# Diagrama em Excalidraw — Arquitetura Redis (Guia Visual)

## Objetivo

Este guia descreve como desenhar um diagrama no Excalidraw para explicar visualmente um fluxo típico de uso do Redis (clientes → Redis → persistência/replicação/cluster).

## Passo a Passo

1. Abra o Excalidraw: [https://excalidraw.com/](https://excalidraw.com/)
2. Defina o título do diagrama: **"Arquitetura Redis — Visão Geral"**.
3. Insira os blocos principais (retângulos arredondados):

Blocos:
- **Clientes** (Apps, APIs, Jobs)
- **Redis Core** (memória, comandos, estruturas de dados)
- **Persistência** (RDB / AOF)
- **Replicação** (master → replicas)
- **Sentinel** (monitoramento + failover)
- **Cluster** (sharding + slots)

4. Conecte com setas:
- Clientes → Redis Core
- Redis Core → Persistência
- Redis Core → Replicação
- Sentinel → Redis Core (seta bidirecional ou anotação)
- Redis Core → Cluster

5. Use cores suaves para destacar camadas:
- Camada de aplicação: `#FFE7C7`
- Núcleo Redis: `#F5F5F5`
- Alta disponibilidade: `#E6F4FF`
- Escalabilidade: `#EAF7E5`

6. Adicione notas curtas ao lado de cada bloco:
- Persistência: "RDB snapshots" + "AOF logs"
- Replicação: "async" + "read replicas"
- Sentinel: "monitor + failover"
- Cluster: "16384 slots"

## Exportação

1. Clique em **Export**.
2. Salve como **SVG** (melhor para README) ou **PNG**.
3. Sugestão de nome do arquivo: `redis-arch-excalidraw.svg`.

## Dica de Layout

- Mantenha o Redis Core no centro.
- Organize Persistência à direita, Replicação e Sentinel abaixo, Cluster à direita/abaixo.
- Evite cruzar setas para manter a leitura limpa.
