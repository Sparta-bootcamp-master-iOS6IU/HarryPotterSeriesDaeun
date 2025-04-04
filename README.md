# **📚 HarryPotterSeries**

해리포터 시리즈 별 정보를 조회할 수 있는 앱입니다.

https://github.com/user-attachments/assets/cca4456f-59c2-41e1-ba0f-447c42e8088e

<br>

## ✅ 주요 구성

### 📦 HomeViewController
- 앱의 메인 화면을 담당하는 `UIViewController`
- `viewModel`과 바인딩하여 UI를 업데이트함
- 초기 로딩 시 `loadBooks()` 호출
- 요약 확장 버튼과 시리즈 선택 버튼의 유저 액션 처리

### 🧱 HomeView
- 주요 UI를 구성하는 커스텀 뷰
- 상단 제목 + 시리즈 선택 버튼 + 스크롤 가능한 책 정보 스택뷰 구성
- 포함된 섹션:
  - `BookInfoView`: 책 메타 정보
  - `BookDescriptionView`: 헌사, 요약, 챕터 (재사용)
- 시리즈 버튼은 동적으로 생성되며 선택 상태 반영

### 🧠 HomeViewModel
- `@Published` 프로퍼티를 통해 뷰와 데이터 바인딩
- `FetchBooksUseCase`를 통해 책 데이터 로드
- 요약 텍스트 처리 및 확장/축소 상태 관리
- 시리즈 버튼 선택 시 `selectedBook` 업데이트 및 summary 재계산

# 📂 디렉토리 구조

```
HarryPotterSeries
├── App                            # 앱 실행 관련 (AppDelegate, SceneDelegate 등)
│   ├── AppDelegate.swift
│   ├── LaunchScreen.storyboard
│   └── SceneDelegate.swift
│
├── Data                           # Data Layer (외부 데이터 접근)
│   ├── DataService/               # JSON 등 외부 자원 로딩 서비스
│   │   └── DataService.swift
│   ├── DTOs/                      # 외부 데이터 모델
│   │   ├── BookDataDTO.swift
│   │   └── BookResponseDTO.swift
│   └── Repositories/             # Repository 구현체
│       └── BookRepositoryImpl.swift
│
├── Domain                         # Domain Layer (비즈니스 로직)
│   ├── Entities/                  # 핵심 모델
│   │   ├── Book.swift
│   │   └── Chapter.swift
│   ├── Repositories/             # Repository 프로토콜
│   │   └── BookRepository.swift
│   └── UseCases/                 # UseCase 정의
│       └── FetchBooksUseCase.swift
│
├── Presentation                   # Presentation Layer (UI)
│   └── Home/
│       ├── Views/                # 커스텀 뷰 컴포넌트
│       │   ├── BookDescriptionView.swift
│       │   ├── BookInfoView.swift
│       │   ├── HomeView.swift
│       │   └── TitleContentView.swift
│       ├── HomeViewController.swift
│       └── HomeViewModel.swift
│
├── Resources                      # 리소스 (Assets, Info.plist, JSON 등)
│   ├── Assets.xcassets
│   ├── data/                     # 정적 JSON 파일
│   └── Info.plist
│
├── Support                        # 상수, 확장 등 유틸 모음
│   ├── Constants/
│   │   └── Constants.swift
│   └── Extensions/
│       ├── String+Extension.swift
│       └── UIViewController+Alert.swift
```
