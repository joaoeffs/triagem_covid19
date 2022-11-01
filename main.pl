nome(caio).
nome(darta).
nome(eduardo).
nome(joao).

temperatura(caio, 40).
temperatura(darta, 36).
temperatura(eduardo, 36).
temperatura(joao, 41).

frequencia_cardiaca(caio, 120).
frequencia_cardiaca(darta, 90).
frequencia_cardiaca(eduardo, 90).
frequencia_cardiaca(joao, 180).

frequencia_respiratoria(caio, 35).
frequencia_respiratoria(darta, 18).
frequencia_respiratoria(eduardo, 20).
frequencia_respiratoria(joao, 39).

pa_sistolica(caio, 100).
pa_sistolica(darta, 105).
pa_sistolica(eduardo, 120).
pa_sistolica(joao, 55).

sa_O2(caio, 100).
sa_O2(darta, 96).
sa_O2(eduardo, 97).
sa_O2(joao, 78).

dispneia(caio, "Nao").
dispneia(darta, "Nao").
dispneia(eduardo, "Nao").
dispneia(joao, "Nao").

idade(caio, 55).
idade(darta, 65).
idade(eduardo, 59).
idade(joao, 65).

quantidade_comorbidades(caio, 2).
quantidade_comorbidades(darta, 0).
quantidade_comorbidades(eduardo, 0).
quantidade_comorbidades(joao, 6).

caso_grave(P):-
    (frequencia_respiratoria(P, FR), FR > 30);
    (pa_sistolica(P, PS), PS < 90);
    (sa_O2(P, S02), S02 < 95);
    (dispneia(P, D), D = "Sim").

caso_medio(P):-
    (temperatura(P, T), T > 39);
    (pa_sistolica(P, PS), PS >= 90, PS =< 100);
    (idade(P, I), I >= 80);
    (quantidade_comorbidades(P, QC), QC >= 2).

caso_leve(P):-
    (temperatura(P, T), T >= 37, T =< 39);
    (frequencia_cardiaca(P, FC), FC > 100);
    (frequencia_respiratoria(P, FR), FR >= 19, FR =< 30);
    (idade(P, I), I >= 60, I =< 79);
    (quantidade_comorbidades(P, QC), QC = 1).

diagnostico_grave(P):-
    caso_grave(P),
    write("Caso Grave: deve ser encaminhado para o hospital").

diagnostico_medio(P):-
    caso_medio(P),
    write("Caso Medio: deve ficar em casa, em observacao por 14 dias.").

diagnostico_leve(P):-
    caso_leve(P),
    write("Caso Leve: deve ficar em casa, em observacao por 14 dias.").

testar_paciente(P) :-
    diagnostico_grave(P);
    diagnostico_medio(P);
    diagnostico_leve(P);
    write("Nenhuma alteracao clinica, paciente normal.").