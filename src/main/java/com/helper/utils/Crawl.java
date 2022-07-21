package com.helper.utils;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

@Component
public class Crawl {
	// 요청 URL
	private final String CRAWL_URL = "https://dict.naver.com/search.nhn?query=";
	
	// 크롤링 로직
	public List<String> getCrawlResult(String queryText, String languageInput) throws Exception {
		Connection con = Jsoup.connect(CRAWL_URL + queryText)
						.header("scheme", "https") // 이하 봇 차단 우회를 위한 HTTP 요청 헤더 변조
						.header("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36")
						.header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9")
						.header("accept-encoding", "gzip, deflate, br")
						.header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
		
		Document doc = con.get();
		Elements elem = doc.select("." + languageInput + "_dic_section dl dd"); // 입력 언어에 따른 셀렉터 쿼리 완성

		List<String> result = new ArrayList<>();
		// 셀렉터 쿼리 결과가 비어있지 않을 시 쿼리 결과를 <br> 태그를 기준으로 split 후 result에 저장
		if (!elem.isEmpty()) {
			String[] resultProc = elem.get(0).html().split("<br> ");
			for (String res : resultProc) {
				result.add(Jsoup.parse(res).text());
			}
		}
		return result;
	}
}
