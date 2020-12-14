SELECT
PARTIDA.partida_id, 
count(partida.partida_fecha) as cantidad,
partida.partida_fecha
FROM partida
where(partida.partida_fecha >= '01/07/2020' and partida.partida_fecha <= '31/07/2020')
group by PARTIDA.partida_id, partida.partida_fecha;

select
premio.premio_id,
premio.premio_nombre,
jugador.jugador_nombre
from premiacion_line
inner join public.jugador on jugador.jugador_id=premiacion_line.premiacion_id
inner join public.premio on premio.premio_id=premiacion_line.premio_id
where premio.premio_nombre='iPhone 12'


select
jugador.jugador_id,
jugador.jugador_nombre,
jugador.jugador_apellido,
count(tabla.tabla_id) as cantidad
from tabla
inner join public.jugador on jugador.jugador_id=tabla.jugador_id
where jugador.jugador_id = '1'
group by jugador.jugador_id,
jugador.jugador_nombre,
jugador.jugador_apellido


select
jugador.jugador_id,
jugador.jugador_nombre,
jugador.jugador_apellido,
jugador.jugador_telefono,
premio.premio_nombre
from jugador
inner join public.premiacion_line on premiacion_line.jugador_id=jugador.jugador_id
inner join public.premio on premio.premio_id = premiacion_line.premio_id
where premio.premio_nombre = 'Television 60 pulgadas'