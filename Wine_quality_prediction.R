
library(ggplot2)
library(tibble)
library(caret)
library(gridExtra)
library(huxtable)
library(data.table)
library(performanceEstimation) 
library(ROCR)
library(grid)

#get data
winequality <- read.table("https://raw.githubusercontent.com/GiselleVicatos/Sunderland_CETM72/main/winequalityN.csv", 
                          header=TRUE, stringsAsFactors = TRUE, sep=',')
str(winequality)
table(winequality$type)

# Barplot of wine type
ggplot(data = winequality) + 
  geom_bar(aes(type, fill = type)) +
  ggtitle("Prevalence of Red and White Wines") +
  theme(
    plot.title = (element_text(hjust = 0.5,color="black", size =30, face="bold" )),
    axis.title.x = element_text(color="black", size=30, face="bold"),
    axis.title.y = element_text(color="black", size=30, face="bold"),
    text = element_text(size = 30))      

#### Data Cleaning
###remove null values
#says how many null values there are
sum(is.na(winequality)) 
#shows where NaN values are
summary(winequality) 
#takes out row with null values and assigns a new dataset
wine3 <- na.omit(winequality) 
#no NAN values 
sum(is.na(wine3))
head(wine3)

###replace existing grading system with a binary high and low evaluation
wine3$quality[wine3$quality==3] <- 0
wine3$quality[wine3$quality==4] <- 0
wine3$quality[wine3$quality==5] <- 0
wine3$quality[wine3$quality==6] <- 1
wine3$quality[wine3$quality==7] <- 1
wine3$quality[wine3$quality==8] <- 1
wine3$quality[wine3$quality==9] <- 1

#convert wine quality to a factor
wine3$quality = as.factor(wine3$quality)
#check conversion 
str(wine3)
table(wine3$quality)

###separate into red and white wine
red_wine <- wine3[which(wine3$type == "red"),]
white_wine  <- wine3[which(wine3$type == "white"),]
#check seperation
table(red_wine$quality)
table(white_wine$quality)

# Barplot of quality for red wine
qr <- ggplot(data = red_wine) + 
  geom_bar(aes(quality, fill = quality)) +
  ggtitle("Quality Distribution for Red Wine") +
  scale_fill_manual(values=c('purple','orange'), labels = c("low", "high"))+
  theme(
    plot.title = (element_text(hjust = 0.5,color="black", size =25, face="bold" )),
    axis.title.x = element_text(color="black", size=25, face="bold"),
    axis.title.y = element_text(color="black", size=25, face="bold"),
    text = element_text(size = 25))   
qr
# Barplot of quality for white wine
qw <-ggplot(data = white_wine) + 
  geom_bar(aes(quality, fill = quality)) +
  ggtitle("Quality Distribution for White Wine") +
  scale_fill_manual(values=c('purple','orange'), labels = c("low", "high"))+
  theme(
    plot.title = (element_text(hjust = 0.5,color="black", size =25, face="bold" )),
    axis.title.x = element_text(color="black", size=25, face="bold"),
    axis.title.y = element_text(color="black", size=25, face="bold"),
    text = element_text(size = 25))  
qw

grid.arrange(qr, qw,
             ncol = 2, nrow = 1)

### Check for outliers
##create a boxplot
#take out the quality column
wine4 <- wine3[-13]
head(wine4)
#plot the boxplots
wine4.m <- reshape2::melt(wine4, id.var = "type") # use melt to restructure data so that I can plot 
ggplot(data = wine4.m , aes(x=variable, y=value)) + 
  geom_boxplot(aes(fill=type)) +
  facet_wrap( ~ variable, scales="free") +
  xlab("Features") + ylab("Value") + ggtitle("Distribution of Values by Feature for White and Red Wine") +
  theme(
    plot.title = (element_text(hjust = 0.5,color="black", size =22, face="bold" )),
    axis.title.x = element_text(color="black", size=22, face="bold"),
    axis.title.y = element_text(color="black", size=22, face="bold"),
    text = element_text(size = 22))

##function to remove outliers
outlierReplace <- function(dataframe, cols, rows, newValue = NA) {
  if (any(rows)) {
    set(dataframe, rows, cols, newValue)}}

##remove outliers of selected features
#make a subset with only the features
ro_red_wine <- subset(red_wine, select=-c(1,13))
ro_white_wine <-subset(white_wine, select=-c(1,13))
head(ro_red_wine)
head(ro_white_wine)

# replace identified outliers with null values
#from white wine - residual sugar
outlierReplace(ro_white_wine, "residual.sugar", which(ro_white_wine$residual.sugar > 40), NA)
boxplot(ro_white_wine$residual.sugar)
# from red wine - chloride
outlierReplace(ro_red_wine, "chlorides", which(ro_red_wine$chlorides > 0.55), NA)
boxplot(ro_red_wine$chlorides)
#from white wine - free sulfur dioxide
outlierReplace(ro_white_wine, "free.sulfur.dioxide", which(ro_white_wine$free.sulfur.dioxide > 250), NA)
boxplot(ro_white_wine$free.sulfur.dioxide)
#from white wine - density
outlierReplace(ro_white_wine, "density", which(ro_white_wine$density > 1.03), NA)
boxplot(ro_white_wine$density)

#put quality column back into subset data set for each wine type
ro_red_wine2 <- data.frame(ro_red_wine, red_wine[13])
head(ro_red_wine2)
ro_white_wine2 <- data.frame(ro_white_wine, white_wine[13])
head(ro_white_wine2)

#take out null values 
sum(is.na(ro_red_wine2))
sum(is.na(ro_white_wine2))

#takes out row with null values and assigns a new dataset
new_red_wine <- na.omit(ro_red_wine2) 
sum(is.na(new_red_wine))
head(new_red_wine)

new_white_wine <- na.omit(ro_white_wine2)
sum(is.na(new_white_wine))
head(new_white_wine)

### data transformation
#normalize data
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))}
# red wine
new_red_wine$fixed.acidity <- normalize(new_red_wine$fixed.acidity)
new_red_wine$volatile.acidity <- normalize(new_red_wine$volatile.acidity)
new_red_wine$citric.acid <- normalize(new_red_wine$citric.acid)
new_red_wine$residual.sugar <- normalize(new_red_wine$residual.sugar)
new_red_wine$chlorides <- normalize(new_red_wine$chlorides)
new_red_wine$free.sulfur.dioxide <- normalize(new_red_wine$free.sulfur.dioxide)
new_red_wine$total.sulfur.dioxide <- normalize(new_red_wine$total.sulfur.dioxide)
new_red_wine$density <- normalize(new_red_wine$density)
new_red_wine$pH <- normalize(new_red_wine$pH)
new_red_wine$sulphates <- normalize(new_red_wine$sulphates)
new_red_wine$alcohol <- normalize(new_red_wine$alcohol)
head(new_red_wine)
# white wine
new_white_wine$fixed.acidity <- normalize(new_white_wine$fixed.acidity)
new_white_wine$volatile.acidity <- normalize(new_white_wine$volatile.acidity)
new_white_wine$citric.acid <- normalize(new_white_wine$citric.acid)
new_white_wine$residual.sugar <- normalize(new_white_wine$residual.sugar)
new_white_wine$chlorides <- normalize(new_white_wine$chlorides)
new_white_wine$free.sulfur.dioxide <- normalize(new_white_wine$free.sulfur.dioxide)
new_white_wine$total.sulfur.dioxide <- normalize(new_white_wine$total.sulfur.dioxide)
new_white_wine$density <- normalize(new_white_wine$density)
new_white_wine$pH <- normalize(new_white_wine$pH)
new_white_wine$sulphates <- normalize(new_white_wine$sulphates)
new_white_wine$alcohol <- normalize(new_white_wine$alcohol)
head(new_white_wine)

###split data into train and test set
#red wine
set.seed(5)
index <- sample(nrow(new_red_wine), 0.8 * nrow(new_red_wine)) 
red_winetrain <- new_red_wine[index,] 
red_winetest <- new_red_wine[-index,]

#white wine
set.seed(5)
index <- sample(nrow(new_white_wine), 0.8 * nrow(new_white_wine)) 
white_winetrain <- new_white_wine[index,] 
white_winetest <- new_white_wine[-index,]

#check quality distribution of train data
table(red_winetrain$quality)
table(white_winetrain$quality)

###oversampling using SMOTE
#white wine
white_winetrain_re <- smote(quality~., white_winetrain, perc.over = 1, perc.under = 2, k=5)
table(white_winetrain_re$quality)
#red wine
red_winetrain_re <- smote(quality~., red_winetrain, perc.over = 0.15, perc.under = 7.73, k=5)
table(red_winetrain_re$quality)


###FUNCTION
# create tibble for results
quality_results <- tibble(wine_type = NA, 
                          Model = NA,
                          Accuracy = NA,
                          Sensitivity_or_Recall = NA,
                          Specificity = NA,
                          Precision = NA,
                          F1_Score = NA,
                          AUC = NA)
#define function
alorgithm_predictions <- function(model, train, test){
  
  {ctrl <- trainControl(method = "repeatedcv", number =5, repeats= 3) 
  set.seed(333)}
  
  if (model=="knn"){
    fit.cv <- train(quality~., data = train, method =model, 
                    trControl = ctrl, preProcess= c("center", "scale"), tuneLength =5)
    variable_importance_knn <<- varImp(fit.cv, scale = TRUE)}
  
  else if (model=="rf"){
    fit.cv <- train(quality~., data = train, method =model, 
                    trControl = ctrl, preProcess= c("center", "scale"), tuneLength =5, metric= "Accuracy")
    variable_importance_rf <<- varImp(fit.cv, scale = TRUE)}
  
  else if (model=="svmRadial"){
    fit.cv <- train(quality~., data= train, method=model, 
                    trControl=ctrl, tuneLength =5, preProcess = c("center", "scale"))
    variable_importance_svmRadial <<- varImp(fit.cv, scale = TRUE)}
  
  else if (model =="rpart"){
    fit.cv <- train(quality~., data = train, method =model, 
                    trControl = ctrl, preProcess= c("center", "scale"), tuneLength =5) 
    variable_importance_rpart <<- varImp(fit.cv, scale = TRUE)}
  
  #prediction
  pred <- predict(fit.cv, test[-12])
  #confusion matrix
  confM <- confusionMatrix(table(pred, test$quality), positive='1')
  # Accuracy
  acc <- mean(pred == test$quality)
  # Sensitivity/Recall
  sen <- caret::confusionMatrix(pred, test$quality, positive='1')$byClass["Sensitivity"]
  # Specificity
  spe <- caret::confusionMatrix(pred, test$quality, positive='1')$byClass["Specificity"]
  # Pos Pred Value/Precision
  pos <- caret::confusionMatrix(pred, test$quality, positive='1')$byClass["Pos Pred Value"]
  # F1 score
  F1 <- 2* (pos*sen/(pos+sen))
  #ROC and AUC
  roc_pred <- prediction(as.numeric(pred), as.numeric(test$quality))
  roc_perf <- performance(roc_pred , "tpr" , "fpr")
  auc_ROCR <- performance(roc_pred, measure = "auc")
  auc_ROCR <- auc_ROCR@y.values[[1]]
  
  #Red/white wine label
  red_white_lable <- as.character(substitute(train))
  red_white_lable2 <- substr(red_white_lable, 1,1)
  
  # gets performance measures for each metric for each model
  quality_results <<- rbind(quality_results,
                            tibble(wine_type = red_white_lable2, 
                                   Model = model,
                                   Accuracy = acc,
                                   Sensitivity_or_Recall = sen,
                                   Specificity = spe,
                                   Precision = pos,
                                   F1_Score = F1, 
                                   AUC = auc_ROCR))
  
  return(confM)
}

###define the models to be used
models <- c("rpart", "knn", "rf", "svmRadial")

###call the function for white wine
for (i in 1:4){
  print(alorgithm_predictions(models[i] , white_winetrain_re, white_winetest))}

###plot the variable of importance for white wine per model
aa <- plot(variable_importance_rpart, cex = 1, main= "DT model")
bb <- plot(variable_importance_knn,  cex = 1, main= "KNN model")
cc <- plot(variable_importance_rf,  cex = 1, main= "RF model")
dd <- plot(variable_importance_svmRadial, cex = 1,main= "SVM model")

#put all the white wine plots on one grid
grid.arrange(aa, bb, cc, dd,
             ncol = 2, nrow = 2, top = textGrob("Variables of Importance for White Wine per Model",gp=gpar(fontsize=20)))

###call the function for red wine
for (i in 1:4){
  print(alorgithm_predictions(models[i] , red_winetrain_re, red_winetest))}

###plot the variable of importance for red wine per model
ee <- plot(variable_importance_rpart, cex = 1,  main= "DT model")
ff <- plot(variable_importance_knn,  cex = 1, main= "KNN model")
gg <- plot(variable_importance_rf,  cex = 1, main= "RF model")
hh <- plot(variable_importance_svmRadial, cex = 1,main= "SVM model")

#put all the red wine plots on one grid
grid.arrange(ee, ff, gg, hh,
             ncol = 2, nrow = 2, top = textGrob("Variables of Importance for Red Wine per Model",gp=gpar(fontsize=20)))

### create table of metric results for white and red wine
as_hux(quality_results) %>%
  # Add colour to red and white wine label
  set_text_color(3:6, 1, "blue") %>%
  set_text_color(7:10, 1, "red") %>%
  # Colour code the models
  set_text_color(3, 2, "purple") %>%
  set_text_color(4, 2, "orange") %>%
  set_text_color(5, 2, "green") %>%
  set_text_color(6, 2, "black") %>%
  set_text_color(7, 2, "purple") %>%
  set_text_color(8, 2, "orange") %>%
  set_text_color(9, 2, "green") %>%
  set_text_color(10, 2, "black") %>%
  # Format numbers
  set_number_format(row= -1, value = 3) %>% 
  # Format header row
  set_top_border(row = 1, col = everywhere) %>% 
  set_bottom_border(row = 1, col = everywhere) %>%
  set_bold(row = 1, col = everywhere) %>% 
  # Title
  set_caption("Model Performance Results") %>% 
  set_position(value = "center") 

### Visualize the confusion matrix tables for white and red wine per model
#set up target and predict classes
TargetClass <- factor(c("0", "0", "1", "1"))
PredictClass <- factor(c("0", "1", "0", "1"))

#get the TN, FP, FN, TP values for each model from the output of the function. 
#white wine
white_svm <- c(246, 85, 167, 476)
white_rf <- c(270, 61, 115, 528)
white_knn <- c(243, 88, 161, 482)
white_rpart <- c(239, 92, 185, 458)
#red wine
red_svm <- c(121, 27, 48, 123)
red_rf <- c(131, 17, 45, 126)
red_knn <- c(103, 45, 39, 132)
red_rpart <- c(119, 29, 56, 115)

#setup the data frames
df_white_rpart <- data.frame(TargetClass, PredictClass, white_rpart)
df_white_knn <- data.frame(TargetClass, PredictClass, white_knn)
df_white_rf <- data.frame(TargetClass, PredictClass, white_rf)
df_white_svm <- data.frame(TargetClass, PredictClass, white_svm)
df_red_rpart <- data.frame(TargetClass, PredictClass, red_rpart)
df_red_knn <- data.frame(TargetClass, PredictClass, red_knn)
df_red_rf <- data.frame(TargetClass, PredictClass, red_rf)
df_red_svm <- data.frame(TargetClass, PredictClass, red_svm)

#plot the confusion matrix using ggplot
#white wine DT model
a <- ggplot(data =  df_white_rpart, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = white_rpart), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", white_rpart)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq" ) +
  theme_bw() +
  ggtitle("DT Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#white wine KNN model
b <- ggplot(data =  df_white_knn, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = white_knn), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", white_knn)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", "Freq") +
  theme_bw() +
  ggtitle("KNN Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#white wine RF model
c <- ggplot(data =  df_white_rf, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = white_rf), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", white_rf)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq") +
  theme_bw() +
  ggtitle("RF Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#white wine SVM model
d <- ggplot(data =  df_white_svm, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = white_svm), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", white_svm)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq") +
  theme_bw() +
  ggtitle("SVM Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#put all plots into one grid for white wine
grid.arrange(a, b, c, d,
             ncol = 2, nrow = 2, top = textGrob("Confusion Matrix for White Wine Models",gp=gpar(fontsize=30)))

#red wine DT model
e <- ggplot(data =  df_red_rpart, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = red_rpart), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", red_rpart)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq") +
  theme_bw() +
  ggtitle("DT Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#red wine KNN model
f <- ggplot(data =  df_red_knn, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = red_knn), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", red_knn)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq") +
  theme_bw() +
  ggtitle("KNN Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#red wine RF model
g <- ggplot(data =  df_red_rf, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = red_rf), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", red_rf)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq") +
  theme_bw() +
  ggtitle("RF Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#red wine SVM model
h <- ggplot(data =  df_red_svm, mapping = aes(x = TargetClass, y = PredictClass)) +
  geom_tile(aes(fill = red_svm), colour = "white") +
  geom_text(aes(label = sprintf("%1.0f", red_svm)), vjust = 1, size = 8 ) +
  scale_fill_gradient(low = "white", high = "steelblue", name = "Freq") +
  theme_bw() +
  ggtitle("SVM Model") +
  theme(text = element_text(size = 20), plot.title = element_text(hjust = 0.5)) 

#put all plots into one grid for red wine
grid.arrange(e, f, g, h,
             ncol = 2, nrow = 2, top = textGrob("Confusion Matrix for Red Wine Models",gp=gpar(fontsize=30)))
















