create or replace procedure PR_CREATE_PLAYER(NAME_PLAYER VARCHAR2) AS
    CURSOR CPLAYER IS SELECT NAME FROM TBL_PLAYER;
    VATTEMPTS NUMBER(10,5):=0;
        BEGIN 
            --this loop valid that name_player not exist
            --if exist name_player,vattempts increase 1 to 1
            FOR PLAYER  IN CPLAYER LOOP
                IF LOWER(NAME_PLAYER)=LOWER(PLAYER.NAME) THEN 
                    IF VATTEMPTS=0 THEN
                        VATTEMPTS:=1;
                ELSE 
                        VATTEMPTS:=VATTEMPTS+1;
                    END IF;
                END IF;
                END LOOP;
                --if exist display message,if not exist proceed to insert into tbl_player
                IF VATTEMPTS<>0THEN 
                     DBMS_OUTPUT.PUT_LINE('El usuario ya existe,por favor ingresar otro.'); 
                ELSE
                    insert into TBL_PLAYER(NAME)
                    values(NAME_PLAYER);
                    DBMS_OUTPUT.PUT_LINE('Se ha creado el usuario exitosamente');
                END IF;

END PR_CREATE_PLAYER;
/