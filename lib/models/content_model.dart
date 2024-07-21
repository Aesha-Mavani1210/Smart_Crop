class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Easy to Use',
      image: 'lib/images/k5.svg',
      discription: "Help farmers to manage their farming techniques with the help of advanced technologies. "
                  "These apps are not only helping in their day-to-day farming but also guiding them about new techniques."
  ),
  UnbordingContent(
      title: 'Chat with AI',
      image: 'lib/images/k6.svg',
      discription: "I algorithms can analyze the chemical composition of soil samples to determine which nutrients may be lacking."
          "AI can also identify or even predict crop diseases."

  ),
  UnbordingContent(
      title: 'Agri Store',
      image: 'lib/images/k7.svg',
      discription: "We can provide you with information about various agricultural products commonly found in stores.  "
          "Are you looking for information on fruits, vegetables or something else"

  ),
];