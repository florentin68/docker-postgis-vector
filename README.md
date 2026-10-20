# docker-postgis-vector

Image Docker pour exécuter PostgreSQL avec PostGIS et gérer des données géographiques et vectorielles.

## Construire l’image

À la racine du dépôt :

```bash
docker build -t docker-postgis-vector .
```

## Démarrer un conteneur

```bash
docker run --name postgis-vector \
  -e POSTGRES_PASSWORD=change-me \
  -p 5432:5432 \
  -d docker-postgis-vector
```

Définissez un mot de passe sécurisé pour tout usage autre qu’un environnement local. PostgreSQL est accessible sur le port `5432` depuis l’hôte. Pour conserver les données après la suppression du conteneur, configurez un volume persistant selon le répertoire de données défini par l’image.

## Activer PostGIS

Connectez-vous à la base souhaitée, puis activez l’extension :

```sql
CREATE EXTENSION postgis;
```

Répétez cette commande dans chaque base de données qui doit utiliser PostGIS. Les extensions disponibles dépendent de celles installées dans l’image.

## Personnalisation

Modifiez le `Dockerfile` pour adapter l’image de base, les extensions installées ou la configuration du service.

## Licence

Ce projet est distribué sous licence Unlicense (Unported License).
