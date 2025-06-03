import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeitosLandingpageComponent } from './leitos-landingpage.component';

describe('LeitosLandingpageComponent', () => {
  let component: LeitosLandingpageComponent;
  let fixture: ComponentFixture<LeitosLandingpageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [LeitosLandingpageComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LeitosLandingpageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
