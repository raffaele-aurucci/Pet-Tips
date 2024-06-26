library(utils)

data <- read.csv("../dataset/cleaned_datasets/dog_breeds.csv")
View(data)

#________________________________________________________________________
#                             SHARED ANALYSIS
#________________________________________________________________________

# Affectionate with Family Attribute Frequencies
family_friendly <- data[, "Affectionate_with_Family"]
family_friendly

intervals <- c(0, 1, 2, 3, 4, 5)
abs_frequence <- table(cut(family_friendly, breaks = intervals))
abs_frequence

hist(
  family_friendly,
  breaks = intervals,
  freq = TRUE,
  ylim = c(0, max(abs_frequence) + 1),
  col = c("orange", "yellow", "green", "blue", "red"),
  border = "black", main = "Affectionate With Family Attribute Frequencies",
  xlab = "Family Friendly Values", ylab = "Absolute Frequency"
)

mean_family_friendly <- mean(family_friendly)
mean_family_friendly


# Longevity Years Attribute Frequencies
longevity_per_year <- data[, "Longevity_Years"]
longevity_per_year_mean <- mean(longevity_per_year, na.rm = TRUE)
longevity_per_year_mean


# Potential For Playfulness Attribute Frequencies
playfullness <- data[, "Potential_For_Playfulness"]
playfullness

intervals <- c(0, 1, 2, 3, 4, 5)
abs_frequence <- table(cut(playfullness, breaks = intervals))
abs_frequence

hist(playfullness,
     breaks = intervals,
     freq = TRUE,
     ylim = c(0, max(abs_frequence) + 8),
     col = c("orange", "yellow", "green", "blue", "red"),
     border = "black",
     main = "Potential For Playfulness Attribute Frequencies",
     xlab = "Potential For Playfulness Values",
     ylab = "Absolute Frequency"
)

playfullness_mean <- mean(playfullness, na.rm = TRUE)
playfullness_mean


# Kid Friendly Attribute Frequencies
kid_friendly <- data[, "Incredibly_Kid_Friendly_Dogs"]
kid_friendly

intervals <- c(0, 1, 2, 3, 4, 5)
abs_frequence <- table(cut(kid_friendly, breaks = intervals))
abs_frequence

hist(kid_friendly,
     breaks = intervals,
     freq = TRUE,
     ylim = c(0, max(abs_frequence) + 8),
     col = c("orange", "yellow", "green", "blue", "red"),
     border = "black",
     main = "Kid Friendly Attribute Frequencies",
     xlab = "Kid Friendly Values",
     ylab = "Absolute Frequency"
)

kid_friendly_mean <- mean(kid_friendly, na.rm = TRUE)
kid_friendly_mean


# Intelligence Attribute Frequencies
intelligence <- data[, "Intelligence"]
intelligence

intervals <- c(0, 1, 2, 3, 4, 5)
abs_frequence <- table(cut(intelligence, breaks = intervals))
abs_frequence

hist(intelligence,
     breaks = intervals,
     freq = TRUE,
     ylim = c(0, max(abs_frequence) + 17),
     col = c("orange", "yellow", "green", "blue", "red"),
     border = "black",
     main = "Intelligence Attribute Frequencies",
     xlab = "Intelligence Values",
     ylab = "Absolute Frequency"
)

intelligence_mean <- mean(intelligence, na.rm = TRUE)
intelligence_mean


#________________________________________________________________________
#                           DOG ANALYSIS
#________________________________________________________________________

# Food Costs Per Year Attribute Boxplot
food_costs_per_year <- data[, "Food_Costs_Per_Year"]
food_costs_per_year

quantile(food_costs_per_year, na.rm = TRUE)
summary(food_costs_per_year)

boxplot(
  food_costs_per_year,
  main = "Boxplot Food Costs Per Year",
  ylab = "Values",
  col = "lightblue",
  border = "black"
)

stats <- boxplot.stats(food_costs_per_year)
stats

high_limit <- stats$stats[5]
high_limit

food_costs_per_year_breed <- data[, c("Breed", "Food_Costs_Per_Year")]
View(food_costs_per_year_breed)

df <- data.frame(
  breed = data[, "Breed"],
  food_costs = data[, "Food_Costs_Per_Year"]
)

breeds_with_highest_food_cost <- c()
for (i in 1:nrow(df)){
  breed <- df$breed[i]
  food_cost <- df$food_costs[i]
  if (is.na(food_cost))
    next
  else if (food_cost > high_limit)
    breeds_with_highest_food_cost <- c(breeds_with_highest_food_cost, breed)
}

print(breeds_with_highest_food_cost)


# Easy To Train Attribute Frequencies
easy_to_train <- data[, "Easy_To_Train"]
easy_to_train

intervals <- c(0, 1, 2, 3, 4, 5)
abs_frequence <- table(cut(easy_to_train, breaks = intervals))
abs_frequence

hist(easy_to_train,
     breaks = intervals,
     freq = TRUE,
     ylim = c(0, max(abs_frequence) + 17),
     col = c("orange", "yellow", "green", "blue", "red"),
     border = "black",
     main = "Easy To Train Attribute Frequencies",
     xlab = "Easy To Train Values",
     ylab = "Absolute Frequency")

easy_to_train <- mean(easy_to_train, na.rm = TRUE)
easy_to_train


# Purchase Price Attribute Boxplot
purchase_price <- data[, "Purchase_Price"]
purchase_price

quantile(purchase_price, na.rm = TRUE)
summary(purchase_price)

boxplot(
  purchase_price,
  main = "Boxplot Purchase Price",
  ylab = "Values",
  col = "lightblue",
  border = "black"
)

stats <- boxplot.stats(purchase_price)
stats

high_limit <- stats$stats[5]
high_limit

purchase_price <- data[, c("Breed", "Purchase_Price")]
View(purchase_price)

df <- data.frame(
  breed = data[, "Breed"],
  purchase_price = data[, "Purchase_Price"]
)

breeds_with_highest_purchase_price <- c()
for (i in 1:nrow(df)){
  breed <- df$breed[i]
  purchase_price <- df$purchase_price[i]
  if (is.na(purchase_price))
    next
  else if (purchase_price > high_limit)
    breeds_with_highest_purchase_price <- c(breeds_with_highest_purchase_price, breed)
}

print(breeds_with_highest_purchase_price)


