@echo off
echo ==========================================
echo COMPILACION DEL PROCESADOR RISC-V
echo ==========================================

echo.
echo Verificando archivos VHDL...
if not exist "ALU.vhd" (
    echo ERROR: ALU.vhd no encontrado
    pause
    exit /b 1
)

if not exist "RISCV_Processor.vhd" (
    echo ERROR: RISCV_Processor.vhd no encontrado  
    pause
    exit /b 1
)

echo ✓ Todos los archivos VHDL encontrados
echo.

echo Orden de compilacion recomendado:
echo 1. ALU.vhd
echo 2. ALUControl.vhd  
echo 3. ControlUnit.vhd
echo 4. DataMemory.vhd
echo 5. ImmGen.vhd
echo 6. InstructionMemory.vhd
echo 7. RegisterFile_32bit.vhd
echo 8. RISCV_Processor.vhd
echo 9. RISCV_Enhanced_TB.vhd (o RISCV_Processor_TB.vhd)

echo.
echo INSTRUCCIONES:
echo - Abrir Quartus II
echo - Cargar proyecto: RISCV_Processor.qpf
echo - Compilar archivos en el orden indicado
echo - Ejecutar simulacion con ModelSim
echo.

echo Para compilacion con ModelSim (desde Quartus):
echo Tools ^> Run Simulation Tool ^> RTL Simulation
echo.

echo Para simulacion independiente con ModelSim:
echo vsim RISCV_Enhanced_TB
echo add wave -recursive *
echo run 500ns
echo.

echo ==========================================
echo LISTO PARA COMPILAR
echo ==========================================
pause
