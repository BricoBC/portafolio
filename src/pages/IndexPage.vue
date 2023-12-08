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
            <q-card flat bordered>
              <q-card-section>
                <div class="text-h6">Ingenieria en computación</div>
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
            label="Academica"
            caption="Oracle Academy"
            default-opened
          >
            <q-card flat bordered>
              <q-card-section>
                <li class="text-h6">
                  Prefiles profesionales en la industria de Tecnología
                </li>
                <li class="text-h6">Nube 101</li>
                <li class="text-h6">Internet of things</li>
                <li class="text-h6">
                  Evolucion de la Inteligencia Empresarial
                </li>
                <li class="text-h6">Experiencia digital</li>
                <li class="text-h6">
                  La importancia de la ciberseguridad en la Transformación
                  digital
                </li>
                <li class="text-h6">Base de Datos en la Nube</li>
                <li class="text-h6">
                  Autonomous NoSQL Database in Cloud (ANDC)
                </li>
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
</style>
