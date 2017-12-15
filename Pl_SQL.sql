
-- I decided to write a PL/SQL function that would let a user add a new disease to the list of diseases
SET serveroutput ON
DECLARE
  v_dname supplier.supplierName%TYPE           := '&Enter_Disease_Name';
  v_ddesc supplier.supplierAddress%TYPE    := '&Enter_Disease_Desc';


BEGIN

  INSERT INTO disease(diseaseName,diseaseDesc) VALUES (v_dname,v_ddesc);
  COMMIT;
  dbms_output.put_line(v_dname ||' is added to the list of diseases ');

EXCEPTION
WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Error number '||SQLCODE||
      ' meaning '||SQLERRM||'. Rolling back...');
  ROLLBACK;

END;