#Script R e arquivo CSV no mesmo diretorio

movies <- read.csv("Movies.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating","AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)

#Transformando chr e int para Factor (Usar o "as" é opcional)
movies$Film <- as.factor(movies$Film)
movies$Genre <- as.factor(movies$Genre)
movies$Year <- factor(movies$Year)

str(movies)
summary(movies)

#-------Aesthetics---------
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
#-------ADD GEOMETRY---------
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()
#-------ADD COLOR---------
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre)) +
  geom_point()
#-------ADD SIZE---------
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre, size=Genre)) +
  geom_point()
#-------ADD SIZE (BETTER WAY)---------
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre, size=BudgetMillions)) +
  geom_point()

#------ PLOTING WITH LAYERS------
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre, size=BudgetMillions)) 
#point
p + geom_point()
#lines
p + geom_line()
#multiple layers
p + geom_point() + geom_line() 
p + geom_line() + geom_point()

#-------OVERRIDING AESTHETICS
s <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre, size=BudgetMillions))
#add geom layer
s + geom_point()
#overriding aes
#EX1
s + geom_point(aes(size=CriticRating))
#EX2
s + geom_point(aes(color=BudgetMillions))
#EX3
s + geom_point(aes(x=BudgetMillions)) +
  xlab("Bugget Millions $$")

# S REMAINS THE SAME(NAO MUDOU NADA)
s + geom_point()
# EX4
p + geom_line(size=0.5) + geom_point()

#------MAPPING VS SETTING-------------
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#ADD COLOR
#1 - MAPPING
r + geom_point(aes(color=Genre))
#2 - SETTING
r + geom_point(color="DarkGreen")
#ADD SIZE
#1 - MAPPING
r + geom_point(aes(size=BudgetMillions))
#2 - SETTING
r + geom_point(size=1)


#------ HISTOGRAMS AND DENSITY CHARTS-----

h <- ggplot(data=movies, aes(x=BudgetMillions))
h + geom_histogram(binwidth = 10)
#add color
h + geom_histogram(binwidth = 10, aes(fill=Genre))
#add a border 
h + geom_histogram(binwidth = 10, aes(fill=Genre), color="black")

#----- as vezes precisamos de um density chart
h + geom_density(aes(fill=Genre))

#----- STARTING LAYER TIPS------
t <- ggplot(data=movies,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="White", color="Blue")
# Another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White", color="Blue")
#4
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", color="Blue")
#5 Varios data sets npo plot
z <- ggplot()


# ------ TRANSFORMAÇOES ESTATISTICAS --------

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplot
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#HACK / TIP 
u + geom_boxplot(size=1.2) + geom_jitter()
#OUTRO JEITO 
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)

#USANDO FACETS
v <- ggplot(data=movies, aes(x=BudgetMillions))

v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color='Black') +
  facet_grid(Genre~.,scales = "free")

#scatterplots

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre))
w + geom_point(size=3)
#facets
w + geom_point(size=1) +
  facet_grid(Genre~.)

w + geom_point(size=1) +
  facet_grid(.~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

# --------- CORDENADAS ------
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             color=Genre))
m + geom_point() +
  xlim(50,100) +
  ylim(50,100)

#------
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))


# ---------THEME ----------
o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

h

#axes label
h + 
  xlab("Money Axis") +
  ylab("Number Of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        )

#tich mark formatting
h + 
  xlab("Money Axis") +
  ylab("Number Of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20)
  )

#LEGENDAS
h + 
  xlab("Money Axis") +
  ylab("Number Of Movies") +
  ggtitle("Movies Budget Distribution") + 
  theme(axis.title.x = element_text(colour="DarkGreen", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family="Courier")
  )