import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tmdb_app/models/serieModel.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:tmdb_app/state/series/actions.dart';
import 'package:tmdb_app/state/series/state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StoreConnector<AppState, List<SerieModel>>(
          converter: (store) => store.state.serieState.topSeries,
          builder: (context, topSeries) {
            var size = topSeries.length;
            return Text("$size");
          },
        )
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StoreConnector<AppState, SerieState>(
                converter: (store) => store.state.serieState,
                builder: (context, serieState) {
                  if(serieState.topSeriesLoading) {
                    return Container(
                      child: CircularProgressIndicator());
                  }

                  if(serieState.topSeries.isEmpty) {
                    return Text("Is empty");
                  }
                  

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: serieState.topSeries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(serieState.topSeries.elementAt(index).name),
                          subtitle: Text(serieState.topSeries.elementAt(index).id.toString()),
                        ); 
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          StoreProvider.of<AppState>(context).dispatch(FetchTopSeries().fetchTopSeries);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
