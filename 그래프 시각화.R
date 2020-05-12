# scatter plot 두 변수 간의 관계를 나타내는 차트
install.packages("ggplot2")
library(ggplot2)

options(scipen=999) # E 표기법 해제
theme_set(theme_bw()) # 테마 설정

??midwest # 검색

data("midwest", package = "ggplot2")

# 데이터 프레암 구조 확인
head(midwest)

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + # 축 설정
  geom_point(aes(col=state, size=popdensity)) + # 데이터 추가
  geom_smooth(method="loess", se=F) + # 추세선 추가
  xlim(c(0, 0.1)) + # 차트 범위 설정
  ylim(c(0, 500000))

plot(gg)

midwest_select <- midwest[midwest$poptotal > 350000 &
                            midwest$poptotal <= 500000 &
                            midwest$area > 0.01 &
                            midwest$area < 0.1,]

gg <- ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point(aes(col=state, size=popdensity)) +
  geom_smooth(method="loess", se=F) +
  xlim(c(0, 0.1)) +
  ylim(c(0, 500000)) +
  geom_encircle(aes(x=area, y=poptotal),
                data=midwest_select, color="red", size=2, expand=0.03)

plot(gg)

# Jitter plot: Scatter plot에 비해 데이터를 상세하게 표현할 수 있음

?mpg # mpg 데이터 세트 정보 조회

data(mpg, package = "ggplot2")

# Scatter plot cnffur
g <- ggplot(mpg, aes(cty, hwy))
g + geom_point()

# Jitter plot 출력
g <- ggplot(mpg, aes(cty, hwy))
g + geom_jitter(width = .5, size=1)

# Count plot
data(mpg, package="ggplot2")

g <- ggplot(mpg, aes(cty, hwy)) +
  geom_count(col="tomato3", show.legend=F)
plot(g)

# Bubble plot

mpg_select <- mpg[mpg$manufacturer %in% c("audi", "ford", "honda", "hyundai"), ]

g <- ggplot(mpg_select, aes(displ, cty)) +
  geom_jitter(aes(col=manufacturer, size=hwy)) +
  geom_smooth(aes(col=manufacturer), method="lm", se=F)

plot(g)

# Correlogram plot

install.packages("ggcorrplot")
library(ggcorrplot)

?mtcars

data(mtcars)

# 변수별 상관도 계산
corr <- round(cor(mtcars), 1)

ggcorrplot(corr,
           hc.order = TRUE, # 데이터 정렬
           type = "lower", # 정렬 타입
           lab = TRUE, # 정보 시각화 여부
           lab_size = 3, # 정보 시각화 크기
           method = "circle", # 모양 (상관도 값)
           colors = c("tomato2", "white","springgreen3"), # 색 범위
           ggtheme=theme_bw) # 테마
