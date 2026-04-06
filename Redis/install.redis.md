# Instalação e Uso do Redis

## Instalação via Docker (Recomendado para desenvolvimento)

```bash
# Executar Redis em um container Docker
docker run -d --name redis -p 6380:6379 redis

# Verificar se o container está rodando
docker ps

# Conectar ao Redis via redis-cli (se instalado localmente)
redis-cli -h localhost -p 6380
ping
exit
```

## Acesso ao Bash do Container Docker

```bash
# Acessar o shell do container
docker exec -it redis /bin/bash

# Dentro do container, usar redis-cli
redis-cli
ping
INFO
exit
```

## Instalação Local no Windows

### Via Chocolatey (se disponível)
```powershell
choco install redis-64 -y
```

### Instalação Manual
1. Baixe o Redis para Windows: [Redis releases](https://github.com/microsoftarchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.zip)
2. Extraia para `C:\Redis`
3. Adicione `C:\Redis` ao PATH do sistema ou execute no PowerShell:
   ```powershell
   $env:PATH += ";C:\Redis"
   ```

## Operações Básicas com Redis

Após conectar via `redis-cli -h localhost -p 6380`:

```bash
# Teste de conexão
ping

# Definir um valor
SET chave "valor"

# Obter um valor
GET chave

# Definir com expiração (em segundos)
SET temp "valor temporário" EX 10

# Listar todas as chaves
KEYS *

# Deletar uma chave
DEL chave

# Trabalhar com listas
LPUSH minha_lista "item1"
LPUSH minha_lista "item2"
LRANGE minha_lista 0 -1

# Trabalhar com hashes
HSET meu_hash campo1 "valor1"
HSET meu_hash campo2 "valor2"
HGETALL meu_hash

# Informações do servidor
INFO

# Sair
exit
```

## Comandos Úteis

- `FLUSHALL`: Limpar todo o banco de dados
- `SAVE`: Salvar dados em disco
- `BGSAVE`: Salvar em background
- `SHUTDOWN`: Desligar o servidor

