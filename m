Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C3341AC5
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176362; cv=none; b=k6cE8Rqm3tUMYmV3xAXMe2gWrMejikBUQMFiaep4RsHY8B7p50aa/VNzuXIrlQWpaefmTzkbJDhEG3iRfxkA3tyh2AG91JnV/Qf3Yxe87PjQkMjp0phRoHQknBYBAYgqJ+IPVwR2B+R4aEnIvAbChKLJUaLSVyNf1LZcqAgQQ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176362; c=relaxed/simple;
	bh=hmZwf+gqSZxGRRmKDKGj7wIJ5dnf5CYeGgO2dqTIhtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIyVRntgtnnzQlpAHJOgTA9rOoyB98kcJigLiyYrc90ldfosYE/J8A6kzjUmmQGS+D/5mRzsDBPg48+0bGX2WFPjjznmnjkSWqLQe7/X5jxA7MB2gGzIPRN/yWEzazObsV09hXzqF11TOxrbCFCyzR9rH4iZKnU/KsmY8oq4hqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiTDr1F/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi8KaG58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiTDr1F/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi8KaG58"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXTp1849222
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=NiTDr1F/7VsrM3ga
	xeDmYRK858JyNr1fY8dbQey34eJhZcxDLWjsahnqZd/ctVMO7+d2608wWkQGg0xo
	QY8u+OO0fjhuibpI9TFV18miyoVxTjKs1KfpOBeQ4/PjAQxLnWP2u6MHHsal8Sdg
	9lwN0R1lAqQQJIWaQwXYANN4180sa+g5w6EOUuagt8i+bSrLHU5X41kHSbd8qLrL
	0HVrbzSGY/svR/M5GRTT4tbTxkNJ49HiOl/CGApxZbwqIl8nrMPRkdmyKao5g9ge
	KHjzfgCEryf+ewWpGvzxWdXRxFX9pYXn166VPVjvmKlkFO6BG6IbnDspk4Gsa8nn
	rixK5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so1115191cf.1
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176359; x=1764781159; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=Oi8KaG58OnNmvmCz/2iTN8ch0ti3++ozYSxacDn38n2SOht9MVgcqlmdyJTLbgYzDK
         W5FRwgJO7oMyANB2VzgnnVeZccEnp8Tcj6K923Pn6jB+raQO1OIdA+8EjJ4OAIqcj8Um
         mUjycne8V8NOgDkS9QrpjimWoNre9QS/i4uY9xzn5OpGb+ipKgsNQuWAnAc/PeiYrlxJ
         JyfDAV6t+pjWvnAt1ZwnzITFkSopP+CdVfzNaZTke01uHaUVJCIJWlThF4AP+v3DN9Yt
         SyKZEaYAt0z6gFv1CzVoAtrMqGDm4lGbaGHy17N2o9hgEr0sQalYesdv6pu4oB02q0qa
         bhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176359; x=1764781159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=NxItimzX5FHcOYmcZkkF3opgBFI5kNjCUXDy6MFqnkTqJ32i2Mdt1zbDUNsNumSZWH
         N6ZxcwbfW7qJieY1aWLfXfdKAlWjRjnQ0t7qvwTyxGRrto1wWQMJlp4s4lE3Y1mzBuGw
         YKDi4FTIzOwlUA1fGDWE9C2aHpTmv+2s1EM3MN2ImQ5MA0fo03FNs2kajRWvVUFe1RMc
         aTFTg+fyYHTQsfsJJFjE7/z7PBJnCm6C44oiFVfMvLWiGmIG+o6Kp+mLZ14UsE4gh8sy
         upDdHk0zNiTXSU0TZeIV1E0to2VF1bmnZifrhkiMyPbha8JyqFKjfnUOzbKWZ7nloVYR
         KK1g==
X-Forwarded-Encrypted: i=1; AJvYcCVkbSbiMj7YIhSc++ftl8ye7rYNY/HbmMci0nGv/3f9IflmXJMjBZNESofRS7xncUllxPU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7rfo+7gaYn6cEu/t4t+asrSBHHC5qAsAwVk1OjzX6EMI6F4ZC
	urAkRnw4pNOBhhwUP4j5Z5Rq8+rw6Gpj2oC2RW/f8Sjg8Unoej+0CUgDhXY6Fg9QODEaE4iIIRL
	9B7egHrJYUtppLVaNNcjkKj/5uMbL9XkZ7Mb7MsKmqjenkybH/bty3M8=
X-Gm-Gg: ASbGncuQQKglZ2NBovQF+SQzZZ2gJWQzaz6ySw+DPwM4w0WVsMmPZpdywlFKqawQt1u
	3rOrRcjpF8X3KV6Is9qW2pJo53zdRiNapezv6dA8NvkHtUC20v/+4jrNVOcojV8J+4HYH+61xgV
	y6ucGt3jqiTmjd8ViJbdrI6nru084nONxxiAjhXp4j82xwF8ORlgSo/lcdCdz7pT7OqCeHo43wq
	mFu/ej+OsypKXQN4xgBmphfdbVn9FJy2KTPJxE9myIwUKxKwADxFdvVk8qJ+4H7YDRlVbIbzm35
	v5AU0HJdfkT8oIBZaEX7wZrkSyXovbQdfZJfGMyNtf9n7I99Q+8mpSqmyTDpRoSRcj5BWz2cWoN
	OSiibec1447LAvnSJM8T/QqD0CC4bxEWQTw==
X-Received: by 2002:a05:622a:83:b0:4ed:b82b:199b with SMTP id d75a77b69052e-4ee58a7fcfdmr280745911cf.25.1764176358691;
        Wed, 26 Nov 2025 08:59:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9Nz5Yp1BIM1KY7e49OaHY0IEhF5wMZdOUEypF18c/ESGrBdCJhh92JCRgAgFt++hNUAfGrg==
X-Received: by 2002:a05:622a:83:b0:4ed:b82b:199b with SMTP id d75a77b69052e-4ee58a7fcfdmr280745601cf.25.1764176358309;
        Wed, 26 Nov 2025 08:59:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:51 +0100
Subject: [PATCH 8/8] regulator: pf9453: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-8-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmZwf+gqSZxGRRmKDKGj7wIJ5dnf5CYeGgO2dqTIhtc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHYXmo0mXPdOVlHCVazTBqn0/qr5MvMIY7+v
 uTv0NxK5R6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx2AAKCRDBN2bmhouD
 116PD/96Qy81QJpXLgEUygAsiYq1Y0UUEImHwCVulXcY0S2IN6/DD0T46awe8VLEeh3nEsA53Vi
 C4f00fwrMbwLzzRP7YERqcUGtgksB5Vj7wgs5LZU/6ktN8YsSwtisDnhl9nzRJkbCKsh0bc4hBT
 AomTnNlxw1HK3lhus33gTYomSuh9zHXQIJ1NKn7NQu8DXrUxReXklh7puUf5p5/f5MQ15nzX14a
 0OjZzzfTNr74KKjeuJMwZ0L6y5XELVDhmVQQhwZKAJWMTuE5A320J39yUQuug6pplw7E+zsqM1P
 rY5fG4PX1JSsScLfpo76Ih/CuYRjzkaO/4dtNt2bReX6eDfAbsbhZk1aP4vugPf/Ug3pG3Xk9TQ
 mqAqu6oKRggIcVSHlS+qd8DoOXQduIhqtxWDcL0A+a949atcum4QUcg3uRYalbTz+JZeD9nJJI7
 9kn1Vs6QrEDmDu+CUQxDd1hDIazOLRLeXmTYL83SLRFWGsIoL6GtFrP49pgWigVqH88Sz3sYQmL
 bkY5KUf3AehEJrUCYaRHFtNS2KkNWCHdhd4GXzCqvmob91i47C2S+rs2AfpVx/Co/9S1jy2nChJ
 Ub1MlfbhoxOeWOUgSvcY0rPkyogfegn8D148yhBPxi/TRtsTm1gdwsnVWay6+OqrP0vDscnk+h3
 6I7ZwKcG4Lg1B+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: XWdxYmdDFbnkg--dz0R7UsTtvwzTRoov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX16cLsvZO6IAG
 Duvztu60Z3iR1xOeoDtQrnri/LUDAv3yU3IyZqDWH2XNPcXvpsKU6qzUuq+fSF/VZgDpOlM3Bth
 /c4pKsROx1+dGZu0vEWim1vN3ZlBo5MMywaQ861lPCpxIXFvUpyJ94ZUh5NKpt/SBpjh7uLrUjz
 RaRgjLkgE3CGvfU23zwNnqIz20YZljP26+do/YU4cVek9rjCpkxLU3HmsEr7unpihmIBorfQw1x
 yY0wfgbqOYhganbL+CXDZ6ryOP4Od0tMfKJ7rYIpB986FdJG81AIAmF/amEoyHitWtKrJON90Fa
 8SPy9X2nSjhQtEtihfCc0I3ZjAt1Ba/i0bTm5ecgCuvxvxM03IOR79p3EFkRxRAlveTh4QrLVEW
 wM1AsSD8FBWWMcKZsFkXRqW3+ZNVlA==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: XWdxYmdDFbnkg--dz0R7UsTtvwzTRoov
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
 drivers/regulator/pf9453-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pf9453-regulator.c b/drivers/regulator/pf9453-regulator.c
index cdb80f9d1bd7..779a6fdb0574 100644
--- a/drivers/regulator/pf9453-regulator.c
+++ b/drivers/regulator/pf9453-regulator.c
@@ -538,7 +538,9 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 static int pf9453_set_dvs_levels(struct device_node *np, const struct regulator_desc *desc,
 				 struct regulator_config *cfg)
 {
-	struct pf9453_regulator_desc *data = container_of(desc, struct pf9453_regulator_desc, desc);
+	const struct pf9453_regulator_desc *data = container_of_const(desc,
+								      struct pf9453_regulator_desc,
+								      desc);
 	struct pf9453 *pf9453 = dev_get_drvdata(cfg->dev);
 	const struct pf9453_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;

-- 
2.48.1

