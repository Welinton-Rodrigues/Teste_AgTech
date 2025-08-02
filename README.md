# teste_vaga_agtech

Observação importante
Este projeto foi desenvolvido durante o processo seletivo para a vaga de Desenvolvedor Mobile Flutter.

No dia do teste, realizei o commit do projeto, porém os arquivos não foram corretamente enviados ao repositório — possivelmente por ter esquecido de executar algum comando do Git, como o git push. Peço desculpas por esse equívoco.

Assim que identifiquei o problema, subi os arquivos exatamente como estavam no momento da entrega do teste, sem realizar nenhuma alteração ou correção no código original e apenas alterações no README.md foram feitas.

Pretendo criar um novo repositório com as devidas correções, melhorias e otimizações, a fim de demonstrar minha evolução técnica e atenção aos detalhes.

Agradeço pela compreensão.
## Getting Starte

This project is a starting point for a Flutter application.

## adicione as dependencias no pubspec.yaml
1. Adicione em dependencies:
   hive: ^2.2.3
   hive_flutter: ^1.1.0

2.Adicione em dev_dependencies:
hive_generator: ^2.0.1
build_runner: ^2.4.9

3.No terminal, dentro da pasta raiz do projeto, rode:
flutter pub get

4. Rode o comando "flutter packages pub run build_runner build".
Isso irá gerar o arquivo user_model.g.dart contendo as funções geradas com base no modelo definido em user_model.dart.

5. Por fim, você pode tentar rodar o projeto com 'flutter run -d chrome'. No entanto, ele não irá funcionar corretamente devido a um erro de sintaxe na classe home_screen.dart, que será corrigido em um novo repositório.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
