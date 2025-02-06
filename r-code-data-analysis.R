data <- read.csv(file = 'order_july24.csv', header = TRUE)
head(data)
library(sqldf)
library(ggplot2)
#Descriptive
dim(data)
colnames(data)
mean(data$past_spend, na.rm = TRUE)
median(data$past_spend, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(past_spend), binwidth = 5, bin = NULL)
mean(data$age, na.rm = TRUE)
median(data$age, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(age), binwidth = 2, bin = NULL)
mean(data$time_web, na.rm = TRUE)
median(data$time_web, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(time_web), binwidth = 5, bin = NULL)
mean(data$spend, na.rm = TRUE)
median(data$spend, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(spend), binwidth = 5, bin = NULL)

ggplot(data)+geom_histogram(aes(ad_channel), binwidth = 1, bin = NULL)
ggplot(data)+geom_histogram(aes(voucher), binwidth = 1, bin = NULL)
#Skew
range(data$past_spend, na.rm = TRUE)
range(data$age, na.rm = TRUE)
range(data$time_web, na.rm = TRUE)
range(data$spend, na.rm = TRUE)

table(data$ad_channel)
table(data$voucher)

sqldf("select sum(spend) from data")

sqldf("select count(age) from data where [age]<30 ")
sqldf("select count(age) from data where [age]>=30 AND [age]<35")
sqldf("select count(age) from data where [age]>=35 AND [age]<40")
sqldf("select count(age) from data where [age]>=40 ")

#Avg spend per age group
sqldf("select avg(spend) from data where [age]<30")
sqldf("select avg(spend) from data where [age]>=30 AND [age]<35")
sqldf("select avg(spend) from data where [age]>=35 AND [age]<40")
sqldf("select avg(spend) from data where [age]<40")
sqldf("select avg(spend) from data")
sqldf("select avg(spend) from data where [age]<35")
sqldf("select avg(spend) from data where [age]>=35")

#Avg spend per time_web
sqldf("select avg(spend) from data where [time_web]<=81")
sqldf("select avg(spend) from data where [time_web]>81")
sqldf("select avg(spend) from data where [time_web]<=81 AND [age]<35")
sqldf("select avg(spend) from data where [time_web]<=81 AND [age]>=35")
sqldf("select avg(spend) from data where [time_web]>81 AND [age]<35")
sqldf("select avg(spend) from data where [time_web]>81 AND [age]>=35")

#Avg spend per past_spend
sqldf("select avg(spend) from data where [past_spend]<=13")
sqldf("select avg(spend) from data where [past_spend]>13")
sqldf("select avg(spend) from data where [past_spend]<=13 AND [age]<35")
sqldf("select avg(spend) from data where [past_spend]<=13 AND [age]>=35")
sqldf("select avg(spend) from data where [past_spend]>13 AND [age]<35")
sqldf("select avg(spend) from data where [past_spend]>13 AND [age]>=35")

#New and Old customers
sqldf("select count(ad_channel), avg(spend), avg(past_spend) from data where [age]<35 AND (past_spend)>0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)>0 AND (ad_channel)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)>0 AND (ad_channel)==2")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)>0 AND (ad_channel)==3")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)>0 AND (ad_channel)==4")

sqldf("select count(ad_channel), avg(spend), avg(past_spend) from data where [age]<35 AND (past_spend)=0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)=0 AND (ad_channel)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)=0 AND (ad_channel)==2")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)=0 AND (ad_channel)==3")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (past_spend)=0 AND (ad_channel)==4")

sqldf("select count(ad_channel), avg(spend), avg(past_spend) from data where [age]>=35 AND (past_spend)>0")
sqldf("select count(ad_channel), avg(spend)  from data where [age]>=35 AND (past_spend)>0 AND (ad_channel)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)>0 AND (ad_channel)==2")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)>0 AND (ad_channel)==3")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)>0 AND (ad_channel)==4")

sqldf("select count(ad_channel), avg(spend), avg(past_spend) from data where [age]>=35 AND (past_spend)=0")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)=0 AND (ad_channel)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)=0 AND (ad_channel)==2")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)=0 AND (ad_channel)==3")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (past_spend)=0 AND (ad_channel)==4")

sqldf("select sum(spend), count(spend) from data where [age]<35")
sqldf("select sum(spend), count(spend) from data where [age]>=35")
sqldf("select sum(spend), count(spend) from data")

sqldf("select count(past_spend) from data where past_spend=0")
sqldf("select sum(past_spend), count(past_spend) from data where [age]<35 AND past_spend!=0")
sqldf("select sum(past_spend), count(past_spend) from data where [age]>=35 AND past_spend!=0")
sqldf("select sum(past_spend), count(past_spend) from data where past_spend!=0")

sqldf("select avg(past_spend) from data where past_spend!=0")
sqldf("select avg(spend) from data where past_spend!=0")
sqldf("select avg(spend) from data where past_spend=0")
sqldf("select count(voucher) from data where past_spend=0 AND voucher=0")
sqldf("select count(voucher) from data where past_spend=0 AND voucher=1")

sqldf("select count(voucher) from data where voucher=0")
sqldf("select count(voucher) from data where voucher=1")

#Ad and Voucher data
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==1 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==1 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==2 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==2 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==3 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==3 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==4 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (ad_channel)==4 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]<35 AND (voucher)==1")

sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==1 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==1 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==2 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==2 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==3 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==3 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==4 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (ad_channel)==4 AND (voucher)==1")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (voucher)==0")
sqldf("select count(ad_channel), avg(spend) from data where [age]>=35 AND (voucher)==1")



#Visualisations
dataplot <- data
dataplot$age_group <- ifelse(data$age < 35, "Under 35", "35 and Above")

summary_data <- aggregate(spend ~ age_group, data = dataplot, FUN = mean)

# Create the bar chart
ggplot(summary_data, aes(x = age_group, y = spend, fill = age_group)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Spend by Age Group",
       x = "Age Group",
       y = "Average Spend") +
  theme_minimal() +
  theme(legend.position = "none")

dataplot$time_group <- ifelse(data$time_web <= 81, "Under Average", "Above Average")

summary_data <- aggregate(spend ~ time_group, data = dataplot, FUN = mean)

# Create the bar chart
ggplot(summary_data, aes(x = time_group, y = spend, fill = time_group)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Spend by time_web Group",
       x = "Time Group",
       y = "Average Spend") +
  theme_minimal() +
  theme(legend.position = "none")

dataplot$past_group <- ifelse(data$past_spend == 0, "New Customer", "Old Customer")

summary_data <- aggregate(spend ~ past_group, data = dataplot, FUN = mean)

# Create the bar chart
ggplot(summary_data, aes(x = past_group, y = spend, fill = past_group)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Spend New v/s Old",
       x = "Customer Category",
       y = "Average Spend") +
  theme_minimal() +
  theme(legend.position = "none")

summary_data <- data.frame(table(dataplot$past_group))
colnames(summary_data) <- c("past_group", "count")

# Create the pie chart
ggplot(summary_data, aes(x = "", y = count, fill = past_group)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Distribution of Old v/s New",
       fill = "Group") +
  theme_void() # Clean theme for pie chart

dataplot$voucher <- as.factor(dataplot$voucher)
dataplot$ad_channel <- as.factor(dataplot$ad_channel)
dataplot<-dataplot[complete.cases(dataplot$spend),] #Delete entries with missing spend as spend is the target variable

ggplot(dataplot)+geom_point(aes(past_spend,spend))
ggplot(dataplot)+geom_point(aes(past_spend,spend, color=voucher))
ggplot(dataplot)+geom_point(aes(past_spend,spend, color=ad_channel))

ggplot(dataplot)+geom_point(aes(time_web,spend))
ggplot(dataplot)+geom_point(aes(time_web,spend, color=voucher))
ggplot(dataplot)+geom_point(aes(time_web,spend, color=ad_channel))

ggplot(dataplot)+geom_point(aes(age,spend))
ggplot(dataplot)+geom_point(aes(age,spend,color=voucher))
ggplot(dataplot)+geom_point(aes(age,spend,color=ad_channel))

ggplot(dataplot)+geom_violin(aes(age,ad_channel)) 
ggplot(dataplot)+geom_violin(aes(age,voucher)) 

#Missing Data
sum(complete.cases(data))
sum(!complete.cases(data))
library(VIM)
aggr(data, numbers = TRUE, prop = FALSE, 
     col = c("#F8766D", "#00BFC4"),
     cex.axis = 0.8, 
     gap = 3,
     ylab = c("Missing Data Pattern", "Frequency"),
     theme = theme_minimal())
library(corrgram)
corrgram(data)



data2<-data
data2$spend_missing <- is.na(data2$spend)
missing_spend <- data2[data2$spend_missing, c("past_spend", "age", "ad_channel",
                                              "time_web","voucher","spend")]
missing_spend

data2$past_spend_missing<-is.na(data2$past_spend)
missing_past_spend <- data2[data2$past_spend_missing, c("past_spend", "age", "ad_channel",
                                                        "time_web","voucher","spend")]
missing_past_spend

data2$voucher_missing<-is.na(data2$voucher)
missing_voucher <- data2[data2$voucher_missing, c("past_spend", "age", "ad_channel",
                                                  "time_web","voucher","spend")]
missing_voucher

data2$time_web_missing<-is.na(data2$time_web)
missing_time_web <- data2[data2$time_web_missing, c("past_spend", "age", "ad_channel",
                                                    "time_web","voucher","spend")]
missing_time_web

data2$ad_channel_missing<-is.na(data2$ad_channel)
missing_ad_channel <- data2[data2$ad_channel_missing, c("past_spend", "age", "ad_channel",
                                                        "time_web","voucher","spend")]
missing_ad_channel

data2$age_missing<-is.na(data2$age)
missing_age <- data2[data2$age_missing, c("past_spend", "age", "ad_channel",
                                          "time_web","voucher","spend")]
missing_age

data3<-data[complete.cases(data$spend),] #Delete entries with missing spend as spend is the target variable
range(data3$past_spend, na.rm = TRUE)
range(data3$age, na.rm = TRUE)
range(data3$time_web, na.rm = TRUE)
range(data3$spend, na.rm = TRUE)
data_knn <- data3[data3$spend != 75, ]
data_knn <- data_knn[data_knn$age != 20, ]
data_knn <- data_knn[data_knn$time_web != 124, ]
data_knn <- data_knn[data_knn$time_web > 20, ]
data_knn <- data_knn[data_knn$past_spend != 51, ]
data_knn <- data_knn[!(data_knn$time_web < 60 & data_knn$spend > 58 & data_knn$spend < 60), ]
data_knn <- data_knn[data_knn$spend != 9,]
data_knn <- data_knn[data_knn$age >= 25,]
data_knn <- data_knn[data_knn$age <44,]

data_knn1 <- data_knn
data_knn$voucher <- as.factor(data_knn$voucher)
data_knn$ad_channel <- as.factor(data_knn$ad_channel)

ggplot(data3)+geom_point(aes(past_spend,spend))
ggplot(data_knn)+geom_point(aes(past_spend,spend))
ggplot(data_knn)+geom_point(aes(past_spend,spend, color=voucher))
ggplot(data_knn)+geom_point(aes(past_spend,spend, color=ad_channel))

ggplot(data3)+geom_point(aes(time_web,spend))
ggplot(data_knn)+geom_point(aes(time_web,spend))
ggplot(data_knn)+geom_point(aes(time_web,spend, color=voucher))
ggplot(data_knn)+geom_point(aes(time_web,spend, color=ad_channel))

ggplot(data3)+geom_point(aes(age,spend))
ggplot(data_knn)+geom_point(aes(age,spend))
ggplot(data_knn)+geom_point(aes(age,spend,color=voucher))
ggplot(data_knn)+geom_point(aes(age,spend,color=ad_channel))


mean(data$past_spend, na.rm = TRUE)
median(data$past_spend, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(past_spend), binwidth = 5, bin = NULL)
mean(data$age, na.rm = TRUE)
median(data$age, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(age), binwidth = 2, bin = NULL)
mean(data$time_web, na.rm = TRUE)
median(data$time_web, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(time_web), binwidth = 5, bin = NULL)
mean(data$spend, na.rm = TRUE)
median(data$spend, na.rm = TRUE)
ggplot(data)+geom_histogram(aes(spend), binwidth = 5, bin = NULL)

mean(data_knn1$past_spend, na.rm = TRUE)
median(data_knn1$past_spend, na.rm = TRUE)
ggplot(data_knn1)+geom_histogram(aes(past_spend), binwidth = 5, bin = NULL)
mean(data_knn1$age, na.rm = TRUE)
median(data_knn1$age, na.rm = TRUE)
ggplot(data_knn1)+geom_histogram(aes(age), binwidth = 2, bin = NULL)
mean(data_knn1$time_web, na.rm = TRUE)
median(data_knn1$time_web, na.rm = TRUE)
ggplot(data_knn1)+geom_histogram(aes(time_web), binwidth = 5, bin = NULL)
mean(data_knn1$spend, na.rm = TRUE)
median(data_knn1$spend, na.rm = TRUE)
ggplot(data_knn1)+geom_histogram(aes(spend), binwidth = 5, bin = NULL)
library(VIM)
aggr(data_knn1, numbers = TRUE, prop = FALSE, 
     col = c("#F8766D", "#00BFC4"),
     cex.axis = 0.8, 
     gap = 3,
     ylab = c("Missing Data Pattern", "Frequency"),
     theme = theme_minimal())

library(VIM)
data4<-data_knn
data4 <- kNN(data4,k=10)
data4<-data4[,(1:6)]

ggplot(data4)+geom_point(aes(past_spend,spend))
ggplot(data4)+geom_point(aes(time_web,spend))
ggplot(data4)+geom_point(aes(age,spend))

sum(complete.cases(data4))
mean(data4$past_spend, na.rm = TRUE)
median(data4$past_spend, na.rm = TRUE)
mean(data4$age, na.rm = TRUE)
median(data4$age, na.rm = TRUE)
mean(data4$time_web, na.rm = TRUE)
median(data4$time_web, na.rm = TRUE)
mean(data4$spend, na.rm = TRUE)
sum(complete.cases(data4))
sum(complete.cases(data3))
datam<-data3[!complete.cases(data3),]
ggplot(data4)+geom_histogram(aes(past_spend), binwidth = 5, bin = NULL)
ggplot(data4)+geom_histogram(aes(age), binwidth = 2, bin = NULL)
ggplot(data4)+geom_histogram(aes(time_web), binwidth = 5, bin = NULL)
ggplot(data4)+geom_histogram(aes(spend), binwidth = 5, bin = NULL)
table(data4$ad_channel)
table(data4$voucher)
#Train Test Split
datasplit <- data4
datasplit$id <- 1:nrow(datasplit)
smp_size <- floor(0.85 * nrow(datasplit))
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(datasplit)), size = smp_size)
trainingdata <- datasplit[train_ind, ]
testdata <- datasplit[-train_ind, ]
trainingdata<-trainingdata[,(1:6)]
testdata<-testdata[,(1:6)]
print(dim(trainingdata))
print(dim(testdata))

#Linear after KNN
model <- lm(spend ~ ., data=trainingdata)
summary(model)
prediction <- predict(model, newdata = testdata)
sqrt(mean((testdata$spend - prediction)^2))

ggplot(data=testdata) + geom_point(aes(past_spend,spend,color='red'))+
  geom_point(aes(past_spend,prediction,color='blue'))+ theme(legend.position="none")
ggplot(data=testdata) + geom_point(aes(age,spend,color='red'))+
  geom_point(aes(age,prediction,color='blue'))+ theme(legend.position="none")
ggplot(data=testdata) + geom_point(aes(time_web,spend,color='red'))+
  geom_point(aes(time_web,prediction,color='blue'))+ theme(legend.position="none")

new_data <- read.csv(file = 'new_customer24.csv', header = TRUE)
new_data$voucher <- as.factor(new_data$voucher)
new_data$ad_channel <- as.factor(new_data$ad_channel)
prediction_new <- predict(model, newdata = new_data)
print(prediction_new)