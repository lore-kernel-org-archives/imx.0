Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A4335551
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620068; cv=none; b=eUtB5Wcswi8L5H5MqKt/iIDPHGx7irh5XN2dAioAUcSwkbrpFDdfnFocB4XiU9DW0M2XyrtRo2zU+crOutWF4e2ZZ9wJfCrOYZfAwPD8J8ywtkjnhaGDYBUCQitRFAPI3lfpyDKa6T49XTt6ffRYrFiv/pVdhlFLWikKJwelDx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620068; c=relaxed/simple;
	bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CrDkoPagtM1VRuzhmmPtYKIPHZmP4TmTlLT8pVbQGzJ5hXyH3AKG7zbPUmS7wKI7zQb5iJ4/2Qny+5ZLLlXok66eYSql4eLMvcgvwEBauhlJ9BPsNJWTkL+XXmdu8fc4GsqpNoX6KGlRlYlJpBsxU+zBbaY2Es9mWl8vatmz4N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0Ye+6s6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoxH3WXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0Ye+6s6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoxH3WXU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KtdK3798232
	for <imx@lists.linux.dev>; Mon, 5 Jan 2026 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=; b=Z0Ye+6s62/VTDHGd
	1G2Tca4dXxjio8BbLPvCE9P654VjAGl3cP1dTXZClo28KJtbz2iH5QCsPDNimUh6
	IzHTL5XqqkJB8JPVa2tKldM5WMaeEbNhEogSKeCIobffKGKKq5O2IBkBTEiRThkr
	S0iXna45ybILw8mq8Sh2r7uRQI489nf+rRFQiNQFVDiqKy318HHUV2VVbal6OsLw
	IwAa9y7CjWfdP81fsd1s21Fi8r4NcY0a5agJsdwnlDJdB1zEXR9WtARrIJp7fevB
	fPCAU0nshGwkVaR+o0nr70A1WqoGO+VX1P3RPOiYIUhwAQXRde+a+AZ4wlSfwfqh
	euFJdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4kc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 05 Jan 2026 13:34:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74ab4172so349399271cf.1
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620058; x=1768224858; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=CoxH3WXUUiUF9BO93N3CD016rDs4sxp8fdnDVKQxgPdbUo6sAqG9l08MWFCCR0r0IW
         14nzUVvEsIkTa8Im+jdmzdwQaDNixjN4nT1ZUzB69cG4PouXvUbvVHjqEW4YzeYsIVM3
         hkMpiP6WnUg3nyW7Bw0HBgOOiAK63twDMV3Ln45wI2Btsse+TVJ1NrrUuGBiL1ZQlECB
         E2q6aUlckxaVnudkwhSqxd5Vx+f9CE7N8adr793frQfcdmtJ79E/zI5eP2mzNVvDwJhS
         wYPYZVjsA/jHr/aS2oyGgcW5E/pc42PMsIVRsge/8f39cfjhn67VebRpmKqNeMlXhdJ+
         4nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620058; x=1768224858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=NFZdJcq3GLvJAKE6CWR5BQTu9dKbvQfJOc1unG4NJAu8qnk96r0PTb7Etm8WYICAg4
         d/DSmhrEKXxVMQO4UbY69n6cd2YHsm/GUkvU5FUvq2Vk5PPRrGLuQRdqYuRujATV6PV+
         zRuBGEPPpuz38Ob/TUkR/cLy1i02GnWoZK5wgGCZUio25Lk+Bm4+ykTBEv9bL6XxiNiF
         euFKl0Q8zY/VC9c7BGqCdEB50UjNlRODzkjpCUbdRAO9MFOlNS/B9qd/8lNAyVX5UKpG
         Bjk148zxC1s+vpnY7X6+Yxa+JqFoyJI5+VAXf3inMTrHjy5c4uYlaIKkwsJcC1MF7Uz3
         vmbw==
X-Forwarded-Encrypted: i=1; AJvYcCUXXEpNopHLZqS2PcGHLDu+betut9eOWMozs7sxGrqv2Sg2bbxeCd5vdyNHJjfKtdPMAmo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmWw48SGXTWBEvPYJeAc0YWsXf9yCSpsgVs/mu7fci6+5fW1FY
	q2L/Lhdmg0TGVIrIfLNtZC34nImCdIfmTYIyc5JsP9W5LdjaYEXNGU3hStJvdWIedlngk6fvHwR
	C6FN60jhvPiQAcf0MgoGUI7rvXC6IZMjGWAgLL4xA5ANz1ASMqYMxfzo=
X-Gm-Gg: AY/fxX5oCo+YGel0aVd2BqZH7DWUTA2WZUVoEM+uVshkfC7V6yAIuzLe5G+KZ82OtUc
	y+y7exCn0wIxv7ohdWpKPg13GzJ1uENlzGxb6xzjLvNDKiOKqfLWCa0UAaj0va+P18+Y0GTnUP8
	hh0OllXEMatVwRl1HKz2iO/zrQ43OBbzgfalzwgUpJjxBUFBsHmXFJR0ezsW6f5EPVtlepwHXuz
	qCfN5IHcBHdKHhF7zNJTJuDTf7P67lvggx7l3f+yhIm7ySJuu1mmO99G5Xc1/zZKTvKa5Df8TGP
	Bww7H7pQQ+Q0snx7Sw1o232TaHFH4XMwch2vhe0S2o5XWqjDTMgP3wlM3ktrkRdrBx3gxkyQ/F/
	d+lYsxC+ojpxAqGaTCv3lvPjRXBa/+nH/SA==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr721834611cf.21.1767620058370;
        Mon, 05 Jan 2026 05:34:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESw6Lz1B78B4ULuxi3VJYQUxXjiiRMNi4bRGaq2JIYI77z61n6T7SSooev3CjMW7TdHKjxOg==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr721834241cf.21.1767620057780;
        Mon, 05 Jan 2026 05:34:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:47 +0100
Subject: [PATCH 09/11] dmaengine: fsl_raid: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-9-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7292bX6sV2klT8k73Gc27WnZClqHRYukVQ3s
 g0dt4LCeumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vQAKCRDBN2bmhouD
 11gKEACUJG62p3bBedXNXFAHMBRvdHh5SRxmskzIZSZ7YDiKWZ1xMuPSZ2UpCgiXYu+jzjQ3pSX
 J/tk4zTo9qz76qTrMt/5FIq6qSzht1As3D0B1eSZuwID8n/AFteLawtMhfHZAK7HNjpXJ5H9EBq
 62LoqS7xAsC0xCiZkpZvcZ9rfMTld2TxZl6XNo3RD0Htu0zWS1yAxP8K18X6I26IvXXjscdtexE
 iBVsA5MbEHfRq5ZKrC29z9sZb3tH62HK6tnmrwjs1SVWC+9e79+2kOb8gyuYuehYkOzBv629c1V
 tbLNukjURdIanxovvvQ0QNp8D409dDRHMp+XHeEcAAqq0XpNdixShlzGnTNVhHq0vF1gK2s6kqt
 VB4FxGFFb02+5YZBjeUN1h5/FR7WfVBSu+fR+LR0oeO49MWlmmCch4ELcHp7i8e9c1H1Mck5N9k
 dc20+3HAxiVbWgSi1z0IvynOLTkyQE2AkIcAjJXxMzpJ08ew0r02sNeagYcwLb1142buVZffbbh
 kwn19rttS0m5FcR0q8cRaTiTdaHPQhE5Vmf6NQvoghBrifIdxgzLmNDGMcmCXH39Lfgtr+qsayx
 noTsLExWWnq3y82IinF0+6fHFsfkb1/B4YQVykBXNubNjrxKqGilh7ZemeG2VmrX1owHSxo2BgD
 F96W9pTZJ8z6+kg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: OWGJsBmu2UWPNEMlA0BPm9c-KTXE4zSJ
X-Proofpoint-GUID: OWGJsBmu2UWPNEMlA0BPm9c-KTXE4zSJ
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbddb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX0DKdv0Qndo31
 Ybs6oB2mKG0DGbb9u83gre0XtgGtFkFW07W0ai7dY3A+rVXhiaVDLaHvf1J0Ve4JIZwxsy2CcYT
 TbwYI/RBK1asPb8799/IaEUuNJvGW6b0W/GAjmwGtAFj2Yj/bKGh1b/8RcMc+dH/gfJSsMV1fA7
 VfjHwaRa/P0akEY0mLHok6D7vJOZxacq/lmZbtl7Sc8reBYMIwUEjhQt29+W+3gmLka8bQsue4/
 yfnfGJwHUMbd6grOriBMGzs/DEpKEdjUE6sSv9FqLNB2gECjWrAf9zYgPtehGGvh72jJuCtqrRP
 81nww4/su7mHH8u1uwKmMxYJ+Q+Otk95BjGcUv67L7UTUs7c6paK2QGMOHhZ3ysbJC+n8gRhOcP
 FjxZXk71dWurZ0k/vyHmaDNI1HtDyVqga0jp7iQNZ8mm5Ix03D0MHTHVwtbVMhk259U3zYXmxl8
 xXuBgH2Db5U3gGQTo0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0

