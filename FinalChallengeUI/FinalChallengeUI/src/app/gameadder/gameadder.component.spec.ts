import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GameadderComponent } from './gameadder.component';

describe('GameadderComponent', () => {
  let component: GameadderComponent;
  let fixture: ComponentFixture<GameadderComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GameadderComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GameadderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
