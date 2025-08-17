import { TestBed } from '@angular/core/testing';

import { SaSharedLibService } from './sa-shared-lib.service';

describe('SaSharedLibService', () => {
  let service: SaSharedLibService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SaSharedLibService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
