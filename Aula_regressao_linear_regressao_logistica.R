dados = read.csv("ECG.csv",head=T, sep=",")
#colnames(dados) <- c("dac","sexo","ecg","idade")

# Gráfico de dispersão de dac em função de idade
plot(dados$idade, dados$dac, pch = 19, col = "gray52", xlab="idade", ylab="dac")

# insere uma reta de regrssão linear simples
abline(glm(dados$dac ~dados$idade), col = "orange", lwd = 3)

# Ajusta um modelo de regressão linear simples e estima a variável dac para idade=28,63,85
rls=lm(dac ~ idade, data=dados)
predict(rls, newdata = data.frame(idade=c(28,63,85)))

#Ajusta o modelo de regressão logística
model <- glm(dac ~ sexo + ecg + idade, data=dados, family=binomial)

# Calcula a razão de chances
require(MASS)
exp(cbind(coef(model), confint(model)))  

# Calcula a razão de chances, com incremento especificado
require(oddsratio)
or_glm(data = dados, model = model, incr = list(sexo = 1, ecg = 1, idade =5))

#Usa a regressão logística para predizer P(dac=1)
#Valores do preditor 
dados$pred <- predict(model, dados, type="response")

#newdata <- data.frame(sexo=0,ecg=0,idade=50)
#predict(model, newdata, type="response")

# Coeficientes do modelo
betas <- coef(model)

# Inclusao de variáveis exploratórias uma a uma
anova(model,test="Chisq")

# Resíduos do modelo
res <- resid(model)

# Curva ROC
require(Epi)
ROC(form=dac ~ sexo + ecg + idade,plot="ROC", data=dados)

# Regra de classificação
pred_c <- ifelse(dados$pred > 0.5,1,0)
library(caret)
confusionMatrix(table(pred_c,dados$dac),positive="1")

# Qualidade de ajuste do modelo: Hosmer
# se der erro nesta importação automática, copie a função pelo link e rode-a no R
source("http://www.poleto.com/funcoes/gof.bino.txt")
gof.bino(model,grupos=10) 

# Análise de resíduos 
fit.model=model
source("http://www.ime.usp.br/~giapaula/envel_bino")
ntot=dados$dac

source("http://www.ime.usp.br/~giapaula/diag_bino")

