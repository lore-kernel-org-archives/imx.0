Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A22633F8D3
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176356; cv=none; b=tC07qrotm+DfYyg6+Iev7svW19SVKXqHSxj08+A1nBZ2im6fVMg1A/senycFbxkKOtkFdW950vhbCXyHLvs4JZF27koxnst0b1CWHNmAIgoolOF1MIlnepxCLFl2edhZZSP5G0cbobYvURDSbEByC3Tx6McuV1qPKe1nFGYVOw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176356; c=relaxed/simple;
	bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgU3LFyFnX1ow3KVht6/+1RmeHTSv0fi0NlCHy0WLtEuqitQ39WaeDbdypcpuDfI6zmUz6c5CEpJU34vTFvoX/8vChsS1Q4aMZpzPMNPLJvmtEihlsB81zDJSWWjp42RA220C9kgSXXvAFFAHB8kYwd2e1GOgXP/iHy2PciqNPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGSUQDDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXin0JPE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGSUQDDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXin0JPE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXa51849232
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=UGSUQDDhRhXxvsL/
	CFeaQtpIxFRcb4GXL/po5P2L8zkbuUyQNSzxKCwc4ZfjVBEVNsvKU5uXzXKoh53e
	qGlMr2qxLNChXMefg9OJvHPGxQ6L5gCR1nhov6+mwUvqKutk5EScifYCDQLkMJ2a
	6CWBG63ubTGAfVnFi6OtMhvwgh/GeYF/ulAd+m5g82QWYaDEXtC9C3EjgizOUBD6
	8x5P0nRiuekBQljpvlTgIYa48ce4AYBgBv3L1Fv1vZGfUcttnfQ28IMKAG8Xoh2u
	wuNz7FkGpiJ+tBUgTxZ86kGoSXa4TBka5Xg5g9OZ9m3viNMYjr6syVjxGkIss6ke
	ij73Rg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee3296e984so739271cf.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176353; x=1764781153; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=bXin0JPE+cxW6gtIlXKy+SYXAGJlHDsEmEqkPv1sQvLADJIGr4RB4ptnq5Lr92wq98
         7iX5iFe4BBFqGwElDi//HLtB8LqGKVZdQ7uV11wMCy/xZTuMrm51tZYPb0K2+ZGpsiMA
         YqFYvAR2mReKI3bHnoLo+hV+Ck/Qpl/oOLzNfS+6BdiGmz6+WfQ5GOMZqrG9+V/QZ67R
         ZMnFvtq4wPTgRFqwg8XiDQ/di1VjkRq8K0CIYr6a2WTDdA/7eEGMSfAYfU0//6ojRAyY
         dYR280GEG335O/PxkWpLPqQvpT238Vw0tOSHKSO6C7BJNCkikGww2IXLMGZndlsCQFpR
         7C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176353; x=1764781153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=QmGMZOrzPjVcJxcMMaepYOr5FdFvL6tIWG9OiZ7Qi1phJ8vZOOzmgioCxexqxoZO6F
         8lomJ6Juj6ihEULn9rC1smdcYre2P6GuM1g6pZTbQt55oMUEQ7frFEWn6dx4LWVye6bq
         Ch503h9yy1QDdTCsb8IMzthJHtonvGeFX94g+pGSsyyfEEpATCx8TYT83bxnDHsPyyWm
         G8dARQYmdhZ5tQtHNZEKEYLDsP4hhvQYrjn2kSA0D5XSd1qGKCF8gQE5OExO2ktngeEB
         w+LqSHrmt1fFuR5JjX/EU4cPlVKU6m96KjFRwTNufFmjR9AnU6vgtRjoAB/2GTb2Hjfp
         YlPw==
X-Forwarded-Encrypted: i=1; AJvYcCVVqiX+70ngJqhI5UmMhEppA0PYYhVVaDol8kUaDXY8EBdY57kq2+4Hcd3kPPpjtJZ/ucI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+2+zrIPV+e3bOE//tkcD72m1Gl6p5RJfSha3aWOJm/NF4T73d
	RpbX9No5B9z5P0vXoGC8w2Mpv9OSJw6f4CxpW0NiuBCaFp7D22myJ1I3GQ+GC5is7zqG7oXIMlI
	GRGHl0cQ3iJZMsbfjxc0IlxM2wV5sckZbYpu7saipbrZVOT+B8WKqgTs=
X-Gm-Gg: ASbGncslgHOZxP/XbXfOS4CKWoR07HCNudphFiRF7GqrgtSKVBHTUSCtLWe0ku0MFmI
	bx11YblZCK6EFHMr5binNDBhYKFFNB2cKy5AO4Rg5mjjZW1ovw6ge5gagFheotPzTlmCG0x0wVs
	QaRC3fm2CO+cRrhMUtUye7rh31rXHBshCSaBoHQe9185CR2zFY7ip5dtvAbAYHe9GtZsO+2+A+m
	fhoThfcLo9sa9FvLULnHjSz0GNWnuT1gpPmd1f5fZY+RiAj3LTJJAGcCZ8r1wWBhNRENOP0vrMY
	FaWQ/KFfqrpB0TD24xCfTwSWlXCxv7i8ptEyqzJ2r3VjfmR41S/pmKuvRkunAa8saDTSkPlz6OW
	ScLhh1XgVEBGkOjuzwU3zKYajub/2spDsXA==
X-Received: by 2002:a05:622a:1a22:b0:4ee:d9a:8877 with SMTP id d75a77b69052e-4ee5894f754mr301719881cf.72.1764176352832;
        Wed, 26 Nov 2025 08:59:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFFNJfMA5YGMK2a1B1clwXb0TeWG0h5ObbcP6jqY2pgY5UGsCXOEnBRMkFRRZT8Gb+jB2+8g==
X-Received: by 2002:a05:622a:1a22:b0:4ee:d9a:8877 with SMTP id d75a77b69052e-4ee5894f754mr301719411cf.72.1764176352359;
        Wed, 26 Nov 2025 08:59:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:47 +0100
Subject: [PATCH 4/8] regulator: bd718x7: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-4-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHUTLtRuGEhkFoXFkaki8FZ9a2VF5tTfLOBZ
 RYcGLx2w4eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1AAKCRDBN2bmhouD
 17Q3EACROfWHE+jjlQlJ5WoREWxGSbBZfoYvYbjXZLbkFP37lg1HeD5Vkc+nHsWHcb7p2vBadA8
 tmuad3RDqYNM8in/+QBkmYtWM2xcSB7xBICZ6QP9j/2bQUOFohJ8K1b4eerzzdWoeIB3mLddLA9
 p9wMxec2iqA7SwUTH9QLRh8aRYcSwIldtsJDUqBEHbtta1O9P0cmpl9kSYhEZKJmyIL3B3HHMZR
 ytWr6UzkcmmoNuQJkPyyG0qx+6hCCu6oK7o1rrwD72oekhi6B7Mb8iGwsXXLy0YVQQBYdITHijD
 d0Hv29u5Sf6ATxURSfth81Lfx3auxgN5NuHRv3t3lTMTU7D7h9FuleMfHGvMiVUOYdHVZJ1rel8
 becxFcHQ2Pzp/sYccUtffpem+pLMHXwdi5W9rF2WT/pjdPlR2CjAl++bsAm8yRIN7lzPwaW6LM8
 0uDdOq+GF+L/vHaLTL0S+WgV5Lzy8cf72u0lic1NGKhk1uoMSGcQ/WtgONpBotBfZULKlYdhE6k
 LG2yrmz/3vYyTUBR39ZgOKdhRceXWOKlVAw/hIQ/RU/lNRkPbBGyXvUgYE31B46QLJBLzpEXrVG
 SkYC1a5w0HpZnJmoMzVcnwfEklJynTM/RLyZHQcAGA1/RUFkCFK9O7WZXgrxgNjG5UvUmRad9wZ
 y944thVw+3wXbyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: _nb_AwoL8Kl5dsuglOszVWmlPt60bail
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX79bV/VkpyYr/
 1gEMt1+UaKr6n6Li/bJapEifeVLorl7s4MDBYNhZnpe7yEGLGKoKA7ZZpiDb5DijEyr/fPFT7no
 OWR9+y4Zqh9HBNvVHF6nfiVZhF2diXeZHr7OQ9C5ro+YHJIV4gWz1Y9J/bsU7IyxrGG53WDhRHE
 5vOc0FSp3ymj+jvT3PeRX3peAK5cNiGIVKm3gzJgVBCOUgWS57nnEt6W2lKMjH6ErROnPdthi4Q
 c6cNv+/v+WB5L5IWILDUwjga5Qq35D/jYPb1B+MN2+Ez6AJyGVKZwVgH1IiOkrrkV6ByDk9MhvS
 hvL1NWMd67KU3ar0WJwR8ITFM8UmCBN7Cc1dLXVXiDudt9Db3uL8CgGfCorn/lgzySZRV9HxO6X
 W6XsWQs4mf8e6BnTJvEHYEKy9VQgzw==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _nb_AwoL8Kl5dsuglOszVWmlPt60bail
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd718x7-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index ea9c4058ee6a..1b5997c8482e 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -698,9 +698,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct bd718xx_regulator_data *data;
+	const struct bd718xx_regulator_data *data;
 
-	data = container_of(desc, struct bd718xx_regulator_data, desc);
+	data = container_of_const(desc, struct bd718xx_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1

