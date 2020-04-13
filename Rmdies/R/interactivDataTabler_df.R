# Creates interactive datatable

# EDIT: Found how to add save buttons (cc: augmented dom var)
# Check here: https://stackoverflow.com/questions/33432174/how-to-set-multiple-option-list-and-extensions-in-dtdatatable/35200721#35200721


interactivDataTabler_df <- function(df                    = df,
                                    nDigits_after_decimal = 2,
                                    table_caption = ""  ){ # absolut path to file
  
  
  # > READING FILE INTO DF; DF TRANSFORMATIONS:
  # Read file
  
  # > Customise interactive DT::datatable
  DT::datatable(df, 
                filter     = "bottom",
                caption    = table_caption,
                extensions = list("ColReorder"   = NULL,
                                  "Buttons"      = NULL,
                                  "FixedColumns" = list(leftColumns=1)),
                
                # OPTIONS:
                options = list(
                  
                  # Does not allow columnful dataframes go rogue and tucks them in to fit page width
                  scrollX = TRUE,
                  scrollCollapse = TRUE, 

                  # Defines all capabilities
                  dom        = 'BRrltpi', 
                  
                  autoWidth  = TRUE,
                  ColReorder = TRUE,
                  
                  lengthMenu = list(c(10, 50, -1), c('10', '50', 'All')),
                  
                  buttons    = list('copy','print', list(extend  = 'collection',
                                                         buttons = c('csv', 'excel', 'pdf'),
                                                         text    = 'Download'),
                                    I('colvis')),
                  
                  # Black header container for colnames
                  initComplete = JS(
                    "function(settings, json) {",
                    "$(this.api().table().header()).css({
                      'background-color': '#00cd9a',
                      'color': '#000000',
                      'font-family': 'verdana',
                      'background-image': 'url(http://texturetaddka.com/wp-content/uploads/2011/09/DSC871.jpg)',
                      'background-size': 'cover'
                    });",
                    "}"),
                  # '#ff8243' Mango Tango
                  columnDefs = list(list(targets = length(colnames(df)), visible = TRUE)))) %>% 
    
    
    
    
    
    # Change fontsize of cell values
    formatStyle(columns    = c(1:length(colnames(df))), 
                fontSize   = "85%",
                fontFamily = "Verdana")%>%
    
    
    # Round values to 4 decimals
    formatRound(colnames(df), nDigits_after_decimal)  -> fancyDatatable
  
  
  return(fancyDatatable)  
}

