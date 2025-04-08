Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6433AC1C
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113575; cv=none; b=YFtw1I9cyiUtfRCnZQFJ7hnNQGd0nWXI1E/N28r910aksOlCkW6/Gb4PGq9N+bFHMr4DnWAkU9uPy4D9wBG8zO1MRE5f3FuXzO/G+At+ry5lCnbafpyP/fjBDAaiwBO7B7R/d9v84HkkWq4paGHjNjU1Xs9rqcVsCT5OBhbLB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113575; c=relaxed/simple;
	bh=6Q4B7GpyPTFBkWAifzFqT2Yt0K6BppXaJfVIu5w/IjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4Klf60MQClkVKrH/ZnYDZWhUWLCsIYbStM8j9nyy2zeY45JbfQuGIZNbJGyoa/OYCNOFe+/rw8N2mPiIeI5WqQrtCaslIcJfh0jXDP/L0wY9k1wWoKr2MQ80k5GxaXq3us4ddI5NDJ6hpCZUWXFY23rUTufOjEse9wscvU2sew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xklge4he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xklge4he"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Awsb6029499
	for <imx@lists.linux.dev>; Tue, 8 Apr 2025 11:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NEuaNgipirFcEWokWSaWAS/H
	yieGaYJXo6f7MVJMQQ8=; b=Xklge4heqEb6htj8B5O7IHd428xO57ftGWanUiIw
	mR4/sOdbi8VjXnwUa/ND193G+DoZbkPHxW2lv0gGqWArKaC4QvbiMDqbKNYNn0RF
	QVwRWcIUMVSe9xonU831+uYGwXOTZ17u7ZTIoMDhD7tO1bEtxkzMZZ39nOSo7AwW
	w3Wg1ispeItWnd1UvoIbgN1aDTOo/NYdJhqKlDXO0EFK5isRGO7hg2LaSSEawevu
	ftk6T7ByD0kTjgLBRvUix5cFS0MPr2WbshmO3ILW20l4gSXfoXM3mfraDwCcXWXJ
	fQytu+NoPZiBJqSR3yhMlc9oLW4/uxFhMHFSFd23bIDFqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrfnvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 08 Apr 2025 11:59:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so1731587785a.1
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 04:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113571; x=1744718371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEuaNgipirFcEWokWSaWAS/HyieGaYJXo6f7MVJMQQ8=;
        b=nkT9CqbhAH9ndxhneGRP/brUbuQKCD2D/tXS3s2fNVEeMSGGjynv/P8BUv9utUylTc
         2N4w5H9BVH1uafhVKCP2YEP/EcxgEirt3ZF8dZGoF47FIAHxrWhm7Ty3kzHRvs64CenO
         OeUaewMeNIge68p+GiG5rV427st02JCgV+2V6p2yWAgNWL5QWuKoFI0Qs5pcue72x8Sp
         Izdw5EKocqzY3LfQ4phnUyYNIMxMTgYIZUi47vIBpeYuz4gexfKHNGGhgwZFISKPjpBm
         YpDnbWmjYM4MUnZ3UVjrsm4O64wzEYMxP/ANJEcVLv+y5/ooUEaM1ivFqWK+ETl00RnX
         ChgA==
X-Forwarded-Encrypted: i=1; AJvYcCV/SzsTW9Ct/pGXhlvKyOf1DMge/m2mTU1a0oLm70AlwyRErepCIoG1Mha8EwTJ186l+NY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAv7uHPtquoqkug8XzsvXUp5AB0dHtIpKSZkKn4N3WVAXGCO3m
	t18pb8vK5gaI/xuZb1+zdwvkIkCPRYq8PrIfepzXjVVzEvZXgKpQRt1PFszbmLd9er79fTZYvKv
	6DyuezECxqIrt1QQp/p7nPaYLLsaj/8nh2swqcks/Jn0XzRyWj6c=
X-Gm-Gg: ASbGncsivtJpDzr4PciJPY7sEdqnAnB93i3YGuAGuiEC+8/wF2VYRABHjiXeZRMmbqr
	D3JzF8UJyhslyr9ccAGlClElS4aveSaw5jQ9/VKLo/V8VyIdkXzsJ2OarG/IW5zIfXyTq9eOcP+
	MSRO9vlEM3yGDlD8MnawjOintMyH+cxp8qXcDCX/FCVoyI+HVjMZ5E5J+kb39hdXe4bXFDXplxX
	1SGLdP223mCJrcRGWmO+n6HgeIRLhcgJreZ6tI6+h4QBxs4MLM34JZ3j1xv6fQDHENZzYqMAZr9
	iVIv1ViHw8qZg9bDhlXSIi8Nhjatv62xe6dHSj4ScFtN+O8dH9eqtFv745sVHoz6MF+FdvPdwoS
	nXUk=
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c774dd611emr2077710785a.38.1744113570961;
        Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0pdqrUOojsKZC0LUZebfwayX/lBneIGD6ckCJRsQXTk8bZ4JOWxGmFcuR+OIU3QqcGFMkQ==
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c774dd611emr2077706885a.38.1744113570585;
        Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab4e1sm1507877e87.23.2025.04.08.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
Message-ID: <megx72fwv3xljmimtftryg6ueusjd2f3wv37u2lstdrjt2vlyf@3w32pt3ozivr>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: NCAMs1ozQoaU4l57T3kw6GGKE5Lr5qAY
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f50fa3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: NCAMs1ozQoaU4l57T3kw6GGKE5Lr5qAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=952 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:32PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
