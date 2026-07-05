Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAE38B7D8
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280468; cv=none; b=my8aQh3wIYk78jgrz0PPkQkQiLSXUDr2vgn+Z9hvnREgfPkBoXjBT4lji5IrqQC7l8glu5M1NZzWU3x3ytO+3OxA2YylIx9oB+tky97QmX5KPPajF3wzUpwYg/4ia08uOPBMDWID2vEHBOibWtxYz64KhnCyXjMNN6J+3Jq2mdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280468; c=relaxed/simple;
	bh=aDbMtkb7vLXS6gEaXl0MiYPwbTWQdGwMD5R/KH8kYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9DydzOaBsbR//FeDr47x6MkB05LPTG/M9cxHmP0KGvM+N4oPP17nzdZEKJEQVpMHsebC67lsDrNI6y9vD0xp386QL2fwvk5biiIkn8VH8+BsVWXAeG76xIB4sTjS6O78FGZu+4bpVqOeoZ19V5+Y3hmvqUMs4zZs8K6nyI6NfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu2AUpMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+kIV2g4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu2AUpMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+kIV2g4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi0l52200111
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek766-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:41:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c8018f11fbso24015195ad.3
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=A+kIV2g4I8QRIxcOBT1tqyvQ1ZNDtCY5prDWBNdq/inOGR2bSJ1/sygE0TIVmesVwK
         k/odRaY7JDgY8/K5KFxKLTGOFdnXF5K9/nkIUT5UBGYYy7Q+9t4VynFN7n5qUFzsUsB2
         M3bqQvo726XdzGtVYWen0mMP3zdXHQ245NUgNEB5KyzQroq98NK2eBNhORwtg5hZKuUM
         fG3V1FxMAxUr9Lz18PilWafsTvmpyf7agO+zMfe1mzvPbNVqpv3XaWumYAlcxRdtw5A8
         bIhyqpejKiZwv7hh92LdnTL5hvcjot0GZAHoUf2TOqFpT4/kiDNVioEnnBojJU1VoFSH
         8oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=HDnMqPHiK2UqbLI/HODu6VCL6K0osyKPpwcradWle14v2yRZn1i+QhOjrXPr2nYV+5
         sKfxFf1rm5ANAf61EVQPoXSLHdab/yCKeV6FeAkGFMU0gfYvM8TL3cNspBHzaffvv3NV
         1GcpBjk4aJ3qCv/trLnwThPkTnJMC4ndP+3lOcYaWokw6ul2TJAIy3qXGqn7xOoCdSct
         SbBnOmIdubKbYUczbbLkam6ag93OCmaHDW/KBCKXNHg9uq5rzrYFperJnOQ5a9urA4OA
         n2VLSDbagv82UOL58IAOrTttVeWmduHGxOBxHYQz9S4vY64HmjQdllAn52TYFBznSZHV
         Km/A==
X-Forwarded-Encrypted: i=1; AHgh+RrH9AbDH+le5cdu6WI0cKGdKdEiIpl0V+62Xr+NqGobtljr3PN5OuocRwjAbi6yoxEPuaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiwPpwmTmJAeKCm1wTDbnSJI4BQjEWZ8I1P70LQgyqrKg0F9aY
	UNyxB9aR1IJYn3Mblr9JtmP/D02JjlNS53VlKu7CRIn4Vy1kuAlX2Ywvw9B+bEoMTdunOWpDORJ
	kYn0xqQmQJf0qNvr4qwsX8H//prgPaTfWEL90Qqed7SCZXwlKgEiAoR0=
X-Gm-Gg: AfdE7clE6C8Jz5QDZJIwNKi5ciCMjeaxJ4nz3iXnFVAOz132doJarzPHGMlQ3xYOY9L
	stDzUMuNw6BX9ba71PQigrLA3O9/e45byBU7BK4P0O7LAkgEgjntK9GQ01n+Pnv91GwZoOkmS51
	kcpDzagq3cFo++SmdP7EXRlnPQOZbEVJ844UgvODXqgMwjJ4Ay8N4TsAFsse/9r0hIMJskM6sSE
	uNJgYT2F5r9gL0zInMbpq/MA980YR60igYT3FzoSYKafsoHP0SZX8KDNs7DXpSYblRbAKPJ8ikS
	x6UYmtBzy+op1WHPwLigp4tS3kAZ5k7Hzw8+AbkixyftMyu0/YLNVVaSA68mnUZDsCqexXL+cdV
	tEORbCMVSREPM5lRmVAb2PuzhH8JrEpJtNcDEew==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673695ad.17.1783280465200;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+oycziSFy4In
 65IbQAQguNv+2vhnxWGjGb3eN8GTYgQNSFlMUzDKUK0nzM0i7E2EOAkEdSkbghHKKo/OG064aN/
 90poK337LTU+TGP5EWkWwcm5vjByVYE=
X-Proofpoint-GUID: 8dvHfMxIhttqP4e4cSLiRAXD-_1FYLoz
X-Proofpoint-ORIG-GUID: 8dvHfMxIhttqP4e4cSLiRAXD-_1FYLoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXy3Fsxl2qSZ0/
 sLu1KoQGV30Hx2FunbUukKF5XNWCIG+v6tpHx19T+SiHd+1dRdFafYYHKeyJwLk2rpJU53ZhKUk
 nqO9HT6NJYfiNxczwGLMcBnrI2c4PPtIe63HhyQrAAVFncVcA0sycqQqKZFFakgZXmt36VJP09H
 YzrvWCYJXySoLbTvfMD4WDsW2mYyyiNvNxvPrIiUYQBEQec9am0Y8P/wNWUNcL0dY1VTyR6i5eu
 DWt4Z+nUQmJ+V7VJ/tHc38KC9Ml2qLC4HC51LMeGnACllc9SAJeGOgGeJHR8fbEpm+jNXqUQ3fn
 CM/isz+mMPOPd/TEBC3N7uMTTPFsWBLAr1bFGGcjSwejf4s9kjMMY45gMouleRUfRUsGwGAm1OY
 pDNkJhh9pHZA/HxLzJvhRaPCJ6hiAgSLyfAhnO6b4VzOFhdPI6Mky/xdwwz2Ginhq0HSXE9sf2x
 cAS2WtoEARjYlkot21w==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4ab351 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

