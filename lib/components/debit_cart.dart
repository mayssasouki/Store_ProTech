import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card_ui/bloc/CartBloc.dart';
import 'package:flutter_credit_card_ui/components/map.dart';
import 'package:flutter_credit_card_ui/models/Cart.dart';
import 'package:flutter_credit_card_ui/widget/ProfilTitle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CreditCardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardPageState();
  }
}


class CreditCardPageState extends State<CreditCardPage> {

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
        title: Text('Credit Card Ui'),
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
              height: 210,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              showBackView: showBackView,
              cardBgColor: Color(0xff009900),
              textStyle: TextStyle(
                color: Colors.black,
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
            Ink(
              decoration: ShapeDecoration(shape: StadiumBorder()),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => PaymentSuccessPage()));
                  },
                  backgroundColor: Color(0xff009900),
                  icon: Icon(
                    FontAwesomeIcons.amazonPay,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Continue",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessPage extends StatefulWidget {
  @override
  PaymentSuccessPageState createState() {
    return new PaymentSuccessPageState();
  }
}

class PaymentSuccessPageState extends State<PaymentSuccessPage> {
  CartBloc _cartBloc = new CartBloc();
  bool isDataAvailable = true;
  Widget bodyData() => Center(
    child: isDataAvailable
        ? RaisedButton(
            onPressed: () => showSuccessDialog(),
            color: Color(0xFF009900),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            padding: EdgeInsets.all(20),
          child: Text("Process Payment"),
    )
        : CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(),
    );
  }

  void showSuccessDialog() {
    setState(() {
      isDataAvailable = false;
      Future.delayed(Duration(seconds: 3)).then((_) => goToDialog());
    });
  }

  goToDialog() {
    setState(() {
      isDataAvailable = true;
    });
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                successTicket(),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ));
  }

  successTicket() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    child: Material(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "Thank You!",
              textColor: Colors.black,
              subtitle: "Your transaction was successful",
            ),
            ListTile(
              title: Text("Date"),
              subtitle: Text(""),
              trailing: Text("HH:MM AM"),
            ),
            ListTile(
              title: Text("User Name"),
              subtitle: Text("user_name@gmail.com"),
              trailing: CircleAvatar(
                radius: 20.0,
              ),
            ),
            StreamBuilder(
                initialData: _cartBloc.currentCart,
                stream: _cartBloc.observableCart,
                builder: (context, AsyncSnapshot<Cart> snapshot) {
              return  ListTile(
                  title: Text("Amount"),
                  subtitle: Text("\$${snapshot.data.totalPrice().toStringAsFixed(2)}"),
                  trailing: Text("Completed"),);}
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
              color: Colors.grey.shade300,
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.ccVisa,
                  color: Color(0xff009900),
                ),
                title: Text("Credit/Debit Card"),
                subtitle: Text("Card ending ****"),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Container(
                height: 40.0,
                width: 220,
                decoration: BoxDecoration(
                  color:  Color(0xff009900),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                  child: Text(
                    "Track Your Order",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Location()));
              },
            ),
          ],
        ),
      ),
    ),
  );
}