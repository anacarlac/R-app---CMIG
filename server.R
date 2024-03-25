#SERVER
server <- function(input, output, session) {
  
  
  output$home1 <- renderValueBox({
    
    valueBox(
      "Brasil", "Global Gender Gap 2021",
      #icon = icon("thumbs-up", lib = "glyphicon"),
      #title = "Global Gender Gap",
      #value = tags$p(style = "font-size: 25px;", 92 , "th"),
      #fill = TRUE,
      color = "purple",
      icon = shiny::icon("chart-line")
      
    )
  })
  
  output$home2 <- renderValueBox({
    
    valueBox(
      "93rd", "Ranking Global Gender Gap ", 
      #title = "Global Gender Gap - Educação",
      #value = tags$p(style = "font-size: 25px;", 35 , "th"),
      #fill = TRUE,
      color = "purple",
      icon = shiny::icon("globe-americas")
      
    )
  })
  
  output$home3 <- renderInfoBox({
    
    infoBox(
      title = "Educação",
      value = tags$p(style = "font-size: 25px;", 37 , "th"),
      fill = FALSE,
      color = "purple",
      icon = shiny::icon("book-open")
      
    )
  })
  
  output$home4 <- renderInfoBox({
    
    infoBox(
      title = "Economia",
      value = tags$p(style = "font-size: 25px;", 89 , "th"),
      fill = FALSE,
      color = "purple",
      icon = shiny::icon("coins")
      
    )
  })
  
  output$home5 <- renderInfoBox({
    
    infoBox(
      title = "Saúde",
      value = tags$p(style = "font-size: 25px;", 1,"st"),
      fill = FALSE,
      color = "purple",
      icon = shiny::icon("heartbeat")
      
    )
  })
  
  output$home6 <- renderInfoBox({
    
    infoBox(
      title = "Política",
      value = tags$p(style = "font-size: 20px;", 108 , "th"),
      fill = FALSE,
      color = "purple",
      icon = shiny::icon("fist-raised")
      
    )
  })
  
  output$alfab_1 <- renderInfoBox({
    
    infoBox(
      title = "Brasil",
      value = tags$p(style = "font-size: 30px;", 93.4 , "%"),
      fill = TRUE,
      color = "purple",
      icon = shiny::icon("pencil-alt")
      
    )
  })
  
  output$alfab_2 <- renderInfoBox({
    
    infoBox(
      title = "Mulheres",
      value = tags$p(style = "font-size: 30px;", 93.7 , "%"),
      fill = TRUE,
      color = "purple",
      icon = shiny::icon("pencil-alt")
      
    )
  })
  
  output$alfab_3 <- renderInfoBox({
    
    infoBox(
      title = "Homens",
      value = tags$p(style = "font-size: 30px;", 93.1 , "%"),
      fill = TRUE,
      color = "purple",
      icon = shiny::icon("pencil-alt")
      
    )
  })
  
  output$plot_alfab <- renderPlot({

    #req(dt_educ())

    plot_educ <- dt_educ %>%
      ggplot(aes(x=raça, y=alfab)) +
      #geom_segment(aes(x=raça, xend=raça, y=-1, yend=alfab), color="grey") +
      geom_point(aes(color=sexo), shape = 16, alpha = 1.2, size=16) +
      geom_text(label = paste0(round(dt_educ$alfab,1), "%"), 
                color="white", size=4.5, fontface="bold", show.legend = NA) +
      scale_colour_manual(values = c("mediumorchid3", "mediumorchid4")) +
      theme_minimal() +
      coord_flip() +
      ggthemes::theme_wsj(color="gray",
                          base_size = 15) +
      facet_grid(faixa_etaria ~ sexo) +
      ylim(0,100) +
      #xlab("") +
      ylab("Porcentagens de pessoas alfabetizadas no Brasil") + 
      theme(legend.position="none")
    
    plot_educ

  })


output$grafico_area <- plotly::renderPlotly({
    
    plot_areas<- dt_educ_sup %>% 
      dplyr::select(area, sexo, yvar=input$areas_tipo) %>% 
      ggplot(aes(x=area, y=yvar)) +
      geom_segment(aes(x=area, xend=area, y=0, yend=yvar), color="grey") +
      geom_point(aes(color=sexo, text = paste0(yvar, " %")), alpha=0.7, size=1.8) +
      scale_colour_manual(values = c("darkorchid4", "darkorchid1")) +
      theme_minimal() +
      coord_flip() +
      theme(
        text = element_text(size=8),
        legend.position="none") +
      facet_wrap(.~ sexo)+
      xlab("") +
      ylab("Porcentagens de homens e mulheres em cada área") 
    
    ggplotly(plot_areas, tooltip=c("text"))
    
  })  
  
  
  output$horas_comb_tot <- renderInfoBox({
    
    # media_br <- dt_tempo %>% 
    #   dplyr::filter(raça=="total" & 
    #                   sexo == "total" & 
    #                   faixa_etaria =="geral")
    # 
    # media_br$horas_semanais_tot <- round(media_br$horas_semanais_tot,1)
    
    infoBox(
      title = "Brasil",
      value = tags$p(style = "font-size: 22px;", media_br$horas_semanais_tot, "horas"),
      fill = TRUE,
      color = "purple",
      icon = shiny::icon("clock")
      
    )
  })
  
  # media_homem <- dt_tempo %>% 
  #   dplyr::filter(raça=="geral" & 
  #                   sexo == "homem" & 
  #                   faixa_etaria =="geral")
  # 
  # media_homem$horas_semanais_tot <- round(media_homem$horas_semanais_tot,1)
  
  output$horas_comb_men <- renderInfoBox({
    infoBox(
      title = "Homens",
      value = tags$p(style = "font-size: 22px;", media_homem$horas_semanais_tot, "horas"),
      fill = TRUE,
      color = "purple",
      icon = shiny::icon("clock")
      
    )
  })
  
  # media_mulher <- dt_tempo %>% 
  #   dplyr::filter(raça=="geral" & 
  #                   sexo == "mulher" & 
  #                   faixa_etaria =="geral")
  # 
  # media_mulher$horas_semanais_tot <- round(media_mulher$horas_semanais_tot,1)
  
  output$horas_comb_wom <- renderInfoBox({
    infoBox(
      title = "Mulheres",
      value = tags$p(style = "font-size: 22px;", media_mulher$horas_semanais_tot," horas"),
      fill = TRUE,
      color = "purple",
      icon = shiny::icon("clock"),
      
    )
  })
  
  
  output$tempo_etario <- plotly::renderPlotly({
    
    plot1<-ggplot(dt_tempo_etario, aes(x=faixa_etaria, fill=Sexo, y=horas_semanais_dom, text = paste0(horas_semanais_dom, " horas"))) +
      geom_bar(position="dodge2", stat="identity") +
      xlab("Faixa etária (anos)") + ylab("Número médio de horas por semana") + # Set axis labels
      scale_fill_manual(values=c("lightgrey","plum3","plum4")) +
      ylim(0,25)+
      theme_wsj(color="gray") +
      theme(legend.title = element_blank(),
            legend.position="bottom")
    
    plotly::ggplotly(plot1, tooltip= c("Sexo", "text"))
    
  })
  
  output$rend <- plotly::renderPlotly({
    
    plot2<-dt_rend %>%
      ggplot(aes(x=ano, y=rendimento,group=sexo,
                 text = paste0(rendimento, " reais"))) +
      geom_point(aes(color = sexo))+
      geom_line(aes(color=sexo),size=1)+
      xlab("Anos") + ylab("Rendimento médio em reais") + # Set axis labels
      scale_colour_manual(values = c("darkorchid4", "darkorchid2")) +
      scale_x_continuous(breaks=seq(2012,2019,1))+
      scale_y_continuous(limits=c(0,3000),
                         breaks=seq(0,3000,500))+
      #ylim(0,3000)+
      theme_wsj(color="gray") +
      theme(legend.title = element_blank(),
            legend.position="bottom")
    
    ggplotly(plot2, tooltip= c("text"))
    
  })
  
  output$ocupacao <- renderPlot({
    
    ocup2 <- dt_ocup %>% 
      dplyr::filter(ocupacao == input$ocup)
    
    req(input$ocup)  
    
    ocup2 %>% 
      ggplot(aes(y=rendimento,x=sexo, fill=sexo)) +
      geom_bar(position="dodge2", stat="identity",fill="darkorchid4", alpha=.6, width=.4) +
      geom_text(aes(label=rendimento), vjust=-0.5) +
      xlab(" ") + ylab("Rendimento médio em reais") + # Set axis labels
      ylim(0,8000)+
      theme_wsj(color="gray") +
      theme(legend.title = element_blank(),
            legend.position="bottom")
    
  })
  
  
  output$anos_viol_plot <- plotly::renderPlotly({
   
    plot_hom_ano<-dt_hom_ano %>%
      ggplot(aes(x=ano, y=taxa, group=crime, 
                 text = paste0(taxa, " homicídios"))) +
      geom_point(aes(color=crime), size=3.5)+
      geom_line(aes(color=crime))+
      scale_colour_manual(values = c("darkorchid1", "darkorchid4")) +
      xlab("Anos") + 
      ylab("Taxa de homicídios a cada 100 mil habitantes") + # Set axis labels
      ylim(0,4)+
      theme_wsj(color="gray") +
      theme(legend.title = element_blank(),
            legend.position="bottom")
    
    ggplotly(plot_hom_ano, tooltip= c("text")) 
    
  })
  
  output$mapa_viol_plot <- leaflet::renderLeaflet({
    
    #montando um mapa MANUALMENTE
    # ajuste de labels para aparecer o número de casos sem notação científica e com negrito
    labels <- sprintf(
      "<strong>%s</strong><br/>%.01f homicídios a cada <br/> 100 mil habitantes", #%.número remove notação científica de número exponencial, 0 = zero casas decimais, 01 =1 casa decimal
      dt_viol_map$name_state, dt_viol_map$taxa
    ) %>% 
      lapply(htmltools::HTML)
    
    #RColorBrewer::display.brewer.all()
    
    # pal <- leaflet::colorNumeric("Purples", domain = range(dt_viol_map$taxa))
    # pal <- leaflet::colorBin("Purples", domain = seq(1,20, 5))
    bins <- seq(0,24,4)
    pal <- leaflet::colorBin("Reds", domain = dt_viol_map$taxa, bins=bins)
    pal(dt_viol_map$taxa)
    
    
    dt_viol_map %>% 
      leaflet() %>% 
      addTiles() %>% 
      addPolygons(
        layerId = ~name_state,
        fillColor = ~pal(taxa), #adiciona a paleta de cores criada em pal
        fillOpacity = 0.6, #ajusta a opacidade das cores
        color = "white", #muda a cor das linhas de contorno
        weight = 1.5, #ajusta a espessura da linha
        opacity = 3,
        dashArray = "3",
        highlight = highlightOptions(weight = 3, #ajusta detalhes quando passa o mouse em cima do município
                                     color = "#972534",         #"#81C5FF", 
                                     dashArray = "",
                                     fillOpacity = 0.7,
                                     bringToFront = TRUE),
        label = labels,
        labelOptions = labelOptions(style = list("font-weight" = "light", 
                                                 padding = "3px 8px"),
                                    textsize = "16px",
                                    direction = "auto"                              )
      ) %>% 
      addLegend("bottomright",  #adiciona legenda no mapa
                pal = pal, 
                values = ~taxa,
                title = "Taxa de homicídios a cada <br/> 100 mil habitantes",
                opacity=0.7)
    
  })
  
  output$casamento <- plotly::renderPlotly({
  
    
    dt_casamento$ano <- as.factor(dt_casamento$ano)
    
    dt_casamento$age <- fct_relevel(dt_casamento$age, "16 e 17 anos", after = 1)
    
    dt_casamento$sexo <- recode(dt_casamento$sexo,
                                'feminino' = 'Meninas',
                                'masculino' = 'Meninos'
                                )
    
    plot_casamento <- dt_casamento %>%
      #dplyr::filter(age == "Menos de 16 anos") %>% 
      ggplot(aes(x=ano, y=perc_mar, fill=sexo, 
                 text = paste0(perc_mar, " %"))) +
      geom_bar(position="dodge2", stat="identity")+
      #geom_point(aes(color=sexo))+
      #geom_line(aes(color=sexo))+
      #scale_fill_brewer(palette = "Purples") +
      scale_fill_manual(values = c("plum", "plum4")) +
      xlab(" ") + 
      ylab("% ") + # Set axis labels
      facet_wrap(.~ age,
                 scales = "free_y",
                 nrow=2)+
      #ylim(0,5)+
      theme_wsj(color="gray", base_size=10) +
      theme(legend.title = element_blank(),
            legend.position="bottom")
    
    ggplotly(plot_casamento, tooltip= c("text"))
    
    
  })
  
  # output$waffle_obs <- renderPlot({
  #   
  #   chart_obs<- waffle(
  #     c('Sim = 25%' = 25, 'Não = 75%' = 75),
  #     use_glyph = "venus", 
  #     glyph_size = 9,
  #     rows = 5, 
  #     colors = c("plum", "plum4"),
  #     title = "1 a cada 4 mulheres sofreu algum tipo de violência durante o parto",
  #     legend_pos="right") +
  #     theme(legend.key.size = unit(4, 'mm'), #change legend key size
  #           rect=element_rect(fill='#f0f0f0',
  #                             color='#f0f0f0'),
  #           plot.background=element_rect(fill='#f0f0f0'),
  #           strip.background = element_rect(colour=NA, fill=NA),
  #           #legend.background=element_rect(fill='red'),
  #           #legend.box.background=element_rect(fill='blue'),
  #           panel.background=element_rect(fill='#f0f0f0', color='#f0f0f0'))
  #   
  #   chart_obs$layers[[1]]$aes_params$colour <- '#f0f0f0'
  #   
  #   chart_obs
  #   
  #   
  #   
  # },
  # bg="transparent")
  
  output$viol_obs <- plotly::renderPlotly({
    
    plot_violobs <- dt_violobs %>% 
      dplyr::filter(sim_nao == "Sim") %>% 
      arrange(desc(porcentagem)) %>% 
      ggplot(aes(x = reorder(violencia, -porcentagem), 
                 y=porcentagem,
                 text = paste0(porcentagem, "%"))) +
      geom_bar(position="dodge2", 
               stat="identity", 
               fill="plum",
               show.legend=FALSE) +
      xlab(" ") + ylab(" ") + # Set axis labels
      ylim(0,25)+
      theme_minimal() +
      coord_flip()+
      theme(legend.title = element_blank())
      
    
    ggplotly(plot_violobs, tooltip= c("text"))
    
  })
    
}

