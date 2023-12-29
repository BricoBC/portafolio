<template>
  <section
    style="width: 100%; height: 100vh"
    class="row justify-around bg-dark"
  >
    <!-- section left -->
    <div style="width: 50%">
      <h3 class="txtH1 text-center">¡Hola, soy {{ name }}!</h3>

      <q-carousel
        v-model="slide"
        transition-prev="fade"
        transition-next="fade"
        control-type="unelevated"
        vertical
        swipeable
        animated
        padding
        control-color="white"
        navigation
        height="75vh"
        class="bg-dark card rounded-borders"
      >
        <!-- Escuela -->
        <q-carousel-slide
          name="school"
          class="column no-wrap flex-center q-pa-md"
        >
          <div class="row flex-center">
            <q-icon name="history_edu" size="40px" />
            <h3 class="q-mx-md q-my-lg"><b>He estudiado...</b></h3>
          </div>

          <div
            v-for="(school, it) in schools"
            :key="it"
            class="q-my-md text-center card"
          >
            <h4 class="q-my-md">{{ school.name }}</h4>
            <h5 class="sinMargin">Nivel: {{ school.nivel }}</h5>
            <li class="txtNormal" v-for="(item, id) in school.about" :key="id">
              {{ item }}
            </li>
          </div>
        </q-carousel-slide>

        <!-- CURSOS -->
        <q-carousel-slide
          name="cursos"
          class="column no-wrap flex-center q-pa-md"
        >
          <div class="row flex-center">
            <q-icon name="history_edu" size="40px" />
            <h3 class="q-mx-md q-my-lg">
              <b>Estos son mis cursos que he tomado: </b>
            </h3>
          </div>
          <div class="" style="width: 90%; height: 90vh">
            <q-card>
              <q-tabs
                class="bg-primary"
                v-model="tab"
                active-color="dark"
                indicator-color="dark"
                dense
              >
                <q-tab name="oracle" :label="cursos[0].about[0].ruta" />
                <q-tab name="platzi" :label="cursos[1].school" />
              </q-tabs>

              <q-tab-panels v-model="tab" animated class="bg-dark">
                <q-tab-panel name="oracle">
                  <li
                    class="txtNormal"
                    v-for="(course, i) in cursos[0].about[0].courses"
                    :key="i"
                  >
                    <a
                      target="_blank"
                      :href="cursos[0].about[0].url_certificate[i]"
                    >
                      {{ course }}
                    </a>
                  </li>
                  <div class="row justify-end">
                    <button type="button" class="buttonCertificate">
                      <a
                        :href="cursos[0].about[0].url_certificate[i]"
                        target="_blank"
                      >
                        Ver certificados
                      </a>
                    </button>
                  </div>
                  <q-separator />
                </q-tab-panel>

                <q-tab-panel name="platzi">
                  <div class="text-h6">
                    <a
                      v-for="(name, i) in cursos[1].about"
                      :key="i"
                      :href="name.all_certificates"
                      target="_blank"
                    >
                      <h5 class="sinMargin">
                        {{ name.ruta }}
                        <li v-for="(course, i) in name.courses" :key="i">
                          <a
                            class="txtNormal"
                            :href="name.url_certificate[i]"
                            target="_blank"
                          >
                            {{ course }}
                          </a>
                        </li>
                      </h5>
                      <div class="row justify-end">
                        <button type="button" class="buttonCertificate">
                          <a :href="name.url_certificate[i]" target="_blank">
                            Ver certificados
                          </a>
                        </button>
                      </div>
                    </a>
                    <q-separator />
                  </div>
                </q-tab-panel>
              </q-tab-panels>
            </q-card>
          </div>
        </q-carousel-slide>

        <!-- TRABAJO -->
        <q-carousel-slide
          name="job"
          class="column no-wrap flex-center sinPadding"
        >
          <q-scroll-area class="fit">
            <div class="row flex-center">
              <q-icon name="work_outline" size="40px" />
              <h3 class="q-mx-md q-my-lg">
                <b>He trabajado en... </b>
              </h3>
            </div>
            <q-card
              v-for="(job, id) in jobs"
              :key="job.name"
              class="q-my-md card bg-secondary"
            >
              <q-card-section class="text-center">
                <q-expansion-item
                  :default-opened="id == 0"
                  group="somegroup"
                  dense
                  dense-toggle
                  expand-separator
                  icon="perm_identity"
                  :label="job.name"
                  :caption="job.ocupation"
                  header-class="txtTitle"
                >
                  <q-card>
                    <q-card-section class="bg-secondary txtNormal">
                      {{ job.description }}
                    </q-card-section>
                  </q-card>
                </q-expansion-item>
              </q-card-section>
            </q-card>
          </q-scroll-area>
        </q-carousel-slide>

        <!-- PORTAFOLIO -->
        <q-carousel-slide name="portfolio">
          <q-scroll-area class="fit">
            <h3 class="q-mx-md q-my-lg">
              <b>Mis proyectos están en... </b>
            </h3>

            <q-card
              class="bg-dark"
              v-for="project in portfolio"
              :key="project.name_platform"
            >
              <a :href="project.url_platform" target="_blank">
                <h5 class="q-mb-md">
                  {{ project.name_platform }}
                  <q-icon :name="project.icon"></q-icon>
                </h5>
              </a>

              <div class="row justify-around">
                <q-card-section
                  class="my-card bg-red-1 q-ma-md"
                  style="width: 30%; height: 200px"
                  v-for="(techonology, id) in project.technologies"
                  :key="id"
                >
                  <q-img style="" :src="project.url_images[id]">
                    <div class="absolute-bottom txtNormal text-center">
                      {{ techonology }}
                    </div>
                  </q-img>
                </q-card-section>
              </div>
            </q-card>
          </q-scroll-area>
        </q-carousel-slide>
      </q-carousel>
    </div>

    <!-- section right -->
    <div style="width: 35%" class="column">
      <q-img src="../assets/images/Personal.jpg" alt="Foto_personal"> </q-img>
      <div class="text-center">
        <a
          target="_blank"
          href="https://api.whatsapp.com/send?phone=525550990404&text=Hola%2C%20Bruno.%0ATe%20queremos%20en%20nuestro%20equipo%20de%20trabajo%2C%20%C2%BFcu%C3%A1ndo%20empiezas%3F"
        >
          <q-img
            style="width: 12%"
            src="https://static.vecteezy.com/system/resources/thumbnails/031/737/231/small/whatsapp-icon-whatsapp-social-media-logo-free-png.png"
            alt="Whatsahpp"
          ></q-img>
        </a>
      </div>
    </div>
  </section>
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({
  name: "IndexPage",
  data() {
    return {
      name: "Bruno Nicolas",
      slide: "portfolio",
      schools: [
        {
          name: "Universidad Autónoma del Estado de México Plantel 'Ecatepec'",
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
      tab: "platzi",
      cursos: [
        {
          school: "UAEM",
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
              url_certificate: [
                "https://drive.google.com/file/d/1PkqTL52u_69r93jBeD3yer34ViTe5Vu5/view?usp=sharing",
                "https://drive.google.com/file/d/15r166kdMjfXXi0oU4-10xtmxFH8AEPB6/view?usp=sharing",
                "https://drive.google.com/file/d/1A8Jy-3Je3CiuFfdSVb-1zrViL7sGOIZW/view?usp=sharing",
                "https://drive.google.com/file/d/1N9FMDqpzAqYoY4A-tK8G_TVUE5x1KwbO/view?usp=sharing",
                "https://drive.google.com/file/d/1am6muouOk67So10JgCaGAJp2CMrMNItR/view?usp=sharing",
                "https://drive.google.com/file/d/1lZaKGuCqH4PNpBDPGcPJ1CIN0CT4KuqA/view?usp=sharing",
                "https://drive.google.com/file/d/1xI9WL_ESh8Ha3dAICGV0UInn95dsNhrl/view?usp=sharing",
                "https://drive.google.com/file/d/1eDRa4DYmLY1ci3Mmd2oBjp-fT2VLEcq1/view?usp=sharing",
                "https://drive.google.com/file/d/1KIBKu_3TBH6eCvfaUHsh_Z1AxmMHGND8/view?usp=sharing",
              ],
              all_certificates: [
                "https://drive.google.com/drive/folders/1QRhMEJelBh3hCGuneQ8qBviib2YQZ_9j?usp=sharing",
              ],
            },
          ],
        },
        {
          school: "Platzi",
          icon: "cast_for_education",
          about: [
            {
              ruta: "Data science",
              col: 2,
              icon: "query_stats",
              courses: [
                "Principios de visualización de datos para Business intelligence",
                "Tableau: Visualización de datos y storytelling para negocios",
                "Análisis de datos con Power BI",
                "Bases de datos: Postgres sql",
                "Excel Básico",
                "Lenguaje de programación Python",
              ],
              url_certificate: [
                "https://drive.google.com/file/d/1l0KzUU2TfP6MFWFYR6HlnjjR5d2XIzwF/view?usp=sharing",
                "https://drive.google.com/file/d/1HxcegOpQoVLfbkvWzDM2WzEGbOMmtnLQ/view?usp=sharing",
                "https://drive.google.com/file/d/14HEoTaAArU5ySQjZwGyhWH2sQfsIMfNf/view?usp=sharing",
                "https://drive.google.com/file/d/10GDXNROO-7HbVhWopS30a13_9pQmleZA/view?usp=sharing",
                "https://drive.google.com/file/d/1rjgnLPJV4ALaZ2jHWERoUn7QP0s9WNsY/view?usp=sharing",
                "https://drive.google.com/file/d/1-oz6r3_0d5Tgl4zdwDUdYAUBH55tE-Nb/view?usp=sharing",
              ],
              all_certificates: [
                "https://drive.google.com/drive/folders/1zO3oGFOSutZoH2TRWMy_m15o1MHFJ-Vv?usp=sharing",
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
              url_certificate: [
                "https://drive.google.com/file/d/1mdhVFoMi3NhTfziqSyiILBMNShUYUTkj/view?usp=sharing",
                "https://drive.google.com/file/d/18Z4pNqOcsvH2eLOGZUrnMQq4Ipxb9anv/view?usp=sharing",
                "https://drive.google.com/file/d/1eKkMVi9f4lXRRi-eZgtPyN2UGUVXJXaK/view?usp=sharing",
                "https://drive.google.com/file/d/1ZKC-SKRbu-BkFqAEX9V8e2A95Tn88vL0/view?usp=sharing",
                "https://drive.google.com/file/d/1JDndQlT-4r5j0jcVScj1SJuC9Ue9oxC6/view?usp=sharing",
              ],
              all_certificates: [
                "https://drive.google.com/drive/folders/1ytc-vWrKpdc1Xz3grbS__koLXdxxCaj3?usp=sharing",
              ],
            },
          ],
        },
      ],
      jobs: [
        {
          name: "Tribunal de la Justicia Administrativa de la Ciudad de México",
          ocupation: "Análista de datos y desarrollador web",
          time: "Mayo 2023 a Noviembre 2023",
          description: `En mi estancia de prácticas profesionales participé en el desarrollo de un sistema que
            permitiría al personal ejecutivo tomar decisiones estratégicas a través de la información
            almacenada en sus bases de datos. Al final de cada semestre, los trabajadores tenían la
            responsabilidad de entregar un informe semestral, por lo que la finalidad del sistema era
            brindar apoyo para la elaboración de este informe.`,
        },
        {
          name: "Teconología en Informática Múltiple SA CV",
          ocupation: "Técnico en equipos de cómputo",
          time: "Enero 2022 a Junio 2022",
          description: `Durante mi servicio social, llevé a cabo labores de mantenimiento preventivo y correctivo
            en los equipos de cómputo utilizados por la FES Zaragoza. Además, fue necesario elaborar
            un registro de las áreas a las cuales se les realizaba mantenimiento, generando un informe
            al finalizar dichas labores tanto para la dependencia escolar como para la institución donde
            estaba realizando mis prácticas.`,
        },
        {
          name: "Solution Networks",
          ocupation: "Desarrollador FullStack",
          time: "Septiembre 2021 a Enero 2022",
          description: `Desarrollé un sistema web para una empresa de servicios técnicos, que incluía electricidad,
          plomería, entre otros. El objetivo principal era facilitar el registro de los servicios solicitados
          por los clientes y automatizar la asignación de tareas a los trabajadores. Esto implicaba
          informarles sobre la ubicación, descripción del trabajo y la posibilidad de generar un informe
          basado en un documento específico.
          Desde el punto de vista administrativo, se requería llevar un registro contable de todos los
          trabajos realizados en diferentes periodos, ya sea mensual, semanal o quincenal.`,
        },
      ],
      portfolio: [
        {
          name_platform: "Tableau",
          url_platform: "https://github.com/BricoBC?tab=repositories",
          icon: "insights",
          technologies: [
            "Dashboard Restaurante 'The Magic'",
            "Ventas de las categorias de forma anual",
            "Ventas en diferentes periodos",
          ],
          url_images: [
            "https://cdn.quasar.dev/img/parallax2.jpg",
            "https://cdn.quasar.dev/img/parallax2.jpg",
            "https://cdn.quasar.dev/img/parallax2.jpg",
          ],
        },
        {
          name_platform: "Google Collaboratory",
          url_platform:
            "https://drive.google.com/drive/folders/1ReelDQDxzI0JGf82yEASQ0ZDbsKyWeYJ",
          icon: "code",
          technologies: ["Pandas", "Matplotlib", "Numpy"],
          url_images: [
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Pandas_logo.svg/1200px-Pandas_logo.svg.png",
            "https://interactivechaos.com/sites/default/files/inline-images/tutorial_matplotlib.png",
            "https://datascientest.com/es/wp-content/uploads/sites/7/2021/04/illu_numpy_blog-125.png",
          ],
        },
        {
          name_platform: "GitHub",
          url_platform: "https://public.tableau.com/app/profile/bricobc/vizzes",
          icon: "terminal",
          technologies: [
            "HTML",
            "CSS",
            "Javascript",
            "Vue",
            "Quasar",
            "Docker",
            "Python",
            "Java",
            "Bash",
          ],
          url_images: [
            "https://cdn-icons-png.flaticon.com/512/732/732212.png",
            "https://cdn.freebiesupply.com/logos/thumbs/2x/css3-logo.png",
            "https://static.vecteezy.com/system/resources/previews/027/127/463/original/javascript-logo-javascript-icon-transparent-free-png.png",
            "data:image/png;base64,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",
            "data:image/png;base64,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",
            "https://variwiki.com/images/a/a1/Docker.png",
            "https://cdn3.iconfinder.com/data/icons/logos-and-brands-adobe/512/267_Python-512.png",
            "https://e7.pngegg.com/pngimages/622/612/png-clipart-java-scalable-graphics-logo-others-text-class.png",
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Bash_Logo_Colored.svg/2048px-Bash_Logo_Colored.svg.png",
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
* {
  color: #ffffff;
}

.txtH1 {
  font-family: "Bebas Neue", sans-serif;
  font-size: 4vw;
  margin: 2vw 0;
}

.txtSecond {
  font-size: 1.5vw;
  background-color: rgba(0, 0, 0, 0.299);
}
.txtTitle {
  font-size: 1.3vw;
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
  border-color: #5f704a;
  background-color: transparent;
  border-style: solid;
  border-radius: 1vw;
  padding: 15px;
}
a {
  text-decoration: none;
}
a:hover {
  color: #c2c2c2;
  font-weight: 100;
}
.buttonCertificate {
  background-color: #5f704a;
  font-size: 0.8vw;
  font-weight: 100;
  cursor: pointer;
}
.buttonCertificate:hover {
  background-color: #5f704aaf;
  font-weight: 300;
}

.cardInfo {
  display: flex;
  justify-content: center;
  background-color: #5f704a56;
  align-items: center;
}

.my-card {
  width: 100%;
  max-width: 550px;
}
</style>
