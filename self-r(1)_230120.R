#벡터 (vector) : 하나 이상의 데이터를 저장할 수 있는 1차원 저장 구조
students_age <- c(11,12,13,20,15,21)  #c는 concentration 연결을 의미
students_age

length(students_age)

students_age[1]  #R은 인텍스 1부터 시작
students_age[-1] #제외하고 싶은 인덱스에 -붙이기

students_age[1:3] #슬라이싱 [시작인텍스 :끝 인덱스]

#벡터의 구조
students_age <- c(11,12,13,20,15,21) 
class(students_age)

length(students_age)

#벡터 데이터 추가, 갱신, 삭제
score <-c(1,2,3)
score[1] <-10
score[4] <-4
score

#벡터의 데이터 타입 : 벡터는 하나의 원시 데이터 타입으로 저장(다양한 데이터 타입을 섞어 저장할 시 하나의 타입으로 자동 형변환)


# 숫자, 문자 섞어 벡터 만들 경우 모두 문자타입으로 변환
code <- c(1,12,"30")  
class(code)
str(code)

# 숫자와 논리를 섞어 벡터를 만들 경우 모두 숫자타입으로 변환
code <- c (1,12,TRUE, FALSE)
class(code)

str(code)
num[1:4] 1 12 1 0

#벡터 데이터 생성
data <-c(1:10)   #1부터 10까지 1씩 증가시켜 생성하기
data

data1 <-seq(1,10)   #1부터 10까지 1씩 증가시켜 생성하기
data1

data2<-seq(1,10, by=2)   #1부터 10까지 2씩 증가시켜 생성하기
data2

data3 <-rep(1, times= 5)   #1을 다섯번 반복 생성
data3

data4 <-rep(1:3, times= 3)   #1부터 3을 세번 반복 생성
data4

data5 <-rep(1:3, each= 3)   #1부터 3을 각각세번씩 반복 생성
data5

data6 <-rep(1:3, each= 2, times=3)   #1부터 3을 각각 2번씩 반복 생성하고 전체데이터를3번반복생성하기
data6

#매트릭스(행렬) : 표 형태와 같은 2차원 데이터 저장구조
var1<-c(1,2,3,4,5,6)

x1 <-matrix(var1, nrow=2, ncol =3)  #2행 3열 행렬 생성
x1

x2 <-matrix(var1,ncol =2)  #2열 행렬 생성, 행의 개수는 자동계산
x2

#일부데이터만 접근
x1[1, ](
x1[, 1]
x1[2,2]

dimnames(x2) <- list(c("r1","r2","r3"), c("c1","C2")) #x2행렬에 행 이름과 열 이름 부여
x2

x2[, "c1"]

x2["r1", ]

x2["r1", "c1"]


#행렬에 데이터 추가
#rbind()로 행을 추가할 수 있고, cbind()을 열을 추가 할 수 있음
x1   

#행 추가
x1 <- rbind(x1, c(10,10,10))
x1

#열 추가
x1 <- cbind(x1, c(20,20,20))
x1


#데이터 프레임 : 매트릭스처럼 행과 열을 가진 2차원 구조
## 열은 속성(attribute) 또는 변수(variable), 행은 관측데이터

no <-c(10,20,30,40,50,60,70)
age <-c(18,15,13,12,10,9,7)
gender <-c("M","M","M","M","M","F","M")

#no, age, gender 벡터들을 각 열로 포함하는 데이터프레임 생성(주의점: 각 벡터의 길이가 동일)
students <- data.frame(no, age, gender)
students

colnames(students)  #각 열의 이름

rownames(students)  #각 행의 이름

colnames(students) <- c("no","나이","성별")
rownames(students) <- c('A','B','C','D','E','F','G')
students
# 영문 열 이름으로 수정
colnames(students) <- c("no","age","gender")


#일부데이터만 접근
#데이터프레임의 변수이름 $열이름으로 특정 열에 접근하기
students$no

students$age

#대괄호 [ ] 안에 열 이름으로 특정 열 접근하기
students[, "no"]

students[, "age"]

students[, 1]

students[, 2]

students["A",]

students[1, ]

students[2, ]

students[, 1]

students[3,1]

students["A","no"]

#데이터프레임의 데이터 타입
class(students$no)  

class(students$gender)  #문자열 character

no <-c(10,20,30,40,50,60,70)
age <- c(18,15,13,12,10,9,7)
gender <- c("M","M","M","M","M","F","M")

new_students <- data.frame(no,age,gender, stringsAsFators = TRUE)
class(new_students$gender)

#데이터프레임 구조
str(students)   

dim(students)   #차원정보 확인 

head(students)  #앞의 6행만 추출  
tail(students)  #뒤의 6행만 추출

#데이터프레임 데이터 추가
students$name <-c ("성주","성이","유이","현이","창아","석아","경아")  #name열을 추가
students

#행 추가
students["H",] <-c(80,10, 'M', '홍길동') #행추가
tail(students)

#배열
var1 <-c(1:12)   #벡터 생성하기
var1

arr1 <- array(var1, dim = c(2,2,3))  #var1벡터 데이터를 이용하여 3차원 배열 생성하기
arr1

arr2 <- array(var1, dim = c(6,2))      #2차원 배열 생성하기
arr3 <- array(var1, dim = c(2,2,2,2))  #4차원 배열 생성하기

#리스트 : 다차원 데이터 저장 구조 
v_data <- c("02-111-2222","01022223333") #벡터
m_data <- matrix(c(21:26), nrow =2)      #행렬
a_data <- array(c(31:36), dim=c(2,2,2))  #배열
d_data <- data.frame(address=c("seoul", "busan"),
                     name=c("Lee", "Kim"), stringsAsFactors=F)

#list에 저장하기
list_data<-list(name="홍길동",
                tel = v_data,
                score1=m_data,
                score2=a_data,
                friends=d_data)

list_data$name

list_data$tel

list_data[1]$name

#R 기초 프로그래밍
#벡터와 스칼라의 연산 예
score <-c(10,20)
score +2

score    #스코어 벡터 자체는 변경되지 않아서 이전 값을 가지고 있음

score<-score+2
score

first_score <- c(100,200)
second_score <- c(90,91)

sum_score <-first_score +second_score   #더하기
sum_score

diff <- first_score - second_score      #빼기
diff

#기초 프로그래밍
#1.백터연산

score <- c(10,20)
score +2

score

score <-score +2
score

frist_score <-c(100,200)
second_score <- c(90,91)
sum_score <- first_score +second_score
sum_score

diff <-first_score - second_score
diff

#벡터의 논리 연산
first_score <-c(100,200,300)
second_score <- c(100,91,300)
first_score == second_score  #데이터가 각각 서로 동일한지 비교하는 연산

first_score >= 0 & first_score <=100

first_score %in% c(1,2,100)

#행렬 연산
m1 <- matrix(c(1,2,3,4,5,6),nrow=2) #행렬과 스칼라 곱하기 연산
m1 <- m1*10
m1

m1 <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
m2 <- matrix(c(2,2,2,2,2,2,2,2,2), nrow=3)             
m1

m2

m1+m2

m1*m2

jumsu <- matrix(c(1,2,3,4), ncol=2, byrow= T)
jumsu

weight <- matrix(c(5,6,7,8,9,10), ncol =3, byrow = T)
weight

jumsu %*% weight
jumsu
t(jumsu)
solve(jumsu)

#if ~ else문
score <-95
if(score <=100 & score >=80)

score <-86
if(score >=91) {
  print("A")
}else {
  print("B or C or D")
}

score <-86
if(score >= 91) {print("A")
} else if(score >= 81) {print("B")
} else if(score >= 71) {print("C")
} else if(score >= 61) {print("D")
} else {print("F")}

score <-85
ifelse(score >=91, "A", ifelse(score >=81, "B","C or D"))

score <65
ifelse(score >=91, "A", ifelse(score >=81, "B", ifelse(score>=71, "C", "D")))

#FOR문 :문장이 여러번 수행할 수 있도록 제어하는 반복문
for(num in(1:3)) {
  print(num)
}

for(num in(1:3))
  print(num)

#while문
num <-1
while(num <=5){
  print(num)
  num <- num +1
}

#break문
s <- 0
for(x in(1:1000)) {
  s<-s +x
  if(s>=100)
    break
}

print(s)

#next문
cnt=0
for(x in c(1,2,NA,4,5)) {
  if(is.na(x))
    next
  print(x)
}  

num <-1
repeat{
  print(num)
  num <-num +2
  if(num >10)
    break;
}

#함수 : 함수를 호출할때는 함수뒤에 소괄호를 붙임
a<-function(){
  print("testa")
  print("testa")
}
a()

#매개변수가 있는 함수
a<- function(num){    #num 매개변수 함수 생성
  print(num)
}

a(20)

a(10)

#두개 이상의 매개변수가 있는 함수
a<-function(num1, num2){
  print(paste(num1, ' ', num2))
}
a(10,20)

a(num1=10, num2 =20)

a(num2=20, num1=10)

a(num1 <-10, num2 =20)
print(num1)
print(num2)

#디폴트값이 있는 매개변수 1예제
a<-function(num1,num2=10){
  print(paste(num1,' ', num2))
}

a(num1=10)

a(10)

a(10, 30)

a(num2=20)

#디폴트값이 있는 매개변수 2예제
calculator <- function(num1,num2, op= "+"){
  result <-0
  if(op == "+") {
    result <- num1+num2
  }else if (op == "-"){
    result <- num1-num2
  }else if (op == "*"){
    result <- num1*num2
  }else if (op == "/"){
    result <- num1/num2
}
print(result)
}
calculator(10,20,"-")

calculator(10,20)

#가변길이 매개변수
a <- function(...){
  for(n in c(...)){
    print(n)
  }
}

a(1,2)

}

a(1,2,3,4)

a(10)

#리턴 데이터가 있는 함수
calculator <- function(num1, op = "+", num2) {
  result <-0
  if(op == "+") {
    result <- num1 + num2
  }else if(op == "-") {
    result <- num1 - num2
  }else if(op == "*") {
    result <- num1 * num2
  }else if(op == "/") {
    result <- num1 / num2
  }
  return(result)
}

n<- calculator(1,"+",2)
print(n)

n<- calculator(1,"+",2)
n<- calculator(n,"*",2)
n<- calculator(n,"-",2)
print(n)


print(calculator(calculator(calculator(1,"+",2), "*",2),"-",2))
#((1+2)*2) -2 순으로 처리됨


#NULL: 변수에 값이 아직 정해지지 않음. 변수를 초기화 할때 사용하는 상수 
#NA : 결측값을 의미하는 상수

a<-NULL
is.null(a)

b <- NA
jumsu <- c(NA, 90,100)

is.na(b)

is.na(jumsu)

#Inf: 무한대 실수를 의미하는 상수
#NaN: NOT A NUMBER를 의미하는 상수

num <- 10 / 0 ;num
num <- -10 /0 ;num
num <- -0 /0 ;num

#뎅터 타입변환과 타입 확인
data <- c(1,2,3)
d1 <- as.character(data)
d2 <- as.numeric(data)
d3 <- as.factor(data)
d4 <- as.matrix(data)
d5 <- as.array(data)
d6 <- as.data.frame(data)

data <-c(1,2,3)
is.character(data)

is.numeric(data)

is.factor(data)

is.matrix(data)

is.array(data)

is.data.frame(data)

is.data.frame(data)

class(data)
str(data)

#변수 삭제
score <-100
remove(score)
score
