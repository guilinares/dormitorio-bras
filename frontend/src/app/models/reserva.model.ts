export interface Reserva {
    codigoReserva: string;
    nomeIrmao: string;
    ministerio: string;
    idade: string;
    tempoDeMinisterio: string;
    enfermidade: boolean;
    alocado: boolean;
    leito: Leito;
  }

interface Leito {
  numeroLeito: string;
  dormitorio: string;
}