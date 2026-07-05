Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F03A0B24
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280481; cv=none; b=W6RL+4sB5NGONqJYrkUuppWA77koupXL5VCjYM3kjWqcqG/dqziq9NTRB3OhLmsPr2RvaK+IltmiRBJtSeYlY3WRmhrCcZj2JaPrlhTcKtbhxGMdRBHfK+zZDrLT7u8/LecjDtGj8nJXsaJU2qLFTLa9h9AD7v1EUNZfNysTjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280481; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXW/jCNZsnCgKuvsUC+cYngH19v+FCH7SwgDf18neZEaZzMUs0qagh6TIUDwjRAmXj9wsHl2GEsFj+d1uQHifepQpJNjZRMF46l1WgqEBgSH3wghOgQCJiYzDRDjjGHkYazku0DFDNuHTfPffmvMVtUpQ5XS/e8OeMvpSrj8HwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1DyePdV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVhvB4ar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1DyePdV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi3kN2353119
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sudw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc77a6943eso38160265ad.0
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=Y1DyePdVF0fk5Lu95SHcDL+4eqDWlreRjOEH1E38OQ0Fmyyz9DLGluV9t70ELSxV8E
         bkRvrcTd41MvX+i7N8OH1saBAISRSSaipO0ogD7zqzQlCnOJ09U11/yzht9bO3DbCW9U
         GOnq3cDAZIAXB1M6ZnZJLue48+Py9vsuKUcudABiD0+togFkNUVqZQv89YsXH8F4fuUT
         pAq5WRmLgQv0Cwi0W5rGchQfq8tAR8dcZX1tZ4MxUsDVCqvetj0Q2PVe/LurzxUid+xe
         GYmFfkm80sm4EqPXft1QBgQ/+zZAfXNiJmSeWLHo7lNWjgQZAwlFh6U38xLfA8SQSfn6
         2THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=G5k83IkfQWChnWjMA66Di31SevqvSZGzKXNVEjk/9+ZNfUu38H6QZIIKRtp+gx+rLU
         Q7crW8iN2Rb1CNr6q9W9cpdVR0It25x8LKZ6MclIAhrdkWzBryEFW9WjlVqJuVOPZUSU
         6hKBHiNuLYWioa2aIZneCq+bQI43IwwdiUoLAoPWtuazPqQf+zdu75bhspExHx5mcygo
         oq/l7cLpPw59QvXTiQPPUfy7rQm1TAlOyYgGIJ2EuyN6I9O22jpQfCaWXLEZhp7MKC26
         QWjNUnawhvJmZNLLEQT6qZUaznl4nOo+4QxXKmJbeBEZouYMQ7GMcp0G5pM+xQA1zNgv
         pVrg==
X-Forwarded-Encrypted: i=1; AHgh+RoMnetV9w07bFKfOzeFoVauVJgfjHosfrulzUUizDDsb0j6uZRI4xVlsDIQPOM+iZpSvgc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtTbafEKM5EdvpI9OMw5Bj4eZDRaHo4cKPQX6hfRROJe3Hq5KZ
	teYPtsP1+LNcFs5YmpjhoqTklLSNCB+sMKfqKVZQH0aZf6T5ftBsQNT7sEesYNef6qmwsrV2ExJ
	lPUqA4nFdEWiTAGpotuSk6sggGDbOOl5mCuc9ZeIwN0Jbcc3RnkQQijU=
X-Gm-Gg: AfdE7clMEfj53QsNmj6XfgRLV4bV/DfwTnpYB6a7A/HDRioXJplqCknNSaiPsrOIKhp
	BwCtTO8IjMol8WjAALQydUdq0g8lYt6THv+8l+UjbIqhcj+AEyQPlXeO8IT4/i58ZTGA4qqq509
	FW93HDinR1K7YbFEIYCnGdu0l9HfIDXe1epg4v07rT4M4GMpqyOQuEE2A06OTd9VD/LtwELIAFr
	WfFWJDuj7c8gFd4B1F3dhfsMbnKlNsS3eHfp5naukCw2Xnz19NzueDcR8sZ3R45Ui+QHM90Flw0
	x3zreJYEjwrzAjiKS9hr+1QhlxIGJQgpUNMwUtpgbG2M3zkhEXYQtCuG4J97Qvmhg7Y6c7BrqO0
	ZdLtzQFxRTAE6M3j0WQHY1VfhVAPp3YKvRuXdHw==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826095ad.34.1783280478036;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
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
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzC/7ofoZxrM6
 xtb36O4LPOqrAMS0DfM6RsxH0BRCNy/ZXgvSv/GvKlrimnj1k099ewhI8c+5Xq2NppQdZfqKEED
 Tz5WEk7iz3i/RQSmcmSZkaooXm1oY+o=
X-Proofpoint-ORIG-GUID: MSCPsxSPo0DsfGa-WzlkZ6ytlFSLSQb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+SazRqFC6owH
 cZhkTiZbJWkmGj4iEhl6/a20vd/XiNsAvB/eOpBa/GNOpw81DmbmvNKdX9kdnZkfJn0kGabX3Mi
 BWJ5Fw8JFsBke5RMVSC0V036DELniVEEZWGiSqAg+78RBqt1gpV9l6bnfc1OiFO3ZKY6DgMCKw0
 +ZHMiQxPFZME3wkb7a1NlqhBJhEmOkHZIPxgtSUAynr5wW/ZdoqmdaGxfQx7MfwsBD/iub8xylS
 PaMDf3cSUxWXuw1Dz/TiYSMTnsKp1huUJp1ifogwv9Hs6bBjdZxCryLDLKqTDW1k8l346NxHAzi
 gLoKaKW6WgF8t9USDAKk+mrMjOucBjTbtfcvLegRwBPY0/NXX+VmKhTpMbRBghQJQ3qcmCD0bVJ
 IeA5ESu3dhXvQs+IuA8dPjLrYhj7X3F4oH7lV9tO3dkBIhIwpBsWOiSngoDdUl1VpQPl10f4Lvr
 3woEjyOm/NcmtC37Ivw==
X-Proofpoint-GUID: MSCPsxSPo0DsfGa-WzlkZ6ytlFSLSQb4
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0

