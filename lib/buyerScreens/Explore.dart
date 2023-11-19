import 'package:farmwise/buyerScreens/data/cartData.dart';
import 'package:farmwise/buyerScreens/data/productList.dart';
import 'package:farmwise/buyerScreens/models/product.dart';
import 'package:farmwise/buyerScreens/widgets/productCard.dart';
import 'package:flutter/material.dart';

class explorePage extends StatefulWidget {
  const explorePage({super.key});

  @override
  State<explorePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<explorePage> {
  List<product> cartList = [];
  List<product> filteredList = [];
  TextEditingController searchController = TextEditingController();

  final sortOptions = ['Product Name (A-Z)', 'Product Name (Z-A)'];
  String? selectedSortOption; // Remove the initial value

  @override
  void initState() {
    super.initState();
    // Set filteredList to all products when the page loads
    filteredList = List.from(productList);
    selectedSortOption = null; // No default sorting
  }

  void sortProductsByName() {
    setState(() {
      filteredList.sort((a, b) => a.name.compareTo(b.name));
    });
  }

  void sortProductsByNameDescending() {
    setState(() {
      filteredList.sort((a, b) => b.name.compareTo(a.name));
    });
  }

  void onDropDownChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedSortOption = value;
        if (value == 'Product Name (A-Z)') {
          sortProductsByName();
        } else if (value == 'Product Name (Z-A)') {
          sortProductsByNameDescending();
        }
        // Add other sorting options if needed
      });
    }
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = List.from(productList);
      } else {
        filteredList = productList
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget build(BuildContext context) {
// Group filteredList by the first letter of the product name
    Map<String, List<product>> groupedProducts = {};
    for (var product in filteredList) {
      String firstLetter = product.name[0].toUpperCase();
      if (!groupedProducts.containsKey(firstLetter)) {
        groupedProducts[firstLetter] = [];
      }
      groupedProducts[firstLetter]!.add(product);
    }

    return Scaffold(
        body: ListView(padding: EdgeInsets.all(16), children: [
      //filter
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  // Update the filteredList when the search query changes
                  filterProducts(value);
                },
                decoration: InputDecoration(
                  hintText: "Search here..",
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(99),
                      )),
                  //prefixIcon: ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton.filled(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 107, 156, 104),
                  )),
            )
          ],
        ),
      ),
      //consultation
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: 170,
          child: Card(
            color: Colors.green.shade50,
            elevation: 0.1,
            shadowColor: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Free Consultation",
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Get free support from our customer service"),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 85, 127, 83)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Call now",
                              style: TextStyle(),
                            ))
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/contact_us.png",
                    width: 140,
                  ),
                ],
              ),
            ),

            //image
          ),
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Featured Products",
            style: TextStyle(
              color: const Color.fromARGB(255, 4, 5, 4),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            //crop
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white70,
            ),
            child: DropdownButton<String?>(
              items: sortOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Text(value),
                  ),
                );
              }).toList(),
              value: selectedSortOption,
              onChanged: onDropDownChanged,
              underline: Container(),
              hint: Text(
                selectedSortOption ?? "Sort by",
                style: TextStyle(
                  color: Colors.green.shade700,
                ),
              ),
            ),
          )
        ],
      ),

      GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return productCard(
                productList: filteredList[index],
                onAddToCart: () {
                  setState(() {
                    filteredList[index].quantity++;
                    CartData.cartList.add(filteredList[index]);
                  });
                });
          })
    ]));
  }
}
