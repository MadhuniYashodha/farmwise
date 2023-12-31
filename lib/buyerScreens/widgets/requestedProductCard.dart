import 'package:farmwise/buyerScreens/data/ApprovedProductList.dart';
import 'package:farmwise/buyerScreens/reviewApprovedProducts.dart';
import 'package:farmwise/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class requestedProductCard extends StatelessWidget {
  const requestedProductCard({super.key, required this.productproposalList});

  final ApprovedProductProposalDetails productproposalList;

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    String token = '';
    String email = '';

    Future<void> deleteRequestedProducts(String product_id) async {
      token = await _authService.getToken();
      email = await _authService.getEmail();
      try {
        final Map<String, String> headers = {
          'authorization': 'Bearer $token',
          'x-access-token': token,
          'Content-Type': 'application/json'
        };
        final Map<String, dynamic> data = {
          "buyer_email": email,
          "product_id": product_id
        };

        final response = await http.post(
          Uri.parse('http://localhost:5005/api/deleteRequestedProducts'),
          headers: headers,
          body: jsonEncode(data),
        );
        //saving the response
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Request Deleted successfully!')));
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/buyerDash', (route) => false);
          });
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Oops! Try again..')));
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/buyerDash', (route) => false);
          });
        }
      } catch (er) {
        print(er);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(er.toString())));
      }
    }

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
                  const Text(
                    "Requested",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(214, 110, 99, 87)),
                  ),
                  TextButton(
                      onPressed: () {
                        deleteRequestedProducts(productproposalList.product_id);
                      },
                      child: const Icon(
                        Icons.delete_forever_rounded,
                        color: Color.fromARGB(255, 157, 67, 60),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
