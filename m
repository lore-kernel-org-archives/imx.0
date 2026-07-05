Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04E93A0B24
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280443; cv=none; b=kuL1KaGZ0ScD7HYewPhZL8BIffebl4iX5rOyIKN+cqCJ5vf67WRVB5tUlRvCApdDxd7FtA7/dztfRvV17COErxB7KHvIl131iT9WFDrzfueplDgdp9JoD4SG7NGISpkVOOkSsSO/A8kXqYJ6nE5Qtz1qajZ5EMqMVxU59y9qpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280443; c=relaxed/simple;
	bh=gFgKgEu5qajbHpLEFwwgM/A3QPsBxXRqQi+CF+ZFu9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ru7X8nwNVg7ATlJPMnY2RUXwyU8VaifJyGw/0VFxu9S3NufS5gKATz1D5UJ+lcPpKKZrCAOF0+ZNOEO2h1ZuNkMKzOkm7rB9sSdZr+UM8tSi+Q8RZnnfDNjxHpYsxQFHH6+uc+W4lJU1gliZmzR5KNCIqxTZlyK1esZT/xaltn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbBSGLsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGFta8vd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbBSGLsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGFta8vd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hj9ck2317389
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9d85160caso18464625ad.1
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=FGFta8vd/asWjX/DKIIkkoWrpijQEQ0c/ouymq83I3IwzNsJ23xWwLRg2oR/ZC/of2
         xtUfH75SowTjkGkyBivmnQogSTlx+otYB2mkWdX5Zw3X0CSrCBmhCtB+KUhwzIR/gDkd
         o4WRHoMbdTWq1rEYjgDWu0yJVFt3r1EvqiZMZFhvaEyl9d+cazwEVrl0j4YqQcJJYhGS
         P9wtIEZ+5nKTJZHlrKGp7NPhjdJCMXqbQVN5KIwy3H80ZLqulIhcNR7oWIg6HE1IGtgm
         bOcHm9fPeU1eMtEyBkEhc3oF9uPtXX9bqyznIGeoxvjce28lEs3LPXxk3Vvq+FPbJ8wL
         onyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=lMbBHCuAZdAFioSO5lcq6tBj9KxM7SuhEsStJ2N4EvIQcUvXAsWYOZL2Msimkklo/T
         EutZ3kLDi9scLoL1MWXMP6WFng0GobpkqtTQhtyUgpOQ5U+m3/vKbpC8PdzfDrtV7PtV
         gyC+eMV4cypORt4K5Z1HLWZzbCe5rKJ6YVJeqUM+dNovX8npEIguN+vWfuKAC8QBFEas
         NQmyNMMup2g1QQCiA8UL0tKA7OY4UsG34j2QE2jJXnygATeorJdFVuR+Rdc6107pLQUC
         UqAibs2PjQhmAKcHHrX3JgFbX0w0kWg5pykcCnkpY41wBKonPRALzKrApL9ZASRUi53A
         M5Eg==
X-Forwarded-Encrypted: i=1; AHgh+RpxYOdfqF9iiNwWldRYLHueWez6d0tINlKL5t9EMn/jQ6di60nfR46ulEEDQ2o9lMm16LM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8lhKIfnkeAjK+x3xi59X5634TP0+57xy5gN5f8oEXLg6XWMP8
	4+Wwd48DpjvgRTECKRC0M6YtO8m/Rxq3m73iGmO3zzLCX/xhyDutP1RlImtBJwmKF/JJKUASTbO
	lvPGdB0TMagUO2EKkNm9XT6kbp6lvoUwv5U+1HUlwGX/4znJleFTVcME=
X-Gm-Gg: AfdE7cnqx0aQz7OHK7Yrbm2LQm4TBcBUPel7wZg3rKKwj7OnCqEjWZzgdgmtFJrVXlj
	JqIAFVyaz91oxfwLwrINjrIbWYuwsMxbBeaEpaZXWNld3+zXsA3gqd1+ysN3IYB3l923jM3xRl9
	Z/eqS0zmTHe86GagSfC9qATKsxYwhbFeWBwFehpqi84eKHiXo6sL/kC2cOv2GcqCSysdIrTguuR
	nsb/KdvPSYwihaYCGEKnEiK3q4LNnx9x26ooEFs56+V8uHglq8Q57lqA1UtbdFQrwD+8y/c4+Kp
	6NwfUXRSxhXUwtCHftEzoClxag3yrb9fzT0rlIStlwQTPFQi5iJFakmX3+XGRqFzEZiu62u2LaW
	rpLgYPE9cMBk/2iYwLYVjMkQoSQLlYsMz3/q0jg==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872275ad.17.1783280439590;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
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
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2WfP6Y-BpNTq7Jl08iaLc9_KdHY0SPiu
X-Proofpoint-GUID: 2WfP6Y-BpNTq7Jl08iaLc9_KdHY0SPiu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX12YFzOY6+OyV
 ExoerBNQdBb/vo4rPymy38BvPOLkcoUic1P1Cbb6gb1o5WQ8Q5+kF85Bc3bFVrTrXGQ+sFnl2Wx
 /aB6IWcxp9Vg8kDwHAZANYlON7/kHc8=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzP4RWNtfqH2r
 VCZqrKdJWu3rvrYwOu0j3F/Az7KtD/cG47mCi5xTjQVvl2UJgtETvNuO4VAchk8hPjRSwKP8c/X
 b0esxIlIuBzAdR/3iv/FIfpZBiNqc1ofMhOJybOWEFMWBKDtjAhssvcl/t6ilhoQtNHYZ0qcsW+
 1tpOFl3zdSlvTDAZ9hnxfzVHPxmTFdPY+3OcYxmJbtRkSZMDr422nbt1LkYWb+5qfG9RezrfKPA
 zTmBALTAbQf6lLOBKmaciLatD/uDufmp/qh9iYPlTCK4L519obe5ddUueiCAugc7fmJpf+wXxbN
 2qE+M4X/n37OvdhQOaV1gvKASuI0HtJ8j0Hff9BrdtQDMcoQWtuoOeqLeFxAE7dfGELJuz5Ai6v
 nkhFpNqOG2/CLuusvAQS/PpRQOQCwx9Jlhg9/MUaNZAOD6ae/xqj99AbMoAK9pef318pcRlRO5p
 CqA1hRaqEpY4HmRyVqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

