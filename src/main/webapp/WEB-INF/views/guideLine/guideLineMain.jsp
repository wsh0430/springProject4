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
	<h2 class="mb-4 text-start">⚾ 가이드라인 ⚾</h2>

	<div class="accordion" id="guideAccordion">
		
		<!-- 1. 야구의 역사 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingHistory">
				<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseHistory" aria-expanded="true" aria-controls="collapseHistory">
					1. 야구의 역사
				</button>
			</h2>
			<div id="collapseHistory" class="accordion-collapse collapse show" aria-labelledby="headingHistory" data-bs-parent="#guideAccordion">
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
					2. 포지션과 규칙
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

		<!-- 3. 야구의 용어 -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTerms">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTerms" aria-expanded="false" aria-controls="collapseTerms">
					3. 야구의 용어
				</button>
			</h2>
			<div id="collapseTerms" class="accordion-collapse collapse" aria-labelledby="headingTerms" data-bs-parent="#guideAccordion">
				<div class="accordion-body">
					<p>야구를 처음 접하는 분들을 위해 기본적인 용어들을 정리하였습니다. 각 용어의 의미를 이해하면 경기를 더욱 재미있게 관람할 수 있습니다.</p>
					<ul>
						<li><strong>스트라이크(Strike):</strong> 타자가 스윙을 했으나 공을 맞추지 못하거나, 스윙을 하지 않았지만 공이 스트라이크 존을 통과한 경우를 말합니다. 세 번의 스트라이크로 삼진 아웃이 됩니다.</li>
						<li><strong>볼(Ball):</strong> 투수가 던진 공이 스트라이크 존을 벗어나고, 타자가 스윙하지 않은 경우를 말합니다. 네 번의 볼로 볼넷이 되어 타자는 1루로 진루합니다.</li>
						<li><strong>파울(Foul):</strong> 타자가 친 공이 페어 지역을 벗어난 경우를 말합니다. 스트라이크 카운트가 2개 이하일 때는 스트라이크로 판정되며, 2스트라이크 이후에는 아웃이 되지 않습니다.</li>
						<li><strong>안타(Hit):</strong> 타자가 친 공이 수비수에게 잡히지 않고 페어 지역에 떨어져 타자가 1루 이상으로 진루하는 것을 말합니다.</li>
						<li><strong>홈런(Home Run):</strong> 타자가 친 공이 외야 펜스를 넘어가면서 타자와 베이스에 있던 주자들이 모두 홈으로 돌아와 득점하는 것을 말합니다.</li>
						<li><strong>도루(Steal):</strong> 주자가 투수의 투구 동작 중에 다음 베이스로 진루를 시도하는 것을 말합니다. 성공하면 추가 진루가 인정됩니다.</li>
						<li><strong>삼진(Strikeout):</strong> 타자가 세 번의 스트라이크를 받아 아웃되는 것을 말합니다.</li>
						<li><strong>볼넷(Base on Balls):</strong> 투수가 네 번의 볼을 던져 타자가 1루로 진루하는 것을 말합니다.</li>
						<li><strong>병살(Double Play):</strong> 수비팀이 한 번의 플레이로 두 명의 주자를 아웃시키는 것을 말합니다.</li>
						<li><strong>실책(Error):</strong> 수비수가 평범한 수비를 실패하여 주자가 진루하거나 득점하는 경우를 말합니다.</li>
						<li><strong>보크(Balk):</strong> 투수가 주자를 속이기 위한 불규칙한 동작을 하여 주자들이 한 베이스씩 진루하는 것을 말합니다.</li>
						<li><strong>희생플라이(Sacrifice Fly):</strong> 타자가 플라이 볼을 쳐서 아웃되지만, 그 사이에 주자가 홈으로 들어와 득점하는 것을 말합니다.</li>
						<li><strong>희생번트(Sacrifice Bunt):</strong> 타자가 번트를 시도하여 자신은 아웃되지만, 주자를 다음 베이스로 진루시키는 것을 말합니다.</li>
						<li><strong>낫아웃(Dropped Third Strike):</strong> 삼진 상황에서 포수가 공을 놓쳐 타자가 1루로 진루할 수 있는 경우를 말합니다.</li>
						<li><strong>고의사구(Intentional Walk):</strong> 투수가 강타자를 피하기 위해 고의로 볼넷을 주는 것을 말합니다.</li>
					</ul>
					<p>이 외에도 다양한 용어들이 있으며, 경기를 보면서 자연스럽게 익혀나가시면 더욱 재미있게 야구를 즐기실 수 있습니다. 더 많은 용어들은 </p>
				</div>
			</div>
		</div>

		<!-- 4. 세이버메트릭스란? -->
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingSabermetrics">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSabermetrics" aria-expanded="false" aria-controls="collapseSabermetrics">
					4. 세이버메트릭스란?
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
					<p>
						
						

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
