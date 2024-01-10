class FlashMessageScreen extends StatelessWidget{
  const FlashMessageScreen({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevateButton(
          onPressed:(){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Credential not correct"),
                ),
              );
          },
            child: const Text("Show Message"),          
        ),
      ),
    );
  }
}