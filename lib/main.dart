import 'package:flutter/material.dart';

void main() {
  runApp(WineStoreApp());
}

class WineStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wine Store',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: Theme.of(context).textTheme,
      ),
      home: WineHomePage(),
    );
  }
}

class WineHomePage extends StatefulWidget {
  @override
  _WineHomePageState createState() => _WineHomePageState();
}

class _WineHomePageState extends State<WineHomePage> {
  String selectedCategory = 'Type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.redAccent),
            SizedBox(width: 8),
            Text('Donnerville Drive', style: TextStyle(color: Colors.black)),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        backgroundColor: Colors.white,  // AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.redAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildSearchBar(),
            SizedBox(height: 16),
            Text(
              'Shop wines by',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            buildWineCategories(),
            SizedBox(height: 16),
            buildWineCategoriesWithImages(),
            SizedBox(height: 16),
            Text(
              'Wine',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            buildWineCard('lib/assets/firstbottle.png'),
            SizedBox(height: 16),
            buildWineCard('lib/assets/secondbottle.png'),
            SizedBox(height: 16),
            buildWineCard('lib/assets/thirdbottle.png'),
            SizedBox(height: 16),
            buildWineCard('lib/assets/fourthbottle.png'),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.mic),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget buildWineCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCategoryButton('Type', selectedCategory == 'Type'),
        buildCategoryButton('Style', selectedCategory == 'Style'),
        buildCategoryButton('Countries', selectedCategory == 'Countries'),
        buildCategoryButton('Grape', selectedCategory == 'Grape'),
      ],
    );
  }

  Widget buildCategoryButton(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red[50] : Colors.white,
          borderRadius: BorderRadius.circular(30), 
          border: Border.all(
            color: isSelected ? Colors.redAccent : Colors.grey, 
            width: 2,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.red : Colors.black, 
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildWineCategoriesWithImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildWineCategoryCard('Red wines', '123', 'lib/assets/redwine.png'),
        buildWineCategoryCard('White wines', '123', 'lib/assets/whitewine.png'),
      ],
    );
  }

  Widget buildWineCategoryCard(String title, String count, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: Container(
        width: 160,
        height: 250,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  count,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWineCard(String imagePath) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Wine Image
                    Container(
                      height: 140,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Wine Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ocone Bozzovich Beneventano Bianco IGT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.wine_bar, color: Colors.redAccent, size: 20),
                              SizedBox(width: 5),
                              Text(
                                'Red wine (Green and Flinty)',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.flag, color: Colors.redAccent, size: 20),
                              SizedBox(width: 5),
                              Text(
                                'From Champagne, France',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Available',
                                  style: TextStyle(
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.redAccent),
                    SizedBox(width: 8),
                    Text(
                      'Favourite',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Text(
                  '₹ 23,256,596',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Critics' Scores: ",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Text(
                  "94 / 100",
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Bottle (750ml)',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}