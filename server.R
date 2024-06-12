shinyServer(function(input, output, session) {
  
  data_set1 <- reactive({
    req(input$file_input)
    
    ext <- tools::file_ext(input$file_input$name)
    switch(ext,
           csv = vroom::vroom(input$file_input$datapath, delim = ","),
           tsv = vroom::vroom(input$file_input$datapath, delim = "\t"),
           xlsx = read_excel(input$file_input$datapath),
           validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  
  # Code for choice for x & y 
  observeEvent(input$file_input , {
    updateSelectInput(session ,
                      'varx1',
                      choices = names(data_set1()))
    updateSelectInput(session ,
                      'vary1',
                      choices = names(data_set1()))
  })
  
  # Code for output in Table & Graph  
  output$Data <- renderDataTable({data_set1()})
  output$Graph <-renderPlotly({
    plot_ly(
      data_set1(),
      x = ~get(input$varx1),
      y = ~get(input$vary1),
      type = input$Graph_type) %>% 
      layout(
        title = input$title1,
        xaxis = list(title = input$varx1),
        yaxis = list(title = input$vary1))
  })
  
})







