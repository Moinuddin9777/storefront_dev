import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView({super.key, required this.brand});
  final String brand;

  @override
  State<ProductsListView> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsListView> {
  List<dynamic> brandData = [];
  List<dynamic> typeFilteredList = [];
  List<bool> isCheckedFilterType = [];

  var productTypeFilters = [];

  List<dynamic> selectedFilters = [];

  var isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  static Dio dio = Dio();

  Future<void> fetchData() async {
    try {
      var response = await dio.get(
          'http://makeup-api.herokuapp.com/api/v1/products.json?brand=${widget.brand}');

      if (response.statusCode == 200) {
        brandData = response.data;
        setState(() {
          productTypeFilters = brandData
              .map((product) => product['product_type'])
              .toSet()
              .toList();

          isCheckedFilterType =
              List.filled(productTypeFilters.length + 1, false);

          setState(() {
            typeFilteredList = brandData;
          });
        });
      } else {
        debugPrint('Failed to Load Products');
        throw Exception('Failed to Load Products');
      }
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }

  static List<dynamic> sortProductsByPrice(List<dynamic> products) {
    products.sort((a, b) => a['price'].compareTo(b['price']));
    return products;
  }

  static List<dynamic> sortProductsByRating(List<dynamic> products) {
    products.sort((a, b) => b['rating'].compareTo(a['rating']));
    return products;
  }

  typeFilterOptions() {
    return ListView.builder(
        itemCount: productTypeFilters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productTypeFilters[index]),
                InkWell(
                    onTap: () {
                      setState(() {
                        isCheckedFilterType[index] =
                            !isCheckedFilterType[index];
                        if (isCheckedFilterType[index]) {
                          typeFilteredList = brandData
                              .where((element) =>
                                  element['product_type'] ==
                                  productTypeFilters[index])
                              .toList();
                        } else {
                          typeFilteredList.remove(brandData
                              .where((element) =>
                                  element['product_type'] ==
                                  productTypeFilters[index])
                              .toList());
                        }
                      });
                    },
                    child: Checkbox(
                      value: isCheckedFilterType[index],
                      onChanged: (bool? value) {
                        setState(() {
                          if (value!) {
                            isCheckedFilterType[index] = value;

                            typeFilteredList = brandData
                                .where((element) =>
                                    element['product_type'] ==
                                    productTypeFilters[index])
                                .toList();
                          } else {
                            isCheckedFilterType[index] = value;

                            typeFilteredList.remove(brandData
                                .where((element) =>
                                    element['product_type'] ==
                                    productTypeFilters[index])
                                .toList());
                          }
                        });
                      },
                    )
                    // child: Icon(isCheckedFilterType[index]
                    //     ? Icons.check_box_rounded
                    //     : Icons.check_box_outline_blank_rounded),
                    )
              ],
            ),
          );
        });
  }

  void showFilterDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.98,
                minWidth: MediaQuery.of(context).size.width * 0.98),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: typeFilterOptions(),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isCheckedFilterType =
                                List.filled(productTypeFilters.length, false);
                            typeFilteredList = brandData;

                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Clear All')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: const Text('Sumbit')),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          TextButton(
              onPressed: () {
                showFilterDialog();
              },
              child: const Text('Filters')),
        ]),
        body:
            // ModalProgressHUD(
            //     inAsyncCall: isLoading,
            //     progressIndicator: const CircularProgressIndicator(),
            //     child:
            productsView()
        //  ),
        );
  }

  GridView productsView() {
    // Color getColorForIndex(int index) {
    //   return Color.fromARGB(255 + index * 40, 92 + index * 30, 144 + index * 40,
    //       233 + index * 20);
    // }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: typeFilteredList.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: Card(
            // color: getColorForIndex(index),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Expanded(
                    child: ClipRRect(
                      child: Image.network(
                        typeFilteredList[index]['image_link'],
                        errorBuilder: ((context, error, stackTrace) {
                          return Image.asset('assets/noimage.png');
                        }),
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.19,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    typeFilteredList[index]['name'],
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Rating: ${typeFilteredList[index]['rating']}',
                        style: const TextStyle(
                          fontSize: 11.5,
                        ),
                      ),
                      Text(
                        'Price \$${typeFilteredList[index]['price']}',
                        style: const TextStyle(
                          fontSize: 11.5,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
