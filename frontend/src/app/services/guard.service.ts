// guards/auth.guard.ts
import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { Auth, user } from '@angular/fire/auth';
import { map, take, filter } from 'rxjs/operators';

export const AuthGuard: CanActivateFn = () => {
  const auth = inject(Auth);
  const router = inject(Router);

  return user(auth).pipe(
    filter((user) => user !== undefined), // aguarda a resolução inicial do estado
    take(1),
    map((firebaseUser) => {
      if (firebaseUser) {
        return true;
      } else {
        router.navigate(['/auth']);
        return false;
      }
    })
  );
};
