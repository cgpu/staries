library(VennDiagram)
library(ggplot2)
library(ggplotify)
library(showtext)
library(gridGraphics)
library(gridExtra)
library(dplyr)

intersect_genes_based_on_systemReview_snps <- intersect(snps, system_review_snps)

# filter(!is.na(name)) equiv to drop_na("name") %>% (removes rows from the df that have NA values in col "name")
SystematicReview %>% 
  add_count(Gene) %>% 
  filter(n > 0) %>% 
  arrange(desc(n)) %>%
  drop_na("Gene") %>%
  filter(Gene %in% intersect_genes_based_on_systemReview_snps)  %>%
  dplyr::select(Gene, n)   %>%
  dplyr::distinct() ->  intersect_genes_systemReview_snps_counts


intersect_genes_systemReview_snps_counts$name <- intersect_genes_systemReview_snps_counts$Gene
intersect_genes_systemReview_snps_counts$Gene <- NULL
intersect_genes_systemReview_snps_counts$n_literature <- intersect_genes_systemReview_snps_counts$n
intersect_genes_systemReview_snps_counts$n <- NULL

# filter(!is.na(name)) equiv to drop_na("name") %>% (removes rows from the df that have NA values in col "name")
cohort_maf %>% 
  add_count(Hugo_Symbol) %>% 
  filter(n > 0) %>% 
  arrange(desc(n)) %>%
  drop_na("Hugo_Symbol") %>%
  filter(Hugo_Symbol %in% intersect_genes_based_on_systemReview_snps)  %>%
  dplyr::select(Hugo_Symbol, n)   %>%
  dplyr::distinct() ->  intersect_genes_snps_counts_snps_Mutect2

intersect_genes_snps_counts_snps_Mutect2$name <- intersect_genes_snps_counts_snps_Mutect2$Hugo_Symbol
intersect_genes_snps_counts_snps_Mutect2$Hugo_Symbol <- NULL
intersect_genes_snps_counts_snps_Mutect2$n_Mutect2_var_calling <- intersect_genes_snps_counts_snps_Mutect2$n
intersect_genes_snps_counts_snps_Mutect2$n <- NULL 

intersect_genes_counts_per_SNP_method_df <- merge(intersect_genes_systemReview_snps_counts, intersect_genes_snps_counts_snps_Mutect2, by = "name" )


# uniqueify
snps_sysReview  <- unique(SystematicReview$Gene) 
snps  <- unique(cohort_maf$Hugo_Symbol) 
  
# drop NAs
snps  <- snps[!is.na(snps)]
snps_sysReview <- snps_sysReview[!is.na(snps_sysReview)]

# https://www.rdocumentation.org/packages/VennDiagram/versions/1.6.20/topics/venn.diagram
vennPlot <- VennDiagram::draw.triple.venn(euler.d = TRUE, scaled = TRUE,
                                          area1 = length(snps), 
                                          area2 = length(snps_sysReview),
                                          area3 =  length(meths),
                                          n12 = length(intersect(snps, snps_sysReview)),
                                          n23 = length(intersect(snps_sysReview, meths)),
                                          n13 = length(intersect(snps, meths)), 
                                          n123 = length(intersect(meths, intersect(snps, snps_sysReview))),
                                          category = c("SNPsMutect2", "SNPsLiterature", "MethylCites"),
                                      fill = c("#2E008B", "#4CCCF2", "#F799D1"),
                                      label.col = c("#F50094", "#F50094", "#F50094", 
                                                    "#F50094", "#F50094", "#F50094",  "#F50094") ,
                                      cex = c(1.4, 1.9, 1.4, 
                                              1.4, 1.9, 1.4, 1.4), 
                                      alpha = c(0.95, 0.65,  0.65), 
                                      cat.dist	= c(0.05, 0.05, 0.05),
                                      cat.cex = c(1, 1,1),
                                      cat.col = c("#2E008B", "#4CCCF2", "#F799D1"),
                                      cat.fontface = c(2,2,2),
                                      cat.fontfamily	= c("sans", "sans", "sans"),
                                      fontfamily = c("sans","sans","sans", "sans","sans","sans", "sans"),
                                      fontface = c(2,2,2,2,2,2,2),
                                      lty = c(1,1,1), 
                                      margin = c(0.02, 0.02, 0.02),
                                      lwd	= c(0, 0, 0),
                                      filename = NULL); grid.newpage(); grid.draw(vennPlot) 
      

grobbed_plot <- grobTree(vennPlot)
is.grob(grobTree(vennPlot))

ggtitle_custom = "Overlap between genes where cites reside \nfound from Systematic Review, Somatic Variant Calling and Differential Methylation"
#ggsubtitle_custom = "Indepedent of number of hits per gene"
ggcaption_custom = "(N = 25 CIN3 cases, 25 matched controls)"
ggtitle_custom_color = "#8A8A8A"
ggsubtitle_custom_color = "#A5A5A5"
ggsubtitle_custom_color = "#A5A5A5"

ggplotify::as.ggplot(grobbed_plot) + 
  theme_gray(base_family = "sans") +
  xlab("")                         +
  ylab("")                         +
  
  # Setting annotation for title, subtitle, caption
  labs(title     = ggtitle_custom,
   #   subtitle   = ggsubtitle_custom,
      caption    = ggcaption_custom)   +


  # Controlling font face, font color and font size of labs. Also centering with hjust 
  theme(
      plot.title    = element_text(color = ggtitle_custom_color   , size = 16, face = "bold" , hjust = 0.5),
  #    plot.subtitle = element_text(color = ggsubtitle_custom_color, size = 12                , hjust = 0.9),
      plot.caption  = element_text(color = ggsubtitle_custom_color, size = 12, face = "italic"                       ) )  +  

  theme(
      legend.position="bottom") +
  
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) -> ggvennPlot


ggvennPlot

# Create a table plot
library(gridExtra)
# Set theme to allow for plotmath expressions
tt <- ttheme_default(colhead=list(fg_params = list(parse=TRUE)))
tbl <- tableGrob(head(as.data.frame(intersect_genes_counts_per_method_df)), theme=tt)
# Plot chart and table into one object
grid.arrange(ggvennPlot, tbl,
             nrow=1, ncol=2, respect = TRUE, padding = 2,
             as.table=TRUE)


# Save multiple objects
save(ggvennPlot,intersect_genes_counts_per_method_df,  file = paste0(here::here(), "/CIN3_meths_snps_genes.RData"))