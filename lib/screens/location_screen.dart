import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class Locationscreen extends StatefulWidget {
  const Locationscreen(this.weather);
  final weather;
  @override
  State<Locationscreen> createState() => _LocationscreenState();
}

class _LocationscreenState extends State<Locationscreen> {
  WeatherModel weth = WeatherModel();
  var tempereture, city;
  var weathers, messagetext;
  @override
  void initState() {
    super.initState();
    lastmethod(widget.weather);
  }

  void lastmethod(dynamic hello) {
    setState(() {
      var condition = hello['weather'][0]['id'];
      weathers = weth.getWeatherIcon(condition);
      double tem = hello['main']['temp'];
      tempereture = tem.toInt();
      messagetext = weth.getMessage(tempereture);
      city = hello['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var update = await WeatherModel().getlocation();
                      lastmethod(update);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var weathe = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return cityscreen();
                          },
                        ),
                      );
                      if (weathe != null) {
                        var wet = await WeatherModel().getweathercity(weathe);
                        lastmethod(wet);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempereture° ',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathers,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                child: Text(
                  '$messagetext in $city ',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
