

select * from tblcursos;
select * from tblestados;
  select * from tblalunos;
  
INSERT INTO tblestados VALUES (102, 'AC');
INSERT INTO tblestados VALUES (103, 'MG');
  
INSERT INTO tblalunos (aluid, alunome, alunomesocial, alucpf, alurg, curid, estid)
              VALUES  (3, 'BRUNA S', 'BRUNA S', 242424, '232323', 10, 100);            
INSERT INTO tblalunos (aluid, alunome, alunomesocial, alucpf, alurg, curid, estid)
              VALUES  (4, 'MARIA IMP', 'MARCIA', 242425, '232326', 11, 101);           
INSERT INTO tblalunos (aluid, alunome, alunomesocial, alucpf, alurg, curid, estid)
              VALUES  (5, 'PAULO B', 'PAULO B', 242426, '232325', 11, 101);
             

 select aluid, alunome, alunomesocial, alucpf, alurg, curid, estid 
   from tblalunos
  WHERE estid >= 100;
  
DELETE FROM tblestados
 WHERE estid >= 100; 
 
DELETE FROM tblalunos;