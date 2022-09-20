myName<-"Xinpeng Hua"

#1.
#(a)
v1<-1:20
v1
#(b)
v2<-20:1
v2
#(c)
v3<-seq(1,19,by=2)
v3
#(d)
v4<-rep(c(3,7,11),10)
v4
#(e)
v5<-c(rep(c(3,7,11),10,),3)
v5
#2.
y1<-(exp(x))*(sin(x))
x<-seq(3,6,by=0.1)
x1<-c(y1)
x1
#3.
sum1<-sum(i^3+4*i^2)
i<-c(10:100)
sum1
#4.
#(a)
str1<-paste("lable",1:30)
str1
#(b)
str2<-paste0("function",1:30)
str2
#5.
vs0<-c(1,'function',NA,seq(1,5,2),0.125)
vs<-paste(vs0,collapse = ",")
vs
#6.
m1<-matrix(1:9,nrow=3,ncol=3,byrow=TRUE)
m1_ans<-m1%*%m1%*%m1
m1_ans
#7.
m2<-matrix(rep(c(12,-12,12),17),nrow=17,ncol=3,byrow=TRUE)
m2
m2_ans<-t(m2)%*%m2
m2_ans
#8.
y <- c(7,-1,-3,5,17)
A <- matrix(0,nrow = 5, ncol = 5)
A <- abs(col(A)-row(A))+1
A
solve(A,y)
#9.
#(a)
xv<-seq(0,1,by=0.1)
func1_ans <- function(xv)
{ 
  xv^(1:length(xv))
}
func1_ans(xv)
#(b)
xv<-seq(0,1,by=0.1)
func2_ans <- function(xv)
{
  xv^(1:length(xv))/(1:length(xv))
}
func2_ans(xv)

#(c)
xv<-seq(0,1,by=0.1)
func3 <- function(x,n)
{
  1+sum((x^(1:n))/(1:n))
}
func3_ans<-func3
func3_ans
#10.
cel_to_far<-function(cel)
{
  cel*9/5+32
}

far_to_cel<-function(far)
{
  (far-32)*5/9
}
#11.
odd_ans<-function(x)
{
  x [x%%2==1]
}

odd_ans(1:2000)
#12.
sum_ans<-function(r)
{
  sum1 <- function(r){sum(((1:r)^0.5)/(11+3.5*r^1.2))}
  sum(sapply(1:r,sum1))
}
sum_ans(10)
#13.

modNumber<- function(x,y)
{ if(x%%y==0){x}
  else{x+y-x%%y}
}
modNumber
modNumber(500,6)
#14.Write a function using switch that returns the number of wheels of a vehicle on the following vehicles:
# - unicycle - bike - car - truck - tricycle - motorcycle Your function should use these as possible input strings.
# Name: numberOfWheels
numberOfWheels<-function(x)
{
  switch(x,"unicycle"=1,"bike"=2,"car"=3,"truck"=18,"tricycle"=3,"motorcycle"=2)
 
}
numberOfWheels("bike")


#15.
myFactorial<-function(x)
{
  m=1
  for(i in 1:x){
    m=m*i}
    return(m)
}
myFactorial
#16.
myCustomFactorial<-function(x,y)
{
  m=ceiling(x)
  for(i in ceiling(x+1):floor(y)){
    m=m*i}
  return(m)
}
myCustomFactorial
# #17.Write a function called customRiverMean that returns the average length of rivers in the vector rivers
# shorter than an given maximum length.
# ex: customRiverMean(400) == 300.125
data(rivers)
sort(rivers)
customRiverMean<-function(x)
{
  mean(rivers[rivers<x])
}
customRiverMean(400)
#18
# Write a for loop that populates a vector with the Length(ToothGrowth\$len) of the ToothGrowth 
# dataset.Your vector should only include observations of teeth 15 units or longer. 
# Name your vector longTeeth.
data("ToothGrowth")
longTeeth <- c()
for(i in ToothGrowth$len)
  {
  if(i >= 15){
    longTeeth <- c(longTeeth,i)
  }
}
longTeeth
#19
data("mtcars")
result <- apply(mtcars,2,mean)
averageHorsePower <- result[['hp']]
averageHorsePower
averageWeight <- result[['wt']]
averageWeight






