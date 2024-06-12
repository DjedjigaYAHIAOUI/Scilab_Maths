EXO 1

    Donnez sous forme de camembert la répartition des genres.
    pour rélisé ce camembert nous avons utilisé des commandes pour séparer les double des string et on les place dans des variables X et Y.
    X = csvRead('data.csv',[],[],'double') ==> les chiffres
    Y = csvRead('data.csv',[],[],'double') ==>female et males
    genre
    et enfin nous avons utilisé cette commande pour afficher le camembert
    pie([sum(find(genre == "Female")),sum(find(genre == "Male")),sum(find(genre == "Other"))])


    Donnez sous forme d'histogramme la répartition des niveaux d'études, suivants le genre.




    Donnez sous forme d'histogramme, les effectifs des 10 professions les plus représentées.


    Quelle est la profession la plus fréquente des femmes ? des hommes ?


    Pour chaque niveau d'études, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.


    Pour chaque genre, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.



EXO2

    Donnez sous forme d'histogrammes la distributions des ages.
    Donnez sous forme d'histogrammes la distributions de l'expérience.
    Donnez les quartiles, interquatiles, min,max, moyenne, mediane, mode, et ecart type de l'age.
    A l'aide du paquet stixbox, tracez une boite à moustache pour l'age.
    Refaire les questions précédentes pour l'expérience.









EXO3

    Donnez, sous forme d'histogramme la distribution des salaires, suivant le genre.
    Tracez un histogramme des salaires moyens suivants le niveau d'études.
    Donnez les quartiles, interquatiles, min,max, moyenne, mediane, et ecart type des salaires. Tracez une boite à moustaches.
    Refaire la question précédente, en distingant les genres. Tracez une boîte à moustache pour chaque genre. Commentaires ?

ExO4

    Tracez un nuage de points (age,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?
    Tracez un nuage de points (expérience,salaire), et la droite de regression correspondante. Quel est le coefficient de corrélation ?

ExO5

    Tracez un nuage de points (salaire,expérience) pour les hommes et les femmes, ainsi que les droites de regression associées. Commentaire ?
    Tracez un nuage de points (salaire,expérince) et les droites de regression associées pour chaque niveau d'études. Commentaire ?



Pour séparer les genres, je fais les commandes suivantes :
--> nb_bac1_homme = sum(etude == 1 & genre == "Male");
--> nb_bac2_homme = sum(etude == 2 & genre == "Male");
--> nb_bac3_hommes = sum(etude == 3 & genre == "Male");

--> nb_bac_femme = sum(etude == 0 & genre == "Female");
--> nb_bac1_femme = sum(etude == 1 & genre == "Female");
--> nb_bac2_femme = sum(etude == 2 & genre == "Female");
--> nb_bac3_femme = sum(etude == 3 & genre == "Female");

-> nb_bac_other = sum(etude == 0 & genre == "Other");
--> nb_bac1_other = sum(etude == 1 & genre == "Other");
--> nb_bac2_other = sum(etude == 2 & genre == "Other");
--> nb_bac3_other = sum(etude == 3 & genre == "Other");

Je crée 3 tableaux pour séparer les genres sur 
--> y_hommes = [nb_bac_homme; nb_bac1_homme; nb_bac2_homme; nb_bac3_hommes];
--> y_femmes = [nb_bac_femme; nb_bac1_femme; nb_bac2_femme; nb_bac3_femme];
--> y_other = [nb_bac_other; nb_bac1_other; nb_bac2_other; nb_bac3_other];

J'affiche ensuite le diagramme
--> legend("homme","femme","other")
--> bar([y_hommes y_femmes y_other], 'grouped');