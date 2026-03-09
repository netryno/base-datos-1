CREATE TABLE "Recorre"(
    "id" BIGINT NOT NULL,
    "color" BIGINT NOT NULL,
    "nombre" BIGINT NOT NULL
);
ALTER TABLE
    "Recorre" ADD CONSTRAINT "recorre_id_unique" UNIQUE("id");
ALTER TABLE
    "Recorre" ADD PRIMARY KEY("color");
ALTER TABLE
    "Recorre" ADD PRIMARY KEY("nombre");
CREATE TABLE "Linea"(
    "color" VARCHAR(255) NOT NULL DEFAULT '3',
    "fecha_cofiguracion" DATE NOT NULL DEFAULT '3'
);
ALTER TABLE
    "Linea" ADD PRIMARY KEY("color");
COMMENT
ON COLUMN
    "Linea"."color" IS 'Esto es id';
COMMENT
ON COLUMN
    "Linea"."fecha_cofiguracion" IS 'No se olviden validar';
CREATE TABLE "Cabina"(
    "id" BIGINT NOT NULL,
    "num_cabina" BIGINT NOT NULL,
    "nombre" BIGINT NOT NULL
);
CREATE TABLE "Estacion"(
    "nombre" BIGINT NOT NULL,
    "direccion" BIGINT NOT NULL
);
ALTER TABLE
    "Estacion" ADD PRIMARY KEY("nombre");
CREATE TABLE "Empleado"(
    "carnet" BIGINT NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "sueldo" FLOAT(53) NOT NULL,
    "supervisor_carnet" BIGINT NOT NULL
);
ALTER TABLE
    "Empleado" ADD PRIMARY KEY("carnet");
CREATE TABLE "Telefono"(
    "id" BIGINT NOT NULL,
    "carnet" BIGINT NOT NULL,
    "numero" BIGINT NOT NULL,
    "tipo" INTEGER NOT NULL
);
ALTER TABLE
    "Telefono" ADD PRIMARY KEY("id");
CREATE TABLE "Trasnporta"(
    "id" BIGINT NOT NULL,
    "fecha" DATE NOT NULL,
    "numero_cabina" BIGINT NOT NULL,
    "carnet" BIGINT NOT NULL
);
ALTER TABLE
    "Trasnporta" ADD PRIMARY KEY("id");
ALTER TABLE
    "Trasnporta" ADD PRIMARY KEY("numero_cabina");
ALTER TABLE
    "Trasnporta" ADD PRIMARY KEY("carnet");
CREATE TABLE "Pasajero"(
    "carnet" BIGINT NOT NULL,
    "nombre" BIGINT NOT NULL,
    "apellido_paterno" VARCHAR(255) NOT NULL,
    "apelldo_materno" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Pasajero" ADD PRIMARY KEY("carnet");
CREATE TABLE "Bono"(
    "codigo_beneficiario" BIGINT NOT NULL,
    "tipo_descuento" BIGINT NOT NULL
);
ALTER TABLE
    "Bono" ADD PRIMARY KEY("codigo_beneficiario");
ALTER TABLE
    "Empleado" ADD CONSTRAINT "empleado_carnet_foreign" FOREIGN KEY("carnet") REFERENCES "Estacion"("nombre");
ALTER TABLE
    "Empleado" ADD CONSTRAINT "empleado_supervisor_carnet_foreign" FOREIGN KEY("supervisor_carnet") REFERENCES "Empleado"("carnet");
ALTER TABLE
    "Recorre" ADD CONSTRAINT "recorre_color_foreign" FOREIGN KEY("color") REFERENCES "Linea"("color");
ALTER TABLE
    "Cabina" ADD CONSTRAINT "cabina_id_foreign" FOREIGN KEY("id") REFERENCES "Linea"("fecha_cofiguracion");
ALTER TABLE
    "Telefono" ADD CONSTRAINT "telefono_carnet_foreign" FOREIGN KEY("carnet") REFERENCES "Empleado"("carnet");
ALTER TABLE
    "Recorre" ADD CONSTRAINT "recorre_nombre_foreign" FOREIGN KEY("nombre") REFERENCES "Estacion"("nombre");
ALTER TABLE
    "Bono" ADD CONSTRAINT "bono_codigo_beneficiario_foreign" FOREIGN KEY("codigo_beneficiario") REFERENCES "Pasajero"("carnet");
ALTER TABLE
    "Trasnporta" ADD CONSTRAINT "trasnporta_carnet_foreign" FOREIGN KEY("carnet") REFERENCES "Pasajero"("carnet");
ALTER TABLE
    "Trasnporta" ADD CONSTRAINT "trasnporta_numero_cabina_foreign" FOREIGN KEY("numero_cabina") REFERENCES "Cabina"("id");