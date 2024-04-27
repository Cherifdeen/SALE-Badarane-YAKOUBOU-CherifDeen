import 'package:flutter/material.dart';
import 'package:tp_election/pages/details_candidate_page.dart';
import '../models/person_dart.dart';
import 'add_candidate_form.dart';

class HomeCandidatePage extends StatefulWidget {
  const HomeCandidatePage({super.key});

  @override
  State<HomeCandidatePage> createState() => _HomeCandidatePageState();
}

class _HomeCandidatePageState extends State<HomeCandidatePage> {
  String name = "";
  bool liked = false;
  List<Person> persons = [];
  List<Person> friends = [];


  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      appBar: AppBar(
        title: Text('Elections 🇧🇯🇧🇯',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 25),
        ),

      ),

      body: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Candidate',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '${persons.length} Candidate (s)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  Person person = persons[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigation vers une nouvelle page lorsque l'utilisateur clique sur un élément
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsCandidatePage(), // Passer la personne sélectionnée à la nouvelle page
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(26.0),
                              child: Image.network(
                                'https://guardian.ng/wp-content/uploads/2022/06/Adebayo-2.jpg',
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${person.name} ${person.surname}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "${person.description}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Canidats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),



      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Person person = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCandidateForm (),
                ));

            setState(() => persons.add(person));

          },
          child: Icon(Icons.add),
        ),



    );
  }

  bool checkIfExists(Person person) {
    return friends.contains(person);
  }

  void addFriend(Person person) {
    if (!checkIfExists(person)) {
      friends.add(person);
    } else {
      friends.remove(person);
    }
  }


}
