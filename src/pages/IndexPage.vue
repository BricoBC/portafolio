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
                  class="my-card bg-red-1 q-ma-md sinPadding"
                  style="width: 30%; height: 200px"
                  v-for="(techonology, id) in project.technologies"
                  :key="id"
                >
                  <q-img
                    class="sinMarging sinPadding"
                    style="max-height: 100%"
                    :src="project.url_images[id]"
                  >
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
      <q-img
        src="https://lh3.googleusercontent.com/pw/ABLVV848sMp7vRliYACTsEi5pJ1ep5coZ0yxzcvmGlNPiCEEcoMg9Uj3lBKyA9c-3in6H1Foe7hywiPOHKymRwxlU7oXAN7r0S5JWzqCtvfLQLqlo-91SpRN6YGW1gC51KXx8nGspevrQidiRqsD0n7dNqg=w720-h960-s-no-gm?authuser=0"
        alt="Foto_personal"
      >
      </q-img>
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
      miPhoto: "Personal.jpg",
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
            "Dashboard 'The Magic'",
            "Ventas de las categorias de forma anual",
            "Ventas en diferentes periodos",
          ],
          url_images: [
            "https://png.pngtree.com/png-vector/20200729/ourlarge/pngtree-small-restaurant-building-vector-with-flat-design-png-image_2316583.jpg",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5vRpqSUPxS8nVaruEyiS-X8RPF2kXtHqC9A9l58SgZchGFxVKJrTv2coua2U64GFXNJY&usqp=CAU",
            "https://cdn-icons-png.flaticon.com/512/4997/4997411.png",
          ],
        },
        {
          name_platform: "Google Collaboratory",
          url_platform:
            "https://drive.google.com/drive/folders/1ReelDQDxzI0JGf82yEASQ0ZDbsKyWeYJ",
          icon: "code",
          technologies: ["Pandas", "Matplotlib", "Numpy"],
          url_images: [
            "https://lh3.googleusercontent.com/pw/ABLVV86ee6cuk2x7NLr8vQzTeu5UxmIIeX0_VJSuIuBM9Pbh-IibelzC3F0KzLJh8ACTfTFYxSgJWvx1us-_V3OrCyVQrpiEeoWWPNrVaOoOuLD3pONO_fPiB-T4oqhY-7b7gsyJfPZbvBqbQATyzIHTj1_c=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87Rl4ssXiV_c9RocaSNzEjjlZQ6MQ-i4qLGHK17Kd42kdY5uKHAUoGPFQwkkMC3nSjbJPkSOITE2-TRute7EmHYi78s84vOX4TXhPPyWcgQBPQIKD2j139qBDkeuDyJYeglQhCYSqEaHlohSn8tzrKm=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV86XBjoUYjAWrbSYMXdSLMqm7npr8DwEvzhQxvG0Y_cT23-_LrxJ9kErKtgEKJyt7dZYdy79tvNVORZDkfCRpHJ5f8VabyypD2mz9NoflMK88bH1h7xVWNsbAadueggbb7UIrZbE-mzn6RYNqCiN8LXX=w762-h548-s-no-gm?authuser=0",
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
            "https://lh3.googleusercontent.com/pw/ABLVV87PGsLcPBEwVjSxP36KFLOmi9TDDssiGmYGJQWox9bQgWXtbuZc-n384XRY0B5d1tQfwPMAtnA8GwSUhN09PsLbAhOMwB2MsM2XcSqArmZkJEKdXDzWU74_U7n7cVjdleW4_6iGQRyfgAq7QGRBiviu=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87NqcyJS-pAr6s7kXOMS6Y4ie-aEY7EKClouwgH1PWimkwHSQThAYRIvpXjvLGNFG_2XvacLbSmldCX_cx4ysST3ky_9nB9HN9kwgyDJvMuYNORT_miBdo4n_k_hOy_YvvFQXCxepp3fC3k0tuNahe5=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV86fQuuiWoYe8xrGD9WnzuTm4CXWKAyMolqk0GZBNr4SSG7eRFkTFLkPA-APlmS04RkaZWPvAb8L_Lo7EAtZiiiQcMCuKAGfupjWYxWVY-oJMmciykyyYFt3LVtcJCKWem97887QGtXyaJJgpRD5uoOc=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV85IrKvk7QII1vp46fMkt1uIa4C_RTmKcODpDui1ADuEB4-KrqHW3Erl_M8Lg4NcdrRHRkrhKd_PBPoxVk13_zMZD5gL5uqYrIMPMpmRuBstdU8ZllO-TbjXdtKfJy7wp5im0Zj1leWPWRaN96wRDLwE=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV86ACWO6wbQrvPvq_y6zDIRkrAQ_gWY_5eTX2M3DW70XakgqxbYtwpQtwLfC5mCqV8tmj7ozgCCwa3dgualJGCgXBp_L1SXuMz-UR71b94mq-FH3nh8uU_5svBHMrF_y0g5M8Npz0zn-KjWuXbwQandT=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV867fPnb1KPN08OieSbWKm-JNpeDJOGwrS7UI4-ebuc1UnVtBEls2SBNh-OZxW0gKNoAHBBCVYstGJzAgcui9QqlMSm0i66qj_yhqxt2HBQFe8NxpSeDV0mqNe7LNq-Fv2kWBSzZ4XNK01dRwZrFRzER=w763-h549-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV85U0mHar0fKeNt304l0qS3psRWH2PwkfHwrQOC8mVm8RqQJ_QsKAyvHrX-F9K7CmFpi-zZM-TvMuZZgZgkuWqkdJP96XtDBmmgoQ1ioSXRSC5iT5VX0xM5R6KRhfyHi-MbTWR-U-Tiqd5h1xi4gRiE2=w763-h549-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV85aV5FTHJdZHE42fa2VSw-YRNOQMxdSCzNR0SLyT9YtQtQpFT-RcM71WvlmGvbNsRvvjTqdb41PooSCVilKjQvJ8MTN5fNH3sjsL9PKHHY_jsL7_NiSOu4YYdMk48cvLc3zeNEXbBJ-Zig8LQUGlDaC=w313-h225-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV84QGAz3E2V5VBLqqIa8IM9uvlVLZaBh_Z0HBGxjTWh0ec54iErFUuEdaaVHj6jdAyvp5up7CiC20aOBt4A62PGA1Wc3rbk5jq7aaRxNJPpIRi4bZgSUEjToDu_pImIa7TSRAReNRsOu5nyXYJm_nvga=w763-h549-s-no-gm?authuser=0",
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
