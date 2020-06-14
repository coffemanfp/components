import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

	final List<String> options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

	@override
		Widget build(BuildContext context) {
			return Scaffold(
				appBar: AppBar(
					title: Text('Componentes Temp'),
				),
				body: ListView(
					children: _createItemsShort(),
				),
		);
	}

	List<Widget> _createItems() {
		List<Widget> list = new List<Widget>();
		ListTile tempWidget = ListTile();

		for (String option in options) {
			tempWidget = ListTile(
				title: Text(option),
			);

			list..add(tempWidget)
				..add(Divider());
		}
		return list;
	}

	List<Widget> _createItemsShort() {
		return options.map((option) {
			return Column(
			  children: <Widget>[
			    ListTile(
			    	title: Text(option),
					subtitle: Text('Cualquier cosa'),
					leading: Icon(Icons.trip_origin),
					trailing: Icon(Icons.turned_in_not),
					enabled: true,
					onTap: () {},
			    ),
				Divider()
			  ],
			);
		}).toList();
	}
}