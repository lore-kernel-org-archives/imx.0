Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3605311C01
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178824; cv=none; b=LPFTCzYaTz3w6x6I0smjFFn7y7bdmSIeozqnwQZPDQfR+xOF3WAILvmDYL2GVQv+WH0Iu8O8ngH1XMP9XKjrvy48+nTC0VJGaYOvZ2Rh6LAG+xaj9w4i3EhoGRjIRADwJlE9SmYIwsPmw+c3ZVeoHqcOcmELRj3KiR8bjVICPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178824; c=relaxed/simple;
	bh=U43YtcHpntkrCP9ocMS7I2vJE2/QxslbHKdrzw9qWsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bbi4COJZ9HhPTLz8UaJsuPA5+ZNPs7QcFLAf0S7ES/Uhuu8g460F7uAIO49ev1gfXy4g4DpvrRZm5mQcHC8YWzASFuB9UU/nZPCea/yUfS0s8/Hf1Xi2c9gSyiwghFs/TKDXGNDSm63kXdzEx1lrr38SOAdeUpM1DWk8qyPB/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2hCpKOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2FYgaaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2hCpKOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2FYgaaY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFvl6b1234736
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=; b=X2hCpKOjHqvkmIyQ
	uMGbdM+Zq5Xqds9v1bnS9koQdy81a4bAdgN8NvvPP5J/HCmK+XTBmct4P65Tnu7A
	MQIW9dyQ3VUq1w2rSb2t5p52+5dyBx9GWl5C+l00sgvx7ZOwp7UBKxea+3NPOMCG
	WY/rw4N8magCB4VbYTP+6Tt98itsAbM6YyfHRB+c6ph/DsNKacRtgotONcfOgwMI
	vJOWToH3NNrJrcRJCZ8tYqSNsiwtKtfeImSvCgWLTMjl2H/8mCXu6uilBOJPv2Vc
	hDw8UhX3AyL/8+lzgoavZPSKVV6Q/hWuTj+rChEK9j0ZIljyutimxvESTnFs0a/L
	+zCV2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41rxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so1936862085a.1
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178821; x=1764783621; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=;
        b=f2FYgaaYXbSDBMzRYJ/WkEHD7F9V5PvbUsOnO/YGWqTIw+tHClcUXoUPrAptKbnheF
         VrHoHJadwq8deASJ+Ct5F3mdX6qKDYw1OQIbC4Gz68ZJc+4vw2mY9eR556kqUJOrOt1B
         P6Na6bgUWyU45y35d8qw1EiFUj6nnahQ+Wk5aFAKR7hX0+qgXsXvPzpwJj7OiiGblNHd
         lCOq/Zm8ytJAqMzWTDzhXSqA0CmCMcsfeKsRsqxvfL4s5NVfH2uzbwkwJi7M8R0HLx+p
         +uwNKMh9aKoIgz4SMsN1+ibN5ibkwZE/qB6zFauIVYDVlgCL94147FC3JbjzI9u1kiw1
         F+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178821; x=1764783621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JLI88Fy68vj0FHydbJ/LnweRpXCDXBC8BYlqjA1nmeY=;
        b=epnpef1826hvC4aI/lkIrP+6m0X5bi3TjVFkBtq4mTcK6fDwp0tWdNehf0ALeJmkfX
         qWYWsbjBBXLZ/nTnNN1HmMscJDtAHguLym8rIFVND6hxHkCu+DrvhyLsyZ6iOnj71bO/
         0yJkwK2nErZVwNMf3vSmLhwENnbkJ9N9IeSPLAU6ZYzr5zCONZRSf5+AIG0pE2IkWEMv
         ce5R7bimRp/q/BFRxt0cAi7OWa+0tW0RCc4I/nArsW1zsbpO0i9a8Mw4S3kaR+n55iA4
         y7lfI3YxEED39y0PwWaTLkYgL2vRcvg9LhfQE6v+34INwD3zR/tBoonUy4Be30Tkxc4C
         dddA==
X-Forwarded-Encrypted: i=1; AJvYcCWKrOqwq354ciABuPVA9H8Api/Y0n8I+a6h62lLjxHl4t+h9PWeekjnbyurpB5wYT4aSQ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwKLPKm6lz2afo3YZo5rKEqMGBw7tYVMIMYf0OIGQBsb11UW8L
	0YYW26yyjwLauxsRJ9F/kUipKiwmH7eLfvSj49ffZ4yba15T+fghN03PI7lEDttHyTaJaF/U5/e
	NkN6pjgNiwL9tsGWZjCx7FilG4XQy5I4S2JR9YNkCJ+1bCb7mprcdUnI=
X-Gm-Gg: ASbGncs0Wu0q0Sq6MPD81q5kIgYGdJh3M9zXphNnNeyEdSU4csadiSQjQIEfmU4zTRC
	kzdfnkNZnln+qywsKw8O8/iNW7yoWPcgVtevCZZIt4D03stWOsE1y15fmw7B86nDlLbMJpcirnC
	Ru5ZHhbBnpxojSJon5PPjHGSYGN1U8q6qTTu2SaJY2LPsvdXNbpjA0eEITscb4yYdP6+4a7Nju8
	PE+JwsREc2JlE0aLIkhkZF2Uq8FYT1Xo6QD6Kndap6n90zIw0pjmMqkH0gEyndoPYKNn0h3LbAL
	W68AkhLNeAuwpJmhQjZnklA5VuGDqyqt0UeGlZKDXbloCBNeg1a8We4o48X8nWnvAXZUqVj0T5Y
	5OvgXNhA46a0TbAJwEsoQ9h+PJistN+rzQA==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447580985a.74.1764178821015;
        Wed, 26 Nov 2025 09:40:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgxrvUjv1L8Qqp5Ly7KuU6GITEy+qFYGTAMuG8yUfN6EMn37qZfVIiA/8CZ6KMq+7xblT3zA==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447575985a.74.1764178820475;
        Wed, 26 Nov 2025 09:40:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:05 +0100
Subject: [PATCH v2 1/8] regulator: Use container_of_const() when all types
 are const
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-1-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8192;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=U43YtcHpntkrCP9ocMS7I2vJE2/QxslbHKdrzw9qWsk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt68w5EN9ZnwGt1+nnfONVEK5b/pP2uSwOUj
 +R+gfl30iOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7egAKCRDBN2bmhouD
 14DUD/9GDZY/BGcJN5fJwbIt8KBO50Zvvu3MGbl6ps2SMhhE4/fcSimXlgCtPW1JuNC4OZz40MQ
 91cKFWG4uvhsNWiI6lkxzKr/57Jg6PMtDBHOTxIhn9OLDa3hOqftufyWUAD6FOrK7npVd7Lvc2g
 kEsw8Wtu/LCt/qUvkMSMNdzhr6OjynagBdWBjSNWv2RMgbucSHk6U8SbK5+oKXIJnnN0b3H05uM
 E/Z67qDfAG53irxS88P3LH0RNiRUAGCKPZ/XOO8FlWjKjlBqX9SDMNCqVWH7OO8ZHyTHtgSOD8A
 CfXoWzhYMQZvpN2Bi4pGUNqAqKZAYuALqB6TLEMmH6InA7M4moUOGcvzLoTU/egz6sBLyI3MmU8
 Y9OBwAauqzQ7gFvZ+FfEcYbqYHClcEgEISU+cz1/ABq1Zh+PqDxl3pjZw/6YB5IZaMj9juzT/9B
 cu9enEWaDT95j4tw41tZnPfBjcpsxQytQcSUQ67KidiCq/pvZKYR87T765Miiy50ZzORHcbMJnA
 ylQ6VEs9i+C9qJfuyU2pArE5hx3vKZ2wpQPJbe0DPUmLGWuL0V9V5RsvZFcLhOLRwGo5GR4uuMz
 QS3P34ZzExhBWJsA9GRwJVgTpt2xGDbSIB1fXDUOpRd1IKqeEwTyUclbct67aVIHaqpiUT966aa
 AD2y65T2pvfNdjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: LVJixMyXkImDx65AOl8G8bdEjjKBNFUc
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69273b86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vouig9Kt115S9qvWE1EA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LVJixMyXkImDx65AOl8G8bdEjjKBNFUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXyytVGNDmaXbd
 d92KEyuSnMnv+hxYHn6dqRCjgMTl22QSKaNJs1RxYDbSUCNBt5xf0OKdPkVOAaoFtf95ukwVMzT
 tgvtYFaFtlapT1Q9pYwTEe/nCPhIb0zpytR+aKU/s6Bq1/GIiRDPfn2yNuWZDsf9j+xOvQ3iWM6
 cl0LfhWDAlJBivbquoJSSWbvTvh0S57ROU5lbmTAmqHYQqWuvIP0XbsP7q04dS62csdKieBtFIT
 yEzb0D29no7TnZWQ+CYUQ/FE/N24h0MctG0DhCw0QJSOhLxqpOWFlDv4ZfiscBOWh+k3oaOj15g
 WvV32xRHNfjApZrcKMxlov6KyDRJ0JRs1LGw0VBNoJJ3FJdregmX70hshg9mIDlkw1dXvCj45hI
 Y0bA34rDMr/lU2yhXm42PptttwPXnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/hi6421-regulator.c b/drivers/regulator/hi6421-regulator.c
index 69d24728d6a4..cd06030c3587 100644
--- a/drivers/regulator/hi6421-regulator.c
+++ b/drivers/regulator/hi6421-regulator.c
@@ -387,7 +387,7 @@ static unsigned int hi6421_regulator_ldo_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 	if (reg_val & info->mode_mask)
 		return REGULATOR_MODE_IDLE;
@@ -400,7 +400,7 @@ static unsigned int hi6421_regulator_buck_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 	if (reg_val & info->mode_mask)
 		return REGULATOR_MODE_STANDBY;
@@ -414,7 +414,7 @@ static int hi6421_regulator_ldo_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -439,7 +439,7 @@ static int hi6421_regulator_buck_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -464,7 +464,7 @@ hi6421_regulator_ldo_get_optimum_mode(struct regulator_dev *rdev,
 {
 	const struct hi6421_regulator_info *info;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 
 	if (load_uA > info->eco_microamp)
 		return REGULATOR_MODE_NORMAL;
diff --git a/drivers/regulator/hi6421v530-regulator.c b/drivers/regulator/hi6421v530-regulator.c
index b3ebd1624814..1822f5daf6ce 100644
--- a/drivers/regulator/hi6421v530-regulator.c
+++ b/drivers/regulator/hi6421v530-regulator.c
@@ -110,7 +110,7 @@ static unsigned int hi6421v530_regulator_ldo_get_mode(
 	const struct hi6421v530_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
+	info = container_of_const(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & (info->mode_mask))
@@ -125,7 +125,7 @@ static int hi6421v530_regulator_ldo_set_mode(struct regulator_dev *rdev,
 	const struct hi6421v530_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
+	info = container_of_const(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
diff --git a/drivers/regulator/hi6421v600-regulator.c b/drivers/regulator/hi6421v600-regulator.c
index e5f6fbfc9016..e7c8bc10cf24 100644
--- a/drivers/regulator/hi6421v600-regulator.c
+++ b/drivers/regulator/hi6421v600-regulator.c
@@ -121,7 +121,7 @@ static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int reg_val;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & sreg->eco_mode_mask)
@@ -136,7 +136,7 @@ static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int val;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		val = 0;
@@ -162,7 +162,7 @@ hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
 {
 	const struct hi6421_spmi_reg_info *sreg;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 
 	if (!sreg->eco_uA || ((unsigned int)load_uA > sreg->eco_uA))
 		return REGULATOR_MODE_NORMAL;
diff --git a/drivers/regulator/max77650-regulator.c b/drivers/regulator/max77650-regulator.c
index 7368f54f046d..a809264c77fc 100644
--- a/drivers/regulator/max77650-regulator.c
+++ b/drivers/regulator/max77650-regulator.c
@@ -68,7 +68,7 @@ static int max77650_regulator_is_enabled(struct regulator_dev *rdev)
 	struct regmap *map;
 	int val, rv, en;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	rv = regmap_read(map, rdesc->regB, &val);
@@ -85,7 +85,7 @@ static int max77650_regulator_enable(struct regulator_dev *rdev)
 	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
@@ -98,7 +98,7 @@ static int max77650_regulator_disable(struct regulator_dev *rdev)
 	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index 2608a6652d77..d3f93aae0fc5 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -80,7 +80,7 @@ static unsigned int mt6315_regulator_get_mode(struct regulator_dev *rdev)
 	int ret, regval;
 	u32 modeset_mask;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
 	ret = regmap_read(rdev->regmap, MT6315_BUCK_TOP_4PHASE_ANA_CON42, &regval);
 	if (ret != 0) {
@@ -111,7 +111,7 @@ static int mt6315_regulator_set_mode(struct regulator_dev *rdev,
 	int ret, val, curr_mode;
 	u32 modeset_mask;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
 	curr_mode = mt6315_regulator_get_mode(rdev);
 	switch (mode) {
@@ -165,7 +165,7 @@ static int mt6315_get_status(struct regulator_dev *rdev)
 	int ret;
 	u32 regval;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
 	if (ret < 0) {
 		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);

-- 
2.48.1

