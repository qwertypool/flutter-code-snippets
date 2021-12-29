
// To create a list of items using listview ---
ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Your data',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),

