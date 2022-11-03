DECLARE
    TYPE RECTYPE IS RECORD
    (
        VALUE1 BOOLEAN,
        VALUE2 NUMBER,
        VALUE3 NUMBER
    );
    TYPE TBLTYPE IS TABLE OF RECTYPE;
    TYPE TblOfTblType IS TABLE OF TBLTYPE;  
    matrix TblOfTblType := TblOfTblType();
BEGIN 
    matrix.EXTEND(3);

    FOR i IN 1..matrix.COUNT LOOP
        matrix(i) := TBLTYPE();
        matrix(i).EXTEND(4);

        FOR j IN 1..matrix(i).COUNT LOOP
            matrix(i)(j).VALUE1 := i;
            matrix(i)(j).VALUE2 := j;
            matrix(i)(j).VALUE3 := DBMS_RANDOM.VALUE;
        END LOOP;
    END LOOP;   

    FOR i IN 1..matrix.COUNT LOOP
        FOR j IN 1..matrix(i).COUNT LOOP
            DBMS_OUTPUT.PUT( '[' || matrix(i)(j).value1
                    || ',' || matrix(i)(j).value2
                    || ',' || matrix(i)(j).value3 || ']' || CHR(11) );
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/