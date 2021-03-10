--Universidad Laica Eloy Alfaro de Manabí
--Carlos Alberto Moya Vera
--Materia: Gestión de base de datos
--Docente: Ing. Robert Moreira Centeno, Mg

--Trigger

create or replace function tg_asignartabla() returns trigger
as
$tg_asignartabla$
    declare
        jugadorid integer;
		partidaid integer;
		cantidad integer;
begin
        SELECT jp.jugador_id, jp.partida_id INTO jugadorid, partidaid FROM jugador_partida jp
		WHERE jp.jugador_partida_id = new.jugador_partida_id;
		
		SELECT COUNT (*) INTO cantidad FROM tabla 
		INNER JOIN tabla_jugador_partida tjp ON tjp.tabla_id = tabla.tabla_id
		INNER JOIN jugador_partida jp ON jp.jugador_partida_id = tjp.jugador_partida_id
		INNER JOIN partida ON jp.partida_id = partida.partida_id
		INNER JOIN jugador ON jugador.jugador_id = jp.jugador_id
		WHERE jugador.jugador_id = jugadorid AND partida.partida_id = partidaid;
        
		if(cantidad=3) then
            raise exception 'Se ha alcanzado el numero maximo de tablas por jugador en esta partida';
        end if;
        return new;
end;
$tg_asignartabla$
language plpgsql;

create trigger tg_asignartabla before insert
on tabla_jugador_partida for each row
execute procedure tg_asignartabla();