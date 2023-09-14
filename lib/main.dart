import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Serverclass {
  String id;
  String name;
  String language;
  String framework;

  Serverclass({
    required this.id,
    required this.name,
    required this.language,
    required this.framework,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController frameWorkController = TextEditingController();
  List<Serverclass> Servers = [];

  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('http://localhost:9090/servers/get'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        Servers = data.map((item) {
          return Serverclass(
            id: item['id'],
            name: item['name'],
            language: item['language'],
            framework: item['framework'],
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> _saveContact(String id, String name, String language, String framework) async {
    final response = await http.post(
      Uri.parse('http://localhost:9090/servers/create'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': id,
        'name': name,
        'language': language,
        'framework': framework,
      }),
    );

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);
      setState(() {
        Servers.add(Serverclass(
          id: data['id'],
          name: data['name'],
          language: data['language'],
          framework: data['framework'],
        ));
        idController.text = '';
        nameController.text = '';
        languageController.text = '';
        frameWorkController.text = '';
      });
    }
  }

  Future<void> _deleteContact(String id) async {
    final response =
        await http.delete(Uri.parse('http://localhost:9090/servers/$id'));
    if (response.statusCode == 200) {
      setState(() {
        Servers.removeWhere((contact) => contact.id == id);
        selectedIndex = -1;
      });
    }
  }

  Widget getRow(int index) {
    nameController.text = Servers[index].name;
    languageController.text = Servers[index].language;
    frameWorkController.text = Servers[index].framework;
    idController.text = Servers[index].id;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            Servers[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              Servers[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
                'Language: ${Servers[index].language}\nFramework: ${Servers[index].framework}'),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: const Icon(Icons.edit),
              ),
              InkWell(
                onTap: () {
                  _deleteContact(Servers[index].id);
                },
                child: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Server List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                hintText: 'Server ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Server Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: languageController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Language',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: frameWorkController,
              decoration: const InputDecoration(
                hintText: 'Framework',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String id = idController.text.trim();
                    String name = nameController.text.trim();
                    String language = languageController.text.trim();
                    String framework = frameWorkController.text.trim();
                    if (id.isNotEmpty && name.isNotEmpty &&
                        language.isNotEmpty && framework.isNotEmpty) {
                      _saveContact(id, name, language, framework);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Servers.isEmpty
                ? const Text(
                    'No Servers yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: Servers.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
