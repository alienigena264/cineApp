// cSpell:disable
# cinemapedia

#Dev

1. Copiar y renombrar el .env.template
2. Asignar su propio apiKey de moviedb
3: cambios en la entidad usar flutter pub run build_runner build

#Prod
Dev dependencies

Para cambiar el nombre:
flutter pub run change_app_package_name:main com.alienigena264.cinemapedia
--
Para cambiar el icono de la app:
flutter pub run flutter_launcher_icons

--
Para cambiar el splash screen:
dart run flutter_native_splash:create

--
Para crear la key:
- keytool -genkey -v -keystore C:\Users\juani\Documents\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
//Para cambiar a un formato aceptado usar esto(Obligatorio desde windows)
- keytool -importkeystore -srckeystore  C:\Users\juani\Documents\upload-keystore.jks -deststoretype pkcs12 

--
Android AAB (Aplication bundle)
flutter build appbundle
/* cSpell:enable */

