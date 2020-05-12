# merge() 데이터 합치기
x <- data.frame(name=c("a", "b", "c"), math=c(1, 2, 3))
y <- data.frame(name=c("c", "b", "a", English=c(4, 5, 6, 7)))
merge(x, y, by="name")
merge(x, y, by="name", all=TRUE)

# rbind() 행으로 데이터 합치기
df1 <- data.frame(name=c("Park", "Lee", "Kim", "Kang"), gender=c("f", "m", "f", "m"))
df2 <- data.frame(name=c("Min", "Ahn", "Choi", "Bae"), gender=c("m", "m", "m", "f"))
rbind(df1, df2)

# cbind() 열로 데이터 합치기
df1 <- data.frame(name=c("Park", "Lee", "Kim", "Kang"), gender=c("f", "m", "f", "m"))
df2 <- data.frame(name=c("Min", "Ahn", "Choi", "Bae"), gender=c("m", "m", "m", "f"))
cbind(df1, df2)

# subset() 조건에 맞는 데이터 추출
subset(iris, Species == "setosa")
subset(iris, Species == "setosa", select = c("Sepal.Length", "Sepal.Width"))

# group_by() 집단별로 나누기
library(dplyr) # 파이프 연산자 사용
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% group_by(manufacturer, drv) %>% summarise(mean_cty=mean(cty))

# left_join() 데이터 가로로 합치기
df1 = data.frame(id = c(1,2,3,4,5), midterm = c(60,95,85,70,30))
df2 = data.frame(id = c(1,2,3,4,5), final = c(70,100,85,75,80))
total = left_join(df1, df2, by = "id")
total
tname = data.frame(id = c(1,2,3,4,5), teacher = c("kim", "lee", "park", "choi", "jung"))
total2 = left_join(total, tname, by = "id")
total2

# bind_rows() 데이터 세로로 합치기
df1 = data.frame(id = c(1,2,3,4,5), midterm = c(60,95,85,70,30))
df2 = data.frame(id = c(1,2,3,4,5), final = c(70,100,85,75,80))
df = bind_rows(df1, df2)
df

# 이상치 확인
boxplot(mpg$hwy)$stats

# 이상치를 NA로 변환
mpg$hwy = ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy, na.rm = T))