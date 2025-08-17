import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SaSharedLibComponent } from './sa-shared-lib.component';

describe('SaSharedLibComponent', () => {
  let component: SaSharedLibComponent;
  let fixture: ComponentFixture<SaSharedLibComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [SaSharedLibComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(SaSharedLibComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
