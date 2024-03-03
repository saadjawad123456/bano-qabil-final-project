import 'package:flutter/material.dart';
import 'model/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int CurrentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRow(),
              const SizedBox(height: 20),
              searchbox(),
              const SizedBox(height: 20),
              homeslider(),
              const SizedBox(height: 20),
              browsecategory(),
              allcategories(),
              const SizedBox(height: 20),
              specialforyou(),
              const SizedBox(height: 10),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row specialforyou() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Special For You",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("See all"),
        ),
      ],
    );
  }

  Row browsecategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Browse Categories",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("See all"),
        ),
      ],
    );
  }

  SizedBox allcategories() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      categories[index].image,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                categories[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: categories.length,
      ),
    );
  }

  Stack homeslider() {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                CurrentSlide = value;
              });
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assests/slider.png"),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: CurrentSlide == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CurrentSlide == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container searchbox() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Color(0xfff5f5f5),
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 25,
          icon: const Icon(Icons.grading_outlined),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            backgroundColor: Color(0xfff5f5f5),
            padding: const EdgeInsets.all(15),
          ),
          iconSize: 25,
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}
