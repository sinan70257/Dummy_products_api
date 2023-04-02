import 'package:dog_image/constants/constants.dart';
import 'package:dog_image/model.dart';
import 'package:dog_image/products_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productTile(products data, context) {
  String pName = data.title!;
  String pPrice = data.price.toString();

  return Container(
    decoration: BoxDecoration(
      color: Kgrey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => productDetails(
                data: data,
              ),
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: sWidth! / 2.5,
                    height: sWidth! / 2.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.thumbnail!),
                          fit: BoxFit.cover),
                      color: Kgrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  $pName",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "  ₹ $pPrice",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        space20(),
        Container(
          width: sWidth! / 2.1,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0, left: 20),
                height: sHeight! / 30,
                width: sWidth! / 6,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => orderDetails(),
                    //     ));
                  },
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Spacer(),
              favbutton(
                data: data,
              )
            ],
          ),
        )
      ],
    ),
  );
}

class favbutton extends StatefulWidget {
  const favbutton({
    super.key,
    required this.data,
  });

  final products data;
  @override
  State<favbutton> createState() => _favbuttonState();
}

class _favbuttonState extends State<favbutton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            widget.data.fav = !widget.data.fav;
          });
        },
        icon: Icon(
          widget.data.fav ? Icons.favorite : Icons.favorite_border,
          color: widget.data.fav ? Colors.red : Kgrey3,
        ));
  }
}
