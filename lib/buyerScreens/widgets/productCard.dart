import 'package:farmwise/buyerScreens/data/ApprovedProductList.dart';
import 'package:farmwise/buyerScreens/reviewApprovedProducts.dart';
import 'package:flutter/material.dart';

class ApprovedProductCard extends StatelessWidget {
  const ApprovedProductCard({super.key, required this.productproposalList});

  final ApprovedProductProposalDetails productproposalList;

  @override
  Widget build(BuildContext context) {
    // double value = double.parse(approvedproductList.);
    // String roundedValue = value.toStringAsFixed(2);
    return GestureDetector(
      onTap: () {
        // Navigate to the second page when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => reviewApprovedProducts(
                  productproposalList: productproposalList)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias, //clip the edges
        elevation: 0.1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            width: 0.2,
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // image
            Container(
              height: 120,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage((productproposalList != '' &&
                        productproposalList.product_img_path != '')
                    ? 'http://localhost:5005/${productproposalList.product_img_path}' ??
                        'http://localhost:5005/uploads/proproposal/defaultproduct.png'
                    : 'http://localhost:5005/uploads/proproposal/defaultproduct.png'),
                fit: BoxFit.cover,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Text(
                    productproposalList.product_name,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Unit Price : Rs.${productproposalList.unit_price}",
                            style: const TextStyle(
                              fontSize: 12,
                            )),
                      ])),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Qunatity: ${productproposalList.quantity} kg",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ])),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text:
                              "Total Price: Rs.${productproposalList.total_price}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ])),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
