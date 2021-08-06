import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}


class _DemoAppState extends State<DemoApp> {

  String cardNumber = '';
  String cardHolderName = '';
  String cvvNumber = '';
  String expiryDate = '';
  bool showBackView = false;

  void onCreditCardModel(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      expiryDate = creditCardModel.expiryDate;
      cvvNumber = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              height: 190,
              width: 350,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              showBackView: showBackView,
              cardBgColor: Color(0xFF009900),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: Duration(milliseconds: 1200),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onCreditCardModel,
                  cursorColor: Colors.blue,
                  themeColor: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(
                alignment: Alignment.center,
                child: new Container(
                    padding: EdgeInsets.only(left: 10, bottom: 20 * 0.02),
                    width: MediaQuery.of(context).size.width - 80,
                    child: new RaisedButton(
                        color: Color(0xFF009900),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
                        padding: EdgeInsets.all(20),
                        onPressed: ()  {},
                        child: new Text("Next",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))
                    )
                ))
          ],
        ),
      ),
    );
  }
}














