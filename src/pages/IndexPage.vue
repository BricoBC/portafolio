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
        <q-carousel-slide :name="0" class="column no-wrap flex-center q-pa-md">
          <div class="row flex-center">
            <q-icon name="history_edu" size="40px" />
            <h3 class="q-mx-md q-my-lg"><b>He estudiado en...</b></h3>
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
        <q-carousel-slide :name="1" class="column no-wrap flex-center q-pa-md">
          <div class="row flex-center">
            <q-icon name="history_edu" size="40px" />
            <h3 class="q-mx-md q-my-lg">
              <b>Mis cursos que he tomado: </b>
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
                        :href="cursos[0].about[0].all_certificates"
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
          :name="2"
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
        <q-carousel-slide :name="3">
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
                  style="width: 30%"
                  v-for="(techonology, id) in project.technologies"
                  :key="id"
                >
                  <a :href="project.urls_portafolio[id]" target="_blank">
                    <q-img
                      class="sinMarging sinPadding"
                      :src="project.url_images[id]"
                    >
                    </q-img>
                    <div class="absolute-bottom text-center q-py-xs txtCard">
                      {{ techonology }}
                    </div>
                  </a>
                </q-card-section>
              </div>
            </q-card>
          </q-scroll-area>
        </q-carousel-slide>

        <!-- INFORMACIÓN PERSONAL -->
        <q-carousel-slide :name="4" class="row">
          <h3 class="q-mx-md q-my-lg">
            <b>En mi tiempo libre me encontraras: </b>
          </h3>
          <div style="width: 100%">
            <li
              class="txtNormal"
              v-for="activity in activities"
              :key="activity.pash"
            >
              {{ activity.pash }}
            </li>
          </div>
          <div style="width: 100%">
            <apexchart
              type="bar"
              height="350"
              :options="chartOptions"
              :series="series"
            ></apexchart>
          </div>
        </q-carousel-slide>
      </q-carousel>
    </div>

    <!-- section right -->
    <div style="width: 35%" class="column">
      <q-carousel
        animated
        v-model="slide"
        navigation
        vertical
        infinite
        transition-prev="slide-down"
        transition-next="slide-up"
        style="height: 90vh"
      >
        <q-carousel-slide
          v-for="(photo, i) in misPhotos"
          :key="i"
          :name="i"
          :img-src="photo"
        />
      </q-carousel>

      <div class="text-center" style="height: 10vh">
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

import VueApexCharts from "vue3-apexcharts";

export default defineComponent({
  name: "IndexPage",
  components: {
    apexchart: VueApexCharts,
  },
  data() {
    return {
      name: "Bruno Nicolas",
      misPhotos: [
        "https://lh3.googleusercontent.com/pw/ABLVV850PLKeDW20gc-Geg7tNhJbep0FBmq_ApLaI7Oqm-1bSImJqwvass-nnb6vf9_AQ2uWa2JzUR7l0JX6t3KBrct1AbhcvMAGM0xNBq87J8rEthjSFg1FBVzYMEwR4DnsYuO85goIn0OZMvicqLaUFkpBYg=w679-h1018-s-no-gm?authuser=1",
        "https://lh3.googleusercontent.com/pw/ABLVV856m02RSDyBSlPvs-u8EO4GoADYwlm1pWKW3mj79CMsLMYT3uKASIPFZ_RuvEhc-g84BB5jV92S-7uFFjJNg2v4_zl9nWtdd0oR0xtaMUK5FRW1tIiNjL_DMYKBt1ual8p7gYbID3-n0ZqyQHLdUa-gImS_mPxCssfXI-6lpnrOQyGGmXrWwZ4BjmGF-h0iil2sRC3zpJk-OKg77DxvFZdSbj_XPo-qHwnTpb5J-ckfanZTCU24yRdnvrKWGIH5pxzJJ-WpUrhTOt6mUALwns_IQdEEZ72gHvjE6VstaAvW8Gh1sP8TOIIMDpsLzc5R5sRumDzhy_xAJg0zoasy2493wU5Yovge8JtpqRpdC79m8P0oTHLtqAC7RdxZ4ERekG0ccKzXATWqvaPl4lN5yO63YSsSncPfDEldm0-JeWkoW1A_AXwbo9bhJau7ZrWFn4MuBAtpikcXjgfgG_JmjcieJ1I0BnYLuMH4o4FhIviLgUucZWLMTnQkLTOk-mCVXRhQcERG3YpM2-VsYFkTxMMzBT6k8ntlIGs1vKs8Igsb7lskjJKSu-FOEp0M2f-WRsqymbWtOP54BnLiTz8Hoj-mdxv93gb85gq7fO-s8fBqSvdh1CUIduavewMJuOyXUsFCFixIOkMP0PyU7PhwPnED_eQGShVNY8EPgVLv3Qc-nvJ3IG3Z7naognfKV6Kyr-zwT0BTXOXOdCBWdfxQsDs8JZQJ000pwu55lF1gqXGATzKmmsod2Nj1RNrlobgBWhevYeuWKVwNGAgqu22Uqbwlc-zlSK_ObEusucfliSuSkR3oRpn8gQCXnGblzbpwC1O7fBi0fF7sODpYaIE_uayuXtVLqpSlSllv02VRBwIe-qhLXN4dYPlJURFhtPRBpPHDH8FfD57iOpfp1CcMx1atsjzopi-t7_qcV_g=w1357-h1018-s-no-gm?authuser=1",
        "https://lh3.googleusercontent.com/pw/ABLVV848sMp7vRliYACTsEi5pJ1ep5coZ0yxzcvmGlNPiCEEcoMg9Uj3lBKyA9c-3in6H1Foe7hywiPOHKymRwxlU7oXAN7r0S5JWzqCtvfLQLqlo-91SpRN6YGW1gC51KXx8nGspevrQidiRqsD0n7dNqg=w720-h960-s-no-gm?authuser=0",
        "https://lh3.googleusercontent.com/pw/ABLVV84g68fAFQUzaUeUKLeNILRMvm74wwqdqBdcrKCOc58P8BhYZOOLzHYAcjCtj2B0eei94yG2bsABX4TpV3pOgPtochsXMeywchhASWrGkvJQ8_ag9vtq9elhzfXdMcjtFJlTB2vc3BsHWkfnHf6JeV3mSyieYkk32ZPJwBjhCOCO1o-9PMLwGjbe07sug1vwWz9vEioPqABlr1d6IGCJ8Hh5andwOGTRakfvG46ytVJMuNpGFYF2Kn4TIf5FTyah3uvqvhESIIm3D_Qg8msxLFcj1VTfjXLoYlNTEIKSVDobS2Fe4rvV-9EtqQkYQTT_huMI3t7F29LV2jshvWLU7jm3j37gRxzBkZbnwtap7skTJqNqBSH83tglH-4rik9URGl89uyD2Rgkc-BVsWCCUOKSjJC2KLmD1bsXH4HQE3F3jXcr8ovvFGgLW-FFiqeflzUB3I-3jgaqpkanJ6WfKCO3kvGtSaBuWamyYlRf0SLKwVEaCySGWfvjTKNJZVF_14F-LyBjuGQR-1g9W0lTQO2izipNEpYEabCdLRMCdFbsHSkb8ha1mgDzaIP6-s5O-twNO1ga8PYm24KydnsVc5vGYCAkttyVri5iZU0K6EiaM6d6rjfPwE1bQfdjYLWDQgFbitNzLHqo-uFspAm3wDYbarXKTrVnOl6RuYLG4QpfxHCwg-8uE2Hl5efv4EjbN5PuGjZgk_U1qYUfWff9bQKBikmkqN_-V5pao52qwmpC8US5-6oeGWISuiLUrB3EVlHJqz99wy8Wzxj7KJBd1CjHywLKnbq2j8w96gBaXQ9ot0CGz9AiKUo8Ln7ACzrCTUPNYQk9iA1zlTsOEgEAhkUNmrYH_ssgmAcNSP-_QcCbkCUIcCFJAmQqjlASGzRsUrshjTC4oE4nJUb6zL1Al3kSg1m5VCu2suxjj4Am=w764-h1018-s-no-gm?authuser=1",
        "https://lh3.googleusercontent.com/pw/ABLVV84g68fAFQUzaUeUKLeNILRMvm74wwqdqBdcrKCOc58P8BhYZOOLzHYAcjCtj2B0eei94yG2bsABX4TpV3pOgPtochsXMeywchhASWrGkvJQ8_ag9vtq9elhzfXdMcjtFJlTB2vc3BsHWkfnHf6JeV3mSyieYkk32ZPJwBjhCOCO1o-9PMLwGjbe07sug1vwWz9vEioPqABlr1d6IGCJ8Hh5andwOGTRakfvG46ytVJMuNpGFYF2Kn4TIf5FTyah3uvqvhESIIm3D_Qg8msxLFcj1VTfjXLoYlNTEIKSVDobS2Fe4rvV-9EtqQkYQTT_huMI3t7F29LV2jshvWLU7jm3j37gRxzBkZbnwtap7skTJqNqBSH83tglH-4rik9URGl89uyD2Rgkc-BVsWCCUOKSjJC2KLmD1bsXH4HQE3F3jXcr8ovvFGgLW-FFiqeflzUB3I-3jgaqpkanJ6WfKCO3kvGtSaBuWamyYlRf0SLKwVEaCySGWfvjTKNJZVF_14F-LyBjuGQR-1g9W0lTQO2izipNEpYEabCdLRMCdFbsHSkb8ha1mgDzaIP6-s5O-twNO1ga8PYm24KydnsVc5vGYCAkttyVri5iZU0K6EiaM6d6rjfPwE1bQfdjYLWDQgFbitNzLHqo-uFspAm3wDYbarXKTrVnOl6RuYLG4QpfxHCwg-8uE2Hl5efv4EjbN5PuGjZgk_U1qYUfWff9bQKBikmkqN_-V5pao52qwmpC8US5-6oeGWISuiLUrB3EVlHJqz99wy8Wzxj7KJBd1CjHywLKnbq2j8w96gBaXQ9ot0CGz9AiKUo8Ln7ACzrCTUPNYQk9iA1zlTsOEgEAhkUNmrYH_ssgmAcNSP-_QcCbkCUIcCFJAmQqjlASGzRsUrshjTC4oE4nJUb6zL1Al3kSg1m5VCu2suxjj4Am=w764-h1018-s-no-gm?authuser=1",
      ],
      slide: 4,
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
              all_certificates:
                "https://drive.google.com/drive/folders/1QRhMEJelBh3hCGuneQ8qBviib2YQZ_9j?usp=sharing",
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
          url_platform: "https://public.tableau.com/app/profile/bricobc/vizzes",
          icon: "insights",
          technologies: [
            "Dashboard 'The Magic'",
            "Ventas de las categorias de forma anual",
            "Ventas en diferentes periodos",
          ],
          url_images: [
            "https://lh3.googleusercontent.com/pw/ABLVV85ipe4UriXQWn36RmSjg3ndJB47tHcxbwt4i5PXSaapdAfkxsDef-1vLQSSHyxABAmMmXSi-Hykyo6L-0MkquDTXDRmMl4O_-hawyTB0zxPBpEdMhf9DZdJ7TQgk3_HffQ1J-JJN9JhyG_EjK28H2jU=w313-h225-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV86AG3qXl2magwLZQwpoZZYQAXPGBER7uFDxNeLn-NI8Ig8a8NkCcu9eBkDb_YO00EuN28GFptGE2LWQayGKOxrW0CzmBNVuoQcYU0BB-KbHN5Z35edE05eBJPtELgrJiBzmVi0QRQuiYkDjTeh6gQVj=w313-h225-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV86qva6zeN1NBzBKQ4jzouT6LB36Jf7O_UY-S2PXxFrZ4aXq1lmHWfiNCA7x_rFNbvbJJkLf0JpSOSk2MiCS6iUaampQ7s9r-jN3wApKFCpOxbAB85PmlZmW4snOhAjKrwkiVPyZieIuFTot5ix6-xK4=w313-h225-s-no-gm?authuser=0",
          ],
          urls_portafolio: [
            "https://public.tableau.com/app/profile/bricobc/viz/Themagic/Historia1",
            "https://public.tableau.com/app/profile/bricobc/viz/Tercerdia/VentasTotales",
            "https://public.tableau.com/app/profile/bricobc/viz/Segundodia/Anlisispormes",
          ],
        },
        {
          name_platform: "Google Collaboratory",
          url_platform:
            "https://drive.google.com/drive/folders/1ReelDQDxzI0JGf82yEASQ0ZDbsKyWeYJ",
          icon: "code",
          technologies: ["Pandas", "Matplotlib", "Numpy"],
          url_images: [
            "https://lh3.googleusercontent.com/pw/ABLVV84zNhrDMgSJetRGNejjpf3hWFrVt1j5IFgyr9HgkDZyrTNsWlQcN8IEDjQ9u4tYFMW-Wz4SHeZM-u-4WGh-F1_y5NX629Gy6ZoQ6nkjkie_IR6C2hO_tkmjmZvYxeCxVlRu3_2b4TJQecvhvoboQr4S=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV85qSoMGLOmOqiWO7-dqCXNgiwizv9p5i5uqgeJA88SWMGhQhFyjCR5Yh71AQ6me475RMw3j93p1JpIPOCdYzc6UKnNhPkRfhpoAGD5ETZ0FlpCYsnM7XfEKF1zYCV5zwqOCQavZIobGSQsdXvMK_9vc=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87EDwLoPHLwEPbAakll-WpMJE2mMA8ZuouKJtyTT35ozBl18bfkDHn3IyHSFnWZplqHXGeS0YWVi4N9_5kiz3hjlvZVMrdcDa0l6X7vrlx5CoEPMjpMrca1_seXZfchsML8Xyp54irExqBWRlyOiVVS=w762-h548-s-no-gm?authuser=0",
          ],
          urls_portafolio: [
            "https://colab.research.google.com/drive/1S-CwRqh8UR0lOwIp8hyoZ1pPeayE8_sl#scrollTo=M86EVjeS3iHR",
            "https://lh3.googleusercontent.com/pw/ABLVV85qSoMGLOmOqiWO7-dqCXNgiwizv9p5i5uqgeJA88SWMGhQhFyjCR5Yh71AQ6me475RMw3j93p1JpIPOCdYzc6UKnNhPkRfhpoAGD5ETZ0FlpCYsnM7XfEKF1zYCV5zwqOCQavZIobGSQsdXvMK_9vc=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87EDwLoPHLwEPbAakll-WpMJE2mMA8ZuouKJtyTT35ozBl18bfkDHn3IyHSFnWZplqHXGeS0YWVi4N9_5kiz3hjlvZVMrdcDa0l6X7vrlx5CoEPMjpMrca1_seXZfchsML8Xyp54irExqBWRlyOiVVS=w762-h548-s-no-gm?authuser=0",
          ],
        },
        {
          name_platform: "GitHub",
          url_platform: "https://github.com/BricoBC",
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
            "Microcontrolador",
          ],
          url_images: [
            "https://lh3.googleusercontent.com/pw/ABLVV86CScv_GSDKUT3sz5EoOdcUGoLavVPv-vJaAm72Ed6Ct3ygQcC5ZcRhRd1wESLHWKZCd3svQ3fMk1tctmqVy22Sq4GnboVZZBfwdA8BzTQIxEJDrpTtn-vcApMCLLmkZ7N6LFhulRm-9q4YfCUAZCl8=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87q_2ZPrkI1Gl5srFzxS-PIk8382n4XyRwLchTkkcUjrDVInJXYSv_ywC7cAxgOsER5B399Ju1HaEQH3rgxOKxVvl-7YfijwHdG8Tx6-UbZGMvm5cU6Crg_IHtRSH_JTMASnnemO7p1CTWC_1L2Y0kQ=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87NwgxnExPr3N5sr8zQfmx2QgO1v2dYFg620CtFruZbsiSe3edCi0OiLNlIlr_oq-cM5pikN3fBZYrAwL3Azzwnk1jiONUMeeSnwrRKMNOgmgrQoEK3TbV088u2qw9qj3xtoY9w08zG4ZS1JxScPFkB=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV85qIJiiUsN69udaa36x_UTW-JF1p92qBNjK8FtIYmrEj5I9UeHLUd7xbtw2oTsPdUcjCKnHSO1MlzHNqDSCtkbmQGELSZK8FRpg9rqGO8FhQwQoUYKANQMZspqtkgHpixD7pRrMbA49lfoBKG1eHDtL=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV85SaNvEAVYxbVGpCHjmvG9TWN7YNz6FV-hhywDv4afyxBLYn-Op2QvnkEYXVsKPm2SZoMPbUYzCis8lEIR6Pxl6BmApziE8ZC7NxZO2g-u9znt9aX3zm-nQLxDs_fU8E5ny7Lt3IscWt4god7hBhQVq=w762-h548-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV84QlOKA8PzN554lJNm27D98zi2QZnB1qcn9-tpUaGxe3E3tCkIsuz51W_DgnOx0VC3dXYfcfYxbWYZOFiSinS88OdutKA4O0AtWcas7KaJOoFaqhcLg6mzgsRLEdE58VZ3-q6SwQobAxKoC_KtBT9PU=w763-h549-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87aML4EPKjGaeukgvHk1uH34WvRJv-uBh4swN2NeBwjwS55kzaas6_9rIJmqJcV2ggPFgot4pUNuraKqVN28I0qlP-23nX3GIwI8EnPWSsSY7ZinkSuIw3q1sn62XQR_m-RfMWb7i7z9nOTRRz6Z0Td=w763-h549-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87Twy6_xINRfIaneApug_3kxtTzZvcCFQBLjo8GL72GVBUb0pLOgQGHoiF1oDdIXD950dzGCNfuoV9Q1CCmP5Pw4Zn2mJd6yc3aGWpDl2_KRfsQ8xPWfmjtPcGILRaNnlvInuNJqn_JZ5GINpjV5uix=w313-h225-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV842HvrTHkUVnG_YIGw12VvOSJA78n_Tvzc78XgW7qwNRtHzfSUgkOOBcNHdqnkntgb9cvtn6JK1C2C5wD21zDcXDszFvLmPpCFUJ97hQiZFD0kpTRSTkT-yi1pcTQ2HKUtYqjzS3VjNdIIi-1cx1_pp=w763-h549-s-no-gm?authuser=0",
            "https://lh3.googleusercontent.com/pw/ABLVV87vdxw4oY6x9Cc9mWzDPkEks2H4qLtOijbONn8wKA4wA_mWmiHVrmXmjVFspaAdtK9zUmgY0RdasbDiuUTipf7KWF8_dC7G8HFDBOtmW3MJJVrhn4LqN05FKk_z0zjsDG5XGmx4yHTWxQy3rPbrhkiS=w313-h225-s-no-gm?authuser=0",
          ],
          urls_portafolio: [
            "https://github.com/BricoBC/hyperblog",
            "https://github.com/BricoBC/hyperblog",
            "https://github.com/BricoBC/Autenticacion",
            "https://github.com/BricoBC/curso_vue/tree/master",
            "https://github.com/BricoBC/portafolio",
            "https://github.com/BricoBC/regresion_lineal_simple",
            "https://github.com/BricoBC/LearnPy",
            "https://github.com/BricoBC/java_programs",
            "https://github.com/BricoBC/Bash-Scripts",
            "https://github.com/BricoBC/Ensamblador-PIC16F84A",
          ],
        },
      ],
      activities: [
        {
          pash: "Practicando algún deporte:",
        },
        {
          pash: "Jugando videojuegos:",
        },
        {
          pash: "Escuchar música:",
        },
        {
          pash: "Leyendo libros:",
        },
        {
          pash: "Viendo alguna serie o pelicula:",
        },
      ],
      slide2: 1,
      autoplay: true,
      series: [
        {
          data: [80, 90, 100, 80, 90],
        },
      ],
      chartOptions: {
        chart: {
          height: 400,
          type: "bar",
        },
        colors: ["#076541"],
        plotOptions: {
          bar: {
            dataLabels: {
              position: "top",
            },
          },
        },
        dataLabels: {
          enabled: true,
          formatter: function (val) {
            return val + "%";
          },
          offsetY: 14,
          style: {
            fontSize: ".9vw",
            colors: ["#FFF"],
          },
        },
        xaxis: {
          categories: [
            "Creatividad",
            "Adaptabilidad",
            "Trabajo en equipo",
            "Memoria",
            "Empatia",
          ],
          labels: {
            show: true,
            style: {
              colors: ["#FFF", "#FFF", "#FFF", "#FFF", "#FFF"],
              fontSize: ".7vw",
            },
          },
        },
        yaxis: {
          labels: {
            show: false,
          },
          max: 100,
          min: 0,
        },
        title: {
          text: "Habilidades",
          align: "center",
          style: {
            color: "#FFF",
          },
        },
      },
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
.txtCard {
  font-size: 0.9vw;
  background-color: rgba(0, 0, 0, 0.4);
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
