D = csvRead('data.csv');
DD = csvRead('data.csv',',','.','string');
genre = DD(:,3);
nb_homme = sum(genre == "Male");
nb_femme = sum(genre == "Female");
nb_other = sum(genre == "Other");

etude = D(:,4);

nb_bac_homme = sum(etude == 0 & genre == "Male");
nb_bac1_homme = sum(etude == 1 & genre == "Male");
nb_bac2_homme = sum(etude == 2 & genre == "Male");
nb_bac3_hommes = sum(etude == 3 & genre == "Male");

nb_bac_femme = sum(etude == 0 & genre == "Female");
 nb_bac1_femme = sum(etude == 1 & genre == "Female");
 nb_bac2_femme = sum(etude == 2 & genre == "Female");
 nb_bac3_femme = sum(etude == 3 & genre == "Female");

 nb_bac_other = sum(etude == 0 & genre == "Other");
 nb_bac1_other = sum(etude == 1 & genre == "Other");
 nb_bac2_other = sum(etude == 2 & genre == "Other");
 nb_bac3_other = sum(etude == 3 & genre == "Other");
 
 y_hommes = [nb_bac_homme; nb_bac1_homme; nb_bac2_homme; nb_bac3_hommes];
y_femmes = [nb_bac_femme; nb_bac1_femme; nb_bac2_femme; nb_bac3_femme];
y_other = [nb_bac_other; nb_bac1_other; nb_bac2_other; nb_bac3_other];


bar([y_hommes y_femmes y_other], 'grouped');
