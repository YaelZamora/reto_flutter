import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Titulo(),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Contenido(),
            ),
          ],
        ),
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Content(),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
          colors: [
            Colors.lightBlue.shade100,
            Colors.purpleAccent.shade100,
            Colors.yellow.shade300,
          ],
          focal: Alignment.bottomCenter,
          radius: 0.3,
          focalRadius: 1.6,
          center: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 35,
          child: Text(
            'you did it! here\nyou can manage\nyour alarm,\nchange time and\nother things',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Icon(Icons.close),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: SvgPicture.asset(
            'assets/picture.svg',
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }
}

class Contenido extends StatefulWidget {
  @override
  _ContenidoState createState() => _ContenidoState();
}

class _ContenidoState extends State<Contenido> {
  bool valor = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('alarm'),
              CupertinoSwitch(
                activeColor: Colors.black,
                trackColor: Colors.grey,
                value: valor,
                onChanged: (value) {
                  setState(() {
                    valor = value;
                  });
                },
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          ToBed(
            dia: false,
          ),
          Hour(),
          ToBed(
            dia: true,
          ),
        ],
      ),
    );
  }
}

class Hour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              FontAwesomeIcons.bed,
              size: 10,
              color: Colors.grey,
            ),
            Text(
              '8 hours sleep',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class ToBed extends StatelessWidget {
  final bool dia;

  ToBed({
    Key? key,
    required this.dia,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          (dia) ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              (dia) ? '' : 'to bed',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Text(
              (dia) ? '7:30' : '23:30',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              (dia) ? 'wake up' : '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
