<template>
  <q-page class="flex flex-center">
    <!-- First section -->
    <section style="width: 100%" class="row justify-around bg-secondary">
      <!-- section left -->
      <div style="width: 50%">
        <h3 class="txtImportant">¡Hola, soy {{ name }}!</h3>
        <q-separator inset />
        <!-- ESCUELA -->
        <q-expansion-item popup icon="school" label="Mi formación acádemica">
          <q-expansion-item
            v-for="school of schools"
            :key="school.name"
            :header-inset-level="1"
            :content-inset-level="1"
            expand-separator
            icon="history_edu"
            :label="school.name"
            :caption="school.nivel"
          >
            <q-card
              flat
              bordered
              style="background-color: rgba(255, 255, 255, 0.299)"
            >
              <q-card-section style="list-style: none">
                <li class="">{{ school.about[0] }}</li>
                <li class="">{{ school.about[1] }}</li>
              </q-card-section>
            </q-card>
          </q-expansion-item>
        </q-expansion-item>

        <!-- CURSOS -->
        <q-expansion-item
          popup
          expand-separator
          icon="badge"
          label="Mis cursos"
        >
          <q-expansion-item
            v-for="curso of cursos"
            :key="curso.school"
            :header-inset-level="1"
            expand-separator
            :icon="curso.icon"
            :label="curso.school"
            caption=""
          >
            <q-expansion-item
              v-for="carrera of curso.about"
              :key="carrera.ruta"
              :header-inset-level="2"
              :content-inset-level="carrera.col"
              expand-separator
              :icon="carrera.icon"
              :label="carrera.ruta != '' ? carrera.ruta : 'Alo'"
              caption=""
            >
              <q-card
                flat
                bordered
                style="background-color: rgba(255, 255, 255, 0.299)"
              >
                <q-card-section>
                  <li v-for="(course, index) in carrera.courses" :key="index">
                    {{ course }}
                  </li>
                </q-card-section>
              </q-card>
            </q-expansion-item>
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

export default defineComponent({
  name: "IndexPage",
  data() {
    return {
      name: "Bruno Nicolas",
      schools: [
        {
          name: "Universidad Autónomoa del Estado de México",
          nivel: "Superior",
          about: [
            "Licenciatura: Ingenieria en computación",
            "Ciclo escolar: 2018 - Actualidad",
          ],
        },
        {
          name: "Colegio de Bachilleres plantel #19",
          nivel: "Medio Superior",
          about: [
            "Salida ocupacional: Informática - Programador",
            "Ciclo escolar: 2015 - 2018",
          ],
        },
      ],

      cursos: [
        {
          school: "Oracle Academy",
          icon: "cloud_circle",
          about: [
            {
              ruta: "Escuela",
              col: 2,
              icon: "history_edu",
              courses: [
                "Perfiles profesionales en la industria de Tecnología",
                "Nube 101",
                "Internet of things",
                "Evolucion de la Inteligencia Empresarial",
                "Experiencia Digital",
                "La importancia de la ciberseguridad en la Transformación digital",
                "Big data, Analytics and Data Science",
                "Base de Datos en la Nube",
                "Autonomous NoSQL Database in Cloud (ANDC)",
              ],
            },
          ],
        },
        {
          school: "Platzi",
          icon: "cast_for_education",
          about: [
            {
              ruta: "Análista de Datos",
              col: 2,
              icon: "query_stats",
              courses: [
                "Principios de visualización de datos para Business intelligence",
                "Tableau: Visualización de datos y storytelling para negocios",
                "Análisis de datos con Power BI",
                "Bases de datos: Postgres sql",
                "Excel Básico",
              ],
            },
            {
              ruta: "Desarrollo web",
              col: 2,
              icon: "code",
              courses: [
                "Diseño web profesional",
                "Javascript",
                "Asincronismo con JS",
                "Git y Github",
                "Ecmascript",
              ],
            },
          ],
        },
      ],
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
