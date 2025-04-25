
import "profilecard.dart";

class _HomePageState extends State<HomePage> {
  final Set<String> unlockedProfiles = {};

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
            final isUnlocked = unlockedProfiles.contains(profile.name);
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
              child: ProfileCard(
                profile: profile,
                isUnlocked: isUnlocked,
                onChatPressed: () {
                  if (userTokens > 0) {
                    setState(() {
                      userTokens--;
                      unlockedProfiles.add(profile.name);
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
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

