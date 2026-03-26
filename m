Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6455734C128
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514524; cv=none; b=fxXwLIvxdIYcD7rCoUUY8gyjXR/IW6R0qCUo/booKbnTmiDcCKNzMGBkUEQFquR4aaa8hkF2EBR/diBv/LSD5qB2WCnOtMQdqhE02+AYDQ8uVo8hxN/jz2d5R8dXr7BNr6gYqJfdNr0tpAXbzfODKg5DSNSTWE+lklleDJwC6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514524; c=relaxed/simple;
	bh=ecBR40z1aoCIIzU/2X4t8qNUh8d9lJnEAJt9Cnz2Xmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzlmY2u0Y8sose7Gnc7/RMhm1YEA183saPbMpGNCF4lqcownfXxxAoW1wj4Xvur1MA3ogSnbvHo0qERCS2BHKimQgW9B9k022c71WPStj5F52+rlltOwx7ve7oUYbSDM4mQsompPkCuXDjGsott2cNctltgKZeZp2CohnSOFg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0oQCCC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wa3eYYNO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0oQCCC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wa3eYYNO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5h4ZH1175631
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=; b=D0oQCCC5qOunMwot
	bzaBpAr1XNfPzBxU+TvkusaL2beTw07OGIwGhQCyMTMZNOZ6EDKXZ5EkluB4DKiQ
	xiN9EMfW8LScTgUsEJFUmEgtnIra4oG/phons6curyp9I32MY2x2lAa9dBWKZ1/I
	GEfHoHt2eivXUGrDr8/YiMeC4DE3fiVjLFdrs9HkaINQrU3/aLZNhzObAsOgDxMS
	7LhM/o1idsSW56FcGOJjPuwUhHLqRCteccatVMNXtT89HzWWnh6zerCdKa5U9gYn
	4I235rGk7ludDEQZn17RahvQEij2cVSyA4XpuIKmKLGRd2aFD0sWLMlkrwGmCyv4
	BY2w7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76syh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 08:42:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so39807911cf.3
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514522; x=1775119322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=;
        b=Wa3eYYNOe4T+8LkkyTwXjOkG0uAMVY6/T7/6qmN1cKV+nejlANyEpK5gZz81rwpavo
         StjoTuw5HM+0SlcXG/wdW+nqAo23KlyqlrD+6f58Y0+08zm2k3QKKy/8P0vTD0UcoHFX
         LV41UYOoUcSQg7qagf4srbK1SulDLfJtx5uGiewlIYHotLwc9n2fShNii8Eh1AYcNkBi
         MJYE5Pn6kifVcLH8i1f123kF6573BwqoKdcayoCM37lMr26crOxBB0jfbWr2jKAvDkvz
         yLiCUfjDMAqO6rRduNVbeKd16cZs7jUfazyffBQSBsfCiy3jfTApO9sJ7EwcP81gmSUh
         83bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514522; x=1775119322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ux0ZdmbwgiEHE0xsx6C23MKBXGqsEpTSkBrlwD/qJVg=;
        b=GwAfYkKyKQz2boM7fAOBfOlJcIivO7Gc5uH9dQIJE/1iVnPkUYlrl0Quslj5lktQ4I
         nrNyXZ1y/f6uClcBNdW0kJPs7Sk+gCzUiz14GsW86qZ1GyfHwPzw6xMSj22WJgMOzdrd
         aYSfYgPwVmc2vFR+9o62XjImTjaFF1tBodXUMbIOy5NuuBz3mTvAtj6dVXFDvcAYSYUp
         z1S6PNSF3P3HPEsVDgZNY2pr9vPJSAOFi6ccwprEeScOgreT1J8JDefPZZgoTFOxl15d
         KirU+pGruKRI5px8nqr67SLRcjHFj445riH7FhE7xvVySfu07jUd50i6Uq+swJ4CO9RF
         0m+g==
X-Forwarded-Encrypted: i=1; AJvYcCUmQl08BrOf3S5jXGPNdIU9OJ90xlvr/rhjD/B2/Q8lhiGp93Lk0cfZIFdJPrxiKuR0FrI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQidDSiKBBiwwBze2swP2aBjLY550H/xzuDh8uMpkpnrhfTEQQ
	g7vTC9KC07++UYFpNbbQ/7eJ2ShLndmASUWWvJjjzi36nDX/kSHmuSVlgZA5GzCbGaFoaMVIY7Q
	XiyDeQCu4HWX7XtcNuuVs70kbw1JXHX3m2FmAp/LC8mr5xC9ZwmlZQFM=
X-Gm-Gg: ATEYQzw8lRz9ykT5SOaPdvSnstUvvsvLgNk6h58EH9wRsHnf4X4FZK2agwELVm4bIMg
	12JKnLKX4gIviQknIz+q0N/XrYJEFUYhje4VtLWstl5FhYiduAe2lCoMDfpYiZM5riMMTsApwpy
	l6lXFOkecuuVxkTT9KTnmb7SabjYT7pP2K8EgsyqDTFgTCPwhR1aJvk6WSF5oVgzPmdgFvmSc84
	w9EhCFzAV6uNsQfMBKJosg5qxcBeIdZHlQBECIulpGdEClSXJKgHj+V9V04PeCgTYb9/HzwV2ZZ
	YtrMn6zLBXJ/EEn3drKt4Bb2MGOEyeb9UBGUHTV4yfZjubTdjPdqrm6lR75NjDP3RN0Ca2UdVrd
	BPFBRaMlBnPKKFDdykRfM8UXr0NvG3p981UriOcYHUJ9Ts5JxF0I=
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr93965381cf.1.1774514521991;
        Thu, 26 Mar 2026 01:42:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1981:b0:509:4198:546a with SMTP id d75a77b69052e-50b80c9bdd2mr93965131cf.1.1774514521573;
        Thu, 26 Mar 2026 01:42:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487208b206dsm26138865e9.1.2026.03.26.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:42:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Thu, 26 Mar 2026 09:41:59 +0100
Message-ID: <177451451521.5307.13788251151955242661.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324192129.2797237-1-shenwei.wang@nxp.com>
References: <20260324192129.2797237-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c4f15a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lldR5Mej2F9az_PsPLoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iZwCmy_H7IfSoQkVbKigXr6stOSFeDLI
X-Proofpoint-GUID: iZwCmy_H7IfSoQkVbKigXr6stOSFeDLI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfXxOK4hzIF54WF
 u4fENWMyYhSPl5pbFIszbmWHy+HMtAtYqzgmh0mIZ6D8RAguOSVK4OX1I9idQSrSh1g9Y3jv5YZ
 QeZnP4VQlLUYtbjYIVA0/OeCfwOjnTuoLGKtu04ZyDTeGFP9oAJi8w/4w2zQ7UZ81efPoDk4yP6
 Y4hFsWOWYp71rsZkIPFna1WHBsGGg7polrXCL5XbrmtcfIbFwuAl6qy2pJGVIE/1tUlAREKeU/0
 gti+bCxzJVXDXc3PrGl3C9WrNbkgUcOQyFBhf55cGGWeS06XYQl25lxTfUpSZxJ/b8G1DvOuH0p
 Gih90pLA6ACsitmyFrgwrRTLMG+mtMOCtzMv7O6o+tuzQqdTKn0xhpg78Igg5GIa8mNKuImZqHD
 W6GD9MRtwIsXOZ8tK3C7UZPaCSApsYQS9RgN+7EbrV+vpb30gLRxXLEcto7iJcqY6XCvAwz9D7b
 alXoyf3EcE09kGYQujQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062


On Tue, 24 Mar 2026 14:21:29 -0500, Shenwei Wang wrote:
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
> trigger due to a hardware bug in the detection logic. Since the hardware
> does not support Both Edge wakeup, remap requests for Both Edge to Rising
> Edge by default to avoid hitting this issue.
> 
> A warning is emitted when Falling Edge is selected on i.MX8QM.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
      https://git.kernel.org/brgl/c/c720fb57d56274213d027b3c5ab99080cf62a306

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
