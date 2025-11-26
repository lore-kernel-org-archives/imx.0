Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBB340294
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176358; cv=none; b=Ucv8rIAyhLfAmq8ey7q5CgnV0yUEpBTy+SuERmokkfPpwQuvxp72aYNFZatrFrECMOvQqgZQdi3QPfFnC+ip54EUz4dRwyYKDPkA407TUj4sjsL5uu19Ko53DZwruXQTC43ueUxnNomVmlyCooI+LMqUkxfuVscKD1idX0eLAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176358; c=relaxed/simple;
	bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gu0tdc9FNtv1Hmnyaz1f2bXr/kf/SIAZB8N4U1gerVFpMJfx5JumaHQ/0W8QBMLKAVMWjRxezYTrQ2Lrvs6hiRJnRRSRi246lFM3Wdbjdzj9kQbhrtOI4wl5crBl+YxsfJI+tw0tzIcfMLgWCFMbuai+p3aaU7YQ2j4ef8UE36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoqpCszP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8zUzpUu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoqpCszP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8zUzpUu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAsj0h1700273
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=CoqpCszPRTAcr3sl
	OlMvUkY3svFku9dZ5uh+NMSNr3qyRR43ZEIF2emQX20Bd4t+EegPgMA9/35urcq0
	xI5gZ8HQo7G3pLzfiHDN9OeEEOOY/NNj5Xg3IRQ81hsmY0mk8lwQjUvIORCT9/XB
	jCJH2oamxiusi8tJlpg/2KfvsPFi8N/SwSJx1gK6zrVyDt+5G2BNUTeif+D6D3go
	TfQ0Fdd9Bs/tjMmV49vs95tzoxERzp/dg5PdmWzlBiySJiVQlHsJULDp2Vy3c6Qh
	mK3XQ+UreONmtUtDdxzzj9YGZC2nTU2ktCgKXGz39IhmbQ/8bMqysPRJcmd2zaMW
	1iIS2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a0ytu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1d8f56e24so1865221385a.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176354; x=1764781154; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=i8zUzpUu/tWTM4zxX2f1Ap8aQ388aBaxdv+WV4rzAIzsZdp7Vk9E139qUUZInyv7GF
         /WKUgmF3g/ovorZzAnsIguVo3YCl4JQhm3gagJIck8KikZPacvCo8iym/QJsVma36P91
         gCQACbmWLHMBWM6eCFc4jQ6oh7Ak7Gs6E4LFFvjROEDePUY0+AeJSmvAWATe54bi15i5
         HKmcWEwUSQfxodToTlqgugXNhdKFS0YnPmZ+ZUEmXIVi8nIOJHdge8XNjblEdIiubK4z
         AtBF9J2nCKY0sGCIsWYkz5SnyATeg/stWO/oNpzBydAOcZ7K0MV63X4l3d/nFyvoz+dD
         2SHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176354; x=1764781154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=KnuVR+GqZcOkJhq6E9ZGnws/Y3AYhSgVaokAuQ4NpNjrm29vAALTRVxSbsc508Zs+C
         0FC57gip9TWuPg62muuMASakcfVwhVlrPnemTs+cVny74/HC4itr9CImVeqTbpXryQfO
         6h0NUYVCuTTnur1xjaVlJtAG852HG8CTHM5PFcSUHpUT3ortmajc7F+bPYzwzk9K6JP3
         9jeGCwLQl8vKt+ST7QebGZhdJJX5Fz2HgfK9bBRXKkjOWUVbryclkWWKgY4ckE7QggMl
         NtUfmbQUmp8yfAcsL/+NI4zxGvLmqFViznG/gpxqpsWfgy/PMnMhi74YSaP44eofKN3s
         MMDw==
X-Forwarded-Encrypted: i=1; AJvYcCXlxzFm8cnktuXmNwLzsyL3f3I7zf8bc9Qr62lFcy3lVtNRioKdaAU6X64LncF9wgRy2J0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNYD8kkVIMo9U2v+Y/k8AOPBhRe6PUoJBFg3qtJosC21TJzJfY
	XSKExDTI4Hr19J5IypuxchNVHH5eH+yhQRym6pgy11IjZeS2a3Dx3eeTv4GjFuaLQNHXe77g0EE
	Of+IxVfO5/ZVADwK2viRPoqcxi7+GgZTXI24KROTYGpUFm8FbD0zQgQQ=
X-Gm-Gg: ASbGncs5Sqsf8lLbPLACEL55woN0hqTd6S09vef1qX0+NenlUO7w6Ba/2fIbaKOGbEo
	pS0u6lLC670zD6vTfX+zUgYU8SqRbrFlSxaCXuRRir5UzAY59Z2hFPPvupLiikxVEczmpisETU2
	mXAruTrNN7PT95D6rb1Ijr2BMv3iw6+AsC6DZn4HpAc347myuOeJ0kmK1PHgyXbepxYKqXiULPk
	YRgDm38nRyvXC5bFHCKShp2jSac+9+UM/bh3blhlukGlyLHc3BsrGjl2W/126ZBi4a8ldc9wP3L
	Lxvs9Ym5MmqEUS2Att482uUjnp/jTwfv2NjVR7dUUz2yEvLR06Fwme5zqUGyao/zoGCHtj6cQ9l
	qoihAyXnX1kMxpdhFSGMil2MoX65629lPOw==
X-Received: by 2002:a05:620a:2910:b0:7e8:46ff:baac with SMTP id af79cd13be357-8b4ebd545e6mr999111885a.1.1764176354317;
        Wed, 26 Nov 2025 08:59:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGt/gU81JQ70dUpUGO0vKvjPidySNwT0x6iFOY2/04I93A62yvmfMI3LpgRB7BswyFxe8slRQ==
X-Received: by 2002:a05:620a:2910:b0:7e8:46ff:baac with SMTP id af79cd13be357-8b4ebd545e6mr999109285a.1.1764176353867;
        Wed, 26 Nov 2025 08:59:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:48 +0100
Subject: [PATCH 5/8] regulator: bd96801: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-5-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHVIqhZwoncq3gm6ksABMOBQ8NNIlA+MDFPt
 ZnTX/xQZKKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1QAKCRDBN2bmhouD
 1/fmD/49q1UtrUEpI8llXnpgz8NlCQZsADq3DhxYy6vzQ3DmnJjAMMSwn2ZxSngBiSeFykVqx2t
 Or7fzn0SOXe6dy2Hym49prlpvLm80gwA5xxpGYIjQJCwHknTp3l7THlaK+MLgGM7gzLOcSckQiF
 dNlLDocsHWTdwKR3CPTq33uBPCGSYNoFxOK9YVnsaWmCkfOLaTF5UV1XvHA+l0TKg2a1D3cXVpV
 5+IVrKPQ0bPg/hvw1YEzqc19yxOBtuAq4JIU1u30ZB11auVZD6yHl/6p9U9zZHNxS/K+o4h18NY
 SmKX1BevRb+FYZWQDN7/amA+ML2cO3zDApzFNABZvhejAJMvF8qGV0q647QsfK+xzvYIrBhGrhg
 e7kMflI9wdrPkJ1mR5/XuAB48UXSilIxVW1Gmhbd2XMZo5GlyBnAOE0suFflJK7TXQ/ZHVEjKVf
 G3s04jFC7s+Z2EXPavS4vb5h4KFdD6WAR7mZss9MfdK52RePivImZhQ9dz/gG4/n6kVJdrBjowJ
 0w4yV5JZC5ZGc1Gm7HqTFv5QSMOio70JGb1DR+7SjkB5G2FbXJrqC4dum4PHz5oAr/xpppMhBbH
 8vU5E/CcBSlUumpc+VMUO5MojM9U0pL0usuxgXv8x3Ea9xNALKw1hoS4O08ZODQePLTxmk1tNkT
 tHcQn1S8Zoyc41Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=692731e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 3mfnL5dH1cQo4rvKZpMgAVpeqELnpm6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX33b9h+S62C3E
 D3RMArWlR6f9QSTxOaiPQisqJUSyDFKH1CH+T6oEEUtVe23/ud971/7haoH6swr470G/HL5uckO
 P4JFAWH2yWOivAo6MyiVD9oN0Bu6whZe815jmi0+/+ZBzgdAiBCPgjVrHIjzXdzQ9xKjrWbFzES
 fJdZNTqjLxr9CuzwGuDE0QbkO1P2TpBv1DPSpMWynSnyOZLgfj1X7V5XjySqmmbSJvQcpolvhc8
 IpxQ1VbLdkfhpSAybIBat93bJVphiorEpIKE8Hkkm1Ux8PQvM4tmGzXCmLGwcddxLz+D/JlmOe2
 p5lfUpmiVj65+VEkuIgRQnal3yseKKFVnLz1oSvgLrfipYDXWO6KM/0AO3IEaLJ7v/VSc+kUZi1
 A6z2pzCjIt75tMwrFpPJaA+2xvQ7LA==
X-Proofpoint-GUID: 3mfnL5dH1cQo4rvKZpMgAVpeqELnpm6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd96801-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 24d21172298b..129b20c33bad 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -337,12 +337,12 @@ static int ldo_map_notif(int irq, struct regulator_irq_data *rid,
 	int i;
 
 	for (i = 0; i < rid->num_states; i++) {
-		struct bd96801_regulator_data *rdata;
+		const struct bd96801_regulator_data *rdata;
 		struct regulator_dev *rdev;
 
 		rdev = rid->states[i].rdev;
-		rdata = container_of(rdev->desc, struct bd96801_regulator_data,
-				     desc);
+		rdata = container_of_const(rdev->desc, struct bd96801_regulator_data,
+					   desc);
 		rid->states[i].notifs = regulator_err2notif(rdata->ldo_errs);
 		rid->states[i].errors = rdata->ldo_errs;
 		*dev_mask |= BIT(i);
@@ -354,9 +354,9 @@ static int bd96801_list_voltage_lr(struct regulator_dev *rdev,
 				   unsigned int selector)
 {
 	int voltage;
-	struct bd96801_regulator_data *data;
+	const struct bd96801_regulator_data *data;
 
-	data = container_of(rdev->desc, struct bd96801_regulator_data, desc);
+	data = container_of_const(rdev->desc, struct bd96801_regulator_data, desc);
 
 	/*
 	 * The BD096801 has voltage setting in two registers. One giving the

-- 
2.48.1

