Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B291030504A
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176352; cv=none; b=IIC8O5GxLNy5HgbP5PJHWtuzHZIqoK9pwKB+ylBOio0Pj7NJ1/LiYAsW98WDZ/eUxC5mYsIr5Cswcodt6bGT+gnULFrRTPtgd+LOk9ZBLx+MyQilR1COMYwG264gKkUSl1ZPvwalt4XhcEPyJdgVM1Kyu4RoL12/Lg//ukK11kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176352; c=relaxed/simple;
	bh=ksdKQZDZf6PSfDQolGcZw2sgxojAWSKaADH0pEqNoMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pk1qgV5kqWu5/TGSD3jBgnCkHOYTWL7EhGDobwEkcXUUg51YeYOxpcPUTgd12gIYB0stVLr0gxamqz+oZFjv6H6RtUDsLd2+s53vl8NPGvE0KYBy0ShMxcIj+guVfMwHro0viEV/Piwb9GaTyqbXqx8nv03OikGFerKTP9Awny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pn7x4zXy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bItphe77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pn7x4zXy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bItphe77"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFSX0J1457983
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=; b=Pn7x4zXy5QN267Fx
	phQ+eFB+DXPWMX2zPUyRVMnKXuAkPNQXoWd0RpjRpxGSq1xv0xt9ZgidGi7+/UY6
	2Q5lRK4doKzxld3kluq/bfdS33BNiSDRJ9qFMll5TdhWK4AgsIGLqtp2QqpkybJJ
	uioo39jXj6NvZqw5WqfERoXxP+eMo2v3HaT7Wtyho4V14DxiMrAQtN/kEXYnTm7p
	uE4DZUaeTzXGxnzkN4aZB7NQgbO4v/OFYrAtEcTN5t57F0L5110thT1twtsDXk2H
	/9UXPyJ4HTzAtnMpwWwZ62iU/NDVfOR7zsxPYzRCDd+dBhMhkC/CqwBvR9fJ1Rbu
	fN8Njg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhq6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804823b757so23708156d6.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176349; x=1764781149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=;
        b=bItphe77ULCvsTyMRTctD8emsB1heHGYtXbGMl4ty4fBQesm2M6JrMBagce/mrjPcG
         yMEhrJcL3khSBzGQfW17tuxzdM+R2DHAV+XTwfkL24BVu+AHr907d7HNUk9SQGIjUGsU
         d89F8QB3AkepELWyuwbxE/Bk/POVW24CMhiyw1cD1FrZGVGhNQgqMcqiPXBGOG7LeAcO
         KQp7SIsf4x7Zz5nGv4fargb2izMo83tWuE4TSg3Uy3zkNyQvYP6CYwJDXxjlaA/Y4JGS
         fivbylvSNrS/A2k4IZFTIpn0BsZApdSc9DoFx/u9ItcuvMihfWE0nlJI4va9sF9arVBe
         JhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176349; x=1764781149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=;
        b=H2YUH32exdK7G/M+V0eMkS4C8l3Je2rCRTqyNGRRKrJV6sPhS2P/EVsN7LtTmDNumQ
         sXKxXZwj2i06Uuuz2nIOtUN6+4cJAfHrXdF+VVxE2FefY5tdEke7w6utMhxpXvh11i7l
         EpPd61eWNeEylSmREaEX2yf4uFo7Qs3MWVcIMW6Ju+ci5OsPZrL2578nN5dIP+QqBudX
         WxtnGA2q1ebn0hqxRVkl6MfykVVbm4LYtunDXM/4JZp5lElGY8lo9t8zkbR/Z9c3e33A
         R4hbQ8vNErfxXFHVF6JCVyrQkBHiN+NhY/gTPFZ5lMcHPY5BTBj3eNLd4gL5/JuaI8zs
         w5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnah+jIeOCDB4G+FkC0G5bkLDHDT8wmE7glqQr7qzvCHHQUeqVJX76CRuRqdSVyINHwK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvVg0fnAezzATvs11sMIHOhKKzMT6RdujBKllI+GEIBMXhvSvQ
	m5xr0ppZ/Tc1sNYZ8gRL7qO8oU1hBsh0Yf8K/dnQsWyyyqdCK3k5JEJjNoGbvw2vGGCQXnzhvbd
	dGmCDf/hOXwOtOnWhMBgW6Ilb89x+sIxebjVF9BNYxxFv3VdTbdFge30=
X-Gm-Gg: ASbGncuInYtAU2GzxpaKJeWWHiPJ7tCuEEO1+emsddAtJe5Ccc3W6WFVC6tjrlcYcmu
	SrXguJBK+zwBwOhT7NO2ixwb3HCp5dAV/yAfMCO6qlrOf4ixerkRMAGc0Sw+N2nLKGUe6LmoyJe
	9pfBjhrmJpgUbJ0HKqVcSPnrXc6ppv8Siwx9NUIDX66BVnR+UTW2Uq52Dgquf0dywQr6rw4oLAy
	p62VYYaFrJd2EVmQb2hK7ziqXF2Whzk4u/O/vU87oxa/qoXONkxmNz670Yd9DPeGehbmMjLY/7I
	HDbsy1wPssOB+VZDhV1iWw3VLe6ubrIhbjOZPRk3sLuIGrUPfu5eZFFQ+CQu6NQqmOpNQe6IDjR
	3l7t4PqZmjXD2WcuuBxcw8VdH7dZu/6qvDQ==
X-Received: by 2002:ac8:7d4b:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4ee4b44942amr390379781cf.14.1764176348635;
        Wed, 26 Nov 2025 08:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXP8xwc6R66Df1B5JWgQH4iuh0Ol81d6xkP0icKm57B55Hsx263/Lx3e/3QyuggROGBRbYXQ==
X-Received: by 2002:ac8:7d4b:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4ee4b44942amr390379201cf.14.1764176348111;
        Wed, 26 Nov 2025 08:59:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:44 +0100
Subject: [PATCH 1/8] regulator: Use container_of_const() when all types are
 const
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10498;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ksdKQZDZf6PSfDQolGcZw2sgxojAWSKaADH0pEqNoMg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHR9c8eoy/Zb1bCHwTyc/IxD6/8sMI7RPdLr
 hFw5PxjURyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0QAKCRDBN2bmhouD
 13A2D/96aVoQBIWlztNXHma1dMqEyrhOjl/nJwqbU4bYXR9p/7cDyCWHzZCzlJanYbCQdHlRsU3
 4XJvLpFKn3SvHvuqFc3piKonZ+WomWUZNApZFb/vIlNP+3qKj/mqckQQ6z3OxM16g9XSWstiWvh
 tJG/ALTOSWZrASQacFCckdNuYkNn8Evw1Y1r3dCyiVTy5VXph/WNp/5faqtO3pkByfVRHf0ST4L
 6z4lQL9qo8fRN8JbfqrIsun9Sf+9/57RGVcaKdiKmUwGhOeXTrfjace7hrhenXayDc705KHjpNl
 vwisst1JR5vYIHCkcmgU1NbnUkMG4q95FKcOS+BV5KHvtg1fSCm79r5EsUGNUFnFYi2WEnydKCZ
 V+Ns7/irjxSJWscArOxlj9ckOeosuoQYzN6Xf0WOHh2U2wICuXj2hiZr4keTRVjztY9/tNwYbfA
 y85fBdV7vcJ6flA96dLqBIQHVKKI9BTXFZD3bC/6EuCidR6FqfZFhvHxGequ2cVyghIkTER/exb
 3aOHQKGJTOwONquL25xJ0Vd/v8z00tEH8KZg6ObhWKrqkOTUFldmCRLBBF2Xv7bnP/R0AU1IA3e
 0GcwJVD/hzuxG/Mhd90sxi+T27+6432JhJ2TEetTwtr01w5+jmENQ/rRiXUedI67uaVyLR2w+8U
 pdjV8C1PTk32Ymw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX6Ka91PvxBZKW
 x8N8rCU2cvDt+Ojuu122zKIskgBA9ypm99PHfPjmG3PI0xwBtBH3w5N00mTO0bV7ZwPZBhipbl7
 M64TDBLlo2nR6L8UsgfYgTkh2Fk8YhMR8I+iRRDSWUVXnv51lIvFtyKMiPUT5ZEU+7F/aYsxBd9
 LInEqhGtthXpoBkqnu94cFYwFIGF2xs3MuC47V/tBLXikNBQSuYjnLBCTEIB5Cy3Q8JdflBqFbk
 MsQ37kJLASTKeZ/yzzEC5gM3Ws4xcmfc2vek6Lt+8IVhCaZm3tBYcq7Sp9yHQlmFtvEkKOfFCTL
 s2rIhvCbJw+2J6lXCtHpCJb9J8400l5kNiODHkoDoY4o8C9S5cbKcko5v7s9Q1MvFsYCedvR6tC
 mgB67sDnj5yjc9H+V71FlmqoYrpaCw==
X-Proofpoint-GUID: GpjJ81fmxBUTSeQ5YjWKDiQNhJEPSvDH
X-Proofpoint-ORIG-GUID: GpjJ81fmxBUTSeQ5YjWKDiQNhJEPSvDH
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=692731dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SzMjVNougZAxKi99s30A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138

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
 drivers/regulator/pf1550-regulator.c     | 24 ++++++++++++------------
 6 files changed, 28 insertions(+), 28 deletions(-)

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
diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 904926097738..037b8ec94066 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -71,9 +71,9 @@ static int pf1550_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 
 static int pf1550_set_suspend_enable(struct regulator_dev *rdev)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	unsigned int val = desc->stby_enable_mask;
 
 	return regmap_update_bits(rdev->regmap, desc->stby_enable_reg,
@@ -82,9 +82,9 @@ static int pf1550_set_suspend_enable(struct regulator_dev *rdev)
 
 static int pf1550_set_suspend_disable(struct regulator_dev *rdev)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 
 	return regmap_update_bits(rdev->regmap, desc->stby_enable_reg,
 				  desc->stby_enable_mask, 0);
@@ -93,9 +93,9 @@ static int pf1550_set_suspend_disable(struct regulator_dev *rdev)
 static int pf1550_buck_set_table_suspend_voltage(struct regulator_dev *rdev,
 						 int uV)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	int ret;
 
 	ret = regulator_map_voltage_ascend(rdev, uV, uV);
@@ -111,9 +111,9 @@ static int pf1550_buck_set_table_suspend_voltage(struct regulator_dev *rdev,
 static int pf1550_buck_set_linear_suspend_voltage(struct regulator_dev *rdev,
 						  int uV)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	int ret;
 
 	ret = regulator_map_voltage_linear(rdev, uV, uV);

-- 
2.48.1

