Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974C27E7D8
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228024; cv=none; b=qiovExpM3xwH4juNPyc/Qo9x9qvxPwPj6036TWCdREo2qZNoyZOIQQsGds9CLmrWVyndOpDCfqQz1TPH9DHKyvFM2w4y1cN75mFB27pH8ZJtOzI7z4ZvpXjSlCCO/IAszrdX4APn3qSuqzQg6EuGHtZdFnWpbys80BUIw2y6ros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228024; c=relaxed/simple;
	bh=zWLtanhvCIpSQaF+swneQUeYFWPTh5F4obnY4lrF7m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDCdNVWi3PCWDPRPMq7ODoihrlEIX+sntZbh1smqurdrhsVY4esr6ahPkObINxBKJ1qo7FZ701eO0DRfKRclE9I9EG/cTdOrNtoP8rnyyweewPZ4hMgEep+fgjPjm6Ga6HdFLzXYZDSKyWQDfuMywWFfxiksSaGp+f+aU3+HjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axw5SR9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axw5SR9u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XLgu003320
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
	c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
	WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
	9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
	twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
	qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
	Qqv/kQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bkb2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:00:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dfe47423f7so5381485a.2
        for <imx@lists.linux.dev>; Fri, 11 Jul 2025 03:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228020; x=1752832820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=hmF5Xqxcsz31gJJrcCJnVAwBMfsGgsTvNCitlqyx3F6rf5QQlfmDKUuVb4gDTT+z3I
         97jL/yprJuibr+/+Iq8wt0qfNUwA8Dpg02F3RmHWknnJ0uoIAcIMeXngJKFt+m6wTQky
         zx8TZDKhBNQUt0Y6RAfY9DIO7B2GexZkbhQoqKFTeoWEXoBGpu6uVLtg+H0V1TtCRjyh
         aWfY7d3uONiNTGdNkvQJ/Re/ZScB7xP7d+3l6SxNgMgYGe3LcDdQX/Wdiw8ckXHpSbmS
         Abt09oH6IVSTCRLFwY5K1ZiAQ1rzRJwj1pdXJQO7OXVCYPJIEtC6Re4v4OkETty4h81Q
         pa9w==
X-Forwarded-Encrypted: i=1; AJvYcCXYxmjYwIDsyryeNI4+EhDt1e2sjOh3hkzdIhFbNE5SNbt2Gp45IfR8Vl96L5plAa2Kmpw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9PCMEx6iueAqUEeqgzIiKZy3TZKDWeBKnw7B2z3GIxfAZ96fj
	qcLPl9lDnjZWwMM7gfpsxyhtXqYg9WPKa0DUFHtIB+MhOqdk18qcy+KlfToYucYUP3djVBkJTDP
	1tzvTkxns40TWrIqjEfmjgeMZ5tK+UK4TI3k5EbCoydVLHgRnrrkA1v0=
X-Gm-Gg: ASbGncsXXqSv2GBZi1UOWQRboh/wrWpHb1K+rtRBf1Mrq3531jPLrauVxzfmRYexsZP
	Vbilky6Eb5qclKBkIvV1nbK6og+9ll6ybY9t7r0FGGPcLhxUyLsbj0HlLlXcsw8wnMuPJa7lpz8
	TmGlHrFz25hss0A0K3bOfZUa7t2hpMy/qWKyW5c4Z0pIFtppIOh5zT472zzyVpW94Je6ynh+6FS
	pMXhfYtx2VZZznJsNQnYa+gNdp7GqvcwXe7RhLE70p9WmI5PAqcbj0BlhhlalrkHov9X7kXClqw
	EbRqP79ydcbt2E7CtfUKRAoqLrIlFjPYLlNOzMPwegLBj7ot3NF3UaKvShjqc8BpC7InQrk2syq
	V3AcePSw8/syNOHDND2ML
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101577085a.6.1752228019721;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfXwz7E8KdEUgwI
 OeSNIv8dcJt42EJh5E5WwV6qenpmuhnsQJ0RogKHQL0mPoIewBsq47RuSKrEmctKAmk60E56LCc
 El3OAhWXITCeRF4deXxu7kl3H0TcjRza/9kliP8W1CpBlUWxS6vFSCIqmUyFj0FUygDfYCy5abF
 a4WICzWq8rZxZRcw7afxFye4zxyCfLjsxRrReQeiPtm6r+j5T7VDZZF5Z7Ak1R1XU+GeD1Tietv
 oF24408X0oQQ6jLJcJrZCCSKGiFgkyFs5guUJP116EeaKs0pHW0NXLkMFt7YDcPQ0vlFPFWudDb
 MeEzFfzgQI04hXal8siaAUE/bZn7W4JHCORSqllo8VEGrbGWGi7LIJq1d94sW/koXLaj1qgUGsF
 ZC24ocfw3t5N0oRau6Ia3xxnT0F9GIe3wlanlh3ypN1fxVU1CYQGra03wy8RAjVOV1dZywGK
X-Proofpoint-ORIG-GUID: TaWu6_VDvItIPkgKHaPkwnLyxcEWe0zO
X-Proofpoint-GUID: TaWu6_VDvItIPkgKHaPkwnLyxcEWe0zO
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6870e0b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=830 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110070

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
