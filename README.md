# PLAN UP — GitHub Pages 배포

## 1. GitHub 저장소 만들기
1. GitHub에 로그인하고 오른쪽 위 `+` → `New repository`를 선택합니다.
2. 저장소 이름을 `plan-up`으로 입력합니다.
3. `Public`을 선택하고 `Create repository`를 누릅니다.
4. `Add file` → `Upload files`를 선택해 이 폴더의 파일 전체를 올리고 `Commit changes`를 누릅니다.

## 2. GitHub Pages 켜기
1. 저장소의 `Settings` → `Pages`로 이동합니다.
2. `Build and deployment`에서 `Deploy from a branch`를 선택합니다.
3. Branch는 `main`, 폴더는 `/ (root)`를 선택하고 `Save`를 누릅니다.
4. 잠시 기다리면 `https://깃허브아이디.github.io/plan-up/` 주소에서 열립니다.

## 3. 기본 사용
Supabase를 연결하지 않아도 계획 추가, 상태 변경, 주간 캘린더, 메모, 리포트 기능은 이 기기의 브라우저에 저장됩니다. 단, 브라우저/기기별 저장이므로 다른 기기와 자동 공유되지는 않습니다.

## 4. PC와 iPad 동기화 설정 (Supabase)
1. Supabase에서 새 프로젝트를 만듭니다.
2. 프로젝트의 SQL Editor에서 `supabase-schema.sql` 내용을 실행합니다.
3. Project Settings → API에서 Project URL과 `anon` / publishable public key를 확인합니다.
4. GitHub 저장소의 `config.js`에서 빈 문자열 두 곳을 본인의 URL과 공개 키로 바꿉니다.
5. 수정 내용을 Commit하면 Pages가 다시 배포됩니다.
6. 웹사이트에서 회원가입 후 로그인하면 같은 계정의 데이터가 클라우드에 저장됩니다.

**주의:** `service_role` 또는 secret key는 절대 `config.js`나 GitHub에 올리지 마세요. 프런트엔드에는 공개용 anon/publishable key만 사용합니다. RLS 정책은 본인 계정의 데이터만 읽고 수정하도록 제한합니다.

## 5. iPad 홈 화면에 추가
Safari에서 배포 주소를 연 뒤 공유 버튼 → `홈 화면에 추가`를 선택합니다.

## 현재 포함된 기능
- 일간 할 일 등록 및 완료/부분 완료/미실행 상태
- 미실행/부분 완료 사유 기록
- 주간 월~일 편집 캘린더
- 기간별 회고 메모
- 실행률 및 규칙 기반 피드백
- 최근 7일/30일 실행 리포트
- Supabase 이메일 회원가입·로그인 및 데이터 동기화

## 참고
현재 피드백은 실제 생성형 AI가 아니라 기록에 근거한 규칙 기반 피드백입니다. 실제 AI 분석은 별도의 서버 함수와 비밀 API 키 보관이 필요하므로, 브라우저 코드에 키를 넣지 않도록 별도로 구성해야 합니다.
