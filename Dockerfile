FROM ubuntu:latest

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    pandoc \
    python3 \
    python3-pip \
    texlive-full \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Création d'un lien symbolique pour que 'python' pointe vers 'python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

# Création des dossiers pour les templates et filtres personnalisés
RUN mkdir -p /usr/share/pandoc/templates \
    /usr/local/share/pandoc/filters \
    /usr/local/share/texmf/tex/latex/local

# Copie des fichiers personnalisés (à adapter selon vos besoins)
COPY custom-latex /usr/local/share/texmf/tex/latex/local/
COPY pandoc-filters /usr/local/share/pandoc/filters/
COPY pandoc-templates /usr/share/pandoc/templates/

# Mise à jour de la base de données de TeXLive
RUN texhash

# Installation de packages latex
#https://distrib-coffee.ipsl.jussieu.fr/pub/mirrors/ctan/
#RUN tlmgr init-usertree
##RUN tlmgr update --self --all
#RUN tlmgr update --all --repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet
#RUN tlmgr install latexmk
#RUN tlmgr install pst-all

# Copie du script entrypoint dans le conteneur
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Définition du répertoire de travail
WORKDIR /data

# Utilisation du script entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]