# PROCESADOR RISC-V MONOCICLO - GUÍA DE SIMULACIÓN

## 📋 DESCRIPCIÓN DEL PROYECTO

Este proyecto implementa un procesador RISC-V monociclo completo que soporta:
- ✅ Instrucciones R-type (ADD, SUB, AND, OR, XOR, SLT)
- ✅ Instrucciones I-type (ADDI y otros inmediatos)
- ✅ Instrucciones Load/Store (LW, SW, LB, LH, etc.)
- ✅ Instrucciones Branch (BEQ, BNE, BLT, BGE)
- ✅ Instrucciones Jump (JAL, JALR)
- ✅ Instrucciones Upper Immediate (LUI, AUIPC)

## 🏗️ COMPONENTES PRINCIPALES

### 1. **RISCV_Processor.vhd** - Módulo Principal
- Integra todos los componentes del procesador
- Implementa la ruta de datos completa
- Maneja el flujo de control y PC (Program Counter)

### 2. **ControlUnit.vhd** - Unidad de Control
- Decodifica el opcode de las instrucciones
- Genera señales de control para coordinar componentes
- Soporta todos los tipos de instrucciones RISC-V

### 3. **ALU.vhd** - Unidad Aritmético-Lógica
- Realiza operaciones: ADD, SUB, AND, OR, XOR, SLT
- Genera flag Zero para instrucciones branch
- Soporta cálculo de direcciones para load/store

### 4. **ALUControl.vhd** - Control de ALU
- Decodifica campos funct3 y funct7
- Determina operación específica de la ALU
- Trabaja con señales ALUOP de la unidad de control

### 5. **RegisterFile_32bit.vhd** - Archivo de Registros
- 32 registros de 32 bits (x0-x31)
- x0 siempre contiene 0 (característica RISC-V)
- Dos puertos de lectura, un puerto de escritura

### 6. **DataMemory.vhd** - Memoria de Datos
- Soporta operaciones load/store
- Maneja diferentes tamaños: byte, halfword, word
- Extensión de signo automática

### 7. **InstructionMemory.vhd** - Memoria de Instrucciones
- Contiene el programa en formato binario
- Lectura asíncrona basada en PC
- Programa de prueba precargado

### 8. **ImmGen.vhd** - Generador de Inmediatos
- Extrae inmediatos de instrucciones
- Soporta todos los formatos: I, S, B, U, J-type
- Extensión de signo automática

## 🧪 TESTBENCHES DISPONIBLES

### 1. **RISCV_Processor_TB.vhd** - Testbench Simple
- Verificación básica del procesador
- Ideal para pruebas rápidas
- Ejecuta programa de suma simple

### 2. **RISCV_Enhanced_TB.vhd** - Testbench Avanzado
- Monitoreo detallado de la simulación
- Reportes extensivos de progreso
- Funciones de decodificación de instrucciones

## 📝 PROGRAMA DE PRUEBA ACTUAL

El procesador viene con un programa precargado en la memoria de instrucciones:

```assembly
# Dirección 0x00: addi x1, x0, 5     # x1 = 0 + 5 = 5
# Dirección 0x04: addi x2, x0, 3     # x2 = 0 + 3 = 3  
# Dirección 0x08: add  x3, x1, x2    # x3 = x1 + x2 = 8
# Dirección 0x0C: addi x4, x3, 4     # x4 = x3 + 4 = 12
```

### Resultados Esperados:
- x1 = 5
- x2 = 3
- x3 = 8
- x4 = 12

## 🚀 CÓMO EJECUTAR LA SIMULACIÓN

### En Quartus II:
1. Abrir proyecto: `RISCV_Processor.qpf`
2. Compilar todos los archivos VHDL
3. Usar ModelSim desde Quartus:
   - Tools → Run Simulation Tool → RTL Simulation
4. Ejecutar testbench deseado
5. Observar formas de onda

### En ModelSim Independiente:
```tcl
# Crear librería
vlib work

# Compilar archivos en orden
vcom ALU.vhd
vcom ALUControl.vhd
vcom ControlUnit.vhd
vcom DataMemory.vhd
vcom ImmGen.vhd
vcom InstructionMemory.vhd
vcom RegisterFile_32bit.vhd
vcom RISCV_Processor.vhd
vcom RISCV_Enhanced_TB.vhd

# Ejecutar simulación
vsim RISCV_Enhanced_TB
add wave -recursive *
run 500ns
```

### En GHDL (Línea de Comandos):
```bash
# Compilar archivos
ghdl -a *.vhd

# Elaborar testbench
ghdl -e RISCV_Enhanced_TB

# Ejecutar simulación
ghdl -r RISCV_Enhanced_TB --stop-time=500ns
```

## 📊 SEÑALES IMPORTANTES PARA OBSERVAR

### Señales de Control:
- `RegWrite` - Habilita escritura en registros
- `ALUSrc` - Selecciona fuente para ALU
- `MemRead/MemWrite` - Control de memoria
- `Branch/Jump` - Control de saltos

### Ruta de Datos:
- `PC` - Program Counter
- `instruction` - Instrucción actual
- `reg_data1/reg_data2` - Datos de registros
- `alu_result` - Resultado de ALU
- `immediate` - Valor inmediato extraído

### Verificaciones:
- Los registros x1, x2, x3, x4 deben contener 5, 3, 8, 12 respectivamente
- PC debe incrementar de 4 en 4 (0, 4, 8, 12, 16...)
- Señales de control deben activarse correctamente

## ⚠️ NOTAS IMPORTANTES

1. **Orden de Compilación**: Los archivos deben compilarse en el orden correcto debido a las dependencias
2. **Reset**: Aplicar reset por al menos 2-3 ciclos de reloj
3. **Timing**: El procesador es monociclo, cada instrucción se ejecuta en un ciclo
4. **Debugging**: Use las funciones de decodificación en el testbench mejorado

## 🔧 CORRECCIONES REALIZADAS

### 1. **ImmGen.vhd** - Generador de Inmediatos
**PROBLEMA**: Error de concatenación "expression has 33 elements, but must have 32 elements"
- ❌ Error: Tamaños incorrectos en J-type y B-type
- ✅ Solución: Tamaños exactos de concatenación para cada tipo

**TAMAÑOS CORREGIDOS**:
- I-type: 20 bits extensión + 12 bits inmediato = 32 bits ✓
- S-type: 20 bits extensión + 12 bits inmediato = 32 bits ✓  
- B-type: 19 bits extensión + 13 bits inmediato = 32 bits ✓
- U-type: 20 bits inmediato + 12 bits ceros = 32 bits ✓
- J-type: 11 bits extensión + 21 bits inmediato = 32 bits ✓

### 2. **DataMemory.vhd** - Memoria de Datos
**PROBLEMA**: Error de concatenación "expression has 40 elements, but must have 32 elements"
- ❌ Error: `x"00000000"` (32 bits) + byte (8 bits) = 40 bits
- ✅ Solución: `x"000000"` (24 bits) + byte (8 bits) = 32 bits

**TAMAÑOS CORREGIDOS**:
- Load Byte: 24 bits extensión + 8 bits dato = 32 bits ✓
- Load Halfword: 16 bits extensión + 16 bits dato = 32 bits ✓
- Load Word: 32 bits directo = 32 bits ✓

**SINTAXIS MEJORADA**: Uso de `(31 downto X => '1')` para extensión de signo más clara.

## 🔧 MODIFICACIONES PARA LOAD/STORE

Si quieres probar instrucciones load/store, modifica `InstructionMemory.vhd`:

```vhdl
-- Ejemplo: sw x1, 0(x2)  # Almacenar x1 en dirección x2+0
-- Ejemplo: lw x3, 0(x2)  # Cargar en x3 desde dirección x2+0
```

## 📚 REFERENCIAS

- RISC-V Instruction Set Manual
- Computer Organization and Design (Patterson & Hennessy)
- Documentación de componentes individuales en cada archivo .vhd

---
**Autor**: Proyecto de Arquitectura de Computadoras  
**Fecha**: Actualizado para soportar load/store completo  
**Versión**: 2.0 - Procesador Monociclo Completo
