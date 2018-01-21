

/****** Object:  Table [dbo].[category]    Script Date: 1/21/2018 2:17:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](256) NOT NULL,
 CONSTRAINT [pk_category_id] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meal]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meal](
	[meal_id] [int] IDENTITY(1,1) NOT NULL,
	[day_of_week] [varchar](10) NOT NULL,
	[meal_name] [varchar](10) NOT NULL,
 CONSTRAINT [pk_meal_id] PRIMARY KEY CLUSTERED 
(
	[meal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meal_plan]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meal_plan](
	[plan_id] [int] NOT NULL,
	[meal_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meal_recipe]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meal_recipe](
	[meal_id] [int] NOT NULL,
	[recipe_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plan_recipes]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan_recipes](
	[plan_id] [int] NOT NULL,
	[users_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[recipe_id] [int] NOT NULL,
	[days_of_week] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plans]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plans](
	[plan_id] [int] IDENTITY(1,1) NOT NULL,
	[plan_name] [varchar](max) NOT NULL,
 CONSTRAINT [pk_plan_id] PRIMARY KEY CLUSTERED 
(
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe](
	[recipe_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_name] [varchar](1000) NOT NULL,
	[directions] [varchar](max) NOT NULL,
	[publics] [int] NOT NULL,
	[ingredients] [varchar](max) NOT NULL,
	[image_name] [varchar](max) NULL,
	[approved] [int] NOT NULL,
 CONSTRAINT [pk_recipe_id] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_category]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_category](
	[recipe_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [pk_recipe_id_category_id] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_tags]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_tags](
	[recipe_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [pk_recipe_id_tag_id] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [varchar](256) NOT NULL,
 CONSTRAINT [pk_tag_id] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_plan]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_plan](
	[plan_id] [int] NOT NULL,
	[users_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_recipes]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_recipes](
	[users_id] [int] NOT NULL,
	[recipe_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[users_id] ASC,
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[website_users]    Script Date: 1/21/2018 2:17:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[website_users](
	[users_id] [int] IDENTITY(1,1) NOT NULL,
	[users_name] [varchar](24) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[email] [varchar](48) NOT NULL,
	[authorization_level] [int] NOT NULL,
	[salt] [varchar](max) NULL,
	[signup] [int] NULL,
 CONSTRAINT [pk_users_id] PRIMARY KEY CLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([category_id], [category_name]) VALUES (1, N'Appetizers')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (2, N'Breakfast')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (3, N'Casseroles')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (4, N'Chicken')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (5, N'Dinner')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (6, N'Fish')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (7, N'Holidays & Occasions')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (8, N'Lunch')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (9, N'Pasta')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (10, N'Salads')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (11, N'Snacks')
INSERT [dbo].[category] ([category_id], [category_name]) VALUES (12, N'Soups')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[recipe] ON 

INSERT [dbo].[recipe] ([recipe_id], [recipe_name], [directions], [publics], [ingredients], [image_name], [approved]) VALUES (1, N'Roasted Cauliflower Dressed Up', N'1. 1 head of cauliflower cut into small florets\n2. 1/3 cup olive oil\n3. Salt & pepper to taste\n4. 1 shallot, cut crosswise into thin rings\n5. 1 tbsp. white wine\n6. 1 tbsp. capers, rinsed and roughly chopped\n7. Grated zest of lemon\n8. Handful of flat leaf parsley roughly chopped', 1, N'3 cups of cooked and cooled spinach, finely chopped\n3 cups of bread crumbs\n1 cup of grated parmesan\n4 eggs lightly beaten\n1/2 cup softened butter\nItalian parsley\nsalt and pepper', N'51143020_parmesan-roasted-cauliflower_1x1.jpg', 1)
INSERT [dbo].[recipe] ([recipe_id], [recipe_name], [directions], [publics], [ingredients], [image_name], [approved]) VALUES (2, N'Spinach Dip Balls', N'1. Mix all ingredients in a large bowl until well blended\n2. To prepare and serve immediately, roll level tablespoons full of the mixture into balls about the size of walnuts,\nand place on a lightly oiled cooking sheet\n3. Bake at 350 degrees for 10 minutes or until lightly browned and firm enough to pick up', 1, N'3 cups cooked and cooled spinach, finely chopped\n3 cups of bread crumbs\n1 cup grated parmesan\n4 eggs lightly beaten\n1/2 cup butter, softened\nItalian parsley\nsalt and pepper', N'Spinach-Balls-Appetizer-Recipe-9-e1451920507572.jpg', 1)
INSERT [dbo].[recipe] ([recipe_id], [recipe_name], [directions], [publics], [ingredients], [image_name], [approved]) VALUES (3, N'Strawberry Yogurt Popsicles', N'1. To a food process add strawberries\n2. Add 3 tbl. maple syrup, lemon juice and mix till you get a smooth puree\n3. In a bowl, whisk together geek yogurt with 1 tbl. maple syrup and vanilla extract\n4. Fill each popsicle mold with 2-3 tsp of the strawberry puree\n5. Then place 1-2 tbl of the Greek yogurt mixture on top. And finally again add few tsp the strawberry puree\ntill your mold is full\n6. Place the popsicle mold in the freezer for 2 hours.', 1, N'10 ounce strawberries ( 2 cups)\n4 tbl. maple syrup\n3/4 tsp lemon juice\n1 cup Greek yogurt\n1/2 tsp vanilla extract', N'strawberry-greek-yogurt-popsicles.jpg', 1)
INSERT [dbo].[recipe] ([recipe_id], [recipe_name], [directions], [publics], [ingredients], [image_name], [approved]) VALUES (4, N'Guacamole', N'1. Peel and pit avocadoes\n2. Dice onion\n3. Chop fresh cilantro\n4. Dice roma tomatoes\n5. Mince garlic\n6. In a medium bowl, mash together the avocados, lime juic, and salt\n7. Mix in onion, cilantro, tomatoes, and garlic\n8. Stir in cayenne pepper', 1, N'3 avocados, peeled, pitted, and mashed\n1 lime, juiced\n1 tsp salt\n1/2 cup diced onion\n3 tbl. chopped fresh cilantro\n2 roma tomatoes diced\n1 tsp. minced garlic\n1 pinch ground cayenne pepper\n1 pinch ground cayenne pepper', N'Best-Guacamole-Ever-(2).jpg', 1)
INSERT [dbo].[recipe] ([recipe_id], [recipe_name], [directions], [publics], [ingredients], [image_name], [approved]) VALUES (5, N'Red Rice Salad with Peaches and Cucumber', N'1. Peel and dice 4 cups of cucumbers\n2. Rinse Bhutanese red rice\n3. Grate fresh ginger\n4. Peel and dice fresh peaches\n5. Toast sesame seeds\n6. Chop fresh mint\n7. Seed and mince fresh serrano chilies\n8. Coarsely chop arugula\n9. Toss cucumber in a bowl with 3/4 teaspoon of salt and let stand in the water for 1 hour\n10. Rinse and drain in sieve, ensuring to press out all of the excess water\n11. Combine water, rice and 1/4 teaspoon of salt in a large sauce pan\n12. Bring to boil over high heat. Reduce heat to maintain a gentle simmer and cover and cook until the rice\nis tender about 20 minutes\n13. Whisk lemon juice, oil, ginger and the remaining 1/4 teaspoon of salt in a large bowl until well combined\n14. Add the cucumber, the rice, peaches, sunflower seeds, mint and chili\n15. Mix well and allow to chill down for 30 minutes | 16. Add arugula and toss just before serving', 1, N'4 cups diced English cucumbers (about 1¼ pounds)\n1¼ teaspoons salt, divided\n1½ cups water\n1 cup Bhutanese red rice, rinsed\n? cup fresh lemon juice\n3 tablespoons extra-virgin olive oil\n1 tablespoon grated fresh ginger\n3 cups diced ripe but firm peaches or nectarines (about 1 pound)\n¼ cup sunflower seeds, toasted (see Tip)\n¼ cup chopped fresh mint\n1 teaspoon minced seeded fresh serrano chile, or to taste\n3 cups arugula, coarsely chopped', N'3758370.jpg', 1)
INSERT [dbo].[recipe] ([recipe_id], [recipe_name], [directions], [publics], [ingredients], [image_name], [approved]) VALUES (6, N'Chicken and Kale Hand Pies', N'1. Preheat oven to 425 degrees\n2. Prepare two baking sheets with parchment paper\n3. On a cool surface, roll out one disc of pie dough to a 14 inch round.\nDust with flour first, if needed, to prevent sticking\n4. With a knife or biscuit cutter, cut out six 4 1/4 inch circles, re-rolling dough just once if needed\n5. Transfer cut dough on parchment to a baking sheet. Repeat with remaining dough, cutting out six larger, 4 1/4 inch rounds\n6. Place sheet in the fridge until ready to use\n7. In a large skillet over medium-high heat, melt butter. Add leek and sauté until soft, about 3 minutes\n8. Add kale, thyme, salt, and pepper, to the skillet an sauté until kale wilts, about 3-5 minutes\n9. Sprinkle flour over mixture. Stir to combine. Add broth and bring to a boil.\nCook stirring often, until mixture thickens, about 2 minutes\n10. Transfer to a medium bowl, season with more salt and pepper if desired, and stir in chicken. Let cool slightly\n11. Remove rounds from fridge\n12. Place a rounded 1/4 cup of chicken mixture on each of the smaller dough rounds, leaving a 1/2 inch border.\nBrush edges with egg and top with larger dough rounds. Using fingers, press edges firmly to seal\n13. Cut a small vent in each pie. Bake until browned and crisp, 30 minutes, rotating sheet halfway through\n14. Let cook slightly on sheets that have been set on a wire rack. Serve warm or at room temperature.', 1, N'2 discs pie dough, either home made or purchased\n2 tbsp. all -purpose flour\nSalt & pepper to taste\n2 tbsp. unsalted butter\n1 leek, white and light green parts only, halved lengthwise,\n  cut crosswise 1/4 inch thick and rinsed well\n1 small bunch kale, de-ribbed and coarsely chopped\n1 tsp fresh thyme leaves\n1/4 tsp dried sage\n1 cup chicken or vegetable broth\n1 cup cooked chicken or turkey, shredded into bite size pieces\n1 large egg, lightly beaten', N'54ef8bf9f04cb_-_chicken-sweet-potato-pot-pies-recipe-wdy0313-xl.jpg', 1)
SET IDENTITY_INSERT [dbo].[recipe] OFF
SET IDENTITY_INSERT [dbo].[tags] ON 

INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (1, N'Gluten Free')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (2, N'Low Sodium')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (3, N'High Fiber')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (4, N'Soy Free')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (5, N'Dairy Free')
INSERT [dbo].[tags] ([tag_id], [tag_name]) VALUES (6, N'High in Iron')
SET IDENTITY_INSERT [dbo].[tags] OFF
SET IDENTITY_INSERT [dbo].[website_users] ON 

INSERT [dbo].[website_users] ([users_id], [users_name], [password], [email], [authorization_level], [salt], [signup]) VALUES (1, N'rob', N'y+bjtdQQpBEu7dSYeSH4aEhPF/E=', N'rob@rob', 3, N'sdZUcw2JQTw=', 1)
INSERT [dbo].[website_users] ([users_id], [users_name], [password], [email], [authorization_level], [salt], [signup]) VALUES (2, N'cam', N'NQ6AdbvWgCEBChpx5IvUh531zfg=', N'cam@cam', 3, N'cQJa/1TRWAo=', 1)
INSERT [dbo].[website_users] ([users_id], [users_name], [password], [email], [authorization_level], [salt], [signup]) VALUES (3, N'nate', N'636Pu+UykDhsFckNyBIXrodpZ+o=', N'nate@nate', 3, N'+TN6kD82RPw=', 1)
INSERT [dbo].[website_users] ([users_id], [users_name], [password], [email], [authorization_level], [salt], [signup]) VALUES (4, N'johnfultonorg', N'+Iko4woeGw7GEW3McJDpUwiBGf0=', N'john.fulton@OrdinarySkill.org', 2, N'9Z0Iati/Cpc=', 1)
SET IDENTITY_INSERT [dbo].[website_users] OFF
ALTER TABLE [dbo].[recipe] ADD  DEFAULT ((0)) FOR [approved]
GO
ALTER TABLE [dbo].[website_users] ADD  DEFAULT ((0)) FOR [signup]
GO
ALTER TABLE [dbo].[meal_plan]  WITH CHECK ADD  CONSTRAINT [fk_meal_plan_meal_id] FOREIGN KEY([meal_id])
REFERENCES [dbo].[meal] ([meal_id])
GO
ALTER TABLE [dbo].[meal_plan] CHECK CONSTRAINT [fk_meal_plan_meal_id]
GO
ALTER TABLE [dbo].[meal_plan]  WITH CHECK ADD  CONSTRAINT [fk_meal_plan_plan_id] FOREIGN KEY([plan_id])
REFERENCES [dbo].[plans] ([plan_id])
GO
ALTER TABLE [dbo].[meal_plan] CHECK CONSTRAINT [fk_meal_plan_plan_id]
GO
ALTER TABLE [dbo].[meal_recipe]  WITH CHECK ADD  CONSTRAINT [fk_meal_recipe_meal_id] FOREIGN KEY([meal_id])
REFERENCES [dbo].[meal] ([meal_id])
GO
ALTER TABLE [dbo].[meal_recipe] CHECK CONSTRAINT [fk_meal_recipe_meal_id]
GO
ALTER TABLE [dbo].[meal_recipe]  WITH CHECK ADD  CONSTRAINT [fk_meal_recipe_recipe_id] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([recipe_id])
GO
ALTER TABLE [dbo].[meal_recipe] CHECK CONSTRAINT [fk_meal_recipe_recipe_id]
GO
ALTER TABLE [dbo].[plan_recipes]  WITH CHECK ADD  CONSTRAINT [fk_plan_recipes_plan_id] FOREIGN KEY([plan_id])
REFERENCES [dbo].[plans] ([plan_id])
GO
ALTER TABLE [dbo].[plan_recipes] CHECK CONSTRAINT [fk_plan_recipes_plan_id]
GO
ALTER TABLE [dbo].[user_plan]  WITH CHECK ADD  CONSTRAINT [fk_user_plan_plan_id] FOREIGN KEY([plan_id])
REFERENCES [dbo].[plans] ([plan_id])
GO
ALTER TABLE [dbo].[user_plan] CHECK CONSTRAINT [fk_user_plan_plan_id]
GO
ALTER TABLE [dbo].[user_plan]  WITH CHECK ADD  CONSTRAINT [fk_user_plan_user_id] FOREIGN KEY([users_id])
REFERENCES [dbo].[website_users] ([users_id])
GO
ALTER TABLE [dbo].[user_plan] CHECK CONSTRAINT [fk_user_plan_user_id]
GO
ALTER TABLE [dbo].[user_recipes]  WITH CHECK ADD FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([recipe_id])
GO
ALTER TABLE [dbo].[user_recipes]  WITH CHECK ADD FOREIGN KEY([users_id])
REFERENCES [dbo].[website_users] ([users_id])
GO

