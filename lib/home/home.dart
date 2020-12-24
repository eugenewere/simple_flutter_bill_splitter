import 'package:basic_flutter_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color _purple = HexColor("#6908D6");

  calculateTotalPerPerson(double billAmount, int splitBy, int _tipPercentage ){
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, _tipPercentage)+billAmount) / splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount == null){

    }else{
      totalTip = (billAmount*tipPercentage) / 100;
    }
    return totalTip;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(
                  context,
                ).size.height *
                0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              width: 150,
              height: 290,
              decoration: BoxDecoration(
                  color:  _purple.withOpacity(0),//Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total per person', style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: _purple,
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('\$${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: _purple,
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: _purple,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                        prefixText: 'Bill Amount',
                        prefixIcon: Icon(Icons.money)
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style:  TextStyle(
                                    color: _purple,
                                    fontWeight:FontWeight.bold,
                                    fontSize:17.0,
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                if(_personCounter > 1){
                                  _personCounter --;
                                }else{

                                }
                              });
                            },
                          ),
                          Text(
                              "$_personCounter",
                            style: TextStyle(
                              color: _purple,
                              fontWeight:FontWeight.bold,
                              fontSize:17.0,
                            ),

                          ),
                          InkWell(
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style:  TextStyle(
                                    color: _purple,
                                    fontWeight:FontWeight.bold,
                                    fontSize:17.0,
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                _personCounter ++;
                              });
                            },
                          ),

                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Tip",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                            " \$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                            style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                          color: _purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double nvalue){
                            setState(() {
                              _tipPercentage = nvalue.round();
                            });
                          }
                      ),
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}























class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test 101'),
        backgroundColor: Colors.amberAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('User'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('Ac'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('alarm'),
          ),
        ],
        onTap: (int index) => debugPrint('$index'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.call_missed),
        onPressed: () => debugPrint('nmmnjn'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onDoubleTap: () => debugPrint('nmmnjn'),
              child: Text(
                'Tap me',
                style: TextStyle(
                  fontSize: 23.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BizCard'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _getCard(),
              _getAvator(),
            ],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(52.0),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(4.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Eugene'),
          Text('Were'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person_outline_outlined),
              Text('eugene@yahoo.com'),
            ],
          ),
        ],
      ),
    );
  }

  _getAvator() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/seed/picsum/200/300'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Eugene'),
          Text('Were'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person_outline_outlined),
              Text('eugene@yahoo.com'),
            ],
          ),
        ],
      ),
    );
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  var _index = 0;
  List quotes = [
    "Stay Hungry. Stay Foolish.Steve Jobs",
    "Good Artists Copy, Great Artists Steal.Pablo Picasso",
    "Argue with idiots, and you become an idiot.Paul Graham",
    "Be yourself; everyone else is already taken Oscar Wilde",
    "Simplicity is the ultimate sophistication. Leonardo Da Vinci"
  ];
  _showQuote() {
    setState(() {
      _index += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quotes[_index % quotes.length]),
            FlatButton.icon(
              onPressed: () {
                _showQuote();
              },
              icon: Icon(Icons.wb_sunny),
              label: Text('First Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
