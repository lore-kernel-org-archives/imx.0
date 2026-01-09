Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98870272803
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977900; cv=none; b=hG+mNTjSXuMdEVhwif/SFalCO+3UCoHkzmI2aAxA6E3KerHGRxLBIFk8qJbKqEQ8P9abgO8gePBV+bHsSGvQ1/WroOMP3fIMzqXrivfmtb5ZAA4tl9VieEoGIzP4QQD9nmjHwj/Rla0vhzO/c1cIDtKJBkZxbb9UaNQFq8rlSJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977900; c=relaxed/simple;
	bh=abI4vVKZ2V3r6fPoj3rMop+rIaKgyFQ7QmKPzSitsLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpwmA2zd8egLAStC2y6ERjXI6CPnWr4HQuFpT9hpzMchB+8UZ0l6o19hzkfiGu16NBhoTogHKtjMhh+xifvHwfc5C9CvXg3BXkJuTLb0HEafV9p0cpH5W6r5nqz/rK6ketCoezG0iGCqdMHzr6t0QtJpc/l/mx/x+kRZ0w3kVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOl4bzuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTG0bxUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOl4bzuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTG0bxUS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609FMwoM1953231
	for <imx@lists.linux.dev>; Fri, 9 Jan 2026 16:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ylUaLBidala1u98n/o6ZCU1ttqISuhXHyYTd1kU9MQ=; b=MOl4bzuBSkWhZR+W
	e45f2dSaxBgBGDuf1HyNyAouMHpD3OPIAKpLdTTQz60siPaIuA46bKvIADDGByRx
	SHQebU8ZwOw6m8f/ZHUK5WY9gT33MeYB8w4VLt82nfVny/c41UlLyTE9BiZ12vUT
	Ecclfxouckb/F0baX9Rh+DGum9cTsDnva7cgykx42OupLEBPUV6g4Eaxqtz0ONC1
	8Dbr5zR3m11HqeMUjULZw94ONdU6kBgkoko3IKxS03bSEbOLjWLiSDPhPZ4ZoXr4
	9Wvmgsr7yzW+VXoN9D884Am/S2z1saGWfAnB/aAtw3F7KCmNXiM5UxF/cxcZiyF2
	j2rm1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdac1x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Jan 2026 16:58:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b17194d321so667302985a.0
        for <imx@lists.linux.dev>; Fri, 09 Jan 2026 08:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977892; x=1768582692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ylUaLBidala1u98n/o6ZCU1ttqISuhXHyYTd1kU9MQ=;
        b=WTG0bxUS4BZ/snLeCQFSdrGrN6L+TPnC+A62ESF95RYayrFbYz0l7KZthyU8kCGfeL
         dtlwK3CsJizn8ZCoBoFOyh9LSl6u9zNR0IuDSFxgYlv23ChHbZVy2jG1VFGu/tBHmPGD
         9sJVipMCPveHgGZgRGA4cxgx31TXPzx2h1B35EZo50HQA9cpA9Lo3H9jXWDQ3JLDWceS
         AZXgOQ1CdXoaP7XemH08fUo/q/z1ATs1AYRltXjY5P7iPeutevbGfsW9zhPCAqKf1F33
         fBHw9Vm+dCxKBXjz8TpMFbtt9MFl96EQTsMFlZAGQg0q+t/xszOQTmoco/3HlbNaQJdG
         vY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977893; x=1768582693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ylUaLBidala1u98n/o6ZCU1ttqISuhXHyYTd1kU9MQ=;
        b=EUYfTHFtwX36Klh3xiF8CRYSXyB5bAwv4BtMZ89k/acumRlcl65faQwtW9tcvhO+vb
         OeQ4cJL9NUZ8QGxxsO86MAcswUhF5Q+0dLrMt4k1FXemG+kzZLPCngEEKcEQWxUkBIz+
         k4/1/FW8Yc92dfcu60q1s+TZGwtpYdUo+qQZ0jJz8dTkOgIGqeYAdvgOoaxVewWBXHAy
         YGPGzmgNWIsO3TV5Q+eR7uUF9JmWodSjtDHxqurYnYhOcrm4udrKO/hI1bP3iipA4Wrt
         M7OAZBr9sgh0TA73d8lhxPZflGB/L4yN8kXRCUzTFqWEvMa1ffkJpA2hjR5xiXb8Jhqa
         PL9w==
X-Forwarded-Encrypted: i=1; AJvYcCXDAKooCgbWdShgA4fnONrU2VX62ovdH1iukWwO0SHXyq0bHST+u332ACyMG35h2+RA3TQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlUxfSuLg4NphI96Uk7zxuHsvhofha/Bsu+YUOebSYiQMLs+K0
	Esu4XChD6QThxQNCUSkI3EptATDTwzuLRIJ++sBDWQgadFOuKzf1Kyf4vs75UKEnIhfV2ASX1G7
	885d35WN3OeCcrmMpWeueT1+YvfcetvQdlhMO67YW0QX6CjoSxb6qTkc=
X-Gm-Gg: AY/fxX5falYZCfVrZIv+KlNzT4y0OtAIvrGJcJFrjKhxKQEGpMYHS5cCYuSmHnGwHxP
	MIqd894aourIijgK5zpjgaZTo2Mr1YgCHXhvDhbBjiSWU0GmbOjafeMwMpmBZ6Xq8B/6NFVcooq
	5VCVRvhm6VDCD9O50+seuUJNLV0hlym0mG7G1RmLM1+PT4axFSCSKEZw9sXOWyRXd+s9M/muO7l
	qUeSx87SoNxRGCooWROx3gBPVsnG6ClQZslEHPIY7hyI/MPOQndI4VKvF3FK/pTB0hlWocMBF/k
	0ldjs2itM3Rzffcz+jcfyEDd3ou1aAcyTXVw+rD3imw2xgAwfaXWsc3E8eyiZbRU4YmoXKL9jyI
	+fWPFDEUKz6TmSGKdBVfIcRo+rt8aYn4cCQ==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr1278313885a.69.1767977892291;
        Fri, 09 Jan 2026 08:58:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPgCL7OXhofKD63yu6CqXzLuabksUOQ8VJV1cad4gN38L8pgj/ln+3O094KFk9sDY/IZdfDQ==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr1278309385a.69.1767977891782;
        Fri, 09 Jan 2026 08:58:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:46 +0100
Subject: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=abI4vVKZ2V3r6fPoj3rMop+rIaKgyFQ7QmKPzSitsLY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlhM5KjFL+VmtviwKxvhVbScXQzaoAQG4FgEd7/qE93wpepQ
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpYTOSAAoJEME3ZuaGi4PXbIYP/2FV
 PTcFQgtRjUNhHGjo0i1/wWxp6lecwR2vezt4z0Y7HtRiPAGB4smNbyWnxb6PhoufWzhQiKcUlox
 IyUXaDuNVhHVF0ciy+80/o7qJLkRbmaA9yML3inA7+ttUCdLtumN3GdgznjiWW58InRPVKKAMBr
 74TUOqUoWsPRCCmRFbsV8LarOKHQl43aPrSFKMO4BxOB98Ff7eNGUzxqStCv0HB8Fb4U67sEEB8
 vjH+FPXHfdrWWYClfg96cRQhIm8scSKz4EZiUJGXSy5efSia11pfzkKrAmuHa7W+nvW34l/CbLF
 RmvGPFB6A2wryDmNhLx4C4Y+oCn6X5jJkcFR5yhTHG00wt4LMlKK63a38ZQSGdxNMa08cR+ZA2i
 scypfUltDqxfv0UNGHlBcevq0vbhhwt8LrfS/O9jHzKud05bcUqwtwwRxGge7+RCPLffZkvAuE6
 4V69DEvZ7zJFMPiSc41CHlltPTLCOXE9otxpyh5fAteTLFUkszNovEJAt64t2rirWRemXfelR+V
 6OB8Iiw3vK0kpIuIuxF+cY2dvCUKoMLXA0hSUih2WqLERud1raVcvBW3p8kGiOELMVX21R13DoR
 3WPrQcn8FzQyttIpIj1d5xvibvNczCroHEvxiXjKK4WK1yJ0hBHnSaiBYb8oXHD8b73H+ZEz3b/
 Mbja+
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696133a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=HKzYjZOG_gvwJIbDKMwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: 5PelfTvY3mKhlqYN552slRk0ySE9Mdi1
X-Proofpoint-GUID: 5PelfTvY3mKhlqYN552slRk0ySE9Mdi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX8JCAnZ2bUGNC
 MGKLxWosf6JO4zq5DYRJE8Na6vNFQjiqi84ef91bF6pxOxGCdT+XAkCNQqzGGtw9EDkZigVcQHv
 gOdNa7t/RRl7eaBUjBbezLeKJaik2ic2PtOob79B1LkFrSoZkOcEPkHS7AoFNtyEabQhBXuwbzV
 VxpVoxKgtCbAX0NwS5ORDfLqaSl3olvQ6rcL/qOASC3cP6DdXE0E/hVssiks1aXOzqRpEO/VxWW
 NS0HywGKdEOTURevKKM/esI8cdMcZQu3XcqPqe0PScWPckDG9Vf+x319EPAXZoZdo9yHbgQfdgg
 t1a9rOpUJ+PJUXKdKdjL80C/cmBBoRTUxncundPnIK+4nmxh8qiv9Px8InsmAR1iSijjK8ueKHs
 ticSivy41jcM+sdyq6jCe6bAfliQdXW8d4PCLQjvzq/r6hdoamEf80Thng1GjSaDP+6chhZiN6y
 tr1Yp+uh6FKTWiaXppA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/arm/mach-at91/pm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 35058b99069c..68bb4a86cd94 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
 	struct gen_pool *sram_pool;
 	phys_addr_t sram_pbase;
 	unsigned long sram_base;
-	struct device_node *node;
 	struct platform_device *pdev = NULL;
 
-	for_each_compatible_node(node, NULL, "mmio-sram") {
+	for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
 		pdev = of_find_device_by_node(node);
-		if (pdev) {
-			of_node_put(node);
+		if (pdev)
 			break;
-		}
 	}
 
 	if (!pdev) {

-- 
2.51.0

