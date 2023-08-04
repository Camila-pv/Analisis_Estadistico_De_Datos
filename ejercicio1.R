# Creacion de matriz
X <- matrix( c(42,52,48,58,
               4,5,4,3), byrow = FALSE,ncol = 2)
print(X)

# Otra forma de crear matriz
X <- matrix( c(42,4,
               52,5,
               48,4,
               58,3), byrow = FALSE,ncol = 2)
print(X)

# Limpiar la memoria, para empezar desde 0
rm(list=ls())

# Creacion de matriz con dataframe
x1 <-c(42,52,48,58)
x2 <-c(4,5,4,3)
Xdf <- data.frame(Variable1=x1,Variable2=x2)

print(Xdf)

#Acceder solamente a la variable 1
X[,1]
#Acceder solo a la fila 3
X[3,]
#Aceder al elento 2-1
X[2,1]

#Hallar la media
(xbar1 <-sum(X[,1])/length(X[,1]))
(xbar2 <-sum(X[,2])/length(X[,2]))

# Hacer matriz de medias
x.bar <-matrix(c(xbar1,xbar2),ncol=1)
print(x.bar)

# Hallar media directa
(xbar1 <- mean(X[,1]))
(xbar2 <- mean(X[,2]))


# Hallar la covarianza con dataframe
n <- length(x1)
s12 <- (1/n)*sum((x1-mean(x1))*(x2-mean(x2)))
print(s12)

s11 <- (1/n)*sum((x1-mean(x1))*(x1-mean(x1)))
print(s11)


#Crear matriz Sn
Sn <- matrix(c(s11,s12,
               s12,s22),
             ncol=2)
print(Sn)


cov(X)


# Leer datos
dat <- read.table("D:/data/T1-11.dat")

# Camnio variables
head(dat)
names(dat) <- c("Size", "Visitors")
head(dat)

#Grafico de dispercion
plot(x=dat$Size,y=dat$Visitors)

# Grafico
plot(x=dat$Size,y=dat$Visitors,
     xlim=c(0,2500),
     ylim=c(0,10),
     main="Attendance and Size of National Parks",
     xlab="Size(acres)",
     ylab="Visitors(millions)",
     pch=12)
                