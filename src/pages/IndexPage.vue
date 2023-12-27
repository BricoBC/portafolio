<template>
  <q-page class="flex flex-center">
    <!-- First section -->
    <section
      style="width: 100%; height: 100vh"
      class="row justify-around bg-secondary"
    >
      <!-- section left -->
      <div style="width: 50%">
        <h3 class="txtH1 text-center">¡Hola, soy {{ name }}!</h3>
        <q-separator color="primary" inset />

        <q-carousel
          v-model="slide"
          transition-prev="coverflow"
          transition-next="coverflow"
          control-type="unelevated"
          vertical
          swipeable
          animated
          padding
          control-color="white"
          navigation
          height="70vh"
          class="bg-secondary card rounded-borders"
        >
          <!-- Escuela -->
          <q-carousel-slide
            name="school"
            class="column no-wrap flex-center q-pa-md"
          >
            <div class="row flex-center">
              <h3 class="q-mx-md q-my-lg"><b>Mi educación</b></h3>
              <q-icon name="history_edu" size="40px" />
            </div>

            <div
              v-for="(school, it) in schools"
              :key="it"
              class="q-my-md text-center card"
            >
              <h4 class="q-my-md">{{ school.name }}</h4>
              <h5 class="sinMargin">Nivel: {{ school.nivel }}</h5>
              <li
                class="txtNormal"
                v-for="(item, id) in school.about"
                :key="id"
              >
                {{ item }}
              </li>
            </div>
          </q-carousel-slide>

          <q-carousel-slide
            name="cursos"
            class="column no-wrap flex-center q-pa-md"
          >
          </q-carousel-slide>
        </q-carousel>
      </div>

      <!-- section right -->
      <div style="width: 35%">
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
      slide: "school",
      schools: [
        {
          name: "Universidad Autónomoa del Estado de México Plantel 'Ecatepec'",
          nivel: "Superior",
          about: [
            "Licenciatura: Ingenieria en computación",
            "Ciclo escolar: 2018 - Actualidad",
          ],
        },
        {
          name: "Colegio de Bachilleres plantel #19 'Ecatepec'",
          nivel: "Medio Superior",
          about: [
            "Salida ocupacional: Informática - Programador",
            "Ciclo escolar: 2015 - 2018",
          ],
        },
      ],

      cursos: [
        {
          school: "Escuela",
          icon: "history_edu",
          about: [
            {
              ruta: "Oracle Academy",
              col: 2,
              icon: "cloud_circle",
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

.txtH1 {
  font-family: "Bebas Neue", sans-serif;
  font-size: 4vw;
  margin: 2vw 0;
}

.txtSecond {
  font-size: 1.5vw;
  background-color: rgba(0, 0, 0, 0.299);
}
.txtNormal {
  font-size: 1vw;
}
.sinPadding {
  padding: 0;
}
.sinMargin {
  margin: 0;
}
.card {
  border-color: rgb(64, 57, 57);
  border-style: solid;
  border-radius: 1vw;
  padding: 15px;
}
</style>
