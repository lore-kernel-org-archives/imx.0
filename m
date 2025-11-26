Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050253126AF
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178826; cv=none; b=DqkM2PLKjOhP3gaOUrLnCQlqYqoOg/oCgOuwYITtxqUA2A3i8XQjdmXv2Xtxq6Ox1L6XOLd8oVhkOXjHEhlv3in7HLEW/TSfCOSPPQkefSu8brXvSCQ6PD5afJhrHcgQOUgYVe6cYoyagQkBK0lU+QB1f0NVye/AZQJfsFiz01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178826; c=relaxed/simple;
	bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ej5ESxJD+RGElj182tAj0VD+j+UHeBE1fi8QYPX0nKSHvE7BwXFIK46rOrkOqnmfju5Vxv8GvyBFDjKRSP0J9k9QcVkl4oLZk30Ya2Mz1qYfBfWJzDyrCYzgnoa2fi64BU7p5ayhzHLk+pqMZs7vdiz55TI2x/R3E4V/0Av4vqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqVj+Xxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M11jVyhF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqVj+Xxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M11jVyhF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ90ro74048890
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=YqVj+Xxp9YY2tixt
	eenl7IDMEmeVj2aENO6JE6BD5dviSs3iq5LlydV+9qIhor8taBRBI9aq61US8BlS
	xiwHrwUNjI+AQY90WiDZ7gDZOxRO1zRCpf3ZQY7IsYUBcVCaaJDaLqOGAI/HxNw4
	bXxSQvdPrMZwqaJPKLv4Bz/05CF22VxqsRF7O3rkaE/XyarKZrcWO0wqaWiT5Kjx
	2Gn8gBGgippfcGAxPiCP38wekbqdxtWUKChyiCvL+2Xdf/O3tJSlf8z0bW+41uM6
	sEJIC0veB5XQLmVkD+dBouvwB/AmpWH+2IdVeNYsUS1sDEboIjOlIE3ZX9i3Yfmc
	fb/Vrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njue2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1841594885a.3
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178823; x=1764783623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=M11jVyhF3cTKE4meNE7dCBHgAwg3Ftr/8i9jipIMfDbfDpjTzJ/xkUVLgM+hfKnf+P
         nd9aybqdVeZWISgY1EJuxppdbXRf1UX/90xeFcRdWZLV/k6BiIuiylzxJd44VOkzZn6L
         NGVY1ksSun2qj96pxPW5Jzfqvt8NT0qj3WeGGNRDk966mAIyZA3ja45cqXEMLkGqQG3m
         lcIpCPguaXKxE6c4Pu2pTBperzTdxV37G9b+Sjx7ujxQWoQmjDaG/HNtVWm3sGMMy1+h
         S/A4+7tQOIa9hHyPjQrijRikK/GiiJjWyNoAfaJNJWYKNJijXWSOpBA2zpjR9c9j9aT7
         Pm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178823; x=1764783623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=OfvYvhqIHyCgDQcwVRdQaE0YcbH8uoahiuK7Jw6t3k6CmGpXcKge1qbEbl4qRcVABe
         hcIUcQPWcTJVy0aq8DTMInmA1ptlusmCjulNv/3kouZwnBjIWQ6Wx+51pPfOU5ja6I9O
         1sIhVxVIxVC2pNk+hil3KWWJIYMyiwO5Bl0fC6fVOW6pLVUTbu22i0gTqSRCHMce7EvQ
         xG1J9Oov9tqVNc/mpLRhZ6XSec74Z0Gh9NS0Y8ULXZPezPZriwsrt4xH+gUF7t6XYApI
         CkqRXTzPE/GPDjFrUfNFAk4FUwKhnF1lu3mNzmLKv2gSYmINWCQw9YJ7FrliJ+ADEIl3
         KUzw==
X-Forwarded-Encrypted: i=1; AJvYcCWMeH+R/rAoyAY10ogKXgANpBiRolvP41bYcI4XkMBW6H0NPG/3zzUqmGolMpgzY891u/E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk0yrGRRrXs2HgQHhVLNsVXz4tBUqZgF+UKzDQ1UMTy/tZTwrm
	R6b0Iod9/I97/KY3vsFxGfzGaiuiBw41LPhMBi9CotxIfiyW1GEBdDHXAlm7NtlConYabjNJGpl
	faHv68FIzTfWucra0AtAlGcDZ9uLBBhNgqc7fqh4neG+cZgYgO1Mxb3M=
X-Gm-Gg: ASbGncuJunLMaEYEGyLUeIF903MZFt6bh7Rmhne+IYpBcfwSdVKZzzH3Cegbjh1KLiQ
	sO2Xd9RlLHplh2s2ei+9hTmu7XJwl378Hmq2WN+jF8dskgkhN/zaaZ48MdMPxgv57v2rvWFPwMQ
	XBrdHD+aUCjfxilBD+OWn/KF8YePUPl+87ujcIfzdhvE4Co9ZfWqOEEeuQYfs0WOQAkM4BWVOV0
	cFW6pEYNfhnju1wwoHOSxIIL3toiAURN9vCTpkVAMOSkH1KdeJC6fYi3CdD0aV5AlghVw/wqaqK
	0ddsAsNTUL3kd/fRmP6zM3D1tunFeQJS7d1Lico/SFQa1vFwVnkt15aKNaM9qA2+pP+7lkZ8f8z
	LqTB0PGzxeH2s/iRYUnQftOY5boHgonU0IQ==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447595985a.74.1764178822888;
        Wed, 26 Nov 2025 09:40:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe3tkVK1tsFBQiS4G+6Zjm6S22v96S5ZcYKIvedvhh8WC93a4qg7Aoeuo37ULuK17/ykM07Q==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447590085a.74.1764178822232;
        Wed, 26 Nov 2025 09:40:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:06 +0100
Subject: [PATCH v2 2/8] regulator: bd71815: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-2-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt7AGT6LRAY8YfTFg7COgV+NHDwYgj6p9TWN
 VpN1PDcNE6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7ewAKCRDBN2bmhouD
 1yreD/wORlUqhLlB45GKp/eaG6b75/1Gp+R/YcNxqWEg2vaslfLtaam7C2VNfj1bijUX30oHGsV
 cvb5KCyoED+dHbJeunzFQLHUyRKJYQKvNgi/1i19ttMSWbnODpIM+eKNEtjS5h98uq+/g8Ja5o2
 ihes407gdCdW5M8NKknn9xPb0j43QQtYq5MpghUXAnmY8l4p+ly2V3dwvHLbbLDzqqMHZz0g8R2
 60TZalrhocpwjgjBxNZDaFk/3PWEmgiUmkTBQ4PuV362d0Sq4qU+L87zXCc2PSpCZydbPSVgc4P
 CkTBsAup4SXI+FQSDzJleQfgwwbM1EBTUkRTlv7ruB9rjksAVpIBU5K4Z/kFd/lg4uuq34MbFqF
 OwYEZiJZHnGihTn0SgEOgp/EheBr/eGTcVksVvUS1Ko5hh14gFhIUIy16T9wSyoc7XYHKgCr7Tw
 xgyea8gx9hwFo2A8z3Z/Mw+zJRULbVeILjFQw2Twx36z3MuKWXAEF0JDDDRX8cpWZswQ8rDKLOi
 u89KNH5rZV/R20O8aDfZIB0Q6gbntWdzlE19d2hvEhRUXnRED36YaYfT70ccbfKrJshM9woCi3u
 ovO2Tvn/y8dDRXNNTuFizGrvIC6ay4E8Tvd2E/z0VaNerk+CPu/M4bc+devSFo8tWMehxBBF371
 7CuJNQBLi/UUsZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69273b88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SBg-UtqhZgdqgGBY4Ll1kZ4ZDe9OfY0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX3b+2OytNLHyY
 y07QPyU2h3EV5SAnY+uVXo5oQ266HikNPzik1EGHR2xs893/mhb/PGNXUaNcPCqFiV+AiuLULf2
 81uPY5nIPM2XKuimKcoKjBd9RLRw+6tqAo/h00ifpsqvna2C6qQYyNdLShCHVicxSNrLaB8lMgf
 x3MtjLh43DzGxLoziOVRAdEeR0zNmnktnvx71ujUXvbbvZf4JuSxi70dCAk1I3of2dx2JjAWHiG
 nj0AeG6NTZC0ba2UiSjy8JQB5sqRY+n83tKiJoUrD4Et6GT4tXvQMlsrddK4IxV03WEyGCnUWxo
 vSpl4N3TZlTBXXOhbDU7X8IkxZsJMTURuxHooIdxNO0cdQkf5TQBSwPCAV3tA69wOxYnENThKv6
 MyxPRKTxPa6+J+PxsuguFgFcDAvAfA==
X-Proofpoint-ORIG-GUID: SBg-UtqhZgdqgGBY4Ll1kZ4ZDe9OfY0l
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
 drivers/regulator/bd71815-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 79fbb45297f6..8da57a7bb2f1 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -173,9 +173,9 @@ static int set_hw_dvs_levels(struct device_node *np,
 			     const struct regulator_desc *desc,
 			     struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 	return rohm_regulator_set_dvs_levels(data->dvs, np, desc, cfg->regmap);
 }
 
@@ -195,10 +195,10 @@ static int buck12_set_hw_dvs_levels(struct device_node *np,
 				    const struct regulator_desc *desc,
 				    struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 	int ret = 0, val;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 
 	if (of_property_present(np, "rohm,dvs-run-voltage") ||
 	    of_property_present(np, "rohm,dvs-suspend-voltage") ||

-- 
2.48.1

