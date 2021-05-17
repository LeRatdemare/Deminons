/*
Ce fichier ne dois(en théorie) contenir que des règles 
ou autres informations sur le jeu, ainsi que les importations
nécessaires(seul partie "code" du fichier à priori).
*/

//////////////////////////////////////////////////////////////////
////////////////////////Importations//////////////////////////////
//////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////
////////////////////////Règles du jeu/////////////////////////////
//////////////////////////////////////////////////////////////////


/*Le deminons se joue sur un terrain composé d'une ou plusieurs grilles
*de demineur sur laquelle se trouvent également des obstacles.
*
*Des bombes apparaîtront aléatoirement sur le terrain à interval de temps
*régulier et l'objectif des joueurs est de marquer un maximum de points dans
*le temps impartis sans tomber à 0 de vie.
*
*Des bonus peuvent appraître à tout moment sur des cases libres afin
*d'aider les joueurs. Mais aussi des malus héhé.
*
*Chaque joueur a la possibilité de se déplacer, de régler sa jauge de power
*afin d'utiliser ses bonus à un niveau équivalent, ainsi que consommer 1 de power pour
*poser un drapeau là où il pense que se trouve une bombe et ainsi la neutraliser.
*Si il se trompe, il consomme seulement 1 power, sinon, il marque 1 point et
*la case qui contenait la bombe est neutralisée un certain temps.
*Il a également la possibilité de révéler une case, dans ce cas, si c'est une bombe
*il perd une vie, sinon il récupère 1 de power et a une chance de récupérer un
*bonus/malus au passage.
*
*La partie se termine lorsque tous les joueurs sont tombés à 0 de vie, ou si ils
*ont réussi à survivre jusqu'à la fin du temps impartis.
*Dans ce cas, on ajoute au total de points marqués par chacun (le nombre de vie
*qu'il leur reste)*5.
*/
