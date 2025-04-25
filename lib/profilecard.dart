
import "dart:ui";

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final VoidCallback onChatPressed;
  final bool isUnlocked;

  const ProfileCard({super.key, required this.profile, required this.onChatPressed, this.isUnlocked = false});

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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: isUnlocked
                  ? const Icon(Icons.person, size: 100, color: Colors.grey)
                  : ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: const Icon(Icons.person, size: 100, color: Colors.grey),
                    ),
            ),
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

