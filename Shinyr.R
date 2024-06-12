

ui <- fluidPage(
  tags$h2(""),
  setBackgroundColor(
    color = c("#F7FBFF", "#2171B5"),
    gradient = "radial",
    direction = c("top", "left")
  ),
    titlePanel('My App'),
 
  
  
  sidebarLayout(
    sidebarPanel(
      fileInput('file_input','Upload a data'),
      selectInput(inputId = "X", 
                  label = "Select the x-axis Variable",
                  choices = c("mpg", "hp", "wt")
                  ), 
      selectInput(inputId = "y", 
                  label = "Select the y-axis Variable",
                  choices = names(mtcars)
      ), 
      textInput('title','Input Your Title')
      
                  
    ),
      
      mainPanel(
        tabsetPanel(
          type = 'tabs',
          tabPanel('Table'),
          tabPanel('Plot')
        )
      )
      
      
      
    )
  )
  



