import redis

# Conectando ao Redis (porta 6380 para Docker)
r = redis.Redis(host='localhost', port=6380, db=0)

# Adicionando dados
def hash_exemplo():
    r.hset('usuario:1', 'nome', 'João')
    r.hset('usuario:1', 'idade', 30)
    r.hset('usuario:1', 'email', 'joao@example.com')
    print("Dados inseridos no hash 'usuario:1'")

    #recperando dados do hash
    user =  r.hgetall('usuario:1')
    print("Dados recuperados do hash 'usuario:1':")

    #atualizando um campo
    r.hset('usuario:1', 'idade', 31)
    print("Campo 'idade' atualizado para 31")

    # Recuperando um campo específico
    age = r.hget('usuario:1', 'idade')
    print(f"update age: {age}")
    print(f"Idade atualizada: {age.decode('utf-8')}")

# Exemplo List
def list_exemplo():
    # r.rpush('tarefas', 'Comprar leite')
    # r.rpush('tarefas', 'Pagar contas')
    # r.rpush('tarefas', 'Estudar Redis')
    print("Tarefas adicionadas à lista 'tarefas'")

    # Recuperando todas as tarefas
    tarefas = r.lrange('tarefas', 0, -1)
    print("Tarefas na lista 'tarefas':")
    print(f"tarefas: {tarefas}")
    # for tarefa in tarefas:
    #     print(tarefa.decode('utf-8'))

    #Removendo e retornando a primeira tarefa
    primeira_tarefa = r.lpop('tarefas')
    print(f"Primeira tarefa removida: {primeira_tarefa.decode('utf-8')}")


    # Recuperando o tamanho da lista
    tamanho = r.llen('tarefas')
    print(f"Tamanho da lista 'tarefas': {tamanho}")


    #Exemplo de set

def set_exemplo():
    r.sadd('tags', 'python')
    r.sadd('tags', 'redis')  
    r.sadd('tags', 'database')
    print("Tags adicionadas ao set 'tags'")

    #recuperando todos os membros do set
    tags = r.smembers('tags')
    print(f"Tags no set 'tags': {tags}")

    # veridicando se um membro existe no set
    existe = r.sismember('tags', 'python')
    print(f"A tag 'python' existe no set 'tags'? {'Sim' if existe else 'Não'}")

    # removendo um membro do set
    r.srem('tags', 'database')
    print("Tag 'database' removida do set 'tags'")

def sorted_set_exemplo():
    r.zadd('ranking', {'Alice': 100, 'Bob': 150, 'Charlie': 120})
    print("Usuários adicionados ao sorted set 'ranking'")

    # Recuperando os usuários ordenados por pontuação
    ranking = r.zrange('ranking', 0, -1, withscores=True)
    print("Ranking dos usuários:")
    print(f"ranking: {ranking}")
    # for user, score in ranking:
    #     print(f"{user.decode('utf-8')}: {score}")

    #atualizando a pontuação de um usuário
    r.zadd('ranking', {'Alice', 110})

    #recuperando a nova pontuação de Alice
    alice_score = r.zscore('ranking', 'Alice')
    print(f"Pontuação atualizada de Alice: {alice_score}")

    #Recuperando os membros com pontuação entre um intervalo especifico
    top_users = r.zrangebyscore('ranking', 100, 130, withscores=True)
    print("Usuários com pontuação entre 100 e 130:")    
    print(f"top_users: {top_users}")



# Executando exemplo
# hash_exemplo()
# list_exemplo()
# set_exemplo()
sorted_set_exemplo()

