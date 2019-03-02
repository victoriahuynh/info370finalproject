# info370finalproject

> Jill Nguyen, Pooja Ramanathan, Shiva Rithwick, Victoria Huynh

## Project Description

### What is the overarching purpose of your research project, and why is it an important undertaking?
The overarching purpose of our project is to examine the impact that home-sharing rental sites, specifically Airbnb, may have on the surrounding neighborhoods that listings are posted in Seattle. We believe this is an important undertaking because gentrification is a rising problem in many American cities today. While gentrification is usually attributed to an influx of new affluent residents into a neighborhood, the purchase of properties in a neighborhood solely to house short-term visitors may also be an overlooked factor. Our research can fit into the broader scope of gentrification and Airbnb, as research has previously been done to examine Airbnb’s impact on urban areas.

### How does your research fit into the broader problem domain?
One dichotomy brought up in research studies is that while Airbnb claims to have a positive impact on local neighborhoods and their residents by bringing in tourism, the reality of the platform's presence is that it raises rental prices in the area, pushing residents out. This is because as long as consumers are incentivized to rent a room on Airbnb as opposed to a hotel, housing owners will be inclined to make Airbnb listings instead of renting to local residents. This increases demand for long-term rentals, and thus increased housing prices. One case study observing this phenomenon was conducted by McGill University researchers, who found that areas in New York such as Harlem and Bed-Stuy, which contained lower-income housing, were seeing those apartments usurped by short-term rentals. [(Wachsmuth)](https://www.researchgate.net/publication/318281320_Airbnb_and_the_Rent_Gap_Gentrification_Through_the_Sharing_Economy) Key findings from their research period found that New Yorkers as a whole were paying $380 more in rent due to reduction of housing supply, and that there were 13,500 units of lost housing in the city through Airbnb. In essence, "the growth of short-term rentals is closely tied to the broader financialisation of housing that makes housing a commodity, erodes the neighborhood identity, attracts new investors for buying or developing more and more units, which in turn increases the scarcity of housing, prompts landlords to raise rent, threatens community bonds and stretches neighbourhood services". [(Bernardi)](https://labgov.city/thecommonspost/the-impact-of-airbnb-on-our-cities-gentrification-and-disneyfication-2-0/) Additionally, Airbnb has been accused of furthering racial gentrification, as a landmark study from Inside Airbnb makes some several key observations. Their main findings concluded that across all 72 predominantly Black New York City neighborhoods, Airbnb hosts are 5 times more likely to be white. In those neighborhoods, the Airbnb host population is 74% white, while the white resident population is only 14%. Due to this disparity in demographics, the loss of housing and neighborhood disruption due to Airbnb is 6 times more likely to affect Black residents, based on their majority presence in Black neighborhoods. [(Inside Airbnb)](http://insideairbnb.com/face-of-airbnb-nyc/a-year-later-airbnb-as-racial-gentrification-tool.html)

### What specific hypothesis (hypotheses) are you going to test?
Our hypothesis is that the presence of Airbnb in Seattle neighborhoods has reduced housing availability and caused real estate pricing to go up, affecting the affordability and accessibility of living for local residents.

### What are the datasets you'll be working with to answer this question? 
The datasets we are using are the datasets provided by [Inside Airbnb](http://insideairbnb.com/get-the-data.html) for the Seattle area. They state that this data is sourced from publicly available information from the Airbnb website, and has been analyzed, cleansed and aggregated where appropriate to faciliate public discussion. The datasets contain listing information, calendar dates for listings, reviews for listings, and a list of neighborhoods in the city.

### What statistical and machine learning methods do you plan on using to test your hypothesis?
We are using logistic regression models to try and identify relationship between the features and the target response. To test our hypothesis, we can perform dimensionality reduction algorithms such as Random Forest or Backward Feature Elimination to find out what predictors are applicable. After that, we can perform KNN for classification to see the relationship between neighborhoods and price hikes in the area.

### Who is your target audience for the resource you will build? 
Our target audience will be Seattle homeowners/renters and potential Airbnb renters in Seattle. In particular, we wish to hone in on Seattle homeowners and renters as we believe our resource will be most informative towards them. Since we’re examining whether Airbnb has a negative impact on the housing areas around it, homeowners who are concerned by our findings may wish to raise their concerns to their local politicians and encourage them to regulate Airbnb.

### What should your audience learn from your resource? 
Our audience may want to answer questions such as:
- How do Airbnbs in a neighborhood affect surrounding home prices and rental rates?
- How does Airbnb affect housing availability in a neighborhood?
- What proportion of a neighborhood is comprised of Airbnb homes?
- What are the demographics of neighborhoods in areas most impacted by Airbnb listings?
- What factors affect how many Airbnb listings are in an area and their prices?

## Technical Description

### What will be the format of your final web resource?
The format of our final web resource will be a an HTML page compiled with KnitR, we chose this format as we want to have a continuous flow of the stages through out project. We can also present interactive maps to demonstrate trends on how the prices change according to the location. We can also use choropleth maps to demonstrate these trends.

### Do you anticipate any specific data collection / data management challenges?
There are a lot of data sets to choose from on Airbnb pricing, it might be difficult figuring out which one is the most relevant to our project. We all have a general understanding of the Airbnb data sets; however, we do not possess significant expertise on the domain. Analyzing and Interpreting findings may require additional research. 

### What new technical skills will need to learn in order to complete your project?
We will need to learn about packages present in R like MIC that will help us fill missing values, rpart for partitioning data, CARET for classification And regression training of the data set. We will also need to do thorough reading and understanding of feature selection to better model our data.

### How will you conduct your analysis? What major challenges do you anticipate? 
We were planning on first finding the features that are useful to our Model using Dimensionality Reduction techniques such as Random Forest and Backward Feature Selection Method. We are then planning to treat the dataset as a classification problem by dividing the range of the price listings of Airbnbs, and performing Classification algorithms for Supervised Learning such as Support Vector Machine.

Supervised learning requires that the algorithm’s possible outputs are already known and that the data used to train the algorithm is already labeled with correct answers. For example, in the case of Airbnb dataset, we can use the words used by the listing owner to describe his space and try to understand if there is a relationship between the words used and the price of the place or the number of customers per month the host receives. However, the challenge would be here is performing a sentiment analysis and because keyword processing algorithms only identifies the sentiment reflected in a particular word, it typically fails at providing all of the elements necessary to understand the complete context of the entire piece.
