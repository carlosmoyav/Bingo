--Universidad Laica Eloy Alfaro de Manabí
--Carlos Alberto Moya Vera
--Materia: Gestión de base de datos
--Docente: Ing. Robert Moreira Centeno, Mg

--Procedimiento Almacenado


create or replace function ObtenerCargo(
    IN  apellido varchar,
    OUT cargo varchar
)
as $BODY$
begin
select cargo.cargo_nombre INTO cargo
FROM asociado
INNER JOIN PUBLIC.cargo ON asociado.asociado_id = cargo.cargo_id
WHERE asociado_apellido = apellido;
end
$BODY$ 
language plpgsql;