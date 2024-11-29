# pinapp_challenge

Flutter Challenge - Desafío para PinApp, en esta aplicación implementamos el consumo de una API y la visualización de los datos obtenidos en la pantalla de "Posteos" y "Comentarios", HomePage y PostDetailPage respectivamente.

## Dependencias

- app_client: Paquete local ubicado en packages/app_client
- cupertino_icons: ^1.0.6
- dio: ^5.7.0
- equatable: ^2.0.7
- flutter (SDK de Flutter)
- flutter_bloc: ^8.1.6
- flutter_dotenv: ^5.2.1
- gap: ^3.0.1
- go_router: ^14.6.1

## Dependencias de desarrollo

- flutter_test (SDK de Flutter)
- flutter_lints: ^3.0.0

## A tener en cuenta

Esta aplicación consume la URL de la API desde un archivo [.env] en la raíz del proyecto, para esta demostración y mayor facilidad a la hora de testear, el archivo [.env] está subido al repositorio junto al resto del proyecto, esta no es una práctica recomendable y solo se llevó a cabo por los movitos ya explicados, además de no contener ningún tipo de información sensible ya que está URL es pública.
