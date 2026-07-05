Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C63A5E8E
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280488; cv=none; b=W7IMCqM/pte6ijgfPH8HBht2awzK5ZTYTwNZDHwruQYreOt9/Ntvskp9Tw0Q0xS5S6ZBg9u75OCJt1Y1EyHl91wvzSr9nEzF9CoksPW1dPxhx+04FS2ZAqlnWzfN1NMaTqZYy+bu+Q2RVH/MlI41DevvIjq9WFqNUlE0iEi8sLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280488; c=relaxed/simple;
	bh=GVKkJosfWbaAfOvliUHFeY44e0c1PSKKGH2GQjW/JNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzoexCSu5gezKOtkTjO6Fm7PvZ0vtCkKRjW2yUBBrI8mApGhtLs1PxNYSvFCQJYMBrdta/WPIJVpPexMjk2jz/n74K5nTM6WMB8AYzR2lcBPCV3uBn5S07m6jrHXQs7VufQJWlFKR9xLyIOs55vd65ULdGyPI1kKO33HNBkQHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLn6zhut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8nDKIyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLn6zhut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8nDKIyu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhcN72189487
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf8359v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so1575775a12.3
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=i8nDKIyuZYf60uVQ4Y5GhgX5qu6utyqKGTuOmwXcP9Lh8rhXpelQ5u001Pzgxa9h1+
         QNSb2z31uHv7FHDk3aPn7LqEjoZocy0G3eLkVFWoj2Lc5/7Jlc1B+81zbwIMduhw0n7F
         lS+gzt1FvHIsKv8i2ezDG9AUeCcOA36l2gKq7wlwP+H/fB8eZFfEIITMlijgnRia6npj
         cSpKMb72uWb4QzSZQ1mPJBd0LA8AkRqwdaXr8fASxpD5g1L0NZH/cdfG4OvEAMDdKc1g
         ngnZgZG+lToy/Hcl27qcR2V/chPO7lh4omZXrq5hdNowbTnUdedyTD5G4+IvzfOzxzSQ
         copQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=NCVJUFDvJZp3lqvGu4dMTrVj5+QljQ60dWYxLubeo+BOY6eLK24/olevuJCJs5JmMa
         QiZJtTz9vRm2C03LTr/zVvKcNQlK17URgd990jifSHyM/8SJr+dPkyof4BVGX4JHJdD5
         6Vpx9JnuB/HILp2GzITQ6b2mT2N6X6N6DkHxZm2N7PIl5UJRF7o26naFnR0HFm/KzXgL
         BW0R/huXd+elRepw+wZH0qZDFnDGG6VjGKQ5kfI5GvKECWPd2Qi1q9vOXwSC6ZUR/XF8
         Ta1d1zY1D7jOMq7TlsvxKZkNH2Z3HQ30lNjuRN6qPBsNwzcGEg0g88XgcdbNQo5jLXPZ
         FeaA==
X-Forwarded-Encrypted: i=1; AHgh+Rq280Pa6cdSCzq5RTIAYkeUEi7JHlp2W3dvUqF68EtTsIlcuZve2h8LgjaH2YLsBjyJmtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YySnGnM0fMF5tgx8CdtfLO3yX3/Z4dh8sBBn3yTysQCmHM6v/al
	UBwotE0zNXo3KeF2sX8bxxDS3mMxvEQ7j7luQqDccbkC2RsJumWDeECbXr4atkKBXHxBJqWz42I
	wVaWgQP3KkSlNWs895bD3+MUhDnoYQWxS8mshU5s0Eu+wtubJAJPE96U=
X-Gm-Gg: AfdE7clOiSdzgJJVciwLZhumf4UYJ/LuGNPrDacuXEJXTUcbIhz2W+PU6qqfrGMRf+u
	0o/Pfn+A/ZJC0L9c83cou4ej0J1vIDsk5zT4xSolDq6DOLcdPAono6xy5ZjLLnNbMc+oPZoamKg
	azyxboRUAvHKtmMquYC6GfCHajhG3Ty7+ezEAoCzt2IvA3Xr5o5I+c5cH8m5iQ/nyme5kcwg5fO
	syrsHIEnJeuc5Blv9DzDgrWI/yXXZigwtVYXXGZg9sL3OdW3XqMuy/vPYPIMWfMyarHcr9bfOX4
	NlobL7/cATsxTTT1fMNW8JMGA08o2xQnKO1FJCwEe19lhW1k2/tH3eQlaa6+SgRuU6hdUIwk9V4
	Ds3skElFvRuOmQbh5E2iUyEFdw2LZSikmlmwImA==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745240637.15.1783280484469;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
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
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4w4ObesKaP4BPGn33oCYfKOgGxvp0S9n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwvDsRccw5BGb
 RlK3iyRYsjlhsVB5pk8/BqrwvtNmN/TWNreBXgx/tX7crYH41mmUCQX1xl8QAigA8jYdqgNSvZJ
 XBTelZ7f32fScOyWil3DdWsG7JJA27c=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 4w4ObesKaP4BPGn33oCYfKOgGxvp0S9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX5TThDpgpAj6z
 +qsg7QsmDNRRKQDcybuW+do1K0OmWDTJbfz4DrOZmtC7c/Xk4lo5VRYmo/0EmR6tgvh1tZRf1Y4
 0x33RJXFhYCLBvWV/DkBjkFutfFYAcnHL9tL7/Sjlbt++XxP1jhO2D7PVEFnAMnJEcnuz4hCpVd
 yF1VUIwBMsHcK3uFj7z76nDhd+gFOxgCQ7sd9J6kU9JYvADEt+YyvU6YD+tszl/qPhdj4lPg1tK
 AqvGo6s5Z0i2KU92O659SUz+Jx15bC4l38pT2IIJ3w/iJIXKZOCptV/WdUmCj051Guwqp9eTPGk
 HmpRkMZbpr6J800VHe0OrphFZxpZOMMKlO26kieRbc5t+6zTSpFa/QKFNtpoThkyWykRLpoVg+k
 6OMd+mowOYuyLFLfRShppnHWOdEEM6q6Opeq7qpKXvqEXWht67IB2Fbh8QeJfumbeg5h+laxSXF
 8x869y/LQ5iFYn1WE0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0

