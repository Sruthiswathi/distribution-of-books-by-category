# Load libraries
library(shiny)
library(plotly)

# Define UI
ui <- fluidPage(
  titlePanel("Pie Chart of Book Categories"),
  plotlyOutput("pieChart")
)

# Define server logic
server <- function(input, output) {
  # Load dataset
  filepath <- "C:/Users/HP/Documents/Book1.csv"
  books <- read.csv(filepath, stringsAsFactors = FALSE)
  
  # Calculate counts of books by category
  book_counts <- table(books$category)
  
  # Create pie chart
  output$pieChart <- renderPlotly({
    plot_ly(labels = names(book_counts), values = book_counts, type = 'pie') %>%
      layout(title = "Distribution of Books by Category")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
