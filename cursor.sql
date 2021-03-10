--Universidad Laica Eloy Alfaro de Manabí
--Carlos Alberto Moya Vera
--Materia: Gestión de base de datos
--Docente: Ing. Robert Moreira Centeno, Mg

--Cursor

do $$
declare

        tabla record;
        ganadores cursor for SELECT jugador.jugador_nombre AS nombre, premiacion_line.partida_id AS id_de_partida FROM premiacion_line
		INNER JOIN jugador ON jugador.jugador_id = premiacion_line.jugador_id;

begin
open ganadores;
fetch ganadores into tabla;
while(found) loop
Raise notice 'Nombre del ganador: %, Id de la partida:  %', tabla.nombre, tabla.id_de_partida;
fetch ganadores into tabla;
end loop;
end $$
language 'plpgsql';