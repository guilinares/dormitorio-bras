export const environment = {
    production: false,
    firebase: {
        apiKey: (window as any).__env?.apiKeyFirebase,
        authDomain: "dormitorio-bras.firebaseapp.com",
        projectId: "dormitorio-bras",
        storageBucket: "dormitorio-bras.firebasestorage.app",
        messagingSenderId: "774952298886",
        appId: "1:774952298886:web:664aa17340ee841e4ea407",
        measurementId: "G-3Y2NEHPLKV"
    }
  };