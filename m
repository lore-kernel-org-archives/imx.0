Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AE33EAE3
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176361; cv=none; b=WKpWx5XMMJC9BIQx9t/h06BRJnViFXbjgvDxmQePqN9SZwyu77U2E8Dn+BP1jd4NFx2iMDmhqEGfcpiz639l1X2VD6eMzrm0fjN8Fii1hhQdmljL5QeQbcOrBaBnblNuvavoYdO9Bh43G8UtBRXTAe98wnvuA+dly2rMGe7NkD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176361; c=relaxed/simple;
	bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhZnoJKIH3SJWOd8ZKYexH+a82w+7F8E+LAjMGXAS46f+MUETsoyJKJJd8Oyrvxzk6U/a7ZqAU7Q3pjHvSZwQUmBp90Ahh6yo4J/KssM/4LgNsqip/ME+GXEJ9UQ4UtpsxR8XCvOLyTjvoKV4gu1+SX+yOlWpL4ZmqMt1fCI+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pRN33DjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVHp9KIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pRN33DjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVHp9KIh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNX3Y1849229
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=pRN33DjVGMibJ0oK
	NNVNiQe3jkGzejkIfU6j5WvHrPDh+/50yARQ4OARD/jcWoz9jAZ/gHtIwLxF2ErF
	HVvNMOl9koEhkPVkBaALd0E839/q5DzuryIoNyCBGYq3sWn1873/XtmyjIsgHDSe
	N7Dn5UBDdimHAXv+r9Uch27QK10XYxOK0n86v+42PsA2B8m0ttYbZvRszY5xXxog
	s2Mcs3SucVZkzloGaax2k1sNnfg8rVcs6KA2wvrOSsy40sTUqvdhM36xTS1S1ZB4
	1/HqsuOCWcx98XXUdg223RZ0XbKxZnLF+UjfVWGCBGZTvBKvjqvPWbd7jH3DFjs/
	JNpjsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee168a520bso822471cf.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176357; x=1764781157; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=VVHp9KIhLaJkV1KV/iZks7Q9ezLJ7LGzC8IXs5jCm4Pj1/pvMDz3XTkTI7UBOAxum8
         Te/NGleVxWYJbwT3a5MeI1pb6VanCrB1cJltU1aLG1rV+u2LxhPRy4pbMyiYP+Qw5Vq7
         F4rDn0jiYH5pYZYXu8WfaZDD335RNcNDRitmi3izd1r7vizYY0By/49hr1CsvPn3hak7
         YV7lawjOEabI0NEU2DZof/VkoAEYCdTzYaQgHHgmxnBpio2cyhOePqgZO2x1Cfdu59Am
         fgKvmI2UCaE9tasRs441R0f8tWDmeYYw8AZSu+3t4VMmrMqvWPCLhF96a3kXinTiSYzo
         lw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176357; x=1764781157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=Umgc99vvX1Qh6KmBTUdTrAaWj6NxZo18SVfcXpmnQQ5WQgso4naJd4axnOuNfkreHE
         AW/ehsn2RO1b5T3JrwRp/9gQZgVlclGIiEHojNIZ6kjQLYHHSRY2w8PuXke5HpIv09TP
         fq6QrMs5mIMN8TDdn+Qi5uApDPZ3kSRMIcGqU4QVgo0JpvnZ6DAj/cz+v0J+w+Ph9gsk
         fOA7w5RW1NsVJw8wc62qTGAFngAwMh3Pir1MzAnjxzU4aueBiLR3wqAPyNuZBdj3olXe
         Qlww7vl4GMml1szezZ9ZS7g8y/RXqc92OJ2mOiFK68oJ5gVq+ORgxHVdaIwa8Fob81iJ
         ALrw==
X-Forwarded-Encrypted: i=1; AJvYcCWIs12cxC5O81+2pxsr+5U2DPOQAaKew+jht9Y+ISAesSiu5tQRgBGlpFrPPELJn1BPfBU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxyq/C93Xw0zv/rKelgSJONO4ScMzwdpcfJgIt+ED7s2Ld+ZA9L
	whPo92paSOxqiMK2prgr6ZPiv08MQTR1QSVlydolWXwgzdpojF/iE4Y/iNkXILXe3oD6/1zMoSN
	c3M0PSorHCfgUg/tcmebuQia/3P8UnWgNYGEU4ECewA6nuoe6VE6MwpY=
X-Gm-Gg: ASbGncv1e/+JdnxKfb+2a934TWL4RZfiUs8yyvWU9LjtblvK0kJ/MWS8YLIKKJ334eN
	knCYIsuFR2sC9vO2W7vW98PGRiecGMPJUlfx0watFa6MLQkKe7W5kAtRYPZuhUsZVi+vJN06xpH
	kueFYbEbekz9x4QWCEmBTmiHdbYmKfeeUhM/9LdubsraE4OEJEmPFff7dY5O8B0t83xGeJMDqY1
	8IjfecrW6FAyzszV1mgPXY96RvZWFILJcIIai2qtVRz2Ml9+cPNMebrpgwCIsoa9ta8H43EWGbW
	lwTSx3ks2Ym1ghym4s1x1CLqVS19q6dqQaz8g03MTdpNqeNp6BSkkgLMM1mqTC8Gh2ZS+allVPa
	3sZ4zCyhWfEA9Y1QbeNgqktksjA962ZjBEQ==
X-Received: by 2002:a05:622a:118c:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4ee58adff7fmr235322541cf.43.1764176357327;
        Wed, 26 Nov 2025 08:59:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf5BR5sc1uyqeochjtqGYLG5XCky6dGNK82Mg1F3Fr/vu1xdHr/JvNRnSKTAPNwurtDJu2hQ==
X-Received: by 2002:a05:622a:118c:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4ee58adff7fmr235322061cf.43.1764176356792;
        Wed, 26 Nov 2025 08:59:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:50 +0100
Subject: [PATCH 7/8] regulator: pca9450: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-7-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHXm4DjOiibZMtVzMV8QxB+V6eAo/uZvNGVY
 RbRJZxsbmqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1wAKCRDBN2bmhouD
 1y0iD/sENBu5+81NVSOLl+hncVKxyBQkJnx/yfWVjuDk7tH9b8bB+QeSX9V14AWPM9GEXqQoufX
 mGXQFaczqBK+ad7yDVb1SIfkbbbG5Z4TEecPDGRfX8npX3PPJo7BPeFtm5RO3+cJgDPqkGDl10+
 nIMXIhqwBvR1uuOFHAH257wWbI9hEG+8p/MkHaLVxvGrsSZBvgxL29NHVR1gDObaEUx80O+YsYC
 96QheHaZD8oy0cFJe0UdklHBVXZoxL6f4xYCkmxwCIAUkvPRFv+HtBDEkJtCN6Cpc1dnM33Lpe3
 u0df7/MYRHHcGAgCTHEk0KhY0dBbxFnRWMw+s0TrJi1bNjia9bSB/AeAQEcnW7nfE/h9JJoIykt
 4UhoEfvLTSkN0XxG7zjbaszX7Iaoqhm762ulj+O0lDtk67qlZAOCWWQev0okoh/4CrampvSVon2
 MwPNZgXS/Oz7/baWEUAxf1fQRfDNPGyUpKbYLVdJ7m5asudNaBc9nb/Xg1VjgE/94Q6mANZtEHN
 HoDHVFSzaSWRcJYGODJKtYvi9c09go1x0m4TQfDNkR5ToycI2hwDdXhwQjnk4TST/E6K8HBrFAE
 LNXJl8vRsx097kljK75rNRDyo3CFX9Elmwv5INgrFvvL05Qwg/QoAKu7sXqMeEgfg22oXZM+rmE
 fusPHitLthfBQZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Gm5qqvV9i2rgzwDCiJuw9AZoaL8hqoj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX6q1JxjVKf/WJ
 TIbMPDC/Q3TTy2yZpl5y85pxerl+E13p27bORqw351goFfmwjJZCYZCzohWqZyT539PZOCBTdCV
 hJlx9cPkw5XMaSG+Vb5qcqc1x2usvVl1C6DO1L1jbJun0PhVKSBgY6rjyg1SSZEXsaegT5V/9Bi
 o6pHxINk7FAi9FOPBam9ffJyxmb849MHkl6ZRLw1lNVY3Webnr1N5rMaUsIFXBuydZlLtzsSobl
 2Qmgl1pf0WjYXOgClcif5q6zfBo2VftkebZfUBxoZwnmE4CNbO+m1Tvc44jM9UFxpNqDS45dJYQ
 0xJpuR24BY29OrCW6riXnHF80AXPW9gJF31+VeXw7C4eLcevM2civwbAluZttYH67/8A/VF+hdF
 3L7zauegn5ifOES4xHjxTTA8OfMzxg==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wapfrd0RAOuIrv5d2i8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Gm5qqvV9i2rgzwDCiJuw9AZoaL8hqoj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/pca9450-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 32780c311ccd..5fa868264250 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -249,7 +249,7 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 	}
 
 	if (ret == 0) {
-		struct pca9450_regulator_desc *regulator = container_of(desc,
+		const struct pca9450_regulator_desc *regulator = container_of_const(desc,
 					struct pca9450_regulator_desc, desc);
 
 		/* Enable DVS control through PMIC_STBY_REQ for this BUCK */
@@ -263,7 +263,7 @@ static int pca9450_set_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct pca9450_regulator_desc *data = container_of(desc,
+	const struct pca9450_regulator_desc *data = container_of_const(desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;
@@ -308,7 +308,7 @@ static inline unsigned int pca9450_map_mode(unsigned int mode)
 
 static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
-	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+	const struct pca9450_regulator_desc *desc = container_of_const(rdev->desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &desc->dvs;
 	int val;
@@ -333,7 +333,7 @@ static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 
 static unsigned int pca9450_buck_get_mode(struct regulator_dev *rdev)
 {
-	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+	const struct pca9450_regulator_desc *desc = container_of_const(rdev->desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &desc->dvs;
 	int ret = 0, regval;

-- 
2.48.1

