# INSTRUCCIONES LOAD/STORE AGREGADAS AL PROCESADOR RISC-V

## 📋 NUEVAS INSTRUCCIONES IMPLEMENTADAS

Se han agregado 2 nuevas instrucciones al programa del procesador para demostrar el funcionamiento de las operaciones load/store:

### 1. **SW (Store Word) - Instrucción 4**
```assembly
sw x1, 0(x0)     # Almacenar x1 en memoria[0]
```

**Detalles técnicos:**
- **Formato**: S-type
- **Opcode**: `0100011` (Store)
- **Función**: `funct3 = 010` (Store Word)
- **Operación**: Almacena el contenido del registro x1 (valor 5) en la dirección de memoria 0
- **Codificación binaria**: `00000000000100000010000000100011`
- **Codificación hex**: `0x00102023`

### 2. **LW (Load Word) - Instrucción 5**
```assembly
lw x5, 0(x0)     # Cargar x5 desde memoria[0]
```

**Detalles técnicos:**
- **Formato**: I-type
- **Opcode**: `0000011` (Load)
- **Función**: `funct3 = 010` (Load Word)
- **Operación**: Carga el valor almacenado en memoria[0] hacia el registro x5
- **Codificación binaria**: `00000000000000000010001010000011`
- **Codificación hex**: `0x00002283`

## 🔄 SECUENCIA COMPLETA DE EJECUCIÓN

```assembly
# Instrucción 0 (PC=0x00):
addi x1, x0, 5     # x1 = 0 + 5 = 5

# Instrucción 1 (PC=0x04):
addi x2, x0, 3     # x2 = 0 + 3 = 3

# Instrucción 2 (PC=0x08):
add  x3, x1, x2    # x3 = x1 + x2 = 8

# Instrucción 3 (PC=0x0C):
addi x4, x3, 4     # x4 = x3 + 4 = 12

# Instrucción 4 (PC=0x10): ← NUEVA
sw   x1, 0(x0)     # memoria[0] = x1 = 5

# Instrucción 5 (PC=0x14): ← NUEVA
lw   x5, 0(x0)     # x5 = memoria[0] = 5
```

## 📊 ESTADOS ESPERADOS

### Estado de Registros al Final:
- **x0** = 0 (siempre cero en RISC-V)
- **x1** = 5
- **x2** = 3
- **x3** = 8
- **x4** = 12
- **x5** = 5 ← Verificación de load/store

### Estado de Memoria:
- **memoria[0]** = 5 (almacenado por sw x1, 0(x0))

## 🔍 VERIFICACIÓN DE FUNCIONAMIENTO

### ✅ **Prueba de Store (SW):**
- Al ejecutar `sw x1, 0(x0)`, el valor 5 del registro x1 debe ser escrito en la dirección 0 de memoria
- Señales de control activas: `MemWrite = '1'`, `ALUSrc = '1'`

### ✅ **Prueba de Load (LW):**
- Al ejecutar `lw x5, 0(x0)`, el valor en memoria[0] debe ser cargado en el registro x5
- Señales de control activas: `MemRead = '1'`, `MemToReg = '1'`, `RegWrite = '1'`

### ✅ **Verificación Final:**
- Si load/store funcionan correctamente: **x5 debe contener el valor 5**
- Si load/store fallan: **x5 contendrá 0 o un valor incorrecto**

## 🚀 SIMULACIÓN

### Señales Clave para Observar:

1. **Durante SW (ciclo 5):**
   - `MemWrite = '1'`
   - `alu_result = 0x00000000` (dirección calculada)
   - `reg_data2 = 0x00000005` (valor de x1 a almacenar)

2. **Durante LW (ciclo 6):**
   - `MemRead = '1'`
   - `MemToReg = '1'`
   - `mem_data = 0x00000005` (valor leído de memoria)
   - `write_data = 0x00000005` (valor a escribir en x5)

### Tiempo de Simulación:
- **Mínimo**: 12 ciclos de reloj
- **Recomendado**: 15 ciclos para observar estados finales

## 🛠️ ARCHIVOS MODIFICADOS

1. **InstructionMemory.vhd**: Agregadas instrucciones 4 y 5
2. **RISCV_Enhanced_TB.vhd**: Tiempo extendido y mensajes actualizados
3. **RISCV_Processor_TB.vhd**: Tiempo extendido y mensajes actualizados
4. **README.md**: Documentación actualizada

## 🎯 OBJETIVOS DE LA PRUEBA

- ✅ Demostrar que la unidad de control decodifica correctamente Load/Store
- ✅ Verificar que la memoria de datos funciona en lectura y escritura
- ✅ Comprobar que el generador de inmediatos maneja direcciones correctamente
- ✅ Validar que la ruta de datos completa funciona para todas las operaciones

Con estas instrucciones adicionales, tu procesador RISC-V ahora demuestra capacidades completas de cómputo, almacenamiento y recuperación de datos.
