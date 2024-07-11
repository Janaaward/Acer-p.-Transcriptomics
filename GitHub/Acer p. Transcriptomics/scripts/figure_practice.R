#figure Practice
#7/10/24
# different figures used in DEGs analysis
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6954399/

######PCA#########
#analysis of the linear components of all existing attributes.
#allowing you to better visualize the variations present in a dataset with many variables.
#This transformation fits the data into a coordinate system where the most significant variance 
#is found on the first coordinate, and each subsequent coordinate is orthogonal to the last and 
#has a lesser variance than the previous


# structure of the iris 
# dataset 
str(iris) 

# print the iris dataset 
head(iris)
iris.pca <- prcomp(iris[,c(1:4)], 
                   center = TRUE, 
                   scale. = TRUE) 

# summary of the  
# prcomp object 
summary(iris.pca)
# structure of the pca object 
str(iris.pca) 
# loading library 
library(ggplot2)
library(ggfortify) 
iris.pca.plot <- autoplot(iris.pca, 
                          data = iris, 
                          colour = 'Species') 

iris.pca.plot
#for better understanding of the linear transformation of features
biplot.iris.pca <- biplot(iris.pca) 
biplot.iris.pca
#determininng the ideal features which can be justified after
plot.iris.pca <- plot(iris.pca, type="l") 
plot.iris.pca


######Volcano####
# Install necessary packages if you haven't already
install.packages("ggplot2")
install.packages("dplyr")

# Load the libraries
library(ggplot2)
library(dplyr)
# Generate mock data
set.seed(22)
num_genes <- 1000
genes <- paste0("Gene", 1:num_genes)
expression_values <- rnorm(num_genes, mean = 0, sd = 1)
p_values <- runif(num_genes, min = 0, max = 0.05)
data <- data.frame(Gene = genes, Expression = expression_values, P_value = p_values)

# Log-transform p-values for visualization
data$logP <- -log10(data$P_value)
# Volcano plot
volcano_plot <- ggplot(data, aes(x = Expression, y = logP, 
                                 color = ifelse(logP > -log10(0.05) & abs(Expression) > 1,
                                                "red", "black"))) +
  geom_point(size = 2) +
  labs(title = "Volcano Plot", x = "Expression", y = "-log10(P-value)") +
  theme_minimal()

# Display the plot
print(volcano_plot)
# Customized volcano plot
custom_volcano_plot <- volcano_plot +
  scale_color_manual(values = c("black", "red"), 
                     labels = c("Not significant", "Significant")) +
  theme(axis.text = element_text(size = 12), 
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = 16, face = "bold"),
        legend.position = "bottom",
        legend.title = element_blank(),
        legend.text = element_text(size = 12)) +
  geom_point(size = 3)

# Display the customized plot
print(custom_volcano_plot)
# Add significance thresholds
final_volcano_plot <- custom_volcano_plot +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  annotate("text", x = 2.5, y = -log10(0.05) + 0.4, 
           label = "Significance Threshold", size = 4.5, color = "black") +
  annotate("text", x = -2, y = -log10(0.05) + 0.4, 
           label = "Significance Threshold", size = 4.5, color = "black") +
  annotate("text", x = 0, y = -log10(0.05) + 0.7, 
           label = "Fold Change Threshold", size = 6, color = "red") +
  theme(axis.text = element_text(size = 12), 
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = 16, face = "bold"),
        legend.position = "bottom",
        legend.title = element_blank(),
        legend.text = element_text(size = 12))

# Display the final plot
print(final_volcano_plot)

