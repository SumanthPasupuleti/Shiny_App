ui<-fluidPage(
  style = "background-color: darkgrey",
  
  # Application title
  titlePanel("My App (India Tourism Data)"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      style = "background-color:  #C0C0C0",
tags$h3("User Inputs"),
fileInput('file_input', 'Upload a data'),
selectInput('varx1', 'Select the X axis variable', choices = NULL), 
selectInput('vary1', 'Select the y axis variable', choices = NULL),
textInput('title1','Name the Graph'),
selectInput('Graph_type','Choose a graph type', choices = c("scatter","box","bar"))
),

# Show a plot of the generated distribution
mainPanel(
  tabsetPanel(
    tabPanel("DATA",
             tags$br(),
             dataTableOutput('Data')),
    tabPanel("GRAPH",
             plotlyOutput('Graph')),
  )
)
)
)




