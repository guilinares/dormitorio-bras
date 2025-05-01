// resolvers/auth.resolver.ts
import { inject } from '@angular/core';
import { ResolveFn } from '@angular/router';
import { Auth, user } from '@angular/fire/auth';
import { firstValueFrom } from 'rxjs';

export const AuthResolver: ResolveFn<unknown> = async () => {
  const auth = inject(Auth);
  await firstValueFrom(user(auth));
  return true;
};
