# Load the necessary library
library(dplyr)

# Example data frame
sales_data <- data.frame(
  ProductID = c(1, 2, 3, 4, 5),
  ProductName = c("TV", "Laptop", "Blender", "Headphones", "Toaster"),
  Category = c("Electronics", "Electronics", "Home Goods", "Electronics", "Home Goods"),
  SalesAmount = c(500, 1000, 150, 200, 50),
  SalesDate = as.Date(c("2024-01-01", "2024-01-02", "2024-01-03", "2024-01-04", "2024-01-05"))
)

# Filter records to include only those from the "Electronics" category
electronics_sales <- sales_data %>%
  filter(Category == "Electronics")

# Group by ProductName and calculate total SalesAmount for each product
total_sales_per_product <- electronics_sales %>%
  group_by(ProductName) %>%
  summarise(TotalSalesAmount = sum(SalesAmount))

# Arrange the results in descending order of total SalesAmount
sorted_sales <- total_sales_per_product %>%
  arrange(desc(TotalSalesAmount))

# Print the result
print(sorted_sales)

# Save the results to a CSV file
output_file <- "sorted_sales.csv"
write.csv(sorted_sales, file = output_file, row.names = FALSE)





#| ProductID | ProductName | Category    | SalesAmount | SalesDate   |
#|-----------|-------------|-------------|-------------|-------------|
#| 1         | TV          | Electronics | 500         | 2024-01-01  |
#| 2         | Laptop      | Electronics | 1000        | 2024-01-02  |
#| 3         | Blender     | Home Goods  | 150         | 2024-01-03  |
#| 4         | Headphones  | Electronics | 200         | 2024-01-04  |
#| 5         | Toaster     | Home Goods  | 50          | 2024-01-05  |

