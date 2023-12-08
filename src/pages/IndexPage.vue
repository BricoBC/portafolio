<template>
  <q-page class="flex flex-center">

    <section style="width: 100%;" class="row justify-around bg-primary">
      <div style="width: 50%;">
        Hola
      </div>

      <div style="width: 40%;">
        <q-img src="../assets/images/Personal.jpg" alt="Foto_personal">
          <div class="absolute-bottom text-subtitle1 text-center">
            Hola, soy {{ name }}.
          </div>
        </q-img>
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
    };
  },
  methods: {
    
  },
});
</script>
