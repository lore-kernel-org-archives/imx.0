Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922736;
	b=rDT8PuwHUy6Hk+1HV0zvfNxxOC+M2EhP3tHu4hdJK+Y9y2KQmcfcaNa8gp7sSfPz8x5n
	 irXl9RfCRPjRNbw0ygc4DHbGKGDL9EGaYivzlDccRoOPfgpI/B50l6l/9Vq6ehoRU2dhE
	 TRfyuAHAyUSinZDSGL8peEcrHqhWkOHIZ4jHr+V6bEn9zMOSYo3fYJ9ppX7x7PDSGtaqK
	 QMb1I9M1wasizJ4qmdcwMqT0di2yzY6pSmLp1FT92HIEdJwgKINxiTLki8+CcNPWWQHKl
	 F6Dinzi4oCD5nrkcKjtTFtKFKyxDueU+zdUW1TuWZG08g9WRF6+o0BOgbHUpHjtwG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
	b=qpNAU9thMj0rRh3TsxGzq9mDBmGF4QCefH+DWhNQZ8tP7ttlG0VjosatXXyThMd/51bm
	 s4I1TLOvvK2CH2Q/jAQ52o3TM3dt8il/QARxESfEVRItNpD3k6zkRQvw8SEIowqWI2lQA
	 eb3JEqeH6NHW1Bws56Xl/lRsBdeDWjye/6a/08i5A2mCOoejDVn0uIkn0gKybMdKv3rcg
	 7Q+H8/KShNo3ud0ITQT7AAzBGBHpxUaY6vPE1vL3mwCiGEu/GESHLX3RXsYi38OpEu161
	 SLl8mcMQ5GupxD4pxclgymQtfBhu/jMnm2zSEmCyr7GqySrxFGMVcEb/aGg/D8hggOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORyrDY50;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqGxWyoh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB240606A330
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB240606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORyrDY50;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DqGxWyoh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3wk22096581
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrW
	NmU2ZASE=; b=ORyrDY50SWYvgMTZehL76oVezNq9eyfaXW928tJardHIF3FHmwP
	4iEJO5B0YNE5/ksTfUru6hZIL4k7OAkzABNPVnhN9SRnjh8b2LN5FNketEXSgvoi
	MrzV0zn5q+Rd2z19YVFCKJwe2Mm3fL/WC3MJ28VyHH7jc3ToyF9QUsvyiZwiG5ss
	nLAY/IdRYrN4QJbB4EzZJkKF7nfPixjtjt4L9PvSIXwDtWmb/Ij2xkZLQlKYDJ57
	LEsqimllkVdQWFOHBWw1eVuedevRBxR8CsXXJf2Cp1fIPXrOjWQT1v3Y2qAw9eck
	qr9xIF447HeWb/8u6SSwOXyUHknzDf+BxcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2smk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:38:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so366694285a.0
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922734; x=1795527534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
        b=DqGxWyohMyYWmrgDlKFwDXeL0v73Aeovg5VxIR8FTMaN4J0UYl5dhJ1XbsdGhj7H0c
         jJLkSNQ6zozckh0VsDztIy0JZF17y6rgz2/P1Qrt4GEuBO/f1IJwpaC6Fl3y38U8kWTj
         pjp1o4QP/UnleZxL+LoWMHI+MSwNgwZYzeqSHpEWj+Y7/99PplIZTPLH6pj9XUZQCHW3
         JDFWP6coYU9pZjLFZppRs4XoUT/0ngjZLS/Zfb62H4kDsmUyWC1YoSD4jByWBFQe7B/T
         HX2x5s5wlSUMdV7H8I6DVZKGwRHyWZVWtmQYnu7pssipuwlODkT5onVz0yo6Snf5FD2+
         aOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922734; x=1795527534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPFDKvmq2EqZh5JS/5rPLMG40AgfNnBYFrWNmU2ZASE=;
        b=nCH7cvX2/I1BBF+b/p95tLEgesguj2/4qpJLjsyFc1XRA3dXtBTYyAnDfJbqAMCR8D
         XFz2W+w1RXkyxVM+w8YFTMm1VWoYdwsgwYwio3v9595fLqnYgbmJzHxEdTjufLfQsQNQ
         DD241fLTtiri80I5umpElUNxFunatP3rPdj9nti/ETHiSPuozQzL5q2RXd+qvZaOG+ab
         L64Buou7FPbbf4kyHezsFym3AuI7zhOePqVfGBCcn6lZb8FiD3U7TZa9VXFJJ8JBz6KO
         DfnkXP9RHkCgLeJwHKE0pmQaefK6Oc6de23giKoOpG2tilz9BWMwwgcLAOtGhW1Y2C49
         nGSg==
X-Forwarded-Encrypted: i=1; AL+hErHvd6auGtjshLXpfiFsXGB1QxAVakrSf34ilLYpJd/0IEfvj39fnM9y9qAxRNjgc8NTKus=@lists.linux.dev
X-Gm-Message-State: APuU4Z+hlE6XkRewoOvVZFdmj9xaVZTJuP3RsH17nj9WQAE2XtGMEoOI
	1NHY3fbuziZ2dSn+v87ovtNp+obvCaWUrheyo19r/Tss9IaI6UqoJssUHHsxbcW2jWL6CLiiaMw
	i+U/m55ZY2zoq6mOkQcX3qDOg3HFJXxnOAeefsWkFbI3dH9qzL9jfxuk=
X-Gm-Gg: AYBFou3MXTrV+sJRAGwioYh+JUjGt+ACgr0dfRyqthymavGeTLkbcqMEx34RF3F1yZj
	4pa4Of50JuT//sfmW/NAYJEqAMtowT86ryUvNxCfMj6CxB/Eg0WJ6kJslid5WuMSpQvffMqu05z
	kg42JAHumL49h1+L9fYOqkP/lZaCGnGAY+JOlX+fZnyy+yuVwUopRhAZmkZjvN62aI/RuIYkj+h
	Q4Luj6mLFBxQg83qoCxnMArJd7V3xR1gJXcU6ruNx4U2wLFQVxlGMV8lJ5CVn+ssEBiUlO25Ya7
	PC/4m6pwK/QxnNHdxV5axQG1UeI6ICPp1Ivgzu6q008rVQ+kKY+OjNQ4Qsa+Ek1/H7OwKGwsOTt
	0AT9x5K1jo7WIgL7kzsR5uGnIkau8kL4brs3KJ/M6nxTsQsv6hSTH9eFjJZgK4Q==
X-Received: by 2002:a05:620a:2b9a:b0:949:7c43:d54b with SMTP id af79cd13be357-9497c43db44mr984485685a.30.1794922733795;
        Tue, 17 Nov 2026 05:38:53 -0800 (PST)
X-Received: by 2002:a05:620a:2b9a:b0:949:7c43:d54b with SMTP id af79cd13be357-9497c43db44mr984480785a.30.1794922733259;
        Tue, 17 Nov 2026 05:38:53 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: freescale: fsl: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:43 +0100
Message-ID: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jtq/IDlygP/FprCTQ5i3pNz0nbgIOtQrQssp7bLL7N4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/Fji22HTKu+W5BUFpD5KKd4WB6zt4bXBDx/Fi
 SunzOCnT6GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4gAKCRDBN2bmhouD
 10yqD/9Sb7oad8D2swCZnW5cV1c8dL9ndvdVHdESXvlykpZUYTP1KeLcdz0avWe148cpbIfJLnx
 USjlpQXwlMUJd8RH9qqhr4pLYP9Uenpm4WZ2OOJgNPiz8t6Oi8B3Z/mKC03iIcng/gTFrWdExKE
 YD6k1xM9XrYhaZ6mD03T3OF14Kg28DoSqOgLdfVz7Brs5DpVFu4+I1jB7lkSIqUOQMyRSqKfVgp
 HQNb9+mM+b5OtefbF8mQNEmQMZtMsc+9Mu79HjNR4TmILrB51Qlr2ELyS6LFOf4UPWkzWwpJLgO
 LrHj94Gw5DU5GLgEhCQcdJqe8VlcFJ1IjtampKtn5u1xzbMggIeESHm0XnK3Nu4C7KB2UbVqfDv
 +MbP21NxWuifS/WElkye2yV2uKWesTkxVAb7a3mTekCPrGQ7h2GfozwQrPZLAqc+aVB+tge+lSK
 PIp3gNQTX9g9Z4W0s1gb2+Vb/xJg6mBJx4e/JKnC/RXla1yP/w0yF614A5z3Izink2gB7JRKEbg
 U+eWImoLq4Jv4itWhEGS32bKXscvyocIRqHky3rsT0ZR1f6l+astu1XqdT+L/wNXBWoQTTgsuin
 HHny+Z2BR75wWNorXQjmtz/6C2t6cSz3er88WM0XBruSklLYBU5//6tKrFy0O7wfoOtXskikFNn 5qYBbMzesNkYcdg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R72uEqx8pwYPGlgn8P6PXZfFCaUgZfVs
X-Proofpoint-ORIG-GUID: R72uEqx8pwYPGlgn8P6PXZfFCaUgZfVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX3QvNCxXTuVlI
 wqPwJ2HIgSaSp81zmlxJSIjX8ozUivkyW+uDDzO7Vl6lyRMBCt8azBVdjeokC959ujjaQiwkxRc
 oUJ77pn29Q//sP7kGTFHifucQzdxzxe05Yxmb24B6nTcl4hwrbEA7O6yFvEB6y6aKfn+qsNH27m
 cjsZxxjFr04HEe/ppFTy9be5NICGVzMy0cvUpdiJX3fYtNOdFi9Ijlh+VrBQH6jkcbwVyUMBOH/
 u1GL9YAyn5fHO8JcrJ0bZF+3wz+y7N5KCbvmKUJNEZa0mjs7cvSoDZtr6oNCd531DgW42ObshA0
 5y/qv1QqClH0hiRxmdVnVKCAERv1TsFPbj3ZqX6lW87y2Sh3xKMl2E+wuWZ2KcHaz6Wf9hcNLSh
 B39hkntpzUDW4jangO/uvyh4LSXSZ+0/0FzgUoX1yy286P9O0jp7WLva+MoDwNCebcGXQs3VAfF
 AKtFcxmbd6W99AKyijg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX490BIlcsL1Yf
 lIhabCk52wQK40ve3GmNAv6O9/23+5hUJW/9XimFAX9v6MmaeJtKcyG4C6zUtsquytySmZtFc8m
 2WBRSmyNuxw6NcTtFhD9BBamjynFj3I=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc58ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MF8-bgRzfeo1eCVTD2gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The dpmac, rtic-, qsgmii-, rgmii-s and other aliases were never approved
by Devicetree maintainers, because they were never documented as actual
ABI.  There is no in-kernel user of these, although there might be
U-Boot.  External DTS users cannot rely on undocumented ABI, thus these
are pretty safe to drop.

No new custom aliases are allowed for years now.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  4 ----
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    | 16 ---------------
 .../fsl-ls1043a-tqmls1043a-mbls10xxa.dts      |  8 --------
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  4 ----
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      |  8 --------
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      | 20 -------------------
 6 files changed, 60 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index b07022e3b6d5..7e455600f8d5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -20,10 +20,6 @@ / {
 	aliases {
 		crypto = &crypto;
 		rtc1 = &ftm_alarm0;
-		rtic-a = &rtic_a;
-		rtic-b = &rtic_b;
-		rtic-c = &rtic_c;
-		rtic-d = &rtic_d;
 		sec-mon = &sec_mon;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index e850551b16ac..ea4863c9686c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -24,22 +24,6 @@ aliases {
 		serial1 = &duart1;
 		serial2 = &duart2;
 		serial3 = &duart3;
-		sgmii-riser-s1-p1 = &sgmii_phy_s1_p1;
-		sgmii-riser-s2-p1 = &sgmii_phy_s2_p1;
-		sgmii-riser-s3-p1 = &sgmii_phy_s3_p1;
-		sgmii-riser-s4-p1 = &sgmii_phy_s4_p1;
-		qsgmii-s1-p1 = &qsgmii_phy_s1_p1;
-		qsgmii-s1-p2 = &qsgmii_phy_s1_p2;
-		qsgmii-s1-p3 = &qsgmii_phy_s1_p3;
-		qsgmii-s1-p4 = &qsgmii_phy_s1_p4;
-		qsgmii-s2-p1 = &qsgmii_phy_s2_p1;
-		qsgmii-s2-p2 = &qsgmii_phy_s2_p2;
-		qsgmii-s2-p3 = &qsgmii_phy_s2_p3;
-		qsgmii-s2-p4 = &qsgmii_phy_s2_p4;
-		emi1-slot1 = &ls1043mdio_s1;
-		emi1-slot2 = &ls1043mdio_s2;
-		emi1-slot3 = &ls1043mdio_s3;
-		emi1-slot4 = &ls1043mdio_s4;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
index e04483fdb908..76a07a0030ae 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts
@@ -19,14 +19,6 @@ / {
 		     "fsl,ls1043a";
 
 	aliases {
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 48a6c08fcea8..8c095aafd596 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -24,10 +24,6 @@ aliases {
 		gpio1 = &gpio1;
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
-		qsgmii-s2-p1 = &qsgmii_phy_s2_p1;
-		qsgmii-s2-p2 = &qsgmii_phy_s2_p2;
-		qsgmii-s2-p3 = &qsgmii_phy_s2_p3;
-		qsgmii-s2-p4 = &qsgmii_phy_s2_p4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 		serial2 = &duart2;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
index 43261cda3fcf..e50469c61482 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
@@ -18,14 +18,6 @@ / {
 		     "fsl,ls1046a";
 
 	aliases {
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
index 181eeab55aa0..d704aac8d9b9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts
@@ -19,26 +19,6 @@ / {
 		     "fsl,ls1088a";
 
 	aliases {
-		dpmac1 = &dpmac1;
-		dpmac2 = &dpmac2;
-		dpmac3 = &dpmac3;
-		dpmac4 = &dpmac4;
-		dpmac5 = &dpmac5;
-		dpmac6 = &dpmac6;
-		dpmac7 = &dpmac7;
-		dpmac8 = &dpmac8;
-		dpmac9 = &dpmac9;
-		dpmac10 = &dpmac10;
-		qsgmii-s1-p1 = &qsgmii1_phy1;
-		qsgmii-s1-p2 = &qsgmii1_phy2;
-		qsgmii-s1-p3 = &qsgmii1_phy3;
-		qsgmii-s1-p4 = &qsgmii1_phy4;
-		qsgmii-s2-p1 = &qsgmii2_phy1;
-		qsgmii-s2-p2 = &qsgmii2_phy2;
-		qsgmii-s2-p3 = &qsgmii2_phy3;
-		qsgmii-s2-p4 = &qsgmii2_phy4;
-		rgmii-s1 = &rgmii_phy1;
-		rgmii-s2 = &rgmii_phy2;
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
-- 
2.53.0

