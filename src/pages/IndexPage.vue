<template>
  <q-page class="flex flex-center">
    <!-- First section -->
    <section style="width: 100%" class="row justify-around bg-secondary">
      <!-- section left -->
      <div style="width: 50%">
        <h3 class="txtImportant">¡Hola, soy {{ name }}!</h3>
        <q-separator inset />
        <!-- ESCUELA -->
        <q-expansion-item
          popup
          icon="school"
          label="Preparación academica"
          caption="Estudios"
          default-opened
        >
          <q-expansion-item
            :header-inset-level="1"
            :content-inset-level="1"
            expand-separator
            icon="history_edu"
            :label="nameUniversidad"
            caption="Licenciatura"
            default-opened
          >
            <q-card
              flat
              bordered
              style="background-color: rgba(255, 255, 255, 0.299)"
            >
              <q-card-section style="list-style: none">
                <li class="">Licenciatura: Ingenieria en computación</li>
                <li class="">Ciclo escolar: 2018 - Actualidad</li>
              </q-card-section>
            </q-card>
          </q-expansion-item>

          <q-expansion-item
            :header-inset-level="1"
            :content-inset-level="1"
            expand-separator
            icon="history_edu"
            label="Colegio de Bachilleres plantel #19 'Ecatepec'"
            caption="Medio superior"
            default-opened
          >
            <q-card
              flat
              bordered
              style="background-color: rgba(255, 255, 255, 0.299)"
            >
              <q-card-section style="list-style: none">
                <li class="">Salida ocupacional: Informática - Programador</li>
                <li class="">Ciclo escolar: 2015 - 2018</li>
              </q-card-section>
            </q-card>
          </q-expansion-item>
        </q-expansion-item>

        <!-- CURSOS -->
        <q-expansion-item
          popup
          expand-separator
          icon="badge"
          label="Cursos"
          default-opened
        >
          <q-expansion-item
            :header-inset-level="1"
            :content-inset-level="2"
            expand-separator
            icon="cloud_circle"
            label="Oracle Academy"
            caption=""
            default-opened
          >
            <q-card
              flat
              bordered
              style="background-color: rgba(255, 255, 255, 0.299)"
            >
              <q-card-section>
                <li class="">
                  Perfiles profesionales en la industria de Tecnología
                </li>
                <li class="">Nube 101</li>
                <li class="">Internet of things</li>
                <li class="">Evolucion de la Inteligencia Empresarial</li>
                <li class="">Experiencia digital</li>
                <li class="">
                  La importancia de la ciberseguridad en la Transformación
                  digital
                </li>
                <li class="">Base de Datos en la Nube</li>
                <li class="">Autonomous NoSQL Database in Cloud (ANDC)</li>
                <div class="fit row justify-end q-mt-md">
                  <q-btn
                    class="content-end"
                    outline
                    color="accent"
                    icon="settings_system_daydream"
                    label="Ver certificaciones..."
                    href="https://drive.google.com/drive/folders/1QRhMEJelBh3hCGuneQ8qBviib2YQZ_9j?usp=sharing"
                  />
                </div>
              </q-card-section>
            </q-card>
          </q-expansion-item>
        </q-expansion-item>
      </div>

      <!-- section right -->
      <div style="width: 40%">
        <q-img src="../assets/images/Personal.jpg" alt="Foto_personal"> </q-img>
      </div>
    </section>
  </q-page>
</template>

<script>
import { defineComponent } from "vue";
import { apiFotos } from "src/boot/axios";

export default defineComponent({
  name: "IndexPage",
  data() {
    return {
      name: "Bruno Nicolas",
      nameUniversidad: "Universidad Autónomoa del Estado de México",
    };
  },
  methods: {},
});
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap");

.txtImportant {
  font-family: "Bebas Neue", sans-serif;
  font-size: 4vw;
}

.txtSecond {
  font-size: 1.5vw;
  background-color: rgba(0, 0, 0, 0.299);
}
</style>
