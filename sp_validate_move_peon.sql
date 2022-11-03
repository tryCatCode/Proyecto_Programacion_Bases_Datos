CREATE OR REPLACE FUNCTION PR_VALIDATE_MOVE_PEON(P_ORIGIN_X NUMBER, P_ORIGIN_Y NUMBER, P_FINAL_X NUMBER, P_FINAL_Y NUMBER, COLOR_PIECE VARCHAR2, P_ID_GAME NUMBER)
RETURN VARCHAR2
IS
    Color_Chess_Piece VARCHAR2(7);
BEGIN
    IF(COLOR_PIECE = 'Negro') THEN

        IF(P_ORIGIN_Y > P_FINAL_Y) THEN

            IF(P_ORIGIN_X = 7 AND P_ORIGIN_X = P_FINAL_X AND P_ORIGIN_Y - 2 = P_FINAL_Y) THEN
                RETURN 'TRUE';
            ELSE

                IF(P_ORIGIN_X = P_FINAL_X AND P_ORIGIN_Y - 1 = P_FINAL_Y) THEN
                    RETURN 'TRUE';
                END IF;

                IF(P_ORIGIN_X + 1 = P_FINAL_X AND P_FINAL_Y - 1 = P_FINAL_Y) THEN
                    Color_Chess_Piece := PR_GET_COLOR_CHESS_PIECE(P_ORIGIN_X + 1, P_ORIGIN_Y - 1, P_ID_GAME);

                    IF(Color_Chess_Piece = 'Blanco' OR Color_Chess_Piece = 'Libre') THEN
                        RETURN 'TRUE';
                    ELSE
                        RETURN 'FALSE';
                    END IF;
                END IF;

                IF(P_ORIGIN_X - 1 = P_FINAL_X AND P_FINAL_Y - 1 = P_FINAL_Y) THEN
                    Color_Chess_Piece := PR_GET_COLOR_CHESS_PIECE(P_ORIGIN_X - 1, P_ORIGIN_Y - 1, P_ID_GAME);

                    IF(Color_Chess_Piece = 'Blanco' OR Color_Chess_Piece = 'Libre') THEN
                        RETURN 'TRUE';
                    ELSE
                        RETURN 'FALSE';
                    END IF;
                END IF;

                RETURN 'FALSE';
            END IF;    

        ELSE
            RETURN 'FALSE';   
        END IF;

    END IF;

    IF(COLOR_PIECE = 'Blanco') THEN

        IF(P_ORIGIN_Y < P_FINAL_Y) THEN
            
            IF(P_ORIGIN_X = 2 AND P_ORIGIN_X = P_FINAL_X AND P_ORIGIN_Y + 2 = P_FINAL_Y) THEN
                RETURN 'TRUE';
            ELSE

                IF(P_ORIGIN_X = P_FINAL_X AND P_ORIGIN_Y + 1 = P_FINAL_Y) THEN
                    RETURN 'TRUE';
                
                ELSIF(P_ORIGIN_X + 1 = P_FINAL_X AND P_ORIGIN_Y + 1 = P_FINAL_Y) THEN
                    Color_Chess_Piece := PR_GET_COLOR_CHESS_PIECE(P_ORIGIN_X + 1, P_ORIGIN_Y + 1, P_ID_GAME);

                    IF(Color_Chess_Piece = 'Negro' OR Color_Chess_Piece = 'Libre') THEN
                        RETURN 'TRUE';
                    ELSE
                        RETURN 'FALSE';
                    END IF;
                
                ELSIF(P_ORIGIN_X - 1 = P_FINAL_X AND P_ORIGIN_Y + 1 = P_FINAL_Y) THEN
                    Color_Chess_Piece := PR_GET_COLOR_CHESS_PIECE(P_ORIGIN_X - 1, P_ORIGIN_Y + 1, P_ID_GAME);

                    IF(Color_Chess_Piece = 'Negro' OR Color_Chess_Piece = 'Libre') THEN
                        RETURN 'TRUE';
                    ELSE
                        RETURN 'FALSE';
                    END IF;
                ELSE
                    RETURN 'FALSE';
                END IF;
            END IF;
        ELSE
            RETURN 'FALSE';
        END IF;
    END IF;
END;
/