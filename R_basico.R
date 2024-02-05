# Projeto 0

# 1. Gerando valores de uma lista de inteiros positivos entre 1 e 10
x=seq(1:10)

# 2. Estatísticas básicas
mean(x)
#[1] 5.5
sd(x)
#[1] 3.02765

# 3. Gerando valores aleatórios de uma nova variável
# em função da anterior com erros normais
set.seed(12345)
y=x+rnorm(10)
#[1] 1.585529 2.709466 2.890697 3.546503 5.605887 4.182044 7.630099 7.723816 8.715840
#[10] 9.080678
mean(y)
#[1] 5.367056
sd(y)
#[1] 2.747763

# 4. Plotando os dados para ver relacionamento entre x e y
plot(x,y)

# 5. Correlação entre x e y
cor(x,y)
#[1] 0.9649189

