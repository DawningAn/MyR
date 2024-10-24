#修改C盘临时文件夹下面中文的名称问题
#https://zhidao.baidu.com/question/748080860947976012.html
#安装包 options(warning=-1)
# 设置R语言环境为英语，方便调试
Sys.setenv(LANGUAGE= "en")
Sys.getenv('R_HOME') #报告R主程序安装目录
#https://rdrr.io/snippets/ 网络R
#初学者很好的学习材料
#https://tianyishi2001.github.io/r-and-tidyverse-book/what-is-R.html#youshi
#https://www.rdocumentation.org/ 
#搜R语言和来自CRAN，GitHub和Bioconductor上的20000个包的所有的函数的说明和使用例。
.libPaths()
.libPaths("C:/Program Files/R/R-4.3.3/library")
#安装并加载所需的R包
#关于加载包的位置的说明
install.packages("vegan")


#install.packages(c("vegan","hier.part"))
library(vegan)
#require(vegan)
help(package='vegan') #显示已经安装的包的描述和函数说明
citation("vegan")
# 查看cca函数的帮助文档和示例
cca
?cca
example(cca)
?hier.part
#如果两个??,加函数还是搜不到，用google, bing,百度，文心一言、kimi、chatG
??hier.part

#R官网的初学者材料
help.start()


RSiteSearch("pca") #在官方网站上联网搜索

(.packages())#查看工作空间已加载的包

#导出R包的列表，比如给比较高级的新R安装R包
#packages <- .packages(TRUE)
#dump("packages", file="packages-20180704.R")
#source("packages-20180704.R")
#install.packages(packages)
#四则运算
#重要提示：关闭中文输入法，否则输入一些中文标点将导致程序错误。
5 + (2.3 - 1.125)*3.2/1.1 + 1.23E3
#次方、平方根、指数、对数
2^10
sqrt(6.25)
exp(1)
log10(10000)
log(10000)
#取整数
round(1.1234, 2)
floor(1.1234)
floor(-1.1234)
ceiling(1.1234)
ceiling(-1.1234)

#管道符
log(exp(1.0))

exp(1.0) |> log()

#如f3(f2(f1(x)))写成x |> f1() |> f2() |> f3()就更容易看清楚数据的流向。

print(sin(pi/2))

#向量vector，R语言以向量为最小单位，单个数值称为标量
#R语言是动态类型的， 其变量的类型不需要预先声明

a <- c(1,2,5,3, 6, -2, 4)     #  数值型向量 
b <- c("one","two", "three")    #  字符型向量 
c <- c(TRUE,NA,FALSE)         #  逻辑型向量 

#为了判断向量每个元素是否NA， 用is.na()函数，
is.na(c(1, NA, 3) > 2)

#比较运算符包括<， <=， >，  >=，  ==，  != ， %in%
c(1,11)%in%1:10

#函数match(x, y)起到和x %in% y运算类似的作用
#， 但是其返回结果不是找到与否， 而是对x的每个元素， 找到其在y中首次出现的下标，找不到时取缺失值，如
match(c(1, 3), c(2,3,4,3))

#逻辑运算符为&, |和!, 分别表示“同时成立”、“两者至少其一成立”、“条件的反面”
c(1, NA, 3) > 2
all(c(1, NA, 3) > 2)
any(c(1, NA, 3) > 2)
#函数which()返回真值对应的所有下标
which((11:15) > 12)
#函数identical(x,y)比较两个R对象x与y的内容是否完全相同
identical(c(1,2,3), c(1,2,NA))
#函数duplicated()返回每个元素是否为重复值的结果
duplicated(c(1,2,1,3,NA,4,NA))
unique(c(1,2,1,3,NA,4,NA))
#
nchar(b)
#substr(x, start, stop)从字符串x中取出从第start个到第stop个的子串
substr('JAN07', 1, 3)
substr(c('JAN07', 'MAR66'), 1, 3)

#因子factor
province <- c("四川", "湖南", "江苏", "四川", "四川", "四川", "湖南", "江苏", "湖南", "江苏")     
pf <- factor(province)    #  创建 province 的因子 pf 
pf 
attributes(pf)
levels(pf)
#因为因子实际保存为整数值,as.numeric()可以把因子转换为纯粹的整数值
as.numeric(pf)
#向量选择
a <- c(1, 2, 5, 3, 6, -2, 4)
a[3]
a[c(1, 3, 5)] 
a[2:6]
a[a>3&a<5]
a[-1]    
a[-1:-3]
#产生向量
rep(2:5, 2) #  等价于  rep(2:5, times = 2) 
rep(2:5, each=2) 
rep(1:3, times = 4, each = 2)  
seq(1,10,0.1)
#想一下，如何保存这些系列呢，赋值！
#0.1-1，间隔0.1，重复1：10

#矩阵matrix必须是同一属性数据，如果不是，会自动调整为同一属性，vector类同
matrix(1:4, nrow = 2, ncol = 2)    
(mat1<-matrix(1:12,6, byrow=T))
mat1
mat2<-matrix(1:12,3,4, byrow=F)
mat2
x <- matrix(1:6, 2, 3) 
x[2,2]
x[2,]
x[,2]
x[1:2,2:3]
 
#数组
a <- array(data=1:18,dim=c(3,3,2)) # 3d with dimensions 3x3x2
a <- array(1:18,c(3,3,2))          # the same array
a
#选取数字为17怎么选

#数据框data frame
#各列允许有不同类型：数值型向量、因子、字符型向量、日期时间向量
patientID <- c(1, 2, 3, 4) 
age <- c(25, 34, 28, 52) 
diabetes <- c("Type1", "Type2", "Type1", "Type1") 
status <- c("Poor", "Improved", "Excellent", "Poor") 
patientdata <- data.frame(patientID, age, diabetes, status) 
patientdata
patientdata[1:2,] #  第 1、2 行的所有元素 
patientdata[,1:2]
patientdata$age    #“$”符合用于选取一个指定的变量
patientdata[,"age"] #试一下去逗号


# 列表list
#提供R分析结果输出包装
#list里面可以装list，可以无限延展。
g <- "My First List" 
h <- c(25, 26, 18, 39) 
j <- matrix(1:10, nrow = 5) 
k <- c("one", "two", "three") 
mylist <- list(title = g, ages = h, j, k,patientdata) 
mylist[[3]]
mylist[3]
#观察一下有什么不同吗？
names(mylist)
mylist[[3]] <- NULL

#课后练习，请大家准备一份自己的excel数据，准备下次上课输入R

