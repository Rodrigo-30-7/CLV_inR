#CLV con Revenue, Expense y Margin. Además de  churn (1-retention) y number of subscriptors

#att = read (bla bla bla)

#Rename to simply names
att2 <- att[,2:9]
rnames <- c("rev","cost","mar","nsub","churn")
rownames(att2) <- rnames
colnames(att2) <- 1:8

# CLV - Infinite
d <- 0.01
rev <- 1000000*att2[1,]
cost <- 1000000*att2[2,]
mar <- 1000000*att2[3,]
rnsub <- 1000*att2[4,]
rr <- 1-att2[,5]
#arpu <- rev/nsub
CLV <- mar * rr / (1+d-rr)
CLV_sub <- (mar/nsub) * rr / (1+d-rr)
rownames (CLV_sub) <- "CLV per suscriber"
CLV
CLV_sub

# CLV - Finite
d <- 0.01
rev <- 1000000*att2[1,]
cost <- 1000000*att2[2,]
mar <- 1000000*att2[3,]
rnsub <- 1000*att2[4,]
rr <- 1-att2[,5]
#arpu <- rev/nsub
CLV_fin <- 0
CLV_fin_sub <- 0
for (i in 1:12){
      CLV_q <- mar*(rr^i / ((1+d)^i))
      CLV_fin <- CLV_fin + CLV_q
      CLV_q_sub <- (mar/nsub)*(rr^i / ((1+d)^i))
      CLV_fin_sub <- CLV_fin_sub + CLV_q_sub
}
CLV_fin_sub

#Number precision, to the 323rd decimal point

### LINK 
# https://www.youtube.com/watch?v=8YEgdi4QxkY