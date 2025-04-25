
int userTokens = 10;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jetonlar: $userTokens"),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Stack(
          children: profiles.map((profile) {
            return Swipable(
              onSwipeRight: (finalPosition) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Beğendin: ${profile.name}")),
                );
              },
              onSwipeLeft: (finalPosition) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Beğenmedin: ${profile.name}")),
                );
              },
              child: ProfileCard(profile: profile, onChatPressed: () {
                if (userTokens > 0) {
                  setState(() {
                    userTokens--;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ChatPage(name: profile.name)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Yeterli jeton yok!")),
                  );
                }
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final VoidCallback onChatPressed;

  const ProfileCard({super.key, required this.profile, required this.onChatPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              "${profile.name}, ${profile.age}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              profile.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onChatPressed,
              child: const Text("Sohbete Başla"),
            ),
          ],
        ),
      ),
    );
  }
}

