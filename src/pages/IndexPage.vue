<template>
  <q-page class="flex flex-center">
    <!-- First section -->
    <section style="width: 100%" class="row justify-around bg-secondary">
      <!-- section left -->
      <div style="width: 50%">
        <h3 class="txtOsw">
          ¡Hola, soy {{ name }}!
        </h3>
        <q-separator inset />

        <q-expansion-item
        expand-separator
        icon="perm_identity"
        :label=nameUniversidad
        caption="Licenciatura"
      >
      <q-card flat bordered>
          <q-card-section>
            <div class="text-h6"> {{ nameUniversidad }} </div>
            
          </q-card-section>
          
          
        
        </q-card>
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
      nameUniversidad: "Universidad Autónomoa del Estado de México"
    };
  },
  methods: {},
});
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');

.txtOsw{
  font-family: 'Bebas Neue', sans-serif;
  font-size: 4vw;
  }
</style>
