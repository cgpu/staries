grobbed_plot <- grobTree(base_plot)
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

