Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AA8366553
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977920; cv=none; b=H/Jv+Vv69TTRUabgPcWLC22AuW/HBvC+mJ8VRTftd0UvSromul6R2HGpWRmla77C4rFto75TjXKoy/jJheFht7qSWN1KBMUfsnZPqjvhXvgJnPqrrbxu+EG/30AgsqCF7agPTLJjWY2RwRcUsSgLN2WkuyHre4frVY7AXQqsm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977920; c=relaxed/simple;
	bh=MsflXqekUXo/aDgUOpqM/A+IhR12MRSHnOb52zLXpPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIE0Ye1oT5V2kvrRexrOu9WbFi33Pi0Sv+00BWgtZvoOnpsoMLXUvlUFSR2BrysT89fCw9ZNA4xVmqRQxG5bXIz8qwyGGswvhhzrk+8SdHlwC13r4UOITB/rl2hN+c6FuFSBErSBHT4Q8UtZpToSbLDDNZqJgCmXhaf+KZNUntM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWiTGxvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8+OMVm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWiTGxvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8+OMVm0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609EhnXF3141618
	for <imx@lists.linux.dev>; Fri, 9 Jan 2026 16:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=; b=YWiTGxvVE15vFfBL
	1PkZ5modhSlq9rMbB1302WeGwFCjUnXrSizKPUTx1ui0mKgKd08ji7dNxyuknY0L
	g3SKoM3LsaGtmiyBvaCvGRiqqR0iSrPMY/8E7ywIgECHJNfYY6yxXSpPLchBmWFw
	J4XWI3V2LTypt+dR/l/0LrR5TNKtzestz+QTpcJdvtfqVEt+WzgbjvQFDaLZS5eJ
	RefVgGMtGfVW4FPkmD1KX+c70rPtSEoh1iFwZ22URvVEg9+OEyx/ftfZGo+gRahK
	yzaap9JtzoiNGpjVFUtOTwct7Xp4/Fhi2w2y0aT3+sLNp4b95ICWt34zu3p/gNR8
	2fVyRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3dae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Jan 2026 16:58:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1126187085a.1
        for <imx@lists.linux.dev>; Fri, 09 Jan 2026 08:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977914; x=1768582714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=;
        b=i8+OMVm0KrM9PfWiefYh5W5kFcAQhvkU8Ogd5Qko2GBn7Bnc1RZzcXlq8n5piDPv8k
         7vcZhjfnAALfnfVRVqhR1TA8zgxOy1uG50SFLI2wsrkWTtXEeBCq4pYpqXcMbIvT3T6h
         T9Cb69p2PUxpXqq+VO3a7x64Tc9VBwNFdq4/fVqbHZC31j6MnY6dXdRJCQV05Am0dZvA
         28duwHRhdHfJMj4DJtzv4xyaQVnC9/wv/rPlJCZ4KnZFuCOMMy7s+IdTKMK/G0d2SOg4
         jDx0jJFMDx06EspI1Vmi3b46cN04Yoy0Duwacn0wlwmI2nu8xWEgGTrRo8uH3j7+n38o
         D53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977914; x=1768582714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=;
        b=S2s5tilUKH+BbyaKJicibZzFLMhW5oDaOt8YVskvIfL/sFhE9yKo8nZ+bTIW5/l+C1
         LiNYrN0Y0SdEt7tWcobcT8U+iMcclbFfoodNQan3LuP+ezK1ScBpEm3dzX1biMvzMZ6w
         mElvvLpe+Pa0HwsnVKH0rv4Fhd03XOgDjxsJjr8RdBnXRKRa6HId/IN4LIo+8Hd7HAYe
         huVGHxSmsBLr/gNEJth+jtkkyTHBplITRA+X4wyuFC7S4LqsHmdjuCvkN4lRWl6o0ltd
         ErLmrS3FiaUXIP7QzekYH+JqmbE7E6o3z+ScmpmR2k9sczQ7JuMFrFOoPsMoO0MT2HvA
         MtPw==
X-Forwarded-Encrypted: i=1; AJvYcCXMhWHTXGn646H8VhvcrBxumqRtJU8sGAZrzJwQFzq1FcirKKd+8RRed7ZqBTvkeh3vMw0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM+FSGjbI9KCploTw+IsnjTyRLvQerxqa4KWGjXgCDbNxZvnzU
	fHaTPwl2uE6csP94piBeTnmXv6Q4WtbZrzeu6uzj2XbCrfZOsEgX5s7oD3tr2KfhN51IRm1rAW0
	MVYQrzews/NAdec8gdApz7NKmtfNc4lIKxKqPKn/6hy/t+JfcydBJBQA=
X-Gm-Gg: AY/fxX5yV2IiNoo/AIIPHtmCB6o92gCVYnZKx9Iqhi62U3HFjorZFf6KzCe0Zl2FK+R
	Qh91jA3u4zOcoGaGMyzKgYRZHZuopAsE+uJ/XLzi2rRgWXwuNxUAQ8DIVprVRFYadshXx0Vw8uA
	YVjlqz5qUCZ+azdYH+zgoSe8rjMivUDC+ulrWlU0kU0WbxrCkNzNXpT5G81qyH4vB80CdupomQj
	NaTFYWqtJV6TIuxjJXJcJHn5I7GQchKjpcVnb0N0Zjtp4FCa9uCq1oUNHiY0MvBZY09yoVynaU0
	4Nb6e6BK6SA2WbLALaMmmnrZNIgxbcroxqSZDQQjZdlCvzDTKZ1f2kRZGl1wIhvUgr730udv/We
	acSjOI8fb2RXy9AhALJNaHObdlWh8xBztUA==
X-Received: by 2002:a05:620a:7088:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8c3893ef83cmr1176961085a.41.1767977913932;
        Fri, 09 Jan 2026 08:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF924iUMxd+MwJ3dGhp/iiQySS67dLxcUnb2YLMcFoaCMT4wx2qTC8T7uv1cj0weZDGRq/u/w==
X-Received: by 2002:a05:620a:7088:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8c3893ef83cmr1176955885a.41.1767977913425;
        Fri, 09 Jan 2026 08:58:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:54 +0100
Subject: [PATCH v3 10/12] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-10-c22fa2c0749a@oss.qualcomm.com>
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
        Frank Li <Frank.Li@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MsflXqekUXo/aDgUOpqM/A+IhR12MRSHnOb52zLXpPE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOZjtjnuHm6MsFLp3+EGzl32axXLPMxcnb5v
 fcxLyp6KqqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmQAKCRDBN2bmhouD
 15GBD/9pEsoaE7Sv9gNfW8gJEPcA0VfLzP/x1SLnW4JtF28oqZVC9He/51hlFzvBEJRg4A1b+Ft
 KOgvgzZS0/SX36dUn+pRf7ML30RCFvWcM/kSG0DgLYtTzezJfUN0kxc5A/xWKEvuPQp5P+967hM
 H4Ijk6xLQcgIn2DJtoVKHurLdzKhOmZIhfVPdAf1jYBCi9xwxCNSkwMoQfkUExJ5jr3kOeHqvVm
 OYjkMu9ExJBuwfwGhqrOR3q+0Wv0F7OXP0iJN2yGQOlztVvx4e/6EiFZxs37S5+LbXHqV7jXbGG
 CalSNTMChp/eEsmNKRlpdIgt1LDnMCYR+LJslJfpIp2RRLX2kK6KLoX2tL5y/qXLicul2V/JWt4
 O8+yTXm5butG+MSp/njvv83MUAAUxzmaCWYP6tNlk+PAMawDXh4IcyAEYAUkNoHu1h96quF8oz3
 5pf07iFkeS2fqhM1PhJ9VLxtsfBA9pVDVkIvAZQaBk9wreiv65snG9i6OFo1qeMsyatrXCMrs7s
 whC2MO0kZPQPzbg2JnYmK/kfVM/tLzvDn8ASzOUnekSH2fIw1O8GzBFFTHio3uwTdp/jShXzhkC
 zbzxjJdBuQRKlNBMeNmOhu45yvU7SHdE75kpTW1uG06zPaMryXuVAg4y1lGCNI+nBUFDD9hKY0M
 cKfFR2KqKiYbCNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX2/LU1UEG02wn
 XiYxwh8mPZovVM+/bBXBqBvLECIevuIJqoRObU9gup8Km6zyGvk4ImMENcN1UicMYjRM2bYg/nO
 k0VpxB/lDrqubs49mf8YAoTNQ8K9OUNmpFg5WW25biRB61p4z4/In2GUBqiVK7xJUuC5dTunedu
 Cx5uEBxqLnUmffp70DfETgOahDmpn1TfQjp3eqXqjqm81pFscrDFQy5tSMtItV5YK5tAoPZWa74
 4L3OkdprUFiE3Kx6UnMWXrKrikUqdZ/shfA+kGQRhHdxxSC+fzzuBvMdaS641M7RL7qrzXD1Mfs
 cFqzu4NHHJNEKQWEZ6a5BBdjPhc7PAsrBW5Wj/GX2cRhtLasePOls5WkPAaRFbhEpf8jjbuAgZP
 tBofYyCFaHSX27X+iICfGpFmR+wGSEo1+arcNi6PWBU1djsIohqoxTyKt1NTRVD4dyFUKvbgA6l
 UZuU1zu3DFcdy7yPiGA==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: KfKyKdNiHDcdw-d30FksctcuIcoJLnI9
X-Proofpoint-ORIG-GUID: KfKyKdNiHDcdw-d30FksctcuIcoJLnI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

