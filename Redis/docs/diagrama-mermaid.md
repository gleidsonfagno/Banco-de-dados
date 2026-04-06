# Diagrama em Mermaid — Arquitetura Redis (Exemplo)

Use este diagrama para visualizar a arquitetura básica do Redis com persistência, replicação, Sentinel e Cluster.

```mermaid
flowchart LR
  A[Clientes\nApps / APIs / Jobs] --> B[Redis Core\nMemoria + Data Types]
  B --> C[Persistencia\nRDB / AOF]
  B --> D[Replicacao\nMaster -> Replicas]
  D --> E[Sentinel\nMonitor + Failover]
  B --> F[Cluster\nSharding 16384 slots]
```

## Observações

- O fluxo destaca o Redis Core como ponto central.
- A persistência garante recuperação em reinícios.
- Replicação e Sentinel cuidam de alta disponibilidade.
- Cluster entrega escala horizontal.
