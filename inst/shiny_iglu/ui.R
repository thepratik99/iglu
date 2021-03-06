#library(shiny)
#library(DT)

shinyUI(fluidPage(

  titlePanel("Shiny iglu"),

  tabsetPanel(
    tabPanel("Data", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(fileInput("datafile", "Choose a CSV File",
                                      multiple =  FALSE,
                                      accept = ".csv"),
                            textInput('id', 'Enter column name corresponding to subject ID', value = 'id'),
                            textInput('time', 'Enter column name corresponding to timestamp', value = 'time'),
                            textInput('gl', 'Enter column name corresponding to glucose values', value = 'gl')
               ),
               mainPanel(tableOutput("data"))
             )),
    tabPanel("Metrics", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(selectInput('metric', 'Choose Metric', choices = c(`Above Percent` = 'above_percent',
                                                                               `Active Percent` = 'active_percent',
                                                                               `ADRR` = 'adrr',
                                                                               `Below Percent` = 'below_percent',
                                                                               `CONGA` = 'conga',
                                                                               `CV` = 'cv_glu',
                                                                               `CV Subtypes` = 'cv_measures',
                                                                               `eA1C` = 'ea1c',
                                                                               `GMI` = 'gmi',
                                                                               `GRADE` = 'grade',
                                                                               `GRADE Euglycemia` = 'grade_eugly',
                                                                               `GRADE Hyperglycemia` = 'grade_hyper',
                                                                               `GRADE Hypoglycemia` = 'grade_hypo',
                                                                               `Glucose Variability Percentage` = 'gvp',
                                                                               `High Blood Glucose Index` = 'hbgi',
                                                                               `Hyperglycemia Index` = 'hyper_index',
                                                                               `Hypoglycemia Index` = 'hypo_index',
                                                                               `Index of Glycemic Control` = 'igc',
                                                                               `In Range Percent` = 'in_range_percent',
                                                                               `Interquartile Range` = 'iqr_glu',
                                                                               `J Index` = 'j_index',
                                                                               `Low Blood Glucose Index` = 'lbgi',
                                                                               `M-Value` = 'm_value',
                                                                               `MAD` = 'mad_glu',
                                                                               `MAGE` = 'mage',
                                                                               `Mean` = 'mean_glu',
                                                                               `Median` = 'median_glu',
                                                                               `MODD` = 'modd',
                                                                               `Quantiles` = 'quantile_glu',
                                                                               `Range` = 'range_glu',
                                                                               `Rate of Change (ROC)` = 'roc',
                                                                               `Standard Deviation` = 'sd_glu',
                                                                               `Standard Deviation Subtypes` = 'sd_measures',
                                                                               `Standard Deviation ROC` = 'sd_roc',
                                                                               `Summary Statistics` = 'summary_glu'
               )),
               uiOutput("select_parameter"),
               uiOutput("help_text")),
               mainPanel(DT::dataTableOutput("metric"))
             )),

    tabPanel("Plots", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 radioButtons("plottype",  "Plot Type",
                              choices = c(`Time Series` = 'tsplot',
                                          `Lasagna Plot (Multiple Subject)` = 'lasagnamulti',
                                          `Lasagna Plot (Single Subject)` = 'lasagnasingle',
                                          `Rate of Change (Time Series)` = 'plot_roc',
                                          `Rate of Change (Histogram)` = 'hist_roc'
               )),
               uiOutput("plot_lasagnatype"),
               uiOutput("plot_subjects"),
               uiOutput("plot_subjects_help_text"),
               uiOutput("plot_timelag"),
               uiOutput("plot_maxd"),
               uiOutput("plot_datatype"),
               uiOutput("plot_datatype_help_text"),
               #uiOutput("plot_tz"),
               #uiOutput("plot_tz_help_text"),
               uiOutput("plot_TR"),
               #uiOutput("plot_TR_help_text"),
               uiOutput("plot_midpoint"),
               uiOutput('plot_limits'),
               uiOutput('plot_colorbar_help_text')
               ),
               mainPanel(plotOutput("plot"))
             ))


  )


))
