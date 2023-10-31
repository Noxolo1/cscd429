#### PROBLEM 1 -- not done
# create x vector
x <- c(-20, -15,-5, 8, 12, 9, 2, 23, 19)

#1a
mean(x)

#1b
median(x)

#1c
sum(x)

#1d
sum(x[x>0])

#1e 
for (i in 1:length(x)){
  if(abs(x[i]) > 8 & x[i] < 8){
    print(x[i])
  }
}


### PROBLEM 2 -- done
#2a 
x <- c(1,3,0,-2,4,-1,5,2,10)
vec_sum <- c(0)
for (i in 1:length(x)){
  vec_sum <- vec_sum + x[i]
}
vec_sum

#2b
vec_sum_sqr <- vec_sum^2
vec_sum_sqr

#2c
vec_sum <- c(0)
for (i in 1:length(x)){
  vec_sum <- vec_sum + x[i]^2
}
vec_sum

#2d
vec_sum <- c(0)
for (i in 3:5){
  vec_sum <- vec_sum + x[i]
}
vec_sum

#2e
vec_sum <- c(0)
for (i in 1:4){
  vec_sum <- vec_sum + x[i]^3
}
vec_sum


### PROBLEM 3 -- done
#create x vector
x <- c(12, 6, 15, 3, 12, 6, 21, 15, 18 , 12)

#3a  
vec_mean <- mean(x)
vec_sum <- c(0)
for (i in 1:length(x)){
    vec_sum <- vec_sum + sum(x[i] - vec_mean)
}
vec_sum

#3b
range_vec <- max(x) - min(x)
range_vec

#3c
var(x)

#3d
sd(x)

#3e
fivenum(x)
boxplot(x)

#### PROBLEM 4 -- done
#4a
data <- scan(file="/Users/nwilson/Downloads/mismatch_dat.txt")

#4b
boxplot(data)

#4c
hist(data)

#4d
hist(data, breaks = 15)

#4e
plot(data, ylab = "Mismatch Value", main = "Scatter Plot of Mismatch Data")






