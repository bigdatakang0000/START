######################################
###########유비온 R 2회차#############
######################################

getwd()

# NA, NULL
a <- NULL
is.null(a)
typeof(a)

b <- NA
is.na(b)
typeof(b)

c <- c(1, 2, 3, NA, NULL)
c <- as.data.frame(c)
is.na(c$c)

#NAN, Inf
d <- 10/0
d
e <- -10/0
e
f <- 0/0
f

#데이터타입 변환
data <- c(1,2,3)
typeof(data)
d1 <- as.character(data)
typeof(d1)
d2 <- as.numeric(data)
typeof(d2)
d3 <- as.factor(data)
typeof(d3)
d4 <- as.matrix(data)
typeof(d4)
d5 <- as.array(data)
typeof(d5)
d6 <- as.data.frame(data)
typeof(d6)

#dplyr
#.libPaths("C:/Users/yhb58/Documents/R/win-library/4.1")
#install.packages("dplyr", dependencies = T)
library(dplyr)
library(rlang)
#install.packages("rlang", dependencies = T, type = "binary")

#파이프연산자를 통한 정제
# %>% : ctrl+shift+m
head(iris, 10)
help(iris)
str(iris)
summary(iris)
iris <- data.frame(iris)
sepallen_over6 <- data.frame(iris %>% filter(Sepal.Length>6))
sepallen_over6 %>% select(Sepal.Length, Species)
iris %>% filter(Sepal.Length>6) %>% select(Sepal.Length, Species)
iris2 <- iris %>% arrange(Sepal.Length)
head(iris2, 20)
tail(iris2, 10)
iris %>% filter(Sepal.Length>6) %>% select(Sepal.Length, Species) %>% arrange(Sepal.Length)
help(dplyr)
??dplyr
iris %>% mutate(Species_n = factor(Species)) %>% group_by(Species_n) %>% summarise(n())

#데이터 불러오기
getwd()
setwd("C:/rproject/ubion")
getwd()
df <- read.csv("Ashopping2.csv", encoding = "cp949") #UTF-8 #fileEncoding = "euc-kr"
head(df)
str(df)
summary(df)
#df$이탈여부 <- as.factor(df$이탈여부)
#df$총매출액 <- as.numeric(df$총매출액)
str(df)

#파일불러오기
#install.packages("readxl")
library(readxl)
#read_excel()

head(df)
str(df)
summary(df)

#결측치
is.na(df)
complete.cases(df)
colSums(is.na(df))


a <- c(NA,1,2,3,4)
a <- data.frame(a)
colSums(is.na(a))

#결측치 제거
df_del_row <- na.omit(df)
summary(df_del_row)
colSums(is.na(df_del_row))

#결측치 대체
df$상품_진열_위치 <- ifelse(is.na(df$상품_진열_위치),
                      mean(df$상품_진열_위치, na.rm =T),
                      df$상품_진열_위치)
colSums(is.na(df))
df$상품_설명_표시 <- ifelse(is.na(df$상품_설명_표시),
                      mean(df$상품_설명_표시, na.rm =T),
                      df$상품_설명_표시)
colSums(is.na(df))

#이상치
boxplot(df$총_매출액)
hist(df$총_매출액)

iqr <- IQR(df$총_매출액)
df_iqr <- df[(df$총_매출액 < median(df$총_매출액) + iqr*2)
             & (df$총_매출액 > median(df$총_매출액) - iqr*2),]
hist(df_iqr$총_매출액) 
hist(df$총_매출액)
df$총_매출액 <- log1p(df$총_매출액)
hist(df$총_매출액)
  
#데이터 분해, 결합
head(df)
under_500 <- df[df$고객ID <= 500,]
over_500 <- df[df$고객ID > 500,]
df_1000 <- rbind(under_500, over_500)
str(df_1000)

#index
colnames(df)
df[,c("고객ID","이탈여부")]
df[150:200 , "고객ID"]

#merge
df1 <- df[,c("고객ID","이탈여부")]
df2 <- df[,c("고객ID","총_매출액")]
head(df1)
head(df2)
df_merge <- merge(df1, df2, all = T)
help("merge")
head(df_merge)

#기술통계
summary(df)
colnames(df)
df1 <- df[,c("성별", "할인권_사용.횟수")]
str(df1)
df1$성별 <- as.factor(df1$성별)
print(df1 %>% group_by(성별) %>% summarise(mean(할인권_사용.횟수)))
print(df1 %>% group_by(성별) %>% summarise(var(할인권_사용.횟수)))
print(df1 %>% group_by(성별) %>% summarise(sd(할인권_사용.횟수)))

df$고객등급 <- as.factor(df$고객등급) 
print(df %>% group_by(고객등급) %>% summarise(mean(할인권_사용.횟수)))
## %>% -> dplyr 패키지


#t-test
##정규성 검정
#shapiro-wilk test
shapiro.test(df$총_매출액)
hist(df$총_매출액)
ks.test(df$총_매출액, pnorm)
shapiro.test(over_500$총_매출액)
shapiro.test(under_500$총_매출액)

#독립성 검정
#상관관계 분석 cor(df$총_매출액, df$할인권_사용.횟수)
df_chisq <- table(df$클레임접수여부, df$이탈여부)
chisq.test(df_chisq)

#등분산 검정
#install.packages("lawstat")
library(lawstat)
library(car)
df$성별 <- as.factor(df$성별)
df$성별 <- as.integer(df$성별)
leveneTest(df$총_매출액, df$성별)
bartlett.test(df$총_매출액,  df$성별)
leveneTest(df$방문빈도, df$클레임접수여부)
#levene.test()
bartlett.test(df$방문빈도, df$클레임접수여부)
str(df)
df_m <- df[df$성별 == 1,]
df_w <- df[df$성별 == 2,]
par(mfrow = c(1, 2))
hist(df_m$총_매출액)
hist(df_w$총_매출액)

#t-test
t.test(df$총_매출액, df_w$총_매출액, var.equal = F)

#ANOVA
colnames(df)
anova <- aov(총_매출액 ~ 구매유형, data = df)
summary(anova)
summary(df)

print(df %>% group_by(구매유형) %>% summarise(mean(총_매출액)))

