Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8B3128D7
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178830; cv=none; b=iA112errwcBJa5YGxWq1+CRl+a2gngvnWDHBBtRYisiPJma0WQbrOgh0tuo5958t+aM/KMLEFjWQMOPe8SYj3YutVag7vgtblSTsUlRIEGIV7Z9uqMoMeUQGuDtNPsmp/n2n488A6UEhzdjuIXelHiCicwXurByhm9as1vBrbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178830; c=relaxed/simple;
	bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNoyZLghZAVoqW46PAMqS64jp5oD39B5gqeaZFmt6/cQyNKOD/PIQkA65UEfPWLstQ5CkhgYATkZcopRJY/ZmPUHySNeb5FOIsNL2d89yVxUE608Twa7fGaZzWTDW6Dzvt2EaWDbJFqBCmXuCa9L5tB+wlffPXY+Q0yxdmeglss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee8TkNAe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmtRXvpb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee8TkNAe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmtRXvpb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ90ro84048890
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=Ee8TkNAeaCYxJvR7
	lYj1pXGUbOv1ZioxdpU4PbsiUvJKz6+krctW4P9wtMVAaXktpi12jqYfhfAqpaRn
	3aO+9nS1uAS2jbej8HMZ2z03oc3ux04JYY17n2PJM0rxXpobRbe1JlQezjc1qbGr
	SNS95Zmk/sFlw94g/jNOcsfiodqdCNXvoq77llIjDhTGjN95MGIeno1Q/LK8+emq
	8NIb/V9LFDMoGHxREC+x5Y6EqPnoPVu+SZGutRkA88nyNURY9L2alyO9UZO9i5Fs
	rtU0aZbSyTEFvx/gByqCNh3PjNPnaOOCl6h/H0b+RY5IwvaqHvmCCGHrCmWKtOOV
	ySUDiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njue8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so354985a.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178826; x=1764783626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=FmtRXvpbWGc8JG+PQPS884+gw52RcT6k71xCHAplOMoyGmRhXUjt93oU2rV4B95/pT
         fPE2Mik+3ocnY9nhcqD4C8TCZmNuOO1+IYbVqhENdyfH9U5ySQ1gIi3D2QXhQ/MFEmqs
         KjbKRPCqX3PBVn9PTGYQ73s+uR7al8MmrzcMZ1KzYJLWP5W1/4lPk10cx489sE5OmMmC
         WkPvUwpmdZAHZeanPiLHguGxwM2+KqAEKcNnWD4U+Dr3/kP/SM9Z3uqfSb3H4m76Pn0R
         TNyTowId75+jzLdECI9OrgyKqXgLUv5GgugZKHGtNKB7OJAD5JeVybUGVT57pp7pXamf
         mZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178826; x=1764783626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=jGVrYN5t5JqV9srGD5a4e9g5CmdMqligITg5LV8XaqFb4YP2GnTYWC0cfEG9JZ/jWM
         TRovcPsLpkmvMgQcIV3McdJUZq9rGv4qEkL+iHqSIyK/mctMfUZzcwP7m5FcZyqG1yUE
         kHVKIeTPFys+erMeF/U6NwVFhBC0q8EXzdkAvI7wdwxqwebUZiMJKIedlpyBRCD4Sztz
         tgleU52I0T2RxN7kDZcWl3ZQXH/E60FBGNP9GRyXXCZF59ljLjy1jxgyg5N5e/L1rmM3
         1zdAt8jUcUUVlQkTNzDHX8Gn5w1BFCCEGk7Qh2oNTwElXiUjzVam4gsR3YVHnLQn6L9W
         NCBw==
X-Forwarded-Encrypted: i=1; AJvYcCVY0y2+siGTpaC797CR8UFj8VtWiM16YAT8gQ2SBogk4wQKBBt0rVC4XUXeK7e679uCQ3k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKQdK6ORePVU70Vh5nbXA3WkoLTo6SmaiPolCHx/HT9PeqzxJ9
	YakIPGwl4xa8jncp5rHniy2W4lf4lZtnI+Y7Jx19oktb25uvCB063hzOiXAk+WkOZQ/NZzs3PAH
	W9E6525+hv9HEoFbQ38juYsorUbvlQm+bGrgvvEbtuRp3mSDrTFtMYiw=
X-Gm-Gg: ASbGncvzH3Jija+fVAWlrgZJSZhDoBUGzWm7xQP51js4hS2c6f4jnMFG9NT3imI2M6A
	49HaWbUxLVzsn3IVZg/gisJ/u8gFmTYCRquIhGgbynLAKD/1Fp4BQjG6EakXApBF5sk2mC1mOVF
	KCPzS4seLORmtQrszacbeOP92LEbb/rmjFI9fil2nxGBeoAo2CTaXT1TcO8a6trpKZnE6dzxF70
	wWQzdUy0Os+N6gNxwKIzgK6Lb3bCvFmBJ2tNPPOBpJWOCztFY4LFExO4TXzLBp63AToD6YyCoZW
	LhpaEMOA/xBjo9KNiYD4hvL0mV3O0Y0LIqnMkZd0P3Nsos38kM9xP+TsEYmHPrKTpBcuruoy+9f
	CAzVmYMZsKPaewn18SZQGVaM9SDOQ+jPmFA==
X-Received: by 2002:a05:620a:4450:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8b4ebd9eb92mr1051556185a.53.1764178826023;
        Wed, 26 Nov 2025 09:40:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk+WYbCB4UAQQbssL44Zoba/uliDJA/IjRYxhjiFF7e5XtfCI4o6pCvBemDjZ7Yr844NNDxQ==
X-Received: by 2002:a05:620a:4450:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8b4ebd9eb92mr1051550185a.53.1764178825481;
        Wed, 26 Nov 2025 09:40:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:08 +0100
Subject: [PATCH v2 4/8] regulator: bd718x7: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-4-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt9jg7POV/+E97cdcSXikJ0TTO5DEGd+g0Bp
 kPawpTUcCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fQAKCRDBN2bmhouD
 14ZND/43VbjQfFZ8ZQa5GgSj68cGizpnP3Lulpkl8vN/CoSgNdpLLuGGfkeOs06X70hijpxaoZe
 MVvrUQWpEq1kaGB1T6YYGUzWYp6FNYlBmZ+QhvikUVe5tSOxCgPNmtoSmAj+zd5g+v26Rn8gwFL
 eZlAaHb68jYse5ydpQoxMJHJE0321ctWbOm74TnUssgF/IDvZ1jOZ4x0dqROWnNQCPW+O3eLsM8
 aU+pxN+P7yezxa8ZSs3qrPQz/hizAoumN+aUGcG9XpzXXyKqf0xBRIsoA4R819t0QQ4J1TgLSPU
 8McgGQaxI3GUziCm4iHNVSb20BjsrBzKKhA+Tzw5Y8A2DqWvqvNWN0Wstshiw5ou9buzttotAy6
 UKIjtlGg2ykA1Loi5KvyWbCuwtDRn/xgKrLwa0ug+R5vJ1xzvGQLhV7QxxjC/IrtSXSbaHsyFhl
 YaenI2PGY2McssB625qOsSAcBvaeSwVDRoadka76VqWWwFu07JcyPx46cma3Ge7oHuHWZkd/hv2
 TulOrFyUwbXqB0/cqCuDyMqfs6z2sqVN6Ei2ElwBAxH758K6NImijE8nh+yHfUCP6zhYF46OwE2
 T2drQ6+mL0of8qUkQXJ7cQfXPEW4ooIL4iXCXmS28dcJ2SZ0HQXC391KYo3g2a55OKm/7/okviI
 nKAGPltNQY3T/mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69273b8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: OtRFUUyXMvi75bX2uSORM8CGJ8GrSqCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX8aMSU5xutUDy
 80W2J0GSsRzVx4MWAwNEPzpADFcZxv59PxbGxXKVA3uRGYOHnBZVOx9Rt+m1TGiima4cwQpTQc6
 5b3iax7sc2uVLLQQ6RtbCO1E1IAweWildD/RZ/G9a8CGhXuOWzrfvOKovB2obZs56RDji7xU8oP
 2Nrs/0Ci+LJshV44LoSX1CL79vaXbzz0yu6BNysFWbz+tP7QARvQnw4Z/2fXAqj1Z9xfzJ6cz5p
 krFiKIU2hJsH09gKXI8vZrNTFi/AJfU+sxHMVWpsNXSPUEq15Svad+U9cB1bnMruu1BfxTCcuFh
 96dt6RejxyPyWr5JdfnNomM6xyySVtfrz2YO12AV5bBzTwCJBGk+ycroPl76d5IDCftJwxfWL8A
 SM3fyCn46SnBL/InSV+k2+LcTvbcqw==
X-Proofpoint-ORIG-GUID: OtRFUUyXMvi75bX2uSORM8CGJ8GrSqCc
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

