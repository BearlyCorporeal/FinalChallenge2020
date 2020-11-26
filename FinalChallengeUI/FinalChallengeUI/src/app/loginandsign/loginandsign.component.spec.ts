import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LoginandsignComponent } from './loginandsign.component';

describe('LoginandsignComponent', () => {
  let component: LoginandsignComponent;
  let fixture: ComponentFixture<LoginandsignComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LoginandsignComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LoginandsignComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
