Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEC933F8DF
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178832; cv=none; b=cRh06l08ohv9vfExTplsNUfAdP25AgTSG+RRVxVbDf5S8le5MpIK11vVaonebBhcJLIKNDpBFQHsBtqGQPpzB3gUpiecWbDwZPrtaTE/z/0Qwfj+hBo2gZabiqRVVCdW+qInHj8RZhXujNDrHuRIWdUa4U+Xd6YlWZdyLC36/p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178832; c=relaxed/simple;
	bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfuY9NGfqpxf4r7LVL+pqUxLqFnlYombDi4xFWBiyXvvnNFFKjCejEWI2mIFM8CHMOiojHeh3Qood3RmcWRKghmE8Kto2eCT5WsDA9CSzvBzOlUvmm5nnLZwU4k2/TD9MeKK7aJUycBAwOv/gRlBWYsoh11sB7v+hU8WGClc134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj8kss0c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQcUnZeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj8kss0c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQcUnZeQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNePx1849261
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=Cj8kss0czCvnTOtK
	Oijfre79MZ9wzUFjAdOBAzakqYgkLLwcaGA3Ep2OJL+tKIMH34zsRzpjosJgvcvY
	TwTN5BTLT6jwCyBVwS3esUlBJ150Xa5cHMnHlQ86QobLdE+UdwdPd+dXuh/RcIMK
	owSWi+pm6vT99vArbQoe/fFzd6+Qi5tY5w9CoPm6TpR6MBjt2JlFnH0iQ8PiDRg8
	RxEvos7ozO//9HvBlGk09Bb/4bVB2czq9GEsep/zmkaUZItAXhn2sjnOEhX99dlC
	CVArODyt50cMve0X4h4EYOS0R1mMOtnjl5om6uUcMtWzHFp9wQ+d3DWx9YFlkgKI
	KEvu8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0mss2d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so363185a.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178829; x=1764783629; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=aQcUnZeQe1HpKakr9DCuy0aZMkORHRi1UYiJq+AQkmDWPdmrD21raOQmkDbPSKA4kZ
         LfNOgDUYKvS/u61SbYUQwIhsM3nPa9S/Ws7z209PN5Ohjohf91ZB5Z3FNVwVyf95ExNn
         tmeoLaRYhyizxqu691s7BOZhqt0j8qNP2n6kFRimlWp7UNM+y1PYB8icPt8ilNLE9E1E
         lYKheE7TKbG1UwM8gK3E4P3NOt+zdOJYQ6ccwB0A2wrXEJvQPptXvQmbkY09TcCtQfYD
         TDY45birdJq6sJIDV8aNnyo8QpV9xCSZ9vVIT+MREnpBkYHc/vbG5WOEqjQBXAYOmhYC
         sgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178829; x=1764783629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=n+/cnoWCaZgQFYQbTifaxMAuEnMfqfu7zmcRZvU9My79Ho/XWt/USwWa9NUREkDJHp
         uyDOs8CvgNjyaUdz0HSLw+/pG4lwg4H3eV9WTGgUMOziSw2dgXjLOCLzGoRTusZU2QPu
         U1QHVwGH/dcVB3hPIwYRiLnCZ0T3pV1tHU/Aw7I6477cqjGw8YdwgldGtWbny8FJoKwg
         vl4MpXlD8HarWDGxaXtayAIgfLOa1NENvzXbWFLqWUSx/EkrNF9eAubMRZuApyxqtSQI
         O7ZSu5eOv9fDqpen3JyKs+5DpmiGHHz0eck2a9J/E7shnFjxIl8yb6rDHcHfVGCeAr/G
         GrTg==
X-Forwarded-Encrypted: i=1; AJvYcCWKMkAu3Yo/EhJWaB2/9if3U4xj9L1bKfWpOklu8SKHE+O6v9UUsXlo0Ei6nKnzVfMltnc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7YEReKqX263hXd0jsCoIYUfOy/jR9JPCv0sPOeIyWHL+/Eo4V
	KDDoBq7DyMzyHCnGfXt32/zFhAKHh5DYG5DQIk1Ul0PfIfdW6ZYfdsEq+B7nRnIa+Q1DzcoQ0Zx
	fuCgEAw300ZrgCCPNG6G0t0zSnoNQjhCbVVrc0SF/Xsry2FqPgofgdos=
X-Gm-Gg: ASbGnctUdb67uUg9d32dkjRYUKFHH5uaxUR+mT+gYaV6LEmRF5qKDBgcdESj4L2WBHP
	/9zUCUhV97JGLOiWFTZhO2h4KKmzNnEMmbmYJnyCpW03GGXsIAWUQ7ofT4bSVQH82qofBwpuqld
	qjtXPRFK9zSbDF1nfbMBHUJZdAxfGPwAZ2pNXk6isxyDKPFPdnZIBw20Ksxafmb5iFWDISFIrgv
	nP3HMnnXIA0QyftfdZtAY2gw3wCLGXDoItvXcabmTIYcohfj0f0kFRD+YzH+cJqoN6Wzeod39Tn
	g4Ied1L0O0L0uQnrZYiUzc4DSFHpuyZe6EuIPKiU8nT8meHo31InKfdisxHu+JwGW6pZNXiS4/R
	XnA25g8iYkbHbuj/DSPZZ6w2fgWvRjaeCVw==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr964587185a.6.1764178829130;
        Wed, 26 Nov 2025 09:40:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG417jnmNWXAWdIRUdmzeTUa3tigqlN4NwGpHVGLuGH+RAKsdxFm+oamJUZ2Qjvp//ID20XHA==
X-Received: by 2002:a05:620a:4085:b0:85d:aabb:47d4 with SMTP id af79cd13be357-8b4ebc438d4mr964582085a.6.1764178828589;
        Wed, 26 Nov 2025 09:40:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:10 +0100
Subject: [PATCH v2 6/8] regulator: mt6358: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-6-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt/In1RckvHlGVJEYfhwVdbZbbsAIGgtydc7
 BD2Swj1fa+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fwAKCRDBN2bmhouD
 13fND/9pvcnMehA/jPpNTRYcpmfk9vKCGiew9Tj1EjZh1iFgSuHQz61oCY/3cku2nvA2KygTSJv
 dks9xOd4kSRomwUJ5Lw4b38aWjDVl3L4a1JC2STgffMgUcShdezfwua8SbYDDUqUTCcUdrnrTMS
 VqvDN/aX77y2U/nWvtMSMou11DGAAk9uOf9x/hOLPwCZHhNopxHNyFkABCqs1IiYGO/XKZOIHTt
 zko4CGv2e4ltSHtYwT3c4kA+ECtC7DBdAmxb2bJXlc1cONLCeNOs6855LpVXbholJBzmyexR5JI
 Pt+PoyIA94CptVwY5Et65kkiY+VS9E+45Fs/Wwlq40H+QvIXtg0zJ1bNL1UUyqDdQu7TyAwGMB0
 cW4JA3si3sz/Mv7uqb9ui+sm2q7SoEAo76rTGvEmBYrsb5UY8MqPD6er0AtiPKcrd6xZd3rWnLg
 23ecm6uDkbSrKyFZKr2Hgcq4LRRSism/TqnCKSGgFrfL2OwW5GsUVVijevacMry9emhgIyqrzZB
 WlCqZXeNI/IGl5j/d8veBNhmttzzrmBlijszFSN5Epw+mdViihypemE+JhC8sYqEMimZ2magKSo
 AJOfEY9Rro4TjyIineaslcIxixvSna5hlvu/mfWZJtQ/jEgGV6MzV5N+MVN6duxg+neqtONjzER
 eGV0zqMMcxVGXaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 9x-mlxr3ka0f9m8WXtK2yTy63GdgmCjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX0t54aYI4Ud5y
 iA4vH+P3gm12z7rtz/6yy3h4aMgcLNy/ZdrD/NoYE3lrOY6Sy97evaFFtrVlZNlpxSKuB3PRdlB
 uJQ4krCGi5dZyz4g4CtHmSDMI8gbNaJFfNP62EvEEvLt6S+us9miAoR9Dt3mxht5dBKiB3T8XXn
 IM7Y4l/npELfgiKjk7gmixJuSa0NuwVJlaRUyRo5j9Ca32s59uvNlsXwLavW7lzFikE4jsuMz+t
 vW1GDPwrKayDnf9uyOa9l+jFcQU38Bjd7E+ydHl+Mnj13YdYfUIBO6SCGByN9ZdD4knxyP3t3XN
 R/g1p0BeOqzFMaAlrC6XGlg7R++ZiGlbQxO28ElQt5DbJbul4XmeIT87D82XWTeb0XX9gkXdvfU
 d5ronEG6okzCIZStC3mviK8S23nFiQ==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=69273b8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqRRrX31zAmjg7hXLkcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9x-mlxr3ka0f9m8WXtK2yTy63GdgmCjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index e4745f616cea..2604f674be49 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -31,7 +31,7 @@ struct mt6358_regulator_info {
 	u32 modeset_mask;
 };
 
-#define to_regulator_info(x) container_of((x), struct mt6358_regulator_info, desc)
+#define to_regulator_info(x) container_of_const((x), struct mt6358_regulator_info, desc)
 
 #define MT6358_BUCK(match, vreg, supply, min, max, step,	\
 		    vosel_mask, _da_vsel_reg, _da_vsel_mask,	\

-- 
2.48.1

