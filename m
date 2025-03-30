Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04F14B08A
	for <imx@lists.linux.dev>; Sun, 30 Mar 2025 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357154; cv=none; b=dKnfs75jyvUA7Mmnt5AKUlxFeqtAqJnGdiuubrmadR3uHdPvrikHFpeE+1SwfaiBhQLzgEBCVWLEfHw2LPp6modBwaWH61FAFYWccv1szvGjsd05wjuKdGNibOKheHm1sJfWM3G3pqPWAwgQZQXTk4bJtGP1exV7z8gwbe8MeSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357154; c=relaxed/simple;
	bh=EA4KcZPr3mnA2HfaRwScb1sqX5QQbQGr36NvLllEblY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/HSEKTyPV9HADBgq8t7AYBcjGw/EDV6c513kDsM2GvqpGJ7JW7g52dvOXsWKpU9LbgfZVEYczoQFfvZlVYnfjB5row/s9qYcHQdGvU/6rh96qBldpzO2anq0SQsRr3V+49Q4vaLbVqDi7/Eyfh6VUO1xkQpK/IgqmLY28QRgp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFUec8+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFUec8+Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UBo2PH020407
	for <imx@lists.linux.dev>; Sun, 30 Mar 2025 17:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfNrr9IWXB5j/RFLxcg5ak0n
	+LLaTpY+LShrMT5MZf0=; b=aFUec8+YWE1jnyv0nk/UwcyIDxhVVm/YbGUA+jt1
	kB1+g/9hulsP7Th5jWEjH4OsgzywWxhXU2h9XSZCxl0pdUCwiey4JcpYzLXajBlf
	JqcWj9i+knFv6i+zvuoUJApQ8X04Gd5XxAYMlyESWeLU1v1lH0xYDOHneldKer7h
	lCjIm5oza06P6dRV1pUFXEWCtzhnBaZhyyS/azLyZahyIBZULLBcju3jKyJTxOSz
	Mrm5om78MEYR5cIp+DBoZKMuwp8EIZQE+o4RGVjzXoM56bFC9/PuQGSJIUiL6NjA
	C++vGODQhgxbE0WaScqwObvkDfm39Uo2V4r6HjYc64HDuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ntgm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 30 Mar 2025 17:52:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c09f73873fso577677685a.1
        for <imx@lists.linux.dev>; Sun, 30 Mar 2025 10:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357151; x=1743961951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfNrr9IWXB5j/RFLxcg5ak0n+LLaTpY+LShrMT5MZf0=;
        b=BPmBkazOuGe8lBRhpMHBKeXor3JojiMGfC3CS4+j7hIdnrWS36Kw9JLnvyTvvAWwQF
         /olzSZNGtiqw3CcfpvoKekbEnO4DtHuy6GojtxUU4wP+Kp0N11lwH77fK+Vc+h0C5Jac
         6k0MXLUEHHcrwECrsW4f3ztk7foiusacSOcK8fxBd1tGq2urUY3mcU8i8zHfB1qwR71g
         NI8cqKMs614ZImJOYjBQZMKhD4aVknyajcMbfYLcrx9Wqeyzrl6iOx0yOBfPZrIFwD1g
         /ES/8T8ARN8jqeXAhb/WOmbB+HiqG8FyJWGYCt0Ixp6TFOVa4YBv/F6bUjoKDwSUklg6
         JCow==
X-Forwarded-Encrypted: i=1; AJvYcCUxPLZSnf1urWa8hwmXPlfx1b90NkmN9nMf8mgBSrbpysTXeFQm+chBGEgXmNxOw5BSgM0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy//bgKyKZJnt0zsXR2jGRAffqcli5GWY2cVjLuPd3Ci1e0CDoU
	VCZ6BfemA6UFR+/Pl6aF/V16Au2plwP12Pyitib2IiAVo0Vr+db5LGK2HiowxyBvf2lcOpzEDAF
	I8ijhgxTY584wRUK02sqy9EZVVGE9wvtxLqlDDYgaXcR/Ajuygr8=
X-Gm-Gg: ASbGncv3nNyMuvXVpBe26hLBCPt3nknGu6mt+sDj5vsrhYoOf2IGZl6a0rQ6NgjLTCz
	4cWI6R6YFZo/pOb8BwHWuEZvb0HJCfNN2bPIxBtHf/+AYE0RBnm0W/OePyJTP6tOpTqtZNnDJ2U
	UdolZqbILPm3eyZe2YxWN5nEEBOxRtOaR7ueRfagy8maRfXm3eGxLcJbaSSBJsSbCtiVTjEGeNz
	HWDybwDHf8yxszTWN7NOWm0ms1rAXyWCjRId/05Lq1tgHw+A2lKprSfzVnEFBETc4b1niXARu11
	Ehui9XFKbTeCjc2MNrPbcHl8ACJwqUAYiYttmcBiCix6xsXqqcrxoWU6sWT0+y//572xYZqdxa6
	euNA=
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id af79cd13be357-7c6862ebacamr786301785a.7.1743357151451;
        Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy5zLBvgqZ9PHFag3iQjcsiuGTjpjVXIsJR4FiwTqbGCjzxceuXoViknNhd3e/sRnunh8apA==
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id af79cd13be357-7c6862ebacamr786299585a.7.1743357151150;
        Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4cd28sm11640941fa.70.2025.03.30.10.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:52:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:52:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting
 warning
Message-ID: <444lkvxa7iuymc6wx2gmcsjm5zv5wa4nq7dyhf4nkxmtfaxrhv@tm4hpcsoxo73>
References: <20250325075503.3852-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325075503.3852-1-hanchunchao@inspur.com>
X-Proofpoint-ORIG-GUID: 2hziVAhU7tDw0nDuqdtwCHuAkxpvY7RO
X-Proofpoint-GUID: 2hziVAhU7tDw0nDuqdtwCHuAkxpvY7RO
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e984e0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=F_93P0QhAAAA:8 a=EUspDBNiAAAA:8 a=hZwuMZaz95D9sbrnA4gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=722 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300125

On Tue, Mar 25, 2025 at 03:55:03PM +0800, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
