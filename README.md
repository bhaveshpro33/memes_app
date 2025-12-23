
# 🎭 Dynamic Meme App- Vibeit (Flutter)

A Flutter-based mobile application that fetches **dynamic memes from Reddit** using the open-source **Meme API by D3vd** and automatically adapts its **UI theme colors** based on each meme image.

Each meme generates a unique look by dynamically changing the **background and card colors** using image color extraction.

---

## 🚀 Features

- 🔄 **Dynamic Meme Fetching**
  - Uses **Meme API (D3vd/Meme_Api)** to fetch memes from Reddit
- 🎨 **Dynamic UI Theme**
  - Background and card colors change automatically using **Palette Generator**
- 🖼️ **Optimized Image Loading**
  - Uses **CachedNetworkImage** for smooth scrolling and improved performance
- 🔗 **View Original Post**
  - Opens the **original Reddit post** in browser using shortened `redd.it` links
- 📱 **Clean & Responsive UI**
  - Modern Flutter UI with smooth animations

---

## 🛠️ Tech Stack & Packages

- **Flutter**
- **Dart**
- **Meme API** – https://github.com/D3vd/Meme_Api
- **palette_generator**
- **cached_network_image**
- **url_launcher**

---

## 🧠 How It Works

1. Memes are fetched from **Meme API**, which sources content from Reddit
2. Meme image URL is loaded using **CachedNetworkImage**
3. Dominant colors are extracted using **Palette Generator**
4. App background & card colors update dynamically
5. Clicking **View Post** redirects to the original Reddit post in browser

---

---

## 📦 Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/dynamic-meme-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd dynamic-meme-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

---

## 🔐 Permissions Used

* Internet access (for Meme API & images)

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

---

## 📌 API Credit

This project uses the **open-source Meme API** created by
**D3vd**
🔗 [https://github.com/D3vd/Meme_Api](https://github.com/D3vd/Meme_Api)

All meme content belongs to their respective Reddit creators.

---

## 🎯 Learning Outcomes

This project helped me understand:

* API integration in Flutter
* Dynamic UI theming using image color extraction
* Handling shortened URLs (`redd.it`)
* Performance optimization using image caching

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to fork this repository and submit a pull request.

---

## ⭐ Support

If you like this project, please give it a ⭐ on GitHub!

---

## 📬 Contact

**Developer:** Bhavesh Kondaskar
**Tech:** Flutter | Mobile Development

---

### 🔖 Tags

`Flutter` `Meme API` `Reddit` `Dynamic UI` `Mobile App` `Open Source`

