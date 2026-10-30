Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368978;
	b=US3XzIWtJRS5tLibR5AJNQtsq3BvahPvnYP6lcrKRi6VjT+DW1OUDcOtstAVYXRxCS++
	 gO9672IwJo1+Jpq6shbL6mqpU53v+aamtttkqYLBTLRIgzlTKkB6awE9Z6EyTclyhzjuB
	 FEFZwN7jP35vUYejroAecbyBOLR7xSUyut6H8Ao8NSvy9pAHWrP2xfbVbQ5zUgjc5U8NY
	 LBttNusoYpDcAAW/YanvZLt1o2nP1jPbJvYkqlGb1Gay98nyLxmoEyLLQ8oQ3nF1jWzbh
	 sBcDAODhXAT8ZNi9mUEmTmAwGAYxypveit3JeXxcfvFfpW/k6zRLful+0E9sCJPohaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368978;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
	b=CCQp0Rr6kcByI5E1F/pVJMh3vPqR8exzY6atNCKogvk/iGrvlqBEulFOyg20RBp4YTjx
	 Z5pGuOmKg61CJyP1ZSfm9CQ/7NtluGS/ZXgdUEQmeGqPsnFHdn6i+dSfqz1kZoEU6XqDe
	 aFyBxMtpGgpFMnNS4RoVG/8bVD3HLRmdMnorzxTdKqwKhirtVYDXukNs4FgilkkpBYpjh
	 eTfgZ8Y4uQOInNpMOwrThDegVMyfDS78X7+t9kR3sRRpDlHTaZcyybKhQRKaBJtzBm1A2
	 7s+u4AiEz89j4M3EciWzmQvrWCPRPaV565xkKsVK5ZX69cocsvSwIAHS1BeYuQmF0VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrRweY7O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C6606A32C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrRweY7O
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn7EA2409206
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3tMVC+s+E/Y
	qx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=; b=M1awF8dRp/omx4H8TE5KB6zRkHQ
	fOkEyIkmJHzcfwHvjB5tedHg3Ri8eOFjH7JdYQnERSNTsCs0YvIQXrM1SsuuGzTS
	5jmXeiPHCjI2NM8sXEPFMW32BDqkmhjIdMeSGMMbP8mUqEaaYyiYkDjtq22+1JhG
	Tzvncr1k1Xz+JFcnePvCAUVC3hta4SwR1NRhq3QTOetwCom5QAuuLkZk/2upCsJ9
	yeJMa8IEailf6aTvL3jDBQ+V4ptVnFByFnZj+w23jdRwpA8AVF05MeQAE2pk6eEP
	WT93DP4kXVeF0uY2f6mG2uJJZBu8yiU+4+X8c7ntLMUS6wZF3hijHnRxb1g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3drg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:02:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bea8fed6so572991241.2
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368975; x=1793973775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=PrRweY7OrK8wgnbBBduWYSGcdaXqCtbatSFczJOp5zoJQh37XWpt0URsW0bT5Y24uC
         0leDSqEplc6ng/cRTby4kPK7v4Ow18B3+QGiB8KCSnEqejcUi8i1EaADkXRn+8Thn2Jh
         +4ABmSsko8YFtz2VvcowDT0UiqOGVvKERhBk7L+/b/97JvtaEfwbeuQFRYPf1AMB8Ko1
         jeiTdB0QFIwg7yYCt5822IX0+9fmBACZCZpn/dPzBEbAggam+q2dKGPXbyu49KWfZOmO
         /aq2d2CKcmIKcGTxuT4He0xm6Yj158mztIMX+96kmjdmqQfko834ZX6wFkoXmmnX0+qw
         7Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368975; x=1793973775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=G38f3YGqdvBVM5YsX8E2xYYrdehqGVe9oFP5zGmDUf/qMNNIta8BrJ5BPzmMq+GBya
         lPkBICk4ckQfP8WS5uGxcOcCgKql2tk/liL0P7mRwqi3o3pRuh+43UotbpgCT7dAzIlO
         8/4LjBsi2GjvUersuVgAcTjqJ+9iaQDu4EU60vkSleDCeYId4r9prPTu1sxWyHrvE24Z
         qLIyNBJgrsvuWL63A1ExRqchB01lV0kTKxJmeBjD7ANe4xbtRgvuoU/ctBr+s5EB7dht
         LUEuw7i+rhBdGNabjkZb9xei23czz6+l/HM2XAIC3Al0yRagYripP0jRn4/QcxRrk2W5
         dRPg==
X-Forwarded-Encrypted: i=1; AKwUvBzwHjhy+4j/Buml6FBnXq3G5oBncFLD3XoYyfK3jQkEKGP+HxebQM1fDxN/kg2UxoBFs/Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYKcNF2MluSmUV68Zfx69RhU3C1kkRCUkc/WiPwDAflL4Furmt9+
	40FGG2VjisHnmdM0Tf1ST81CVE11bV602hRiF9gaYFoMx2XPo1qY4SCxo/VpUsp/GblesPrWEjD
	bL8BvlWTj1Vnfs3CQCcHlc2UeaTPRseWmGt4vx19/z8uWD9q1UbrWbkM=
X-Gm-Gg: AYBFou0ulp9aieZ3F7EdlScuDoKc4IoQ7ABd7DXBTT0INdGWBYTXDEM82XUwtt1XAGV
	BtOExtMiqCJPBjYUj599UGvENCM7J2Poyk+yVw3+1AB4/4u0QMUdCcJa10mDPcaiW1kHKTdasjJ
	gf8qyzHGobufUGdlmx4Uh76VU+g51k+1nDCDKe5FRYqdvUDop/viVjFdC8XRaQy6k5i7JZ/Zy3v
	jNHATP9bXKNrdnCx4b71Bpw7NvNNma7LoGxTc4l1E+oO+d1ShnazL9L7tvl8ZlCXoWPlHQthkL7
	jlv60T197x36ijkLpWBhfd2bUnVpIGsQIYgdS62LoJqV6QU58AguI0XQNHeylMIC89zLRpiJG/m
	/7UH2wn4hGdRPfx3BV5WKYpUz1GZOS4yG5L7H8X5aNII8vP7oj9dQcr/pyO5gyA==
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093378137.10.1793368975276;
        Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093264137.10.1793368974313;
        Fri, 30 Oct 2026 07:02:54 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm146146995e9.9.2026.10.30.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 15:02:42 +0100
Message-ID: <20261030140240.211786-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AfeMZsx3zqqMT4vEfgLT41qQLlFUhH5PXM+/16YdHOg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KOE8OZLBL1KSPOzy2PTf7D1fbtJWm/X8QGMh
 1uEadY8ZKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSjhAAKCRDBN2bmhouD
 1ztBD/9sstFWk1A9Ng49ETxFwagmCGyZ4AVotBxT8ZddXnTTzWQvY8eKKKs/2fuAtwZ3HefHs4E
 TdQ9UiBFcatGhgGt+Ugbk4Jx+QpVg6P8hAILjJSLLvxAlBwcbpfToTVmQdPazXI+iBFf4WFBxML
 BGHhmSmn0FSedMNLBIXFvxgjd7zM3BzjtBwbsXEGrqp6j3iB5rrWT5LryYpJiRpIAbTPQE5fmNM
 3eOq/SiWNO6aZpZGvjrT7QnsBsvGrekphmm4hH2rUnFo/1v27uOu+Ppt03FQ052U9pjGufwl0k4
 lPOLmdWOdeHA4BP8YfmL8RM3bpHo0QQ26VRgr9XnGr5KaDn5xLX3BGcJMWmRTkUK/yuJtzAZPlN
 bw5bQvr0G7P2vDJEK6QJJEVoqL4ia8lD7FWP1/cUbgZ8Raj7gFxI5NvuR+PBQseKfeKE8kE7+RT
 CrPgvEt+jhACYfWKSnVwl14U05BKOAg0fGZnI1vzsfVECg/jz/QtnZ8T/CnbELozZPIE5kRBOD8
 72mfqYZ3eUaRAHbfYLmPzCMqebZTFjo8KG1cXWvArk4BXRGYoC/W8PNhmmexHfIB4sOqdX9Wv7w
 DCR0F6hiiDIM0YYkNQTCS31KmHGg7sNcD0PZEm8XLcZi6xq3sXtPGDhR5TDf2vkGb+aWvoIpDVx Rxb/pLyVr/TPJyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX7Ihh8Qwmtgeq
 NEWP1T/4HPXSaGqFXSW2ozDP+OrF33dCLJNhwugE2xQitg0ItwmkkfHnCyAOfR9P21BSCfj+ItH
 9wEn4VfBKwLC60/ic8cG0JaZW+wRThHQar+JyCh9mdysNGtexfTSO1+2KWV1yl3MN9wbDYmz7jc
 ISaP57B+11zQ5oc3t2eALpr1ZWrj2JsSH9o+wZLN/wtihuufjI264BQHJ7+aMla70SInSmBUja1
 QCUtQRPDrywx2olftIWlpl0SFQbriVYGeJr6/Dog36fmuh97x1YRNDJ0hAegcMFEUbRB98OKPK2
 ZRCawUKkwuVTtufOU2uOGyJ9VCDIy4UIWbEW6JBWmgFXZft50lDW6sehK4GCEQHxxLf1ssfWyU5
 oNpvglbbq1l6eT1B9DqYTjFych7RJAnxxKQftoeAMW9GS7ntPEcvTT3bu+Eht68y1Wyc51N7qap
 EsKyWvvyo5x3okB+5NA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX0qfpAkIu020Y
 MpkaTQZiUUweDZYN/MQ6UpdEgixIeED1mp7ZL3/dWeOC5X7aDmrf1cJxmxzICio+joe40b73Sso
 TL40ebvZ4h1AHHh8rg+Xxwhgkw/MrpM=
X-Proofpoint-ORIG-GUID: WkAkZrGWiEd4BsrU6Kj03NjnUkA9wahq
X-Proofpoint-GUID: WkAkZrGWiEd4BsrU6Kj03NjnUkA9wahq
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4a38f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rKWnc9nNlL7eC5Y4R5YA:9
 a=o1xkdb1NAhiiM49bd1HK:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054

cgbc-core.c driver does not use any X86-specific headers, so looks like
it can be build tested everywhere for increased build coverage.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add tags
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..de957f574056 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
 config MFD_CGBC
 	tristate "Congatec Board Controller"
 	select MFD_CORE
-	depends on X86
+	depends on X86 || COMPILE_TEST
 	help
 	  This is the core driver of the Board Controller found on some Congatec
 	  SMARC modules. The Board Controller provides functions like watchdog,
-- 
2.53.0

