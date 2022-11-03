CREATE OR REPLACE FUNCTION PR_VALIDATE_MOVE_ALFIN(P_ORIGIN_X NUMBER, P_ORIGIN_Y NUMBER, P_FINAL_X NUMBER, P_FINAL_Y NUMBER) 
RETURN VARCHAR2
IS
    NEW_X NUMBER(2);
    NEW_Y NUMBER(2);
BEGIN
    NEW_X := P_ORIGIN_X;
    NEW_Y := P_ORIGIN_Y;
    IF P_ORIGIN_X < P_FINAL_X AND P_ORIGIN_Y < P_FINAL_Y THEN
        FOR X in 1..8 LOOP
            NEW_X := NEW_X + 1;
            NEW_Y := NEW_Y + 1;

            IF NEW_Y > 8 OR NEW_X > 8 THEN
                RETURN 'FALSE';
            END IF;

            IF NEW_Y = P_FINAL_Y AND NEW_X = P_FINAL_X THEN
                RETURN 'TRUE';
            END IF;
        END LOOP;
        RETURN 'FALSE'; 
    END IF;

    IF (P_ORIGIN_X > P_FINAL_X AND P_ORIGIN_Y > P_FINAL_Y) THEN
        FOR X IN 1..8 LOOP
            NEW_X := NEW_X - 1;
            NEW_Y := NEW_Y - 1;

            IF(NEW_X < 1 OR NEW_Y < 1) THEN
                RETURN 'FALSE';
            END IF;

            IF NEW_Y = P_FINAL_Y AND NEW_X = P_FINAL_X THEN
                RETURN 'TRUE';
            END IF;
        END LOOP;
        RETURN 'FALSE';
    END IF;

    IF(P_ORIGIN_X < P_FINAL_X AND P_ORIGIN_Y > P_FINAL_Y) THEN
        FOR X IN 1..8 LOOP
            NEW_X := NEW_X + 1;
            NEW_Y := NEW_Y - 1;

            IF(NEW_X > 8 OR NEW_Y < 1) THEN
                RETURN 'FALSE';
            END IF;

            IF NEW_Y = P_FINAL_Y AND NEW_X = P_FINAL_X THEN
                RETURN 'TRUE';
            END IF;
        END LOOP;
        RETURN 'FALSE';
    END IF;

    IF(P_ORIGIN_X > P_FINAL_X AND P_ORIGIN_Y < P_FINAL_Y) THEN
        FOR X IN 1..8 LOOP
            NEW_X := NEW_X - 1;
            NEW_Y := NEW_Y + 1;

            IF(NEW_X < 1 OR NEW_Y > 8) THEN
                RETURN 'FALSE';
            END IF;

            IF NEW_Y = P_FINAL_Y AND NEW_X = P_FINAL_X THEN
                RETURN 'TRUE';
            END IF;
        END LOOP;
        RETURN 'FALSE';
    END IF;
    RETURN 'FALSE';
END;
/