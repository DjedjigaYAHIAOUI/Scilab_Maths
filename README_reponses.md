# Data Analysis Report

<div style="background-color: #f0f8ff; border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
    <h2>Question 1</h2>
    Donnez sous forme de camembert la répartition des genres.
</div>
<div style="background-color: #e6ffe6; border: 1px solid #b3b3b3; padding: 10px; margin: 10px 0;">
    <h2>Réponse</h2>
    <pre>
    repense genre = tabul(csvString(:,3),"i")
        ->genre(1)
        ->genre(2)
    pie(genre(2),genre(1))
    </pre>
    <img src="camembert_genre_1.1.png" alt="Répartition des genres">
</div>

<div style="background-color: #f0f8ff; border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
    <h2>Question 2</h2>
    Donnez sous forme d'histogramme la répartition des niveaux d'études, suivants le genre.
</div>
<div style="background-color: #e6ffe6; border: 1px solid #b3b3b3; padding: 10px; margin: 10px 0;">
    <h2>Réponse</h2>
    <pre>
    genre_lvl = [csvString(:,3),csvString(:,4)]
    high_homme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Male"))
    high_femme = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Female"))
    high_autre = length(find(genre_lvl(:,2) == "0" & genre_lvl(:,1) == "Other"))

    b_homme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Male"))
    b_femme = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Female"))
    b_autre = length(find(genre_lvl(:,2) == "1" & genre_lvl(:,1) == "Other"))

    m_homme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Male"))
    m_femme = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Female"))
    m_autre = length(find(genre_lvl(:,2) == "2" & genre_lvl(:,1) == "Other"))

    d_homme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Male"))
    d_femme = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Female"))
    d_autre = length(find(genre_lvl(:,2) == "3" & genre_lvl(:,1) == "Other"))

    temp = [high_homme, high_femme, high_autre;b_homme, b_femme, b_autre;m_homme, m_femme, m_autre;d_homme, d_femme, d_autre]
    lvlEtude = [0,1,2,3]
    bar(lvlEtude,temp);
    legend("homme","femme","autre")
    </pre>
    <img src="niveaux_etude_1_2.png" alt="Répartition des niveaux d'études suivant le genre">
</div>

<div style="background-color: #f0f8ff; border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
    <h2>Question 3</h2>
    Donnez sous forme d'histogramme, les effectifs des 10 professions les plus représentées.
</div>
<div style="background-color: #e6ffe6; border: 1px solid #b3b3b3; padding: 10px; margin: 10px 0;">
    <h2>Réponse</h2>
    <pre>
    metiers = tabul(csvString(:,5),"i")
    [occu,indice] = gsort(metiers(2))
    profession = metiers(1)
    matrice_occurence = [occu(1:1),occu(2:2),occu(3:3),occu(4:4),occu(5:5),occu(6:6),occu(7:7),occu(8:8),occu(9:9),occu(10:10)]
    bar(matrice_occurence)
    legend(profession(indice(1:10)))
    </pre>
</div>

<div style="background-color: #f0f8ff; border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
    <h2>Question 4</h2>
    Quelle est la profession la plus fréquente des femmes ? des hommes ?
</div>
<div style="background-color: #e6ffe6; border: 1px solid #b3b3b3; padding: 10px; margin: 10px 0;">
    <h2>Réponse</h2>
    <pre>
    indice_female = find(csvString(:,3) == "Female")
    [valeurs] = csvString(indice_female,5)
    metiers_female = tabul(valeurs)
    [occurence_tri,indice_tri] = gsort(metiers_female(2))
    liste_metiers_female = metiers_female(1)
    liste_metiers_female(119)

    indice_male = find(csvString(:,3) == "Male")
    [valeurs2] = csvString(indice_male,5)
    metiers_male = tabul(valeurs2)
    [occurence_tri,indice_tri] = gsort(metiers_male(2))
    liste_metiers_male = metiers_male(1)
    liste_metiers_male(11)
    </pre>
    <p>homme = Software Engineer</p>
    <p>femme = Data Scientist</p>
</div>

<div style="background-color: #f0f8ff; border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
    <h2>Question 5</h2>
    Pour chaque niveau d'études, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.
</div>
<div style="background-color: #e6ffe6; border: 1px solid #b3b3b3; padding: 10px; margin: 10px 0;">
    <h2>Réponse</h2>
    <pre>
    indice_high = find(csvDouble(:,4) == 0)
    salaire_high = csvDouble(indice_high,7)
    mean(salaire_high)                                      //36706.694
    age_high = csvDouble(indice_high,2)
    mean(age_high)                                          //26.854911
    exp_high = csvDouble(indice_high,6)
    mean(exp_high)                                          //1.9151786

    indice_b = find(csvDouble(:,4) == 1)
    salaire_b = csvDouble(indice_b,7)
    mean(salaire_b)                                         //95082.909
    age_b = csvDouble(indice_b,2)
    mean(age_b)                                             //30.260179
    exp_b = csvDouble(indice_b,6)
    mean(exp_b)                                             //5.4195631

    indice_m = find(csvDouble(:,4) == 2)
    salaire_m = csvDouble(indice_m,7)
    mean(salaire_m)                                         //130112.06
    age_m = csvDouble(indice_m,2)
    mean(age_m)                                             //35.171505
    exp_m = csvDouble(indice_m,6)
    mean(exp_m)                                             //9.6456989

    indice_p = find(csvDouble(:,4) == 3)
    salaire_p = csvDouble(indice_p,7)
    mean(salaire_p)                                         //165651.46
    age_p = csvDouble(indice_p,2)
    mean(age_p)                                             //41.154858
    exp_p = csvDouble(indice_p,6)
    mean(exp_p)                                             //13.915267
    </pre>
</div>

<div style="background-color: #f0f8ff; border: 1px solid #ccc; padding: 10px; margin: 10px 0;">
    <h2>Question 6</h2>
    Pour chaque genre, donnez le salaire moyen, l'âge moyen et l'expérience moyenne.
</div>
<div style="background-color: #e6ffe6; border: 1px solid #b3b3b3; padding: 10px; margin: 10px 0;">
    <h2>Réponse</h2>
    <pre>
    indice_6_female = find(csvString(:,3) == "Female")
    salaire_female = csvDouble(indice_6_female,7)
    mean(salaire_female)                                    //104233.96
    age_female = csvDouble(indice_6_female,2)
    mean(age_female)                                        //32.679245
    exp_female = csvDouble(indice_6_female,6)
    mean(exp_female)                                        //7.264151

    indice_6_male = find(csvString(:,3) == "Male")
    salaire_male = csvDouble(indice_6_male,7)
    mean(salaire_male)                                      //109176.81
    age_male = csvDouble(indice_6_male,2)
    mean(age_male)                                          //32.535087
    exp_male = csvDouble(indice_6_male,6)
    mean(exp_male)                                          //7.1666665

    indice_6_other = find(csvString(:,3) == "Other")
    salaire_other = csvDouble(indice_6_other,7)
    mean(salaire_other)                                     //96417.645
    age_other = csvDouble(indice_6_other,2)
    mean(age_other)                                         //30.441176
    exp_other = csvDouble(indice_6_other,6)
    mean(exp_other)                                         //5.838235
    </pre>
</div>

  
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

[def]: camembert_genre_1.1.png