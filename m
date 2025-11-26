Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA431326D
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178834; cv=none; b=HjHJhiCun2jxFDoC5keibUcNeqNgBUqZKPkJgpayS9DeEeb2lyNsJRmFXmpXNFkYpsRhC5f/wdacjkVU85uk8VZVfjQCPqiVD+244fNEkD11yMbdTEg2/Sucx2YrzPe36MPy1IboMwoUoipuMJ6eVE5ghd4bxbJ8HgYr7pYiBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178834; c=relaxed/simple;
	bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYVSFtKjCaK6t2aZ3IiK7GKQVfYisFKhIeBAToOCeZyOV6KGm12mClfGs2hQ59nfQRuE8c6lDABMqRntL0EwKLppgM5umkCSCBocfeHr9MxO61nmEX+x5NKQZPCuO0MsIljgCiWL3czCCnOa+rWRI/gUZgx9vQ7gsPIVebuu3hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhzZvyxL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGI0GNZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhzZvyxL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGI0GNZV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8lRHY3666317
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=hhzZvyxLmJY8GRFc
	WnVCW0cAYn7x62Rw2dgZd/Sra0R/cKZZQ7LobHH08olKbex/rZvgyuSjcahjMBcH
	bYv21fMI3yYeJ0F6DAK5eEJbann5O64mrgep4Huus3mZaj+qSCf2GvSoomsn31Qo
	LU9vl/VXqnALdcgqDjRrVrxtNX7Y3KyGUEZoqlXlX4ZDauA2QIcY3JE8gf1LuyDU
	ejVgQRjf2VNMhGi08uBriquiyCXBG9/th7ab9sTtCV8bETFBQiTNReIsiZbxv1T2
	FVErpwsNqPRT/j+A64Rp0WvYTEdevNjSWeqavqy6Y6y5rstBZBEnGR91th3L0HJE
	ywPglw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemu0v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b29b4864b7so950185a.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178830; x=1764783630; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=PGI0GNZVN9FbODOgHXwKckQO5kNOFVLQ8Lza6DMpklUH0tjX5DdlkNQ0UpTtr3HpX6
         9/VNW4XU3HJcayxd2qztQUgpWirj6YTn099an19Iqe9vIaXmQydjbFcF5kl691iw2UM3
         cwIOtBubqzj5Sz2IeYGu+jsN2S5Nz+rZxxgIpdSdBLQBowY8M9Ahb6yKI5MTlfhbL5mo
         HpV62ttKggv75n4OWfHIb5vbbdfAzMFjfm3HK2wAssvSZE5tabdZh2ZvyOzeRkQJHpHD
         N9byB0KQ0G94d/ShAXeNi0PS9MbccTyzkwtZoG98zjkL+PHpWbd0zbABjO8FoXVxcmMg
         4YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178830; x=1764783630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=JCSXaQAM7dlPi4BlE4aab+T3sB53Rm6sAyHzjdcTzaps8YuwThHz5O45gO/NHn5k7j
         149brAPni7lYeb1N1p4cineq5Xv4Fhps5E4JfLl6Dp8EDmR9OZPYwJhasWoazp/7Ml6/
         8cqFlz9klPLFlV7H/YcfCPr0855iv976waYMxZ+HdcBEUqSaVmYlrzXNTvOlmAo3pa0c
         hCfbtJ0u++aEORnurDHGMakorTAQ1PXAGk2wyNgIzW1Wj/IlAXxyc2xQkOB4cxlolpk6
         3yI5ln3FBWiGHR0spl6mYy23zLGYzpMNx6yo6pI+IdHtw52DYR8mWKnRz3/IDYP1GZgw
         9prQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXn01jzZrqZwkMObGPInuz4vbHhv9imiZ4W4LHAcXLAhHILEBzs2QxxcIvswNniIrqph0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXvYhMnQwVkCPfMMEVh2EBf95Tx7nBMja7P188UG5cOj73Wv/G
	mWojSnl8zCmlObru/LSPgIQTwZlkQg8OXWofL4MEdz+fHscWktl2znYXWjCTSKTirYP8Aiy2POM
	O0mUdpdK01oovN61e5w6XiqrnTEwoZ7D0ms1AjM+EH2nRaS4PDvfP2dg=
X-Gm-Gg: ASbGncsSlUz6YBQ3jXNpH3b30YQ3/e/MCW+HXqniny8VORJ406PEXuKNpwiwtoHffki
	0oMGXT8Oh6s2u8MFeT828qYG5YDbDUweDXRcQ4FWqjKQiJdZ2fvAvZeB0bRihqJ6oC5sPWhY3zP
	qKDIvEJor+1ZYGVRxABUns38SqvopfnRxtZK6aEm0Zjm5RT+Vl9vi2Fft029Y73Q+WXpjrwjzpo
	JbP4XJfLFArpXTaNDe0ipb1jam1OHXBfjCi07AD/OMDONm1AyVto1Xpen3Iyu9Aq1HcIm3h9oVo
	OEDsue+yVFTNR5z4vXfc2ZUQozlxS9EjtzT6+Pv3wBEg1/JtkAUBcbhCZ5ZK9c5h4GUhyuXKW4N
	sRRZeL/iwz251i+wSDTYTO8VCT3TNzxmuhA==
X-Received: by 2002:a05:620a:1909:b0:8b2:6121:5af7 with SMTP id af79cd13be357-8b4ebd54602mr1013173185a.3.1764178830603;
        Wed, 26 Nov 2025 09:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt1Mz9fBy3af1695aDhvFped40qCkoUYHIDo3l5Pjiw2ThshIXfjfsGRpZLC9wUBlHEqde+Q==
X-Received: by 2002:a05:620a:1909:b0:8b2:6121:5af7 with SMTP id af79cd13be357-8b4ebd54602mr1013168785a.3.1764178830218;
        Wed, 26 Nov 2025 09:40:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:11 +0100
Subject: [PATCH v2 7/8] regulator: pca9450: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-7-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt/rKHLlSw2aj9ekDpuHoQUuxhSPS1ONpNfU
 t1fSa6vSdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fwAKCRDBN2bmhouD
 12IAD/4jnjL9wTJJWRkQ/+Sr+duE/So+Tn0cVx0bSN89gdxic7LNgiflqKQYzOf79poYlRrPqqI
 sgQjOR+KEmimL81vv1T7ie8fY7tpXDmIPf8Psexu9Anev2OX9zcoyfowZ4Wy98vfj6QT/HYiywF
 2XgOeQ0DRUhffxOrnPCnbPiD70YOyXUZ6HYCrghW/+FPBt6SglwtX1aD7+gF2LnUf/6MqHqF1uE
 RhqmL6j9Iv+amRsqf11MWIuvbSOrUk/ZY5KDJRHNbP8T6WtWn9FztikJ1zpzASfTClza4VznOFH
 tmC2gP3R8zs2uYQAQGMB86PsEfB0JBlwUWzakp4nombs9OnEt4MScvsNXwBcnPvxJva0ODT9lwU
 /FYk6ew7198c04MicdYfU62HeD68RCZJP/ms4nLD0Rlg+nWAGvqGvrFZc46gjcQ3PqB2nCVUrIi
 uZQpiNtIcOdXpQ+tzbxmU3xH4OSYVKI/g3MDdeATNbuMQyVsGW8ty9cRfAb2aOdiBObgeKn+GYP
 rO9WTd0ueT5yFbp+mTiDbDtdS/LCrFpqo9ePZyeIut8onXd0cieAiy7bUJhqRtvcrrxQ3m/hlIV
 Igq54LQlMwWspYBbIeLTiLxMqTZy+I9Zvx4UFw74SOoOCssjQfqQcXd/HH9Uz9gDWL3/dX/+tEJ
 pXlZ9adGnE7i0kA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 4xkZgq3jHX85h8PHR5vA-Iwimm0UK9Od
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXwMuYJNoE6UTE
 EBZthmF+OmJ0QUzUVCNqaQcUT1lIa0QwkQHlbz2PMVdtdD4wvgOruxq91X59lc9jmJ5MAsA4PZC
 AeQz56tnLGw1AGy06Jc3TIrPHOVbW+ARrXoX5xAOLZQh7HAchTcKA4tHlsJDetQLXs7W4e5/GJj
 p0ZZB8+69rToHrETub0HiiluocSvMYq+qcO8ayv2OeaSzDYgScvu43AQosG9PNwOUoMjb4Isgrr
 4ucGNQqNTrSmyFtzj28YpCL49kBp6CY87YAH6x8fGFdRe9rQa4IsU9DY7415OZ/cUpgrnLXnezX
 hx88qcapJCrizLpvdONS7L2mDYz26ykLJG46IhKX3/jBsqRL3umM/mLLXmQETJ73UNzKMNZ4ORw
 c0+pAljYnkHFxpz2oRwtBWPc4T2hoA==
X-Proofpoint-GUID: 4xkZgq3jHX85h8PHR5vA-Iwimm0UK9Od
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69273b8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wapfrd0RAOuIrv5d2i8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144

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

