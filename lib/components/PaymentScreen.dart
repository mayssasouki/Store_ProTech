import'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card_ui/components/map.dart';
import 'package:flutter_credit_card_ui/bloc/CartBloc.dart';
import 'package:flutter_credit_card_ui/components/debit_cart.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen() : super();

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  CartBloc _cartBloc = new CartBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Payment Option'),
          centerTitle: true,
          backgroundColor: Colors.black,
          ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(125),
                  height: 100,
                  width: 160,
                  decoration: new BoxDecoration(
                    color: Colors.white24,
                    image: DecorationImage(
                      image: new AssetImage(
                        'assets/images/Logo.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 20 * 0.02),
                  width: MediaQuery.of(context).size.width - 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Color(0xFF009900),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 25.0),
                          Text(
                            'Cash On Delivery',
                            style: TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                           builder: (BuildContext context) => Location()));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 10, bottom: 20 * 0.02),
                  width: MediaQuery.of(context).size.width - 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: Color(0xFF009900),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 25.0),
                          Text(
                            'Debit/Credit card',
                            style: TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => CreditCardPage()));
                      },
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
    );
  }
}
