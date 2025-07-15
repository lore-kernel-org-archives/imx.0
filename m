Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4D11EFF96
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592067; cv=none; b=mnKDjcQQbGPtZNLkAuQMj8IS3MNvvfeC50OXB99Jlsm2xRpHUZb2g1DF7AhOvIKobxKW/75s6eo7sz77kbWhWg5sj1UZhyBW/XE2yqQRB/uOShiWLE+pZ5EqGTTV2F0BOCIwrR4PoDnQ+Jm1en+48Ne+rbLxCAf485M6I955m3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592067; c=relaxed/simple;
	bh=nw3fUOy4Dyo7OtTrgCRJLRfNiAZiw2FkoPy8uKRJufI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvYJGruBans2zS/wLgsUn78pcLp4iQtLE4qadU1TkbcsCd3CyMqiR+At25UoQGy06TBDIC0Xrhf4Z0MlYm5QctZM1QasX0MZvbhCrHvkGUDFPbJWXdKHjPcUzUXuYDOL+9vN657d0iUMAjYq7e8SsJ5sC3RjL3RPn9HD/kszZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kms4CHhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kms4CHhK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEHcnn005981
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UFE3yd+yxu1P9RbRQyZIroNt
	ei5T0YAfVddPN3zIsz4=; b=kms4CHhKguztPZrh6aMbRBtnl6d9uGu4uOFm50lw
	iMEm3Hk1vAypjt53Ce3yleNqozyM/XTTCxr+e4G/uDCfYHbXQAg9h5hQNPK9y3I2
	udYhwnexMqZsF9/inyxAfUZ76hBWYT3td4TY3OazGAs+vHQuinCcwiorjzrk+l0g
	1Za2lALAmOj85o6c8rScrhk/vR+IhdCd7eBxxr3eg9cgxubjapge0iJaHFWolH36
	PYJa/KbYNYKjmbLO0zdUTqedsIENjxR/LKLsuUc3U4b4zj/FX1nbUJwrZnhLZ3fE
	bV+7Tw6R8Bs9zY0xs7ikJuxKj8mBvjo/d/+R4DU3M38Xdg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb0rdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:07:44 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e933923303so5121364fac.1
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 08:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592063; x=1753196863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=;
        b=xLFwhAl4x9nr0qqteqQFd0V45JHoNQeQyZSmztPl7d5oTpq+Fn2Lnt12ALWKd6WeXO
         jrve9HUKx6LN5jpm/bvsZ64qHWkaOovrkw2NKFL7ixXldf3zd5wc5qn7p/oruu1O0hTP
         BhExYxpYo1hC0K5zDbf9fHVERe7CF3IRez/dFuApPscr211cqTx/CPwqRo0zw9riecZp
         g5KzRJrT4EdAWeLOknMh+duDLUryE7nkuMxhTJsZ/jJAsO0s1R/fDgTdI/JnTd5sYxaw
         itDJMT7O+I82GR/f9gvj800XA4/FmFn8U7fAT5M+S6/C2x/Rq2nn6Lc7QvDIFG2XbItz
         H9ow==
X-Forwarded-Encrypted: i=1; AJvYcCUzyWbXBuG7jhImkaR+NFnNvhE60iGUNkK1xNDbFz5ajUvSQzVtMaZsOpCV2wko/ygp4FY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWz7+Eo2mrSfa8Om9nJoPcdz74w3gkB74Mfdpi+5VrZpgbqW2L
	D0DmVN70dLTunszV9AruMFibkgSLq8xTdQVWUxUrIJO1xerV5yU9dgCmOBDf9hq7Y3Id47V2AIz
	XXcrNIR1X5mX62CfD3Ly11yvFG8mnSs/rpkX39jz7M4JJImDWMZCsz4M=
X-Gm-Gg: ASbGncspRZBMMb5lQIREU1S31MKp7eoFL1GYaxiTqH/iSCKhnFEyE/gU0pdfyKYC3Ni
	sWDsI3nX9DIyP7+igCJQoogK/mPIDthcowmmjfGCnZjik/3o0it4m5oeJ2VNQl8LLPdD0QPdPwf
	rXaOJa8KG6WQLMlIi9C1Jlrrb4eh/rH/0TFYxCl0MOPAgwujuux7Vs0/J0C1EVaCm0XBo7+y6Wl
	PoYcIdJRsF0xZAxzpWe5oDIx74pH+v9UQ3XeJHX4L0HBP9Im1Z1gnip0uwRQxyZMgkGRsPnNkPu
	j7xNmdGZlJITIOwWwaFCpjAiPaQ7uK36zulYpzO9H5GVRqigtayGluDC0+mE8ruvaa18nr+aS+z
	UZKTZgENKfyQROxAURGovt9gYVurgvTVi9Z56m1M35JKtR/mTbG26
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id 586e51a60fabf-2ff8f899b18mr3018606fac.11.1752592063014;
        Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzt/a91mT3BodYIFDMVy8jVt1HoRKIa+1bUOyQbH9aZS0Ib97nHGb4Ty6uV5H10BORptHD0g==
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id 586e51a60fabf-2ff8f899b18mr3018555fac.11.1752592062451;
        Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d092csm2317122e87.114.2025.07.15.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:07:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:07:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Message-ID: <qk4v2znryznnvg2vcye2m7taurfhoozjjdtye3fmk4fgawm5jq@2qlqgg4htfnl>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Proofpoint-GUID: XTu8XdMeQV3Bj4XkaC27nl3kDb5OhzMy
X-Proofpoint-ORIG-GUID: XTu8XdMeQV3Bj4XkaC27nl3kDb5OhzMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXwuzSFc8tTQEV
 c0NkH+a1rXTnn8Hlmu2pgUIOUqKwgdvHFcJIrajJ80xrdgiyUx5Qu6iTF60m6o6H1b24UIeaOP6
 XF84FqTli2aiXxLsUYk/PPVrsKv4XJvmuhiuRiBD9z5Drk95LhiTpf41I6Q01HgR6N0yiOvnJX1
 Jtg4I4DsfzizK99kC6mgc4wBFPhz834IYtxRJbgaTwT01Dc7dng58clu5tisKvmFrPQxPLFlAyZ
 43Z10SxfEfvF9uBTOihR4T5dDZytUsnfH7gvseqA9mw0kdD4FTNffV7hUCNqCnlLXU3aLnod51K
 qDEwoYp94FhC0tBTbNPyrCspBmc7laR2VoD7Q6tlr0i/9S4X0P4qEKaeRFjEzZFex8WV1OzsjhU
 YWIBCzZC6G/MUkFF0GB8TFzOGIvbP+G0mV+53RtLqY0V3d+pRZY3qAPcr4ehoxDgP4Kv6Xox
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68766ec0 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=873
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139

On Thu, Jul 10, 2025 at 01:43:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
