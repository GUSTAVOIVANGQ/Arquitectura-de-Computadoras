# Diagrama de Flujo - Ruta de Datos del Procesador RISC-V

## Flujo Principal de Datos (De Arriba a Abajo)

```
┌─────────────────────────────────────────────────────────────────┐
│                        INICIO DE CICLO                         │
└─────────────────────────┬───────────────────────────────────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   PROGRAM       │
                 │   COUNTER       │
                 │     (PC)        │
                 └─────────┬───────┘
                           │ PC [31:0]
                           ▼
                 ┌─────────────────┐
                 │  INSTRUCTION    │
                 │    MEMORY       │
                 │   (256 x 32)    │
                 └─────────┬───────┘
                           │ Instruction [31:0]
                           ▼
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        │                  ▼                  │
        │        ┌─────────────────┐          │
        │        │   CONTROL       │          │
        │        │     UNIT        │          │
        │        │ (Opcode [6:0])  │          │
        │        └─────────┬───────┘          │
        │                  │                  │
        │     Control Signals:                │
        │     • RegWrite                      │
        │     • ALUSrc                        │
        │     • MemRead/MemWrite              │
        │     • MemToReg                      │
        │     • ALUOP [1:0]                   │
        │                  │                  │
        ▼                  ▼                  ▼
┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
│  REGISTER       │ │    IMMEDIATE    │ │   ALU CONTROL   │
│    FILE         │ │   GENERATOR     │ │ (funct3,funct7) │
│  (32 x 32)      │ │                 │ │                 │
└─────────┬───────┘ └─────────┬───────┘ └─────────┬───────┘
          │                   │                   │
     rs1_data [31:0]    immediate [31:0]    ALUCtrl [3:0]
     rs2_data [31:0]          │                   │
          │                   │                   │
          └─────────┬─────────┘                   │
                    │                             │
                    ▼                             ▼
            ┌─────────────────┐            ┌─────────────────┐
            │      MUX        │            │                 │
            │   (ALUSrc)      │            │                 │
            │                 │            │                 │
            │ rs2_data  imm   │            │                 │
            │    │      │     │            │                 │
            │    └──┬───┘     │            │                 │
            └───────┼─────────┘            │                 │
                    │                      │                 │
                    │ alu_input2 [31:0]    │                 │
                    │                      │                 │
                    └──────────┬───────────┘                 │
                               │                             │
                               ▼                             │
                     ┌─────────────────┐                    │
                     │      ALU        │◄───────────────────┘
                     │   (32-bit)      │
                     │                 │
                     │ A[31:0] ────────┼── rs1_data
                     │ B[31:0] ────────┼── alu_input2
                     │ ALUCtrl[3:0] ───┼── ALUCtrl
                     └─────────┬───────┘
                               │
                      alu_result [31:0]
                      zero_flag
                               │
                               ▼
                     ┌─────────────────┐
                     │   DATA MEMORY   │
                     │   (256 x 32)    │
                     │                 │
                     │ addr ───────────┼── alu_result
                     │ wr_data ────────┼── rs2_data
                     │ MemRead/Write ──┼── Control signals
                     └─────────┬───────┘
                               │
                        mem_data [31:0]
                               │
                               ▼
                     ┌─────────────────┐
                     │      MUX        │
                     │  (MemToReg)     │
                     │                 │
                     │ alu_result      │
                     │     │           │
                     │ mem_data        │
                     │     │           │
                     │     └─┬─────────│
                     └───────┼─────────┘
                             │
                      write_data [31:0]
                             │
                             ▼
                   ┌─────────────────────┐
                   │   REGISTER FILE     │
                   │   WRITE BACK        │
                   │                     │
                   │ wr_addr ────────────┼── rd [11:7]
                   │ wr_data ────────────┼── write_data
                   │ RegWrite ───────────┼── Control signal
                   └─────────────────────┘
                             │
                             ▼
                   ┌─────────────────────┐
                   │    PC UPDATE        │
                   │   PC = PC + 4       │
                   └─────────────────────┘
                             │
                             ▼
                   ┌─────────────────────┐
                   │   FIN DE CICLO      │
                   │  (Siguiente inst.)  │
                   └─────────────────────┘
```

## Descripción del Flujo de Datos

### 1. **Fetch (Búsqueda)**
- **PC** → Proporciona dirección de instrucción
- **Instruction Memory** → Devuelve instrucción de 32 bits

### 2. **Decode (Decodificación)**
- **Control Unit** → Decodifica opcode [6:0] y genera señales de control
- **Register File** → Lee registros rs1 y rs2
- **Immediate Generator** → Extrae y extiende inmediato
- **ALU Control** → Decodifica operación específica usando funct3/funct7

### 3. **Execute (Ejecución)**
- **MUX (ALUSrc)** → Selecciona entre rs2_data o immediate
- **ALU** → Realiza operación aritmética/lógica
- **Data Memory** → Acceso a memoria (si necesario)

### 4. **Write Back (Escritura)**
- **MUX (MemToReg)** → Selecciona entre resultado ALU o memoria
- **Register File** → Escribe resultado en registro destino (rd)
- **PC Update** → Incrementa PC para siguiente instrucción

## Señales de Control Clave

| Señal      | Función                                    |
|------------|-------------------------------------------|
| RegWrite   | Habilita escritura en registro destino   |
| ALUSrc     | Selecciona fuente para operando B de ALU |
| MemRead    | Habilita lectura de memoria de datos     |
| MemWrite   | Habilita escritura en memoria de datos   |
| MemToReg   | Selecciona fuente para write back        |
| ALUOP      | Código de operación para ALU Control     |

## Ejemplo de Ejecución: `addi x1, x0, 5`

```
PC = 0 → Instruction Memory → 0x00500093
       ↓
Control Unit (opcode: 0010011) → RegWrite=1, ALUSrc=1, ALUOP=00
       ↓
Register File (rs1=x0=0) → rs1_data = 0x00000000
       ↓
Immediate Gen → immediate = 0x00000005
       ↓
MUX (ALUSrc=1) → alu_input2 = immediate = 0x00000005
       ↓
ALU (ADD) → result = 0x00000000 + 0x00000005 = 0x00000005
       ↓
MUX (MemToReg=0) → write_data = alu_result = 0x00000005
       ↓
Register File Write → x1 = 0x00000005
       ↓
PC Update → PC = PC + 4 = 4
```