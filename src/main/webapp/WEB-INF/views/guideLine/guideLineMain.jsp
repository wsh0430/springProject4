<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>guideLineMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs5.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
	<h2 class="mb-4 text-start">🥎 가이드라인 🥎</h2>

	<div class="accordion" id="guideAccordion">
		
		<div class="accordion-item">
			<h2 class="accordion-header" id="whatIsSite2">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#whatIsSite" aria-expanded="false" aria-controls="whatIsSite">
					0. 사이트 소개
				</button>
			</h2>
			<div id="whatIsSite" class="accordion-collapse collapse" aria-labelledby="whatIsSite2" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<p>HITBox - 기록과 팬심이 만나는 곳, 프로야구 통합 플랫폼</p>
					<p>
						국내 프로야구는 매년 수백만 명의 관중을 동원하며 한국 스포츠 시장에서 가장 높은 대중성과 팬덤을 자랑합니다. 
						하지만 그에 비해 팬들이 데이터를 바탕으로 의견을 나누고, 경기 외적인 즐거움을 함께할 수 있는 통합 플랫폼은 여전히 부족한 현실입니다. 
						기존의 세이버메트릭스 사이트들은 정제된 통계를 제공하지만, 야구에 대한 사전 지식이 없는 사용자에게는 어려운 수치와 복잡한 용어들로 인해 진입 장벽이 높은 경우가 많습니다. 
						반면, 커뮤니티 사이트들은 자유로운 소통이 가능하지만 전문적인 데이터 분석에는 한계를 보입니다.
					</p>
					
					<p>
						HITBox는 이러한 분산된 정보 환경과 기능의 한계를 넘어서기 위해 만들어졌습니다. 
						HITBox는 세이버메트릭스를 보다 쉽게 이해할 수 있도록 시각화된 차트와 통계 가이드를 제공하며, 
						야구 입문자부터 데이터 분석에 관심 있는 전문가까지 누구나 흥미롭게 데이터를 탐색할 수 있도록 설계된 플랫폼입니다. 
						또한, 팬들이 직접 의견을 나누고, 분석 결과를 공유하며, 자유롭게 소통할 수 있는 커뮤니티 기능을 함께 제공하여 정보의 깊이와 팬들의 참여를 동시에 실현합니다.
					</p>
					
					<p>
						기록의 스포츠인 야구의 본질을 살리면서도 팬들이 함께 호흡할 수 있는 공간,
						HITBox는 프로야구를 더 깊이 이해하고, 더 넓게 즐기기 위한 새로운 기준이 될 것입니다.
					</p>
				</div>
			</div>
		</div>
		
		<!-- 1. 야구의 역사 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingHistory">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseHistory" aria-expanded="false" aria-controls="collapseHistory">
					1. 야구의 역사
				</button>
			</h2>
			<div id="collapseHistory" class="accordion-collapse collapse" aria-labelledby="headingHistory" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<h5>1-1. 야구의 유래</h5>
					<p>
					<strong>야구</strong>는 19세기 중반 미국에서 시작된 스포츠로, 영국의 라운더스와 크리켓에서 유래했습니다.  
					1845년, 알렉산더 카트라이트가 ‘니커보커스 규칙’을 정립하며 9이닝, 9명 구성 등 현대 야구의 기반을 마련했습니다. 이후 1869년 최초의 프로팀 ‘신시내티 레드 스타킹스’가 창단되고, 1903년에는 메이저리그(MLB) 체제가 시작되며 전 세계로 퍼졌습니다.
					
					한국에는 1890년대 말 미국 선교사들에 의해 소개되었고, 1906년 YMCA와 외국어학교 간의 경기가 최초로 기록되었습니다. 일제강점기에는 조선인 팀이 일본인 팀과 맞붙으며 야구가 민족적 자긍심을 상징하게 되었고, 광복 후에도 학교와 사회단체를 중심으로 야구는 꾸준히 확산되었습니다.
					</p>
					<h5>1-2. 한국 프로야구 출범</h5>
					<p>
					<strong>한국 프로야구(KBO 리그)</strong>는 1982년 6개 구단(삼성, OB, MBC, 해태, 삼미, 롯데)으로 출범한 이후 점진적인 성장을 거쳐 현재는 10개 구단 체제로 운영되고 있습니다.  
					현재 리그에는 SSG 랜더스, LG 트윈스, 두산 베어스, 키움 히어로즈, 롯데 자이언츠, KIA 타이거즈, 한화 이글스, 삼성 라이온즈, NC 다이노스, KT 위즈가 소속되어 있습니다.
					
					KBO 리그는 2000년대 들어 TV 중계권, 구단 마케팅, 구장 리모델링 등을 통해 프로 스포츠 시장에서 강력한 브랜드 가치를 확보하였으며, 팬덤 중심의 응원 문화와 지역 연고제가 잘 정착되며 높은 관중 충성도를 보여주고 있습니다.  
					2023년에는 정규시즌 관중 수가 800만 명을 돌파하며 코로나19 이전 수준을 회복했고, 여성·가족 단위 팬의 증가로 관람 문화도 다양화되고 있습니다.
					
					또한 박찬호, 류현진, 김하성, 이정후 등 메이저리그에서 활약한 선수들의 영향으로 국제적 위상도 높아졌으며, WBC와 올림픽, 프리미어12 등 국제대회에서도 꾸준한 성과를 보이며 야구 강국으로 인정받고 있습니다.  
					최근에는 KBO의 리그 데이터를 활용한 스포츠 분석 산업과 콘텐츠 산업도 활발히 성장하며 야구 산업의 확장성이 주목받고 있습니다.
					
					이러한 점들을 통해 KBO 리그는 단순한 경기 이상의 사회·문화적 자산으로 자리잡고 있으며, 향후 디지털 기술 접목과 유소년 육성 강화 등을 통해 더욱 경쟁력 있는 리그로 발전할 가능성이 큽니다.
					</p>
					<h5>1-3. 야구가 지닌 미래시장에서의 가치</h5>
					<p>
					현재 야구는 미국, 일본, 한국, 대만, 중남미 일부 국가 등 제한된 지역에서만 주류 스포츠로 자리잡고 있지만, 이는 오히려 야구가 세계적으로 개척할 시장이 아직 많이 남아 있다는 것을 의미합니다.  
					특히 아시아 내 미개척 지역, 유럽, 아프리카 등에서는 아직 프로 리그가 활성화되지 않았으며, 메이저리그와 KBO, NPB 등 기존 리그가 콘텐츠 수출과 글로벌 마케팅을 강화함으로써 국제적 확장성을 확보할 수 있는 여지가 큽니다.  
					또한 스트리밍 플랫폼, 데이터 기반 해설, 가상현실 중계 등 디지털 기술과 결합된 야구 콘텐츠는 새로운 세대의 팬을 유입시키는 데에도 큰 역할을 하고 있습니다.  
					
					따라서 KBO 리그를 비롯한 야구 산업 전반은 단순히 국내 인기 종목을 넘어, <strong>세계 시장을 겨냥한 스포츠 산업</strong>으로서의 성장 가능성이 충분하며, 앞으로의 글로벌 전략이 그 성패를 좌우할 것으로 기대됩니다.
					</p>
				</div>
			</div>
		</div>

		<!-- 2. 포지션과 규칙 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingRules">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRules" aria-expanded="false" aria-controls="collapseRules">
					2. 포지션과 규칙🧍‍♂️
				</button>
			</h2>
			<div id="collapseRules" class="accordion-collapse collapse" aria-labelledby="headingRules" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<!-- 2-1 포지션 -->
					<h5>2-1. 포지션</h5>
					<p>야구는 9명의 수비수로 구성되며, 각각의 포지션은 고유의 역할과 요구 능력을 갖고 있습니다. 다음은 포지션 번호 순서대로 설명한 내용입니다:</p>
					<p><img src="${ctp}/resources/images/position.png"></p>
					<ul>
						<li>
							<strong>1. 투수 (Pitcher, P)</strong><br>
							공을 던져 타자와 대결하는 중심 포지션으로, 경기의 흐름을 좌우합니다.<br>
							<em>특징:</em> 다양한 구종과 제구력, 경기 운영 능력, 체력과 집중력이 중요합니다.
						</li>
						<li>
							<strong>2. 포수 (Catcher, C)</strong><br>
							투수의 공을 받아내며, 수비의 리더 역할을 합니다. 도루 저지와 작전 지시도 담당합니다.<br>
							<em>특징:</em> 강한 어깨, 빠른 판단력, 상대 분석력, 투수 리드 능력이 요구됩니다.
						</li>
						<li>
							<strong>3. 1루수 (First Baseman, 1B)</strong><br>
							1루에서 많은 아웃플레이를 수행하며, 송구를 받는 일이 많습니다.<br>
							<em>특징:</em> 안정적인 포구 능력, 키와 리치가 좋으면 유리하며, 비교적 기동력 부담은 적습니다.
						</li>
						<li>
							<strong>4. 2루수 (Second Baseman, 2B)</strong><br>
							내야 중앙을 수비하며 유격수와 함께 병살 플레이 등을 수행합니다.<br>
							<em>특징:</em> 민첩성과 빠른 반응속도, 송구 정확도가 중요합니다.
						</li>
						<li>
							<strong>5. 3루수 (Third Baseman, 3B)</strong><br>
							강한 타구가 자주 오는 핫코너 수비수로, 빠른 타구 처리와 강한 송구가 필요합니다.<br>
							<em>특징:</em> 반사 신경, 강한 어깨, 빠른 판단력이 요구됩니다.
						</li>
						<li>
							<strong>6. 유격수 (Shortstop, SS)</strong><br>
							내야 수비의 핵심으로, 넓은 수비 범위와 다양한 플레이를 수행합니다.<br>
							<em>특징:</em> 운동신경, 민첩성, 강한 송구력, 게임 센스가 뛰어나야 합니다.
						</li>
						<li>
							<strong>7. 좌익수 (Left Fielder, LF)</strong><br>
							외야 좌측을 담당하며, 타구 처리와 주자의 진루 저지를 수행합니다.<br>
							<em>특징:</em> 송구력과 타구 판단 능력, 정확한 포구가 필요합니다.
						</li>
						<li>
							<strong>8. 중견수 (Center Fielder, CF)</strong><br>
							외야 중앙을 수비하며, 가장 넓은 범위를 커버합니다.<br>
							<em>특징:</em> 빠른 발과 넓은 수비 범위, 강한 송구력과 포구 능력이 필수입니다.
						</li>
						<li>
							<strong>9. 우익수 (Right Fielder, RF)</strong><br>
							외야 우측을 수비하며, 홈으로의 송구가 많은 위치입니다.<br>
							<em>특징:</em> 강한 어깨와 정확한 송구 능력이 특히 중요합니다.
						</li>
					</ul>
					<p>또한, 지명타자(DH)는 수비에는 참여하지 않고 공격만 수행하는 역할로, 리그 규칙에 따라 채택 여부가 다릅니다.</p>
					
					<!-- 2-2 규칙 -->
					<h5 class="mt-4">2-2. 규칙</h5>
					<p><img src="${ctp}/resources/images/Baseball_diamond_ko.png"></p>
					<p>야구는 정해진 규칙에 따라 공정하고 전략적으로 경기를 진행하는 스포츠입니다. 기본적인 규칙과 경기 진행 방식은 다음과 같습니다:</p>
					<ul>
						<li>
							<strong>이닝(Inning):</strong> 경기는 총 9이닝으로 구성되며, 한 이닝은 양 팀이 각각 한 번씩 공격과 수비를 수행하면 끝납니다. 점수가 같을 경우 연장전이 진행될 수 있습니다.
						</li>
						<li>
							<strong>공격과 수비:</strong> 경기에서는 두 팀이 번갈아가며 공격(타격)과 수비(포지션 수비)를 수행합니다. 수비 팀은 3명의 타자를 아웃시키면 공격으로 전환됩니다.
						</li>
						<li>
							<strong>아웃(Out):</strong> 타자가 삼진(strike out), 땅볼 혹은 뜬공을 잡히거나, 베이스에서 태그 또는 포스 아웃되면 1아웃이 되며, 3아웃 시 공수 교대가 됩니다.
						</li>
						<li>
							<strong>점수 획득:</strong> 타자가 1루, 2루, 3루를 거쳐 홈플레이트까지 돌아오면 1점을 얻습니다. 타자의 안타, 홈런, 희생타 등으로 주자를 홈으로 불러들이는 것이 목적입니다.
						</li>
						<li>
							<strong>스트라이크/볼:</strong> 투수가 던지는 공이 스트라이크 존을 통과하면 스트라이크이며, 3스트라이크는 삼진 아웃입니다. 반면 스트라이크 존을 벗어난 공을 치지 않으면 볼이며, 4볼이면 타자는 1루로 진루합니다.
						</li>
						<li>
							<strong>타격과 주루:</strong> 타자는 안타를 통해 진루하며, 주자는 다음 베이스로의 진루 또는 도루(Steal)를 시도할 수 있습니다. 단, 수비 측의 송구나 태그에 의해 아웃될 수 있습니다.
						</li>
						<li>
							<strong>홈런(Home Run):</strong> 타자가 외야 펜스를 넘기는 홈런을 치면 본인과 베이스에 있는 주자 모두가 점수를 얻습니다.
						</li>
						<li>
							<strong>승패 결정:</strong> 9이닝 종료 후 더 많은 점수를 획득한 팀이 승리하며, 동점일 경우 연장전을 통해 승부를 결정합니다.
						</li>
					</ul>
					<p>이 외에도 경기에는 다양한 세부 규칙이 존재하며, 리그나 대회에 따라 일부 규칙이 다를 수 있습니다.</p>
				</div>
			</div>
		</div>

		<!-- 3. 야구의 용어 - 기초편 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingBasic">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBasic" aria-expanded="false" aria-controls="collapseBasic">
					3-1. 야구의 용어 - 기초편🧢
				</button>
			</h2>
			<div id="collapseBasic" class="accordion-collapse collapse" aria-labelledby="headingBasic" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<p></p>
					<ul>
						<li><strong>스트라이크(Strike):</strong> 스트라이크 존을 통과하거나 타자가 스윙했으나 공을 맞추지 못한 경우.</li>
						<li><strong>볼(Ball):</strong> 스트라이크 존을 벗어난 공에 타자가 스윙하지 않은 경우.</li>
						<li><strong>파울(Foul):</strong> 타자가 친 공이 페어 지역을 벗어난 경우.</li>
						<li><strong>아웃(Out):</strong> 타자 또는 주자가 규칙에 의해 경기에서 제외되는 상황.</li>
						<li><strong>세이프(Safe):</strong> 주자가 베이스에 도달하여 아웃되지 않은 경우.</li>
						<li><strong>이닝(Inning):</strong> 양 팀이 한 번씩 공격과 수비를 마치는 경기의 단위. 보통 9이닝 진행.</li>
						<li><strong>득점(Run):</strong> 주자가 홈 플레이트를 밟아 점수를 올리는 것.</li>
						<li><strong>인플레이 / 아웃플레이:</strong> 공이 유효하게 경기장 내에서 진행되는 상태 / 타자나 주자가 아웃되는 상황.</li>
						<li><strong>이닝(Inning):</strong> 각 팀이 한 번씩 공격과 수비를 수행하는 회차.</li>
						<li><strong>타임(Time):</strong> 심판이 경기 진행을 일시적으로 중단시키는 선언.</li>
						<li><strong>피클 플레이(Pickle Play):</strong> 주자가 두 베이스 사이에서 수비수에게 쫓기는 상황.</li>
						<li><strong>인터페어런스(Interference):</strong> 수비수나 주자가 경기 진행을 방해하는 행위.</li>
						<li><strong>인필드 플라이(Infield Fly):</strong> 1, 2루 또는 만루에서 내야에 뜬 공으로 자동 아웃 선언.</li>
												
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 3. 야구의 용어 - 타자편 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingHitter">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseHitter" aria-expanded="false" aria-controls="collapseHitter">
					3-2. 야구의 용어 - 타자편🏏
				</button>
			</h2>
			<div id="collapseHitter" class="accordion-collapse collapse" aria-labelledby="headingHitter" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<p>타자의 타격 관련 용어들을 정리하였습니다.</p>
					<ul>
						<li><strong>안타(Hit):</strong> 타자가 친 공이 페어 지역에 떨어져 수비에게 잡히지 않은 경우.</li>
						<li><strong>홈런(Home Run):</strong> 공이 외야 담장을 넘어가 타자 및 주자들이 득점하는 경우.</li>
						<li><strong>볼넷(Base on Balls):</strong> 투수가 네 번의 볼을 던져 타자가 1루로 진루하는 경우.</li>
						<li><strong>삼진(Strikeout):</strong> 타자가 세 번의 스트라이크로 아웃되는 경우.</li>
						<li><strong>희생번트(Sacrifice Bunt):</strong> 타자가 번트를 시도해 자신은 아웃되더라도 주자를 진루시키는 작전.</li>
						<li><strong>희생플라이(Sacrifice Fly):</strong> 플라이 아웃 중 주자가 득점하는 경우.</li>
						<li><strong>고의사구(Intentional Walk):</strong> 투수가 의도적으로 타자에게 볼넷을 주는 행위.</li>
						<li><strong>2루타 / 3루타:</strong> 타자가 공을 쳐서 2루 / 3루까지 가는 것.</li>
						<li><strong>타점(RBI):</strong> 타자가 타격으로 주자를 홈으로 불러들이는 것.</li>
						<li><strong>득점(Run):</strong> 주자가 홈 플레이트를 밟아 점수를 올리는 것.</li>
						<li><strong>타율(AVG):</strong> 안타 수를 타수로 나눈 값.</li>
						<li><strong>장타율(SLG):</strong> 총 루타 수를 타수로 나눈 값.</li>
						<li><strong>출루율(OBP):</strong> 출루 횟수를 타석 수 등으로 나눈 값.</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 3. 야구의 용어 - 투수편 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingPitcher">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePitcher" aria-expanded="false" aria-controls="collapsePitcher">
					3-3. 야구의 용어 - 투수편🧤
				</button>
			</h2>
			<div id="collapsePitcher" class="accordion-collapse collapse" aria-labelledby="headingPitcher" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<p>투수의 투구 및 수비 관련 용어들을 정리하였습니다.</p>
					<ul>
						<li><strong>보크(Balk):</strong> 투수가 주자를 속이기 위한 불규칙한 동작을 한 경우, 주자는 한 베이스 진루.</li>
						<li><strong>실책(Error):</strong> 수비수가 평범한 수비를 실패하여 주자가 진루하거나 득점하게 하는 경우.</li>
						<li><strong>병살(Double Play):</strong> 수비팀이 한 번의 플레이로 두 명의 주자를 아웃시키는 경우.</li>
						<li><strong>도루저지(Caught Stealing):</strong> 투수 또는 포수가 주자의 도루를 막아내는 플레이.</li>
						<li><strong>사구(Hit by Pitch):</strong> 타자가 투수의 공에 맞아 1루로 진루하는 경우.</li>
						<li><strong>완투(Complete Game):</strong> 한 명의 투수가 경기 전체를 던지는 경우.</li>
						<li><strong>세이브(Save):</strong> 리드를 유지한 채 경기 종료 시까지 막아낸 투수에게 주어지는 기록.</li>
						<li><strong>홀드(Hold):</strong> 팀의 리드를 유지하고 마운드를 내려가는 중간 계투의 성과를 기록하는 지표.</li>
						<li><strong>스트라이크 존:</strong> 타자가 타격할 수 있는 공간.</li>
						<li><strong>포심 패스트볼:</strong> 직선으로 빠르게 들어오는 기본적인 직구.</li>
						<li><strong>슬라이더:</strong> 수평으로 휘어지는 변화구.</li>
						<li><strong>커브볼:</strong> 위에서 아래로 크게 떨어지는 변화구.</li>
						<li><strong>체인지업:</strong> 속도를 줄여 타이밍을 빼앗는 변화구.</li>
						<li><strong>삼진(K):</strong> 타자가 스트라이크 3개로 아웃되는 것.</li>
						<li><strong>볼넷(BB):</strong> 볼 4개로 타자가 1루에 진루하는 것.</li>
						<li><strong>사구(HBP):</strong> 투구가 타자 몸에 맞아 1루로 나가는 것.</li>
						<li><strong>빈볼(Beanball):</strong> 타자를 위협하거나 맞히려는 의도가 있는 투구.</li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="accordion-item">
			<h2 class="accordion-header" id="specialRull2">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#specialRull" aria-expanded="false" aria-controls="specialRull">
					3-4. 야구의 용어 - 심화편⚾
				</button>
			</h2>
			<div id="specialRull" class="accordion-collapse collapse" aria-labelledby="specialRull2" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<p>야구 마니아가 아니라면 자주 햇갈리는 특수 규칙이나 새로 유행중인 용어들을 정리한 것입니다.</p>
					<ul>
						<li><strong>스트라이크 아웃 낫 아웃:</strong> 1루가 비어 있는 상황이나 2사 상황에 3번째 스트라이크를 포수가 정규포구 하지 못 할 때 타자가 1루로 진루를 시도 할 수 있는 권한이 생기는 상황.</li>
						<li><strong>삼중살:</strong> 한 타자의 타석에서 3개의 아웃 카운트가 한 번에 잡히는 경우.</li>
						<li><strong>누의 공과:</strong> 주자가 밟아야 할 베이스를 밟지 않고 지나치는 것</li>
						<li><strong>슬러브:</strong> 슬라이더와 커브를 합친 구종으로서 커브보다는 빠르고 슬라이더보다는 휘는 정도가 크다. 그립은 슬라이더 그립이고 던지는 폼은 커브 폼으로 던진다. 현재 KBO에서 각광받는 구종이다.</li>
						<li><strong>오타니 룰:</strong> 투수 겸 타자로 출전한 선수가 마운드에서 내려오더라도 지명타자로 계속 타석에 들어설 수 있도록 하는 규칙. 전무후무하게 투타를 겹업하는 LA에인절스의 선수 오타니 쇼헤이 때문에 생긴 규정.</li>
					</ul>
				</div>
			</div>
		</div>


		<!-- 4. 세이버메트릭스란? -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingSabermetrics">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSabermetrics" aria-expanded="false" aria-controls="collapseSabermetrics">
					4. 세이버메트릭스란?🧮
				</button>
			</h2>
			<div id="collapseSabermetrics" class="accordion-collapse collapse" aria-labelledby="headingSabermetrics" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<h5 class="mt-4">4-1. 세이버메트릭스의 정의와 기원</h5>
					<p>
						<strong>세이버메트릭스(Sabermetrics)</strong>는 야구의 통계적 분석을 통해 선수와 팀의 성과를 평가하고 예측하는 학문 분야로 야구 경기에서 발생하는 다양한 활동을 수치화하여 분석하는 방법론입니다. 
						이는 기존의 전통적인 직관이나 경험에 의존한 분석을 넘어서는 과학적 접근법을 제공하며 이는 경기 데이터를 기반으로 선수의 기여도를 평가하고, 팀 전략을 최적화하는 데 활용됩니다. 
						세이버메트릭스라는 용어는 미국 야구 연구 단체인 Society for American Baseball Research(SABR)에서 유래하였으며, 
						Bill James가 이를 대중화한 것으로 알려져 있습니다. 
						Bill James는 세이버메트릭스를 '야구에 대한 객관적인 지식의 추구'로 정의하며, 
						이를 통해 야구의 본질을 과학적으로 이해하고자 했습니다.
					</p>
					<h5 class="mt-4">4-2. 한국에서의 세이버메트릭스</h5>
					<p>
						<strong>KBO(한국프로야구)</strong>에서는 2000년대 중후반부터 세이버메트릭스가 본격적으로 도입되기 시작했습니다. 
						미국 메이저리그에서 ‘머니볼(Moneyball)’로 대표되는 세이버메트릭스가 주목을 받으면서, 
						국내 구단들도 기존의 전통적인 지표(타율, 방어율 등) 외에 새로운 통계 지표를 활용하려는 움직임을 보였습니다.
					</p>
					<p>
						초기에는 일부 구단이 경쟁력 강화를 위해 자체적으로 데이터 분석팀을 구성하고, OPS(출루율+장타율), WHIP(이닝당 출루 허용) 등 비교적 간단한 지표부터 활용하기 시작했습니다. 
						이후 2010년대에 들어서면서 KBO와 스탯티즈(Statiz) 등 외부 데이터 제공 업체 간의 협력이 강화되었고, 팬 여러분과 미디어에서도 WAR(대체 선수 대비 승리 기여도), 
						wRC+(조정 득점 생산력) 등의 고급 지표에 점차 익숙해졌습니다.
					</p>
					<p>
						2016년부터는 KBO의 공식 기록 시스템이 개선되면서 PTS(Player Tracking System)와 같은 고도화된 장비가 도입되었고, 
						트래킹 데이터를 기반으로 한 정밀한 분석도 가능해졌습니다. 이에 따라 각 구단은 분석 전문 인력을 채용하고, 
						프런트와 현장 간의 데이터 공유도 활발히 이루어지며 조직 차원의 활용이 확대되었습니다.
					</p>
					<p>
						현재는 구단의 스카우팅, 전력 분석, 선수 육성 등 다양한 분야에서 세이버메트릭스가 실질적인 의사결정 도구로 활용되고 있으며, 
						이는 한국 프로야구의 수준 향상과 전략 다양성 확대에 크게 기여하고 있습니다.
					</p>
					
				</div>
			</div>
		</div>

		<!-- 5. 세이버메트릭스의 용어 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingSabermetricTerms">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSabermetricTerms" aria-expanded="false" aria-controls="collapseSabermetricTerms">
					5. 세이버메트릭스의 용어
				</button>
			</h2>
			<div id="collapseSabermetricTerms" class="accordion-collapse collapse" aria-labelledby="headingSabermetricTerms" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<ul>
						<li><strong>WAR</strong>: 대체 선수 대비 승리 기여도</li>
						<li><strong>OBP</strong>: 출루율</li>
						<li><strong>SLG</strong>: 장타율</li>
						<li><strong>OPS</strong>: 출루율 + 장타율</li>
						<li><strong>FIP</strong>: 수비 무관 평균자책점</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 6. 참고자료 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingLinks">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLinks" aria-expanded="false" aria-controls="collapseLinks">
					6. 참고자료
				</button>
			</h2>
			<div id="collapseLinks" class="accordion-collapse collapse" aria-labelledby="headingLinks" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<ul>
						<li><a href="https://www.statiz.co.kr" target="_blank">Statiz</a></li>
						<li><a href="http://www.kbreport.com" target="_blank">KBReport</a></li>
						<li><a href="https://www.fangraphs.com" target="_blank">FanGraphs</a></li>
						<li><a href="https://www.baseball-reference.com" target="_blank">Baseball Reference</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</div>
<p><br/></p>
</body>
</html>
