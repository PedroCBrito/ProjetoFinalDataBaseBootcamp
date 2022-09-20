use mecanic;

insert into person(Name , CPF, Adress, Telefone ) values
					('Claudio','74587466225','Itu', '1152012014'),
 					('Ana','51554232556','Sao Paulo', '9886535237'), 
 					('Roberto','75452211233','Itu', '2102145789'),
 					('Pedro','67549184516','Sao Paulo', '3214569875'),
 					('Mauro','67526434213','Sao Paulo', '325698563'),                   
					('Maria','95794675467','Belo Horizonte', '9874587456'),
                    ('Jose','13246579789','Belo Horizonte', '3256325639'),
                    ('Angelica','97854641325','Itu', '7845632598'),
                    ('Eloisa','75845454545','Belo Horizonte', '1234657986'),
                    ('Carlos','64062301664','Sao Paulos', '6457894657'),
                    ('Daniel','01502524502','Belo Horizonte', '97643125403'),
                    ('Roberta','0105245205','Rio de Janeiro', '01346758413');


                        
insert into clients (idCPerson ) values
						(6),
                        (7),
                        (9),
                        (10),
                        (11),
                        (12);
                        
                      
                      
 insert into equip (Speciality)  values   
					('Motor'),
                    ('Combustivel'),
                    ('Borracheiro');


insert into functionary (idFPerson, Speciality, idFEquip ) values
						(1,'Motor', 1),
                        (3,'Borracheiro', 3),
                        (4,'Combustivel', 1),
                        (5,'Combustivel', 2),
                        (2,'Combustivel', 2),
						(8,'Interno', 3);
                        
	
  
             
insert into vehicle (idVClients, idVEquip, Motive, Board, KMs, Defect) values
					(1,1,'Conserto','fnw4578',45000,'Barulho no motor'),
                    (2,1,'Revisao','fer4578',30000, null),
					(3,3,'Conserto','rrs4578',152000,'Banco descascando'),   
                    (5,2,'Revisao','rse7858',10020, null),  
                    (5,2,'Revisao','epo7852',45880, null);
                    

insert into os (idOSvehicle, DeliveryDate, TotalPrice, Status, CompleticionDate) values
				(1,'2022-2-15',650.00, 'Aguardando', '2022-2-20'),
                (2,'2022-2-17',100.00, 'Em processo', '2022-2-27'),
                (3,'2022-2-26',155.00, 'Aguardando', '2022-3-7'),
                (4,'2022-2-22',100.00, 'Em processo', '2022-3-5'),
                (5,'2022-2-25',150.00, 'Finalizado', '2022-3-10');
                
 insert into labor ( Service ) values
					 ('Manutencao no motor'),
                     ('Lubrificacao no motor'),
                     ('Revisao'),
                     ('Reforma interna');
                     
               
                
insert into service (idSlabor, idSOs, Price) values
					(3, 2, 100.00),
                    (3, 4, 100.00 ),
                    (3, 5, 150.00 ),
                    (1, 1 , 250.00 ),
                    (4, 5, 120.00 );
                    
                    
insert into part ( Name, Price, Category, Brand, Observation) values
				('Pistao',400.00,'Motor','Starret', null),
                ('Capa couro',30.00,'Interno','Touroll', null);
                

insert into partOS (idPOs, idPPart, Quantity) values
				  (1,1,1 ),
                  (5,2,1);
                  
                  
								

-- Quem sao os clientes?
select p.Name, p.CPF , p.Adress, p.Telefone from person as p
		inner join clients as c ON p.idPerson = c.idCPerson;
        
-- Quem sao os funcionarios?
select p.Name, p.CPF , p.Adress, p.Telefone from person as p
		inner join functionary as f ON p.idPerson = f.idFPerson;                
                
-- Veiculos e seus donos que estao em aguardo
select p.Name, p.Telefone, v.Board as Placa, v.Defect as Defeito, o.Status  from os as o
		inner join vehicle as v ON v.idVehicle = o.idOsVehicle
        inner join clients as c ON c.idClients = v.idVClients
        inner join person as p ON p.idPerson = c.idCPerson
        where o.Status = 'Aguardando';
        
        
-- Valor da Os total, Peca e Servico
select o.idOs as OS, o.TotalPrice as Valor_total, s.price as Valor_Servico, p.price as Valor_Peca, o.Status  from os as o
		inner join service as s ON o.idOs = s.idSOs
        inner join labor as l ON s.idSlabor = l.idLabor
        inner join partOS as po ON po.idPOs = o.idOs
        inner join part as p ON po.idPPart = p.idPart;
        
        
-- Funcionarios de cada equipe
select p.Name as Nome, f.Speciality as Especialidade_Funcionario, e.idEquip as Equipe, e.Speciality as Especialidade_Equipe from equip as e
		inner join functionary as f ON f.idFEquip = e.idEquip
        inner join person as p ON p.idPerson = idFPerson
        order by e.idEquip;

