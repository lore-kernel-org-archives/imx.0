Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E12C181
	for <imx@lists.linux.dev>; Tue, 26 May 2026 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784470; cv=none; b=WeyStJsGGiTK8bJ67WD8jFlMjA+6tRdVVBmJWTTjC/cZ/O3n6F486+XvC1NrLa0m/xHKrKNwbA5U1ize+L2S7JmJZRanzwf55BavWPQ5YswwR/OLxmq5l3qaLKfRNITbrqjbPpaablXmQ8aWpHVNzPdnzy0nSWcTakTNVXH+GAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784470; c=relaxed/simple;
	bh=m4TqrEI2ia1H4xi4/l0BCXnlwT5D7v+r5tHtMfS6n4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIsP6PgNhOsn3NxCL8Pm7gcYoP7MxkgPNWo5toQU9K0IJyUzgGR9ayZBeBBdOFnWQU1uKpSraRVe/Mcv0LFDgErpBi3/tv9zSMh5ft8mPcrmuJmxD0SUkrnr3t3y5yL/KJPDpa9aY7Oi1HOncCD2owzhSuFypxbY3LSVvH5hUo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1c9J6vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVCbnKa0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1c9J6vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVCbnKa0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60lMM1763827
	for <imx@lists.linux.dev>; Tue, 26 May 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=; b=p1c9J6vvPxzObYFA
	HzcSo4qtpIGKTdvlz72yTPVRrFKR2Xp0eUXbo3bgHCOD/l6RjaWNxC/bemr/dt2Z
	nmAA5nGuQwIlBrNhPDMni2MyXKXgCv1LHBXSfCBAJ+yw9OuzV4nyXlrzq+/3b6qY
	AGPTl0v3TBJfppcH5bali1yaeGMHDpf+nb5qPFv9Yg48luv+cYjxrMkFd/jn7/xM
	S2XqZp/vkIz25mzglzRL0V4fUYMLT5uzxhIdLdk2Tv8hyRMt7a3Z/U46Rv+bjpoU
	DLa9PrwcRniqmVpzWe7diHKSAiC6CS93lQYKP92CnZEDf1AKSLQISiTKGDLSx0ye
	DCcjrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggkq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 08:34:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso73708361cf.2
        for <imx@lists.linux.dev>; Tue, 26 May 2026 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784468; x=1780389268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=;
        b=KVCbnKa0sSpxwx2TnWjEmc9jSeW+fxZ/0fiQMsczbWwftG0qleNAlmJGYpTjeXj1c3
         mEJugFmxocvyh5LoRtBKnbdR8K9IZt5zCzrYq4lzW08iSWBRSt9gHObsbi7bNwtfqJ/P
         jmQGWDcbUhdNTrs1hmmAVjmcAsC3fNL3NcxfmgaE/1NKh40Mv8RBEIjL1VBE3xdtjrHm
         wfHrJPZTgBTPNhvjnmVXweOo/YBm6WTOBREyf2bmexSdyrieigYmrUTxw0nwzoKOVpoG
         LQytQS96tjgspv5y6N0+MQHUqzk72b6UeZb/u9/LNanVqURU9jemFrSLyFKaJJypGfg+
         1kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784468; x=1780389268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=;
        b=SLv2oP4UJqDFlLswrvbU60LPgFeQFS2DCAvHUBDZFELuHjdrMzSsE4PlEaQHKD21/8
         VVfk+HlLlpsaya3DRoyY8Vbj9OEfnUCHNUgn2dJD0aGVZLtTmSKLPHOqWizrQPfNO2vU
         vAp+jZPznC+SStcNtbN87qdjnqYdWqyRaESGz9aGzwsu0FUzsTB20TCMhIKNo0zdFbv5
         TNTELFKiUjQEkVNG0jbhN9wwffZkzwPUyuNQa1WltneRcgwkbOriXQkEtTUBaU9A0E65
         iwgytV9cBbjTcYBVMA+spvnGeRtJKwYi+543TYnb4P9eWxX6lPTvpC9GfaeaLEarCI4v
         0W3A==
X-Forwarded-Encrypted: i=1; AFNElJ9d/Glr7CCBaQiCmdLktovSxrRFHtnjtjEjLt1fTB7MF7fLKfHV7a2Lnnp7MmN1a6Kss8M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEZtSHgbhp96cyLOB31YMpVUvcqQsC9bmzf6Ohc1Ff2kcQGty/
	HMCCE71d8Y8Dne4fUSZol8Mq7/QD8pKJWqN29vsV9DksF6efdLWe5UP+d+GeTw302QOUqeXLYrQ
	idvoLMxFXwD7hrCgt2c4HNSXlpQAR38ohH+S6ECfeU0LJ+QsZjg5RDXM=
X-Gm-Gg: Acq92OGQpaW1zCmSeW/hq/LPpnOOn7f721f9dS4Q3oiYI3HB+0V5mT73ZzskotNMhjw
	402BjB1jiY86PL67dID2we0/5rgmVbw/MxnnKrVry90/AOipPNHnT5lJwRR9XNeGnSyvY7NlYch
	n+gwqX2JEfPrxBAer0auJeN1QEuytdtK9vTRDZ/xeFVWvDaBecA71Mi7NNA4Iys0IhWv/zrA5r2
	YKEcE8b3wG8vDIL4l1y2vA1CAHxcL73P5DqCREgLSbdcRxlPasgzZ6KIaclysZv5OJvHrLHBl0a
	Pm8gOdMRkQKGxTLmDwLXUOMqID1IPz0WS+xz6ZTVKF4Lk0dP0PlB9CAUxa754wHXFqCiHkiwL6P
	1TSlmvICxfOE4yzjdaYct2Q1aBD+7+5hWiRSeT5GqYHfLmiqlxEwP59LVh2/k
X-Received: by 2002:ac8:7c4c:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-516d467ee64mr235196851cf.44.1779784467947;
        Tue, 26 May 2026 01:34:27 -0700 (PDT)
X-Received: by 2002:ac8:7c4c:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-516d467ee64mr235196641cf.44.1779784467486;
        Tue, 26 May 2026 01:34:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: mxc: fix irq_high handling
Date: Tue, 26 May 2026 10:34:18 +0200
Message-ID: <177978444191.19212.9827196149190633847.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
References: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a155b14 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LetV_JAka1SG655h8UQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UppwF_F1VkQEGQCqBJzp_BL_MDlaUQfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfXy/Y7WjxUX9dK
 xL3h3xmTOEic3pGO/0xdPGk9i2FDRBLY4mkHpXG3tTfX/ZN/YL7wsGlvAvZNNA1U03s7jwGKxcc
 rfLNkh9iz7oRn6YwtQgy7af4yiJ8vgmsQzLRmBek16QAfryM9Fr/oMcMTVCpIpAJzyjl6vOLYrM
 ePIYMiL3RoH1+rLiL5S60ROoJj0D/OM3SnKglNLVrKHj7Xyz0IFXyKb33N74j8U5A1Fc0q9Fibp
 yHQ+7f5nbpPHVNOYz55neeDl2EtwpFmGbgduvifDYdKnZRpT/pHYu3ahQDeY02DHUiN2+zDujvS
 P9Rh6qb3NwOPMzfSmUwIuZkSWtd8AVG48fBDb39F9fiIpyRRejVCn43v4Cf+o16DqZTEWUAJEzP
 b4mODnwUB2ypNnDTMpzMW261RZZOOaoU1uUPVx0vVRbAr/VFeGPO8/k5/wLmxU+Prs3H/IoAf9p
 xigAujbROY87QZw1ttA==
X-Proofpoint-GUID: UppwF_F1VkQEGQCqBJzp_BL_MDlaUQfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073


On Tue, 26 May 2026 08:35:01 +0200, Alexander Stein wrote:
> If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
> enable_irq_wake() is called with -1 which is wrong.
> 
> 

Applied, thanks!

[1/2] gpio: mxc: fix irq_high handling
      https://git.kernel.org/brgl/c/dac917ed5aead741004db8d0d5151dd577802df8
[2/2] gpio: mxc: use BIT() macro
      https://git.kernel.org/brgl/c/077c421b38ab87f32f7ef4503a6add43ae4cb57a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
