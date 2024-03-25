
#UI
ui <- dashboardPage(
  #skin = "black",
  dashboardHeader(title = "CMIG 2021"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "sobre"),
      menuItem("Educação", tabName = "educ"),
      menuItem("Áreas de estudo", tabName = "areas"),
      menuItem("Atividades diárias", tabName = "tempo"),
      menuItem("Renda mensal", tabName = "salario"),
      menuItem("A violência", tabName = "viol_geral",
               menuSubItem("Conceitos importantes", tabName = "viol_concept"),
               menuSubItem("Violência obstétrica", tabName = "viol_obs"),
               menuSubItem("Violência contra meninas", tabName = "viol_meninas"),               
               menuSubItem("Violência contra mulheres", tabName = "viol_mulheres"),
               menuSubItem("Mapa da Violência", tabName="mapa_viol")
               ),
      menuItem("Para além dos números", tabName = "frases"),
      menuItem("Para o futuro", tabName="limit"),
      menuItem("Ranking Desigualdade de Gênero", tabName="mapa_gap"),
      menuItem("Sugestões de leituras", tabName = "leitura"),
      menuItem("Sobre nós", tabName = "contact")
      
    )
  ),
  dashboardBody(
    
    ### changing theme
    shinyDashboardThemes(
      theme = "grey_light"
    ),
    
    tabItems(
      tabItem(
        tabName="sobre",
        h1("Direitos humanos e gênero no Brasil"),
        h3("Interpretando a realidade da desigualdade de gênero"),
        br(),
        fluidRow(
          column(
            width = 6,
        p(style="text-align: justify;",
        "De acordo com o Relatório Global Gender Gap 2021, e considerando o ritmo atual, a igualdade entre 
        gêneros deve ser globalmente alcançada em 136,5 anos. O Brasil
        se encontra na 93ª posição do ranking global de igualdade entre os gêneros e 22º posição entre os países da América Latina.
        E, apesar das melhorias substanciais nas áreas de saúde e educação,
        nas dimensões profissional e política, a desigualdade de gênero persiste."),
        p(style="text-align: justify;",
        "Como forma de acompanhar indicadores similares no Brasil, foi criado o Conjunto Mínimo de Indicadores de Gênero (CMIG) 
        em 2018. Esses indicadores foram criados a partir de dados do IBGE e retratam a realidade brasileira em cinco domínios: 
        Estruturas econômicas, participação em atividades produtivas e acesso a recursos; Educação; Saúde e serviços relacionados; 
        Vida pública e tomada de decisão; e Direitos humanos das mulheres e meninas. Atualmente, o CMIG está em sua segunda edição, 
        e os resultados apresentados se referem ao ano de 2019."),
        #br(),
        p(style="text-align: justify;",
        "Neste dashboard, você encontrará um recorte dos indicadores provenientes destes relatórios citados. Estas informações serão 
        apresentadas através de gráfico e tabelas interativas provenientes de análises descritivas dos dados. Além disso, a aba Ranking de 
        Desigualdade de Gênero apresenta informações sobre o Global Gender Gap 2020 e a aba Leituras 
        contém indicações de livros e artigos sobre o assunto "),
        #br(),
        #h4("Contato"),
        #h5("Ana Carla Crispim | Arielle Sagrillo Scarpati"),

        br(),
        p("Fonte: ",
          a("IBGE", 
            href = "https://www.ibge.gov.br/estatisticas/multidominio/genero/20163-estatisticas-de-genero-indicadores-sociais-das-mulheres-no-brasil.html?=&t=o-que-e")),
        p("Fonte: ",
          a("World Economic Forum", 
            href = "https://www.weforum.org/reports/gender-gap-2020-report-100-years-pay-equality#trends"))
        ),
        
        column(
          6,
          valueBoxOutput(
            outputId = "home1",
            width = 5 * 2
          )),
        column(
          6,
          valueBoxOutput(
            outputId = "home2",
            width = 5 * 2
          ),
          infoBoxOutput(
            outputId = "home3",
            width = 5
          ),
          infoBoxOutput(
            outputId = "home4",
            width = 5
          ),
          infoBoxOutput(
            outputId = "home5",
            width = 5
          ),
          br(),
          infoBoxOutput(
            outputId = "home6",
            width = 5
          )
        )
        
      )
      ),
      
      tabItem(
        tabName= "educ",
        h1("Níveis de alfabetização no Brasil"),
        h3("Taxas de alfabetização entre homens e mulheres"),
        br(),
        infoBoxOutput(
          outputId = "alfab_1",
          width = 3
        ),
        infoBoxOutput(
          outputId = "alfab_2",
          width = 3
        ),
        infoBoxOutput(
          outputId = "alfab_3",
          width = 3
        ),
        br(),
        br(),
        
        fluidRow(
          column(
            width = 9,
            h3("O que isso significa?"),
            p(style="text-align: justify;",
            "De acordo com o Gender Gap Report 2020, o Brasil está próximo de fechar o gender
              gap na área da Educação. De acordo com o CMIG (2021), gerações mais jovens apresentam taxas de alfabetização por volta de 
              90%. No entanto, pessoas com mais de 65 anos apresentam taxas menores, principalmente quando
              olhamos o recorte por raça e cor."), 
             p(style="text-align: justify;",
             "É importante notar que esses resultados refletem uma realidade pré-pandemia. 
             E apesar do acesso a educação estar em crescimento ao redor do mundo, estima-se que 1.57 bilhões de estudantes 
             ficaram fora das escolas em 2020 (ONU, 2020). O acesso a escola está relacionado ao desenvolvimento pessoal de cada um", 
             strong("– por meio do maior exercício da cidadania e a relação com resultados 
            de empregabilidade e rendimentos financeiros."),
             "E por isso, também se relaciona com o desenvolvimento do país como um todo (OECD, 2000)."),
          )
          
        ),
        h3("Taxas de alfabetização por faixa etária e raça/cor"),
        fluidRow(
          column(
            width = 9,
          ),
          column(
            width = 9,
            plotOutput("plot_alfab"),
            p("Fonte: IBGE")
          )
        )
        
        
      ),
      
      tabItem(
        tabName = "areas",
        h1("Planejando o futuro"),
        h3("Diferenças nas escolhas de carreiras entre homens e mulheres"),
        #br(),
        fluidRow(
          column(
            width = 9,
            height = 300,
            br(),
            p(style="text-align: justify;",
            "Em áreas STEM (Ciência, Tecnologia, Engenharia e Matemática), a porcentagem de mulheres matriculadas 
            e concluintes é substancialmente menor quando comparadas com homens. Na área de engenharia, 76% dos concluintes são homens. Na área de Computação e Tecnologia 
              da informação, 86% dos concluintes são homens.Na área de bem-estar, 90% dos concluintes são mulheres. Já na área da Saúde, 
              75% dos concluintes são mulheres."),
            p(style="text-align: justify;",
              "Áreas como Matemática ou Ciências ainda são percebidas como áreas masculinas de modo geral.
              Essa percepção impacta  nas aspirações de meninas e meninos com relação a qual carreira seguir, podendo
              atuar como uma barreira para determinadas minorias. Por exemplo, resultados de pesquisas sobre essa percepção reforçam que 
              crenças sobre esses estereótipos previnem mulheres de seguir carreiras STEM (Makarova, Aeschlimann & Herzog, 2019).
              No Brasil, esses resultados parecem se replicar também, principalmente em áreas de tecnologia e ciências exatas. 
              Os estereótipos também são reforçados em áreas como saúde e de cuidados, onde existem mais mulheres matriculadas do
              que homens. O que pode se relacionar a percepções de que mulheres exercem tais funções porque são 
              mais delicadas e ou porque tem mais habilidades para cuidar de outras pessoas.")
            )),
        
        fluidRow(
          column(
            width = 9,
            br(),
            selectInput(
              inputId = "areas_tipo",
              label = "Matriculados(as) ou Concluintes?",
              #selected = dt_ocup$ocupacao[[1]],
              choices = names(dt_educ_sup[,6:7])
            )),
          
            column(
              width = 9,
              plotly::plotlyOutput("grafico_area", height=500),
            )
        ),
      
      fluidRow(
        column(
          width=9,
          p("Fonte: IBGE")
        )
      
      )
      ),
      
      tabItem(
        tabName = "tempo",
        h1("O nosso tempo é gasto de forma igual?"),
        h3("Comparando o número médio de horas em atividades domésticas e de trabalho"),
        #h3("Número médio de horas semanais dispendidas em tarefas domésticas e no trabalho"),
        br(),
        infoBoxOutput(
          outputId = "horas_comb_tot",
          width = 3
        ),
        infoBoxOutput(
          outputId = "horas_comb_men",
          width = 3
        ),
        infoBoxOutput(
          outputId = "horas_comb_wom",
          width = 3
        ),
        br(),
          fluidRow(
           column(
             width = 9,
           h3("O que isso significa?"),
           p(style="text-align: justify;",
           "Como um todo, mulheres apresentam um número médio de horas maior do que homens
           em atividades domésticas e de trabalho.Ao fazer um recorte sobre atividades domésticas, mulheres 
           dispendem quase 2 vezes mais tempo em atividades domésticas do que homens.
           Isso não é um fato isolado no Brasil. De acordo com a International Labour Organization (2016),
           mulheres executam, no mínimo, duas vezes mais tarefas domésticas do que homens, tanto em
           países desenvolvidos quanto em países em desenvolvimento."), 
           # p(style="text-align: justify;",
           # "O resultado incorre em mulheres
           # apresentando jornadas de trabalho mais longas do que homens. Por exemplo, em países em desenvolvimento,
           # mulheres tendem a dispender", strong("9 horas e 20 minutos em tarefas de trabalho e domésticas, enquanto homens
           # tendem a dispender 8 horas e 7 minutos"), "(International Labour Organization, 2016)."),
           p(style="text-align: justify;",
           "No cenário de pandemia, essa realidade tende a piorar. Isso porque, apesar de homens e mulheres
           estarem trabalhando em casa, isso não se reflete necessariamente no investimento do tempo de homens
           em tarefas domésticas ou na divisão igualitária de tarefas entre os parceiros. Especialmente no caso 
           de famílias com filhos ou para mulheres negras. Ou seja, a maioria das atividades
           ainda recai mais sobre mulheres e meninas (ONU, 2020).")
        )),
        
      br(),
      h4("Número médio de horas dispendidas em tarefas domésticas por faixa etária"),
      fluidRow(
        column(
          width = 4,
        ),
        column(
          width = 9,
          plotly::plotlyOutput("tempo_etario"),
          p("Fonte: IBGE")
        )
      )
        
      ),
      
      tabItem(
        tabName= "salario",
        h1("A desigualdade de gênero nos salários"),
        h3("Analisando os rendimentos de homens e mulheres ao longo dos anos"),
        br(),
        
        fluidRow(
          column(
            width = 9,
         p(style="text-align: justify;",
         " De forma geral, o rendimento médio dos homens é maior do que o rendimento médio das mulheres, sendo 
           que essa diferença pode ser vista em diferentes ocupações. Esse resultado não é exclusivo do Brasil. 
           Em pesquisa recente ao redor do mundo, foi visto que",
           strong("mulheres ganham $0.77 para cada $1 que homens ganham"),"(International Labour Organization, 2016)."),
          )
        ),
      
        fluidRow(
          column(
            width = 9,
            #footer = "Fonte: IBGE",
            plotly::plotlyOutput("rend", height=250),
            p("Fonte: IBGE")
          ),
          
          column(
          width = 9,
          p(style="text-align: justify;",
          "O motivo dessa diferença é multifacetado e complexo. Apesar de haver diferenças
           de salários para homens e mulheres com a mesma ocupação, a diferença de rendimentos como um todo 
           também se relaciona a variáveis como horas trabalhadas e responsabilidades da vida pessoal.
           Por exemplo, enquanto mulheres que têm filhos tem um apresentam um gap maior em comparação com mulheres sem filhos
           (motherhood wage gap), homens que têm filhos tendem a ganhar mais do que seus pares sem filhos. Essa diferença de rendimentos
           entre homens com e sem filhos é referida como fatherhood wage premium (International Labour Organization, 2016) ")
          )
        ),
        
        h3("Analisando os rendimentos de homens e mulheres por ocupação"),
        br(),
        fluidRow(
          shinydashboard::box(
          width = 9,
          #title = "Ocupações",
          solidHeader = TRUE,
          #status="danger",
          collapsible = TRUE,
          
            column(
              width = 9,
              selectInput(
                inputId = "ocup",
                label = "Selecione uma ocupação",
                #selected = dt_ocup$ocupacao[[1]],
                choices = dt_ocup$ocupacao))),
            
          shinydashboard::box(
              width = 9,
              footer = "Fonte: IBGE",
              plotOutput("ocupacao", height=300))
         ) 
        
        ),
      
      tabItem(
        tabName = "viol_concept",
        h1("O que é violência?"),
        h3("Tipos de violências contra meninas e mulheres"),
        
        fluidRow(
          column(
            width = 9,
        p(style="text-align:justify;",
          "Tendo como base o exposto, trataremos aqui da violência cometida contra mulheres, que se configura como qualquer ação ou 
              conduta, baseada no gênero, que cause morte, dano ou sofrimento físico, sexual ou psicológico à mulher, tanto no âmbito 
              público como no privado (Convenção Interamericana para Prevenir, Punir e Erradicar a Violência Contra a Mulher, adotada 
              pela OEA em 1994). Dentre elas, a violência:  "),
        p(style="text-align:justify;",
          strong("Doméstica: "), "violência sofrida no ambiente doméstico, ou em uma relação de familiaridade, 
          afetividade ou coabitação."),
        p(style="text-align:justify;",
          strong("Familiar: "), "violência que acontece dentro da família, ou seja, nas relações entre os membros da comunidade 
          familiar, formada por vínculos de parentesco natural (pai, mãe, filha etc.) ou civil (marido, sogra, padrasto ou 
          outros), por afinidade (por exemplo, o primo ou tio do marido) ou afetividade (amigo ou amiga que more na mesma casa)."),
        p(style="text-align:justify;",
          strong("Física: "), "qualquer conduta praticada com uso de força física – com ou sem o uso de armas – que ofenda 
          integridade ou saúde corporal da mulher. Exemplos: bater, chutar, queimar, cortar, empurrar, apertar e/ou mutilar."),
        p(style="text-align:justify;",
          strong("Psicológica: "), "qualquer conduta que cause alguma forma de dano emocional e/ou diminuição da autoestima da 
          vítima. Por exemplo, humilhações, xingamentos, isolamento através da proibição do trabalho, estudo ou lazer."),
        p(style="text-align:justify;",
          strong("Sexual: "), "qualquer conduta que constranja a mulher a presenciar, a manter ou a participar de relação sexual 
          não consentida ou ainda, qualquer ação que atinja a integridade sexual feminina. São exemplos: assédio sexual, 
          prostituição ou tráfico sexual, aborto imposto, uso – ou não uso – de anticoncepcionais contra a sua vontade ou mediante 
          assédio, intimidação, ameaça, coação ou uso da força."),
        p(style="text-align:justify;",
          strong("Patrimonial: "), "qualquer conduta que configure retenção, subtração, destruição parcial ou total de objetos 
          pessoais e/ou pertencentes da vítima, tais quais seus instrumentos de trabalho, documentos pessoais, bens, valores e 
          direitos ou recursos econômicos."),
        p(style="text-align:justify;",
          strong("Moral: "), "qualquer conduta que importe em calúnia, difamação ou injúria. Ofendendo, portanto, a dignidade da 
          vítima. Exemplos: dar opinião contra a reputação moral, críticas mentirosas e xingamentos."),
        p(style="text-align:justify;",
          strong("Feminicídio: "), "assassinatos de mulheres cometidos em razão do gênero. Ou seja, quando a vítima é morta por 
          ser mulher. No Brasil, a Lei do Feminicídio entrou em vigor no ano de 2015 e estabelece que, quando o homicídio é 
          cometido contra uma mulher, a pena é maior."),
        p(style="text-align:justify;",
          strong("Tráfico humano: "), "uso de poder e controle para forçar, fraudar ou coagir alguém a se envolver em trabalho ou 
          serviços, incluindo sexo comercial. Os traficantes usam táticas que incluem violência, manipulação emocional e ameaças 
          psicológicas, explorando a desigualdade social e econômica em benefício próprio. "),
        p(style="text-align:justify;",
          strong("Stalking ou perseguição: "), "padrão de comportamento de assédio ou conduta dirigida a uma pessoa específica que 
          poderia colocá-la com medo razoável. Os comportamentos de perseguição incluem, mas não estão limitados ao monitoramento 
          das atividades da vítima, perseguição, envio de presentes e bilhetes indesejados ou ligações repetidas (para a vítima ou 
          pessoas próximas)."),
          )
        )
      ),
      
      tabItem(
        tabName = "mapa_viol",
        h1("A violência contra mulheres"),
        h3("Taxa de homicídios de mulheres em cada estado"),
        br(),
        
        fluidRow(
          column(
            width = 5,
            br(),
            p(style="text-align:justify;",
              "• O Brasil está no 5º lugar no ranking mundial do feminicídio, segundo a Organização Mundial da Saúde)"
              ),
            p(style="text-align:justify;",
              "• O Brasil está no 5º lugar dos países que mais matam mulheres no mundo no contexto de violência doméstica, 
              segundo a Organização Mundial da Saúde)"
            ),
            p(style="text-align:justify;",
              "• Em 2018, 1.206 mulheres tiveram suas mortes registradas como feminicídio. Nove em cada dez casos, 
              a mulher foi morta por um companheiro ou ex-companheiro (Fórum Brasileiro de Segurança Pública)"
            ),
            p(style="text-align:justify;",
              "• Em 2018, foram registrados 263.067 de lesão corporal dolosa dentro da Lei Maria da Penha. Isso significa que, a 
              cada dois minutos, uma mulher apanhou do marido, namorado ou ex-companheiro (Fórum Brasileiro de Segurança Pública)"
            ),
            p(style="text-align:justify;",
              "• Em 2017, 34.348 mulheres foram ameaçadas. No ano seguinte, esse número subiu para 37.423. Vítimas de constrangimento 
              ilegal passaram de 393 em 2017 para 404 em 2018 (Dossiê Mulher 2019)"
            ),
            p(style="text-align:justify;",
              "• No Brasil, uma mulher trans é assassinada a cada três dias. Apenas em 2019, 124 foram vítimas (Associação Nacional de 
              Travestis e Transexuais)"
            ),

          ),
          shinydashboard::box(
            width = 7,
            footer = "Fonte: Instituto de Pesquisa Econômica Aplicada - 2020",
            leafletOutput("mapa_viol_plot")
          ),
      )
      ),
        
      
      tabItem(
        tabName="viol_mulheres",
        h1("A violência contra mulheres"),
        h3("Um retrato da violência dentro e fora das residências"),
        
        fluidRow(
          column(
            width = 9,
            br(),
            p(style="text-align:justify;",
              "Por violência de gênero se caracteriza pela incidência de atos violentos em razão do gênero das pessoas envolvidas. 
              Isso significa que, ao menos teoricamente, homens e mulheres podem ser vitimizados. Na prática, no entanto, a referida 
              expressão tornou-se quase um sinônimo de violência contra mulheres. Afinal, são elas que, historicamente, configuram-se 
              como o grupo mais afetado por diferentes formas de violação."
              ),
            br(),
            p(style="text-align:justify;",
            strong("Feminicídio:"), " entende-se como assassinatos de mulheres cometidos em razão do gênero. Ou seja, quando a vítima é morta por ser mulher. 
            No Brasil, a Lei do Feminicídio entrou em vigor no ano de 2015 e estabelece que, quando o homicídio é cometido contra 
            uma mulher, a pena é maior. Apesar da lei existir, o monitoramento de feminicídios é complexo e ainda não é feito
            de forma adequada. Mais recentemente tem se tentado identificar esse fenomeno por meio da taxa de homicídios dentro do espaço 
            doméstico, o que poderia sugerir uma relação entre o autor e a vítima do crime (IPEA, 2020).
            "
            ),
            h3("A taxa de homicídios de mulheres ao longo dos anos"),
            h4("Taxa de homicídios a cada 100 mil habitantes")
            
          ),
          br(),
          column(
            width = 9,
            plotly::plotlyOutput("anos_viol_plot"),
            p("Fonte: Instituto de Pesquisa Econômica Aplicada - 2020")
          ),
          ),
        ),
      
      tabItem(
        tabName="viol_meninas",
        h1("O casamento infantil no Brasil"),
        h3("Taxas de casamento na infância e adolescência"),
        br(),
        
        fluidRow(
          column(
            width = 6,
            plotly::plotlyOutput("casamento", height=500),
            p("Fonte: IBGE")
          ),
          column(
            width = 5,
            br(),
            p(style="text-align: justify;",
            "Antes de qualquer dado, é preciso que se esclareçam, aqui, alguns termos. Entende-se por casamento infantil, 
            prematuro e/ou forçado, aquelas uniões: a) ocorridas antes dos 18 anos de idade (i.e., por isso, infantil); b) 
            envolvendo meninas e adolescentes em fase de desenvolvimento (i.e., por isso, prematuro ou precoce); e que, por isso, 
            c) ressaltam o caráter de não-escolha desse grupo, frente às desigualdades estruturais de gênero, e por isso, forçado. 
            "
            ),
            p(style="text-align:justify;",
              "É preciso que se compreenda, ainda, que estes casamentos e uniões são concretizados, em sua grande maioria, com homens 
              mais velhos (maiores de idade). Não sendo rara a ocorrência de outras formas de violação subsequentes à concretização do 
              matrimonio. De modo geral, sabe-se que, em números absolutos, ",
              strong("o Brasil ocupa a quarta posição no ranking internacional de 
              uniões de meninas"), 
              " e está entre os cinco países da América Latina e Caribe com maior incidência de casos."
            ),
            p(style="text-align:justify;",
              "Tendo como base o exposto, apresentamos alguns dos – poucos – dados disponíveis, na expectativa de evidenciar esta 
              problemática, chamar atenção para a necessidade de responsabilizar os envolvidos e, mais ainda, construir soluções de 
              prevenção e cuidado."
            ),
            p(style="text-align:justify;",
              "Fonte: Plan International (2019)"
            ),
            
          ),
        
      )
      ),
      
      tabItem(
        tabName = "viol_obs",
        h1("A violência obstétrica no Brasil"),
        br(),
        
        fluidRow(
        column(
          width = 9,
        p(style="text-align: justify;",
          "Entende-se por violência obstétrica qualquer conduta, ação ou omissão,
          realizada por profissional de saúde, seja na esfera pública ou privada,
          que afete - direta ou indiretamente - o corpo e os processos reprodutivos
          das mulheres. Seja através de tratamento desumanizado, abuso de medicalização 
          e/ou patologização de processos naturais e que tragam, como efeito, a perda 
          autonomia e protagonismo femininos antes, durante ou após o parto (Parto do Princípio, 2012)."))),

        fluidRow(
          column(
            width = 9,
            #plotOutput("waffle_obs", 
            img(src = "graficowaffle.png", height = 220, width = 800)
        )
        ),
        
        h3("Violências durante o parto"),
        fluidRow(
          column(
            width = 9,
            br(),
            p(style="text-align: justify;",
              strong("Físico:"),
              "refere-se a qualquer ação sem justificativa ou recomendação baseada em evidências científicas que 
              incida sobre o corpo da gestante de modo a causar dor ou dano físico. Exemplos: privação de alimentos, 
              interdição à movimentação da mulher, cesariana eletiva sem indicação clínica ou não utilização de analgesia."
              ),
            p(style="text-align: justify;",
              strong("Psicológico:"),
              "refere-se a toda ação verbal ou comportamental que cause na gestante sentimentos ou emoções negativas. Tais quais 
              os sentimentos de inferioridade, vulnerabilidade, medo, insegurança. São exemplos de tal forma de violência as ameaças,
              piadas, humilhações, chantagens, ofensas, omissão de informações, ou desconsideração de seus padrões culturais. "
              ),
            p(style="text-align: justify;",
              strong("Sexual:"),
              "refere-se a toda ação imposta à gestante que viole seu senso de integridade sexual e reprodutiva e que não envolva seu 
              pleno esclarecimento e consentimento. Por exemplos: episiotomia, assédio, exames de toque invasivos, constantes ou 
              agressivos, lavagem intestinal, cesariana sem consentimento informado, exames íntimos repetitivos. "
              ),
            p(style="text-align: justify;",
              strong("Institucional:"),
              "quaisquer ações ou serviços, de natureza pública ou privada, que dificultem, retardem ou impeçam o acesso da gestante 
              aos seus direitos constituídos. São exemplos de tal violação, o impedimento do acesso aos serviços de atendimento à 
              saúde, impedimento à amamentação, omissão ou violação dos direitos da mulher durante seu período de gestação, parto e 
              puerpério ou a vigência de protocolos institucionais que impeçam ou contrariem as normas legislativas vigentes."
            ),
          ),
        ),
        
        h3("Tipos de violências obstétricas sofridas em hospitais"),
        h4("Porcentagem de relatos de mulheres que sofreram violência obstétrica"),
        fluidRow(
        column(
          width = 9,
          plotly::plotlyOutput("viol_obs", height=300),
          p("Fonte: Fundação Perseu Abramo, 2010")
        )
        ),
        fluidRow(
          column(
            width = 9,
        p(style="text-align: justify;",
          "Essas violações, entretanto, muitas vezes se dão de modo velado, silencioso, ou 
              ainda, naturalizado. Fazendo com que suas vítimas não procurem ajuda ou falem a 
              respeito. Por isso, é preciso quebrar os tabus e jogar luz sobre tais práticas. 
              Seja através da reflexão pessoal, seja pelo contato com terceiros. Afinal, somente 
              desta maneira tornar-se-á possível o reconhecimento de que estas não são práticas 
              isoladas ou infrequentes. Contrariamente, pesquisas sobre tal fenômeno indicam a 
              recorrência de agressões diversas durante a gestação, em consultas pré-natais, no parto 
              ou mesmo puerpério."),
          ))
      
      ),
      
      tabItem(
        tabName ="frases",
        h1("Quem são essas mulheres?"),
        h2("Um espaço para as vozes por trás dos números"),
        br(),
        
        fluidRow(
          column(
            width = 9,
        p(style="text-align: justify;",
        "'Haben, a waitress in Mekelle (Ethiopia), was raped with two other women at the cafe where
          they work in December, she said. Her body is still covered in bruises from the assault.",
          strong("They told us not to resist,"), "she recalled.", strong("Lie down. Don't shout."),
          "But even if they shouted, she added:", strong("there was nobody to listen.'")),
        p(em("Artigo do New York Times sobre violência sexual na guerra da Etiópia, 2021.")),
        br(),
        p(style="text-align: justify;",
          strong("Não sou livre"), " enquanto outra mulher for prisioneira, mesmo que as correntes
          dela sejam diferentes das minhas"),
        p(em("Audre Lorde")),
        br(),
        p(style="text-align: justify;",
          "'A violência é uma maneira de silenciar as pessoas, de negar-lhes a voz e a credibilidade, de afirmar que",
          strong("o direito de alguém de controlar vale mais do que o direito delas de existir", " de viver.'")),
        p(em("Rebecca Solnit em Os homens explicam tudo para mim, 2017.")),
        br(),
        p(style="text-align: justify;",
          "'Na verdade eu não sei se tenho medo de passar em uma rua deserta
          e não ver ninguém, ou se eu tenho medo de achar alguém no meio do caminho,
          entendeu?'"),
        p(em("Relato no documentário Chega de Fiu Fiu - Think Olga, 2018.")),
        
      ))),
      
      tabItem(
        tabName="limit",
        h1("Próximos passos"),
        h3("O que podemos fazer?"),
        br(),
        
        fluidRow(
          column(
            width = 9,
        p(style="text-align: justify;",
          strong("Se informe:"),
          " O primeiro passo para entender como mudar uma situação, é buscar informações em fontes confiáveis e seguras. 
          No tópico “Sugestões de leituras” você encontrará artigos, livros e relatórios sobre a temática de gênero em diversos 
          contextos."),
        br(),
        p(style="text-align: justify;",
          strong("Converse sobre o assunto:"),
          " Compartilhe o que você aprendeu. Compartilhe suas dúvidas. Conversar é uma forma de amadurecer o seu entendimento 
          sobre o assunto e de aprender junto com outras pessoas."),
        br(),
        p(style="text-align: justify;",
          strong("Coloque em prática:"),
          " Pense na sua realidade e em como você pode fazer uso dessas informações. Adapte-as e dê sentido a 
          elas no seu dia-a-dia. Assim, essas informações podem te ajudar a construir uma realidade diferente."),
        br(),
        p(style="text-align: justify;",
          strong("Entenda as limitações:"),
          " Apesar da gravidade de situações de violência, por exemplo, o Brasil não tem índices de feminicídio ou de violência 
          obstétrica. Portanto, o conhecimento mostrado aqui partiu de uma leitura não-sistemática, porém aprofundada, sobre quais 
          índices se assemelham ou podem ser usados como proxies para acompanhar questões relacionadas a gênero no Brasil. Essa leitura 
          foi motivada pelos índices encontrados na CMIG. O que ressalta a importância da existência e do acompanhamento de tais 
          indicadores em território nacional."),
      ))),
      
      
      tabItem(
        tabName = "mapa_gap",
        h1("Ranking da Desigualdade Social no Mundo"),
        h2("Informações de acordo com World Economic Forum 2020"),
        p("Use as opções de Switch View para ver o ranking de desigualdade social com todos os países e para explorar os relatórios de cada país"),
        fluidRow(
          tags$iframe(
            src ="https://widgets.weforum.org/ggi-2019/index.html",
            height = "650",
            width = "100%",
            frameborder="0" 
          )
          
          
        )
      ),
      
      tabItem(
        tabName = "leitura",
        h1("Quer saber mais?"),
        h3("Artigos e Matérias"),
        p("1. Children Show a Gender Gap in Negotiation (2021). Psychological Science."),
        p("2. Knowing is half the battle: teaching stereotype threat as a means of improving women's math performance (2005). Psychological Science."),
        p("3. The Different Words We Use to Describe Male and Female Leaders (2018). Harvard Business Review."),
        p("4. The Gender Gap in STEM Fields: The Impact of the Gender Stereotype of Math and Science on Secondary Students' Career Aspirations (2019). Frontiers in Education."),
        p("5. O ciclo do assédio sexual no ambiente de trabalho. Think Eva e Linkedin.",
          a("Clique aqui", 
            href = "https://thinkeva.com.br/pesquisas/assedio-no-contexto-do-mundo-corporativo/")),
        br(),
        h3("Livros"),
        p("1. Invisible Women: Exposing Data Bias in a World Designed for Men por Caroline Criado-Perez"),
        p("2. Os homens explicam tudo para mim por Rebecca Solnit"),
        p("3. Eu sou Malala: A História da garota que defendeu a educação e foi baleada pelo Talibã por Malala Yousafzai"),
        p("4. Mulheres, raça e classe por Angela Davis"),
        p("5. O momento de voar por Melinda Gates"),
        br(),
        h3("Relatórios"),
        p("1. International Labour Organization - Women at work 2016",
          a("Clique aqui",
            href="http://www.ilo.org/wcmsp5/groups/public/---dgreports/---dcomm/---publ/documents/publication/wcms_457317.pdf")),
        p("2. IBGE - Estatística de Gênero: Indicadores sociais das mulheres no Brasil 2ª edição",
          a("Clique aqui",
            href= "https://biblioteca.ibge.gov.br/visualizacao/livros/liv101784_informativo.pdf")),
        p("3. World Economic Forum - Gender Gap Report 2021",
          a("Clique aqui", 
            href = "https://www.weforum.org/reports/global-gender-gap-report-2021")),
        p("4. United Nations - The Sustainable Development Goals Report 2020",
          a("Clique aqui", 
            href = "https://unstats.un.org/sdgs/report/2020/The-Sustainable-Development-Goals-Report-2020.pdf")),
        p("5. Organization for Economic Co-operation and Development (OECD)- Literacy in the Information Age",
          a("Clique aqui",
          href = "https://www.oecd.org/education/skills-beyond-school/41529765.pdf")),
        p("6. Instituto de Pesquisa Econômica Aplicada - Atlas da Violência 2020",
          a("Clique aqui",
            href = "https://www.ipea.gov.br/atlasviolencia/download/24/atlas-da-violencia-2020")),
        p("7. Fundação Perseu Abramo - Mulheres brasileiras e gênero nos espaços público e privado 2010",
          a("Clique aqui",
            href = "https://apublica.org/wp-content/uploads/2013/03/www.fpa_.org_.br_sites_default_files_pesquisaintegra.pdf")),
        p("8. Parto do Princípio – Mulheres em Rede pela Maternidade Ativa 2012",
          a("Clique aqui",
            href = "https://www.senado.gov.br/comissoes/documentos/SSCEPI/DOC%20VCM%20367.pdf")),
        p("9. Plan International – Tirando o véu: estudo sobre o casamento infantil no Brasil 2019",
          a("Clique aqui",
            href = "https://plan.org.br/https-plan-org-br-wp-content-uploads-2019-07-tirando-o-veu-estudo-casamento-infantil-no-brasil-plan-international-pdf/")),
        p("10. ANTRA – Assassinatos e violência contra travestis e transexuais no Brasil em 2018 (2019)",
          a("Clique aqui",
            href = "https://antrabrasil.files.wordpress.com/2019/01/dossie-dos-assassinatos-e-violencia-contra-pessoas-trans-em-2018.pdf")),
        p("11. ONU Mulheres – Diretrizes para atendimento em casos de violência de gênero contra meninas e mulheres em tempos da pandemia da COVID-19 (2020)",
          a("Clique aqui",
            href = "https://www.onumulheres.org.br/wp-content/uploads/2020/08/Diretrizes-para-atendimento_ONUMULHERES.pdf")),
        p("12. Dossiê Mulher (2019)",
          a("Clique aqui",
            href = "http://arquivos.proderj.rj.gov.br/isp_imagens/uploads/DossieMulher2019.pdf")),
        p("13. Fórum Brasileiro de Segurança Pública - Visível e invisível: a vitimização de mulheres no Brasil (2019)",
          a("Clique aqui",
            href = "https://forumseguranca.org.br/wp-content/uploads/2019/02/relatorio-pesquisa-2019-v6.pdf"))
        

      ),
      
      tabItem(
        tabName="contact",
        h1("Um pouco sobre nós"),
        br(),
        
        # fluidRow(
        #   column(
        #     width = 5,
        #   img(src = "cropAna.png", height = 125, width = 125)),
        #   column(
        #     width = 6,
        #     img(src = "cropArielle.png", height = 125, width = 125))
        # ),
        
        img(src = "cropAna.png", height = 125, width = 125),
        
        fluidRow(
        column(
          width = 10,
          br(),
          p(style="text-align: justify;",
            strong("Ana Carla Crispim")),
          p(style="text-align: justify;",
          "Formada em Psicologia pela Universidade de Itajaí, Mestre em Psicologia pela Universidade Federal de Santa Catarina (UFSC) e
          Doutora em Psicologia, com foco em Psicometria, pela University of Kent (Canterbury, Reino Unido). Fez estágio de pós-doutorado
          em modelagem estatística para ciências do comportamento no Departamento de Psicologia Experimental do Instituto de Psicologia 
          da Universidade de São Paulo. Trabalha com pesquisas sobre bem-estar, estados emocionais 
          e afetivos, personalidade, assim como métodos de análise de dados e psicometria. No momento, atua como gerente de projetos 
          do edulab21 no Instituto Ayrton Senna e como consultora na área de desenvolvimento de surveys e psicometria para
          projetos de iniciativas privadas e acadêmicas.")
          )),
        
        # column(
        #   width = 10,
        #   br(),
        #   p(style="text-align: justify;",
        #     strong("Arielle Sagrillo Scarpati")),
        #   p(style="text-align: justify;",
        #     "Formada em Psicologia, Mestre em Psicologia Social pela Universidade Federal do Espírito 
        #   Santo (UFES), Doutora em Psicologia Forense pela University of Kent (Canterbury, Reino Unido) e no ano de 2019 concluiu 
        #   seu estágio de pós-doutorado pela Universidade Federal do Rio Grande do Sul (UFRGS). Desde 2009 trabalha com pesquisa, 
        #   intervenções clínicas e sociais; com ênfase em saúde mental, nas vulnerabilidades sociais e diferentes formas de 
        #   violência cometidas contra mulheres e meninas. Atualmente, atua como psicóloga clínica, é consultora técnica do 
        #   Instituto Avon para a Coalizão Empresarial, realiza trabalhos de consultoria e intervenção com outras entidades públicas 
        #   e privadas e conduz pesquisas e formações técnicas nas áreas de expertise (saúde mental e autocuidado, gênero, feminismo,
        #   violências cometidas contra meninas e mulheres, masculinidade e direitos humanos)."),
        # )
        # ),
        # 
        
        br(),
        
        img(src = "cropArielle.png", height = 125, width = 125),
        
        fluidRow(
          column(
            width = 10,
        br(),
        p(style="text-align: justify;",
          strong("Arielle Sagrillo Scarpati")),
        p(style="text-align: justify;",
          "Formada em Psicologia, Mestre em Psicologia Social pela Universidade Federal do Espírito 
          Santo (UFES), Doutora em Psicologia Forense pela University of Kent (Canterbury, Reino Unido) e no ano de 2019 concluiu 
          seu estágio de pós-doutorado pela Universidade Federal do Rio Grande do Sul (UFRGS). Desde 2009 trabalha com pesquisa, 
          intervenções clínicas e sociais; com ênfase em saúde mental, nas vulnerabilidades sociais e diferentes formas de 
          violência cometidas contra mulheres e meninas. Atualmente, atua como psicóloga clínica, é consultora técnica do 
          Instituto Avon para a Coalizão Empresarial, realiza trabalhos de consultoria e intervenção com outras entidades públicas 
          e privadas e conduz pesquisas e formações técnicas nas áreas de expertise (saúde mental e autocuidado, gênero, feminismo,
          violências cometidas contra meninas e mulheres, masculinidade e direitos humanos)."),
        )
        ),
        
        br(),
        h3("Contribua com essa iniciativa"),
        h4("Vamos conversar"),
        p("anacarlacrispim@gmail.com | arielle.psicologia@gmail.com")
        
      )
    )
  )
)

