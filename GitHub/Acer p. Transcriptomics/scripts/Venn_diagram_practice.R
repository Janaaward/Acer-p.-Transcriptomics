# venn diagram with data set practice
# 7/8/2024
#Janaa Ward
# RNA gene expression 4-way venn diagram
setwd("/Users/janaaward/Desktop/R work/RNA Transcriptomics")
#set seed
set.seed(22)
install.packages("VennDiagram")
library(VennDiagram)

venn.diagram(x, filename = "Venn diagram sig DEGs.csv")
# Helper function to display Venn diagram
display_venn <- function(x, ...){
  library(VennDiagram)
  grid.newpage()
  venn_object <- venn.diagram(x, filename = NULL, ...)
  grid.draw(venn_object)
}

#view plot
display_venn(x)
# Change category names
# Change fill color
display_venn(
  x,
  category.names = c("Male flowers" , "Female Flowers " , "Male Leaves", "Female leaves"),
  fill = c("dodgerblue2", "deeppink2", "darkseagreen2", "gold1")
)



# Further customization
display_venn(
  x,
  category.names = c("Male flowers" , "Female Flowers " , "Male Leaves", "Female leaves"),
  # Circles
  lwd = 2,
  lty = 'blank',
  fill = c("dodgerblue2", "deeppink2", "darkseagreen2", "gold1"),
  # Numbers
  cex = .9,
  fontface = "italic",
  # Set names
  cat.cex = 1,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  cat.dist = c(0.1, 0.1, 0.1, 0.1)
)

###fake data set###
# Reference four-set diagram

#########new type##############
# Reference four-set diagram
DEG_venn.plot <- draw.quad.venn(
  area1 = 18602,
  area2 = 19275,
  area3 =17983,
  area4 = 18320,
  n12 = 18148,
  n13 = 17282,
  n14 = 17515,
  n23 = 17761,
  n24 = 18146,
  n34 = 17754,
  n123 = 17220,
  n124 = 17486,
  n134 = 17128,
  n234 = 17616,
  n1234 = 17103,
  fill = c("dodgerblue2", "deeppink2", "darkseagreen2", "gold1"),
  category = c("Male_flowers", "Female_flowers", "Male_leaves", "Female_leaves"),
  cex = 2,
  cat.cex = 1,
);
# Writing to file
tiff(
  filename = tempfile(
    pattern = 'Quad_Venn_diagram',
    fileext = '.tiff'
  ),
  compression = "lzw"
);
grid.draw(venn.plot);
dev.off();

