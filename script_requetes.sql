/*Le script SQL permettant d'exécuter les requêtes de test*/

/*1 - Afficher la liste des noms des focaccias par ordre alphabétique croissant*/

SELECT nom from foccacia
order by nom asc;
/*Résultat attendu : listing des noms des foccacia rangé par ordre croissant
Résultat obtenu : 
Américaine
Emmentalaccia
Gorgonzollaccia
Hawaienne
Mozaccia
Paysanne
Raclaccia
Tradizione*/

/*2 - Afficher le nombre total d'ingrédients,*/

SELECT count(*) AS Nombre_total_ingredient from ingredient
Résultat attendu 25
Résultat obtenu : 25

/*3 -Afficher le prix moyen des focaccias,*/

SELECT AVG(prix) AS prix_moyen from foccacia;
/*Résultat attendu 10,375
Résultat obtenu : 10,375*/

/*4 - Afficher la liste des boissons avec leur marque, triée par nom de boisson,*/

SELECT b.nom as nom_boisson, m.nom as Marque from boisson b
left join marque m on b.id_marque = m.id_marque
order by b.nom asc;

/*Résultat attendu 2 colonnes : nom des boisson et nom des marques rangé par ordre croissant sur le nom des boisson*/

/*Résultat obtenu : 

Capri-sun	Coca-cola
Coca-cola original	Coca-cola
Coca-cola zéro	Coca-cola
Eau de source 	Cristalline
Fanta citron	Coca-cola
Fanta orange	Coca-cola
Lipton Peach	Pepsico
Lipton zéro citron	Pepsico
Monster energy ultra blue	Monster
Monster energy ultra gold	Monster
Pepsi	Pepsico
Pepsi Max Zéro	Pepsico*/


/*5 - Afficher la liste des ingrédients pour une Raclaccia,*/

SELECT i.nom as ingredient  from foccacia f
left join foccacia_ingredient fi on f.id_foccacia = fi.id_foccacia
left join ingredient i on fi.id_ingredient = i.id_ingredient
where f.nom = 'Raclaccia'


/*Résultat attendu : Base tomate, raclette, cresson, ail, champignon, parmesan, poivre*/

/*Résultat obtenu : 

Ail
Base Tomate
Champignon
Cresson
Parmesan
Poivre
Raclette*/


/*6 - Afficher le nom et le nombre d'ingrédients pour chaque foccacia,*/

SELECT f.nom, count(fi.id_ingredient) as nombre_ingredient from foccacia f
left join foccacia_ingredient fi on f.id_foccacia = fi.id_foccacia
group by f.nom

/*Résultat attendu 2 colonnes : nom des foccacia ainsi que le nombre d’ingredients*/

/*Résultat obtenu : 

Mozaccia	10
Gorgonzollaccia	8
Raclaccia	7
Emmentalaccia	7
Tradizione	9
Hawaienne	9
Américaine	8
Paysanne	12*/


/*7 - Afficher le nom de la focaccia qui a le plus d'ingrédients,*/

SELECT f.nom, count(fi.id_ingredient) as nombre_ingredient from foccacia f
left join foccacia_ingredient fi on f.id_foccacia = fi.id_foccacia
group by f.nom
ORDER BY nombre_ingredient DESC
LIMIT 1;

/*Résultat attendu Paysanne : 12
Résultat obtenu : 

Paysanne	12*/





/*8 - Afficher la liste des focaccia qui contiennent de l'ail,*/

SELECT f.nom from foccacia f
left join foccacia_ingredient fi on f.id_foccacia = fi.id_foccacia
left join ingredient i on fi.id_ingredient = i.id_ingredient
WHERE i.nom = "Ail"

/*Résultat attendu Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne*/

/*Résultat obtenu : 

Mozaccia
Gorgonzollaccia
Raclaccia
Paysanne*/

/*9 - Afficher la liste des ingrédients inutilisés,*/

SELECT i.id_ingredient, i.nom
FROM ingredient i
LEFT JOIN foccacia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL;

/*Résultat attendu Salami et tomate cerise*/

/*Résultat obtenu : 

23	Salami	
24	Tomate cerise	*/


/*10 - Afficher la liste des focaccia qui n'ont pas de champignons.*/

SELECT f.nom
FROM foccacia f
WHERE f.id_foccacia NOT IN (
    SELECT fi.id_foccacia
    FROM foccacia_ingredient fi
    JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);

/*Résultat attendu Hawaienne et Américaine
Résultat obtenu : 

Hawaienne
Américaine*/
