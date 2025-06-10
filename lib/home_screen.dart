import 'package:flutter/material.dart';
import 'drawerMenu.dart';
import 'icon.dart';
import 'colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannersList = [
    "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/2474661/pexels-photo-2474661.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/2942320/pexels-photo-2942320.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?auto=compress&cs=tinysrgb&w=1200",
    "https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1200",
  ];

  double translateX = 0.0;
  double translateY = 0.0;
  double scale = 1;
  bool toggle = false;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          transform: Matrix4.translationValues(translateX, translateY, 0)
            ..scale(scale),
          child: ClipRRect(
            borderRadius: (toggle)
                ? BorderRadius.circular(20)
                : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_arrow,
                    color: Colors.black,
                    progress: _animationController,
                  ),
                  onPressed: () {
                    setState(() {
                      toggle = !toggle;
                      if (toggle) {
                        translateX = 200;
                        translateY = 80;
                        scale = 0.8;
                        _animationController.forward();
                      } else {
                        translateX = 0.0;
                        translateY = 0.0;
                        scale = 1;
                        _animationController.reverse();
                      }
                    });
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                iconTheme: const IconThemeData(color: Colors.black, size: 24),
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Delivering to",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Current Location",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        search_icon,
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Search foods",
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(filter_icon, width: 16, height: 16),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    TittleWidget("Category"),
                    const SizedBox(height: 8),

                    // Category List
                    SizedBox(
                      height: 115,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listCards.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                height: 70,
                                width: 70,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(listCards[index].imageUrl),
                              ),
                              Text(
                                listCards[index].title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),
                    TittleWidget("Popular"),

                    ...List.generate(bannersList.length, (i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(bannersList[i]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 8),
                              child: Text(
                                "Food Name",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: primaryColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "(128 Ratings)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Burger ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "\$5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Text TittleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}

class CategoryModel {
  String imageUrl, title, remoteUrl;
  CategoryModel(this.imageUrl, this.title, {required this.remoteUrl});
}

List<CategoryModel> listCards = [
  CategoryModel(
    "assets/images/gift.png",
    "Offers",
    remoteUrl: "assets/images/gift.png",
  ),
  CategoryModel(
    "assets/images/drink.png",
    "Drinks",
    remoteUrl: "assets/images/drink.png",
  ),
  CategoryModel(
    "assets/images/burger.png",
    "Burger",
    remoteUrl: "assets/images/burger.png",
  ),
  CategoryModel(
    "assets/images/chicken.png",
    "Chicken",
    remoteUrl: "assets/images/chicken.png",
  ),
  CategoryModel(
    "assets/images/pizza.png",
    "Pizza",
    remoteUrl: "assets/images/pizza.png",
  ),
  CategoryModel(
    "assets/images/tteok.png",
    "Italian",
    remoteUrl: "assets/images/tteok.png",
  ),
];
