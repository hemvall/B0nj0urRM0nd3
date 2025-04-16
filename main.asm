GPR_VAR        UDATA
somme		RES        1     ; Variable pour stocker la somme
i         RES        1     ; Compteur pour la boucle

;*******************************************************************************
; Vecteur de Reset
;*******************************************************************************
RES_VECT  CODE    0x0000            ; Vecteur de reset du processeur
    GOTO DEBUT                   ; Aller au début du programme

MAIN_PROG CODE                      ; Début du programme principal

DEBUT 
    CLRF somme                     ; Initialiser "somme" à 0
    MOVLW d'20'                    ; Charger la valeur 20 dans WREG
    MOVWF i                        ; Stocker WREG dans "i"
boucleAddition
    MOVF i, 0                      ; Charger la valeur de "i" dans WREG
    CPFSEQ somme                   ; Comparer "i" avec "somme"
    GOTO addition                  ; Si différent, aller à "addition"
    GOTO fin                       ; Sinon, aller à "fin"
addition
    ADDWF somme, 1                 ; Ajouter "i" à "somme" (mode indirect)
    DECF i, 1                      ; Décrémenter "i"
    GOTO boucleAddition            ; Retour à la boucle
fin
    GOTO $                         ; Boucle infinie pour arrêter le programme

    END
