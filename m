Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390DE312809
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178827; cv=none; b=OKuHMgJ3muQhhcxfOnn2jXQwJ7jgRn6RRapvjesnN1Wekqc+UnFagrUagcFZ+Exm48991fEcndTU1LSKDUs1vFbg54CSJEWmS0qAKP9zyQ4/L1xcdQcHGpEdw8i/He6exRleeYw/4Jhz0tWMZQSUNcPrW1/pGuq+PcVYuRy8u1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178827; c=relaxed/simple;
	bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpMqf5tmpxwr4R5nIKZccEiaGZaDPSp+PzUl75xzGDZTSX+gROSv4LsPGctqA1Tj/uoc5A4hHVX2YXYw1oohRMoOeJ64mywgb7n5XlrvpUz5XxUCq337MbRP8xUyjM1PxWyNjHletE9Qv3eFmc720ohjplxpM0jwrQ8CHTuThfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayZHyRX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtDns4sr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayZHyRX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtDns4sr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ957754048329
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=ayZHyRX6tMYKRV2L
	MG7IZwBvoGRwaxWvEabJ5AGpU46K+fHm5YslQIWa5RbaxFe6QUZvAj64cOOw3Nbd
	5OMasmfDeWc1rr6ASY9I7C++uiFMuw+iACWPuWKSOW3YmPM5H0fRis5Xt/9ia2BL
	BNOnYxs11roBt5SvwjXfT7VACs8Vv46mYV8XFW45Axq3OW7QwvpSCzflm8+fnWDs
	IgfJoobJb/gQhLbaPXPxWNxXyAfV9GbfuM8tPj/Z4L9z3UDISGT8v8DafOfjIDTe
	8dlj4BqvC5XCYEn6HFjcf6xUVoE0Z/FJffPZvkanSzxH+Q+VT4RHBfgKfYfo1kv+
	RCwkLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njue4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b23a64f334so1752021485a.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178824; x=1764783624; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=JtDns4sr92whRyblvwv50I/ZV9RHY6AeznRWXcxJ8SXFK4MazJdMAf9pG0xJmY21j/
         fu9OFXTSTP9lEEzgcTszR/jN6PKLWPAO8ZnHCc/T5mXhLzhuRLVfbD0hCPyC/mewxooo
         sg2dQ5Mlbii8E4MsziJjs6wluD2YBXkOHwhSNIZnVPQ3AQZplmzcPKY0zhMPSPE6W0BK
         uHiXGiAfwAwEUxocoLYKa/MRi+cN6BK4CSePQ3Ljk/070aYemTLN3FLJEPdM7vlRa3QY
         aylB00dQKP49vUsrRJA2TjhqbOo0zc16+a2qVCzMstKLC67/mt9wQsaGM9GCNCLwmDQH
         aMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178824; x=1764783624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=Z7J/9t2uPec+zMZ/rRmkdt0s1jJAKhOJk1w3segioesL/8LWdNhA5xMKIta9El4ARZ
         +S/14UYXrNjFsQkZYyPwoEZPohUrtzrgU2+2OBVzRg/7svICSORvI94jeqLPxCskH07+
         LGP0llZikofAVdNPWx8JADjwcPndWcrYKa7P4WJUIw6X/HdTsNA6HTpdTzjssJPxZEvu
         4r/KagBkqVvqqrHz0duQHqIKNcMraAw5e63jpTyjBOpSP/YYecZG+OuX/L5ydXeLJU50
         BcVDPYNVPPMu0dKXTJtB66hduvfffXDq//RZfpGQgN481n3/UgkYGssAdYNLKbzi37Ra
         LSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPwB0fY95gasW4AhlSm1Dk7B+6NNPC0TK4OpysiPPfwhtuAQw6xpHfUBKXmZJFbhxQ/FQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkoT3N4rJ9LLG74i6TUGv1HXyn0sAa0/XkTJX0yYgL1o8m6MCN
	/q/t09lPwHhF0qsGC4skj8wse1jtmzvEiZXwOKhgvRQoJ//NzgX9oOgHUK9GOjsG+LU1vRkWfym
	pCQucoL2z7gGMu4UoyfqCsMkDxP85EbwQWEu59aBdzVOQGiLmpq80KVM=
X-Gm-Gg: ASbGncuMCkKgPHSb8e41IiU0SuclRMKmOd6IHjrzuMjelmBxzdW8zIcenTW+7wRomMz
	BVIXcEErDE6F58PQi3HuCkN45UQZ2dDLs/B0KqEokCop6Oj+oOZFbJTs/ZnZQaZz8LTpxnXFHqs
	mJU/I/LdaPBUNoaPKbeJLWWJWgZiHeCiO1giIqkeji/vbNEJ3+6yU/kitg45GKbrDHN+/PIBDvZ
	LM5bURj1XV1DtERXIieCbZbjqHdY3iHDcpJqpiZm0p/z6ZOwKVMEyULprfjccyiq+OE9GC8w3uh
	nRnNsap3a8aO/WDJNiznaw3YaZNC3CPkBhuAkmyjE8SQz7PEW90twMSc/Vjm/+TR+oLlFQgG3Ox
	SEV6QjuBhDB6WW3CijXHddaiYRxKyst4prQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr2592965185a.38.1764178824439;
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7nhci4TP1tVjsETA0tlWunV2qp6pDTsMykO36IvhVB1WF8317r9qgovKqAlWtXjv5oMmPIQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr2592961085a.38.1764178824000;
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:07 +0100
Subject: [PATCH v2 3/8] regulator: bd71828: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-3-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt8B2DOoorWpIacFqRiKYdaRVgdvJIOyX1+J
 Z/akURM0yqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fAAKCRDBN2bmhouD
 160KD/4lnr6Qkpo/E3Y0Sgwj2Ollr93XBJuEN1ps3HH9wxcoQQnblBcZSKsFGRx7C1S9/eJ8A2i
 13m0RTmbbs0eFI9KMsaVQsvkvXwSoLCj1Gq9nHlrGqFeJN2FA/h134L+cKM+3iuzBG8G7PKoYwz
 3kfvYhIufwkCNbAR/yVzOW/K1rXiodaoCP9x81wb/5r4ifZWh0AQWTaB+5HCN7aYmEEpMOUqP6n
 PWd6U7hyaXNkiAFalQl+2GZzTVXjM8WZoIBRfMyvPNX4DK/ccf4BMmAL6GtBvxLFHkykmvE9YWV
 WmOPiddYFrVS8bqOZjHJ77yaNKPjgF7EGjqDUBfh5O78iGvB6gTiwddpvIYvFtxxBDdS6E5iB9D
 muz2wyodr8EfwWYArDy/U65P6DqOuaKjiuwKiiv9gfkKzvxHQO7sCmw/v7v97C1TLMzQ/0xSFef
 68rPX3sHmknklQ7lGJW2obGQK3IQSBZ+GCBNcX2iC+3UOlJXrUxQqEuKd9vGAC/qbTeBwXH4ecm
 3Bz+FxIqthvmhCBN71jhDdFKspfOHCYhZqiH5FIKPWn7XrsRaRNA3np8IpAHFaDDtP8n3d6NwLs
 XQJhF5LotKfRzuMhFVTWaFUMh4t2iGJuGo60n8Q8hVc2ilpTp8/OzvLEd1hEDbu+ho2PUy6mYYq
 6QhNbv9iLln2yOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69273b89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6NJKm7d1xyV0EZs6JkNgq-_XFdrb-Tbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX7gN4+6tJ7XZV
 tAe4yaDDIwwxN16dxoLjcqsNjlShr2GkMIYAthQePhKVE69y3VbuRtdwu+Zn8HBdEPq4B6U69qE
 aAfXJyeUmTqN8l/5SeQVpbSA+DwkRMmIuzLEWUX6e/fGu1UPJPGdwz1DcpYbBpGv/o8klyR9EeK
 vilxa6MJPYu+qTEiVag9+brndr3GaWCCfPB9QDHgyPA29jVJesws4csHP82cQ7foFWY/LVqFH9Z
 3uhFpXu2wGSDwHiqCiB75keHrp/rWEMKh6g4oiNCilay8T99DMG5Onyovs+4Ik21Za9/MJME7mk
 5sDAbd1dDwWVO2EadZ6u1nnFBh7RBVuqthTZlbQjVc9PUduek1LCnk4isaPTjQfAO8s6s7eqpUq
 eT1M1MlIUtSwW0uRhuwsxeIBEChr8Q==
X-Proofpoint-ORIG-GUID: 6NJKm7d1xyV0EZs6JkNgq-_XFdrb-Tbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71828-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index dd871ffe979c..87de87793fa1 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -95,9 +95,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *cfg)
 {
-	struct bd71828_regulator_data *data;
+	const struct bd71828_regulator_data *data;
 
-	data = container_of(desc, struct bd71828_regulator_data, desc);
+	data = container_of_const(desc, struct bd71828_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1

