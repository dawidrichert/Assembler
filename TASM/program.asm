.model TINY                     ; dyrektywa .model mowi kompilatorowi na jakim modelu pamieci bedzie operowal				
.stack 100h

	.data                       ; deklaracja zmiennych
		zmienna1 db 0
		zmienna2 db 0
		zmienna3 db 0
		zmienna4 db 0

	.code                       ; dyrektywa .code rozpoczyna czesc kodu
		mov ax, @data
		mov ds, ax              ; ustawienie DS, aby wskazywal na segment .data
            
		mov ah, 08              ; wczytanie znaku z klawiatury
		int 21h                 ; zapisanie znaku do rejestru al
		mov [zmienna1], al      ; przeniesienie znaku z al do zmiennej
	
		mov ah, 08              ; wczytanie znaku z klawiatury
		int 21h                 ; zapisanie znaku do rejestru al
		mov [zmienna2], al      ; przeniesienie znaku z al do zmiennej
	
		mov ah, 08              ; wczytanie znaku z klawiatury
		int 21h                 ; zapisanie znaku do rejestru al
		mov [zmienna3], al      ; przeniesienie znaku z al do zmiennej
	
		mov ah, 08              ; wczytanie znaku z klawiatury
		int 21h                 ; zapisanie znaku do rejestru al
		mov [zmienna4], al      ; przeniesienie znaku z al do zmiennej
	
		mov al, [zmienna1]      ; nasza cyfra zostala wczytana jako znak ASCII i ma wartosc liczbowa danego znaku...
		sub al, 48              ; wiec odejmujemy 48, aby otrzymac prawdziwa wartosc liczbowa 
		mov [zmienna1], al      ; np. cyfra "3" w kodzie ASCII ma wartosc 51, wiec po odjeciu 48 otrzymujemy 3 jako liczbe.

		mov al, [zmienna3]      ; nasza cyfra zostala wczytana jako znak ASCII i ma wartosc liczbowa danego znaku...
		sub al, 48              ; wiec odejmujemy 48, aby otrzymac prawdziwa wartosc liczbowa 
		mov [zmienna3], al      ; np. cyfra "3" w kodzie ASCII ma wartosc 51, wiec po odjeciu 48 otrzymujemy 3 jako liczbe.
			
		mov cl, [zmienna3]      ; petla odpowiedzialna za wyswietlanie znakow z iloscia powtorzen z trzeciej zmiennej
		petla1:
			mov ah, 2
			mov dl, [zmienna2]  ; przeniesienie znaku do rejestru dl
			int 21h             ; wyswietlenie znaku przechowywanego w drugiej zmiennej
		loop petla1;
				
		mov cl, [zmienna1]      ; petla odpowiedzialna za wyswietlanie znakow z iloscia powtorzen z pierwszej zmiennej
		petla2:
			mov ah, 2
			mov dl, [zmienna4]  ; przeniesienie znaku do rejestru dl
			int 21h             ; wyswietlenie znaku przechowywanego w czwartej zmiennej
		loop petla2;

	mov ah, 4ch;                ; zakonczenie programu
	int 21h				 
	end
