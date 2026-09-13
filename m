Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F8D3A1CF8
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339885; cv=none; b=eapYWfOxnD6tQ6xdHWDAHyx542IHd7Bls1K3dnqjmxdWh6s+doC6V6Jj8iRO1bJb72PvmIS9911fu2lsSgPMNAjIn+zrEYL2UG2cvRQtNGhEPAYCFCwVCmACLDGssWFk51tdPf6UxD+3VOOK4wo5jrVaQn6BCrZpu9ciAuCKY4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339885; c=relaxed/simple;
	bh=xPoaboMMdHnZFam4HfRn3NpLX7dSPbRXi6l5ULEulr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz2GfInI9dHNjyo3Wcg4yYTioYs6K7FRsuTi9h7ADxLpHdJ4lG0uUbQUbWl4Udge7WsfekgMCrJbjrqWP5Ipyo7OkNeyb5jAeEHu6vNR09Rhd3LxT4+77ST4yL5TrzQn8EzG401rPS44x5YJ/LK1dKyiaQ4Zbw7LMamN69BVEos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSN3ULp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cklgm9jc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSN3ULp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cklgm9jc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DLFKMs3673277
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 22:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btDF+i2KLcySKsRDG04ke9EX
	GqLGBKkYRlkEl3KSsbc=; b=cSN3ULp/jmbD+RpqhvAi7G4b8xI5NHqzdYnUZhQk
	pqRdi8OFg4yp6abdziJVVvNQxLPekTUoi2qzD+Hf6CUBJY52mICx0i+Ild//Ou35
	cv3WwDThVV+NN299SEV0hpMYpHSNwQ+6XYCpWNzK4diPVU90zzLYiejU8LUXjatK
	ocOuYsNom8HvdaXAbadzhrtybdJLnz2OcOF3OP2UVbplsG85bTwkdndc1wOrUOsi
	22pcbkOiL3fe+wZJUqic9K/G/UBZx7yiNiVjQhvqDoPqLjxph6Z24wMWk4g2d559
	0vUESeSvhT7fybc3nCMhBJN4uPKQrfSJ3Ye7FY765JOdIg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k084rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 22:51:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79014f0b44cso2527501137.3
        for <imx@lists.linux.dev>; Sun, 13 Sep 2026 15:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339882; x=1789944682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=Cklgm9jcUG5LOC16VbPETf+Ws6OjN1/4s3s9vCUUV4DBjJu7Rl5U3EGV5Kyga+/09/
         /fy22XPE3vt3OE69QWuC27a3nwclh3Evz8T3dmNkwIKA6DcDjvjNIJ6wjGaSNcoBpr8j
         GzBaYgBKuZu0VyjCcSPmg8uy2jLIpCD/5y/M5nvZmlQ5wVCqm2XOZY/fhFWObNHcX6x7
         1EypLrPtSRkydgxkEZhnnIqhU0UeNMh4FhInN08JnA3lNcULAk6rgS5iODNwqxfioq36
         BOh+h0TwFvubXw19SuJH7V7ABHlyMKT5X/SGy/UT84Yu0nrWt+25H57Bhj1lFVRzg2Wr
         clIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339882; x=1789944682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=RUk428rqao/xVlVniLyUMkPXH7cXjEi/7iJhlLb9BeJ/JX9f1fxfVeDfWaY5uwthUX
         ZzznzX1TEqyXoux+49cG33itzF+scVP+vqxElq1XQb3tUwQ4JyzGrdvPA+QSiTc7pFWZ
         pMjxJqMv0lt+qw9dGSbiGb7iV9+4xC5Fe2lBQGHqVQLQ9XjgZ8B/q8ku8aCBEHKu/3IQ
         ATeHa5kFGHoEjkIxmfc8YScODkcveRK81iL9sb3bZj0l3Ba1Me1VRDcKi7zUs55fUUl8
         EEhpLMVR7F92n4kBZgH1Q0dci1hWMGbKfAYtxozM38F58CodYlwKkaNQw6K9BkGflqZz
         2+ww==
X-Forwarded-Encrypted: i=1; AKwUvBxpEh0XXQvk+MAhGJBnq3XAue9EeGMLoi3eSu4ZEpF4ULdWw4PafCIcxfYcQxKGK03gRw8=@lists.linux.dev
X-Gm-Message-State: AFuF++nY8nBejlOqbEqLysDRFnfb2eY4217ImWMeIpQNtqEo6fB7r+/o
	0MDitwLnhimZCTW1WcfYeSipNiV0l9ffqKociz8/L706EIoI9GwGlDorBuGe7ZeP2JDc1KhAQOZ
	HDO10ekNyxiNGS5umsPeJx94ZUZmbqPi69oFwbaoA2CZSGV3qaEEuqE0=
X-Gm-Gg: AYBFou3UzBXsLUnefmPyVfNZweO6ecSGWGGIMn7G7+Hi2zEvpCTBhcjryOFp7iDYtRA
	3JdTc2Q/T5MW0BMxYYLeHsOx9qcsBVRxxB3xQbhR7WXyyZRE91zjiKSwBIVIQ0nPZKUIDsjp33c
	RgEFV/21S6GeXOZ86SmSzrLHJJbhWEouODpClgQPYZ0eBCzPVN3XFL4DtAH3gbd9GHlGaUdixrG
	VJyPqhOTD9C+nW1x80hL/2fqflLLeYjZONGVp/1lfuUJrAL7Sou/4XQjEMVkyfIRahTkOc7a1rK
	oP1QGd3uqLZ/onpe99jfIikFsGqHSruNvapGo2lrQ37AdS1vYqss+8Iy+wCjoRYS/gIJ8EKlnYr
	1zwieqhBYT9T+LS5oVbR2Lo1eiWEknp5LL0OM571h1QmgKxWH5dqDokdV/PS0dMN2SRCDHyMnc/
	sQszj3qao3lrch
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888884137.2.1789339882125;
        Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888827137.2.1789339881698;
        Sun, 13 Sep 2026 15:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm2086254e87.80.2026.09.13.15.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:51:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation
 in the example
Message-ID: <acryik4zjxxt76ldqk46a3wymgettocilimua4tlm7wl3tvfo7@yrh36odg6fju>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfXxvJ4p8Rltczm
 R/MP2WnQ9nfGX8yGlngkRIGoXk/uL3MNtw29zImKFFULm+dIZfz6YZUky06VCU93klZyN+IvEsa
 SDFYj1vPkLudNF7CdewLLYV/EAJ11pE=
X-Proofpoint-GUID: NcRDerkgotV65gEhyhiUKMHivmqtNNGp
X-Proofpoint-ORIG-GUID: NcRDerkgotV65gEhyhiUKMHivmqtNNGp
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa728eb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX8r8t+RiKCK4B
 p6kfmndhZw0nNYg8k7MYwtnhCNBuDEKC6R3JN0IGGty6YTqh/dmyGVfTptErXflHzgKAcMBAvYG
 ZKbYbYsbqsAb7E9qs9T4ieLsLeUfIv48aDmWbzNsCPYc38jIM0uhu5ra2iUv4MFgVg3EovYYhoQ
 zEGyJ/BnXej4fNi0M8z8HzJDjuig95dz3WBRdkIHFlqWOcCKm27u4TSj8dr5v30OFxdNQ2GlbF3
 49nxOUJX7NS5iP/SjjkowRju8cux3Yuyh61tAY1uEYVV9FdreqpdO7e/twpGk8hdkspv7ppsgEY
 8Gs876zzcJqdfQ+O0VUsdlkF1ySkygZdowDBDhXl0vnAgh8vK8o2TN+VAwdG22HA2Vj3Q2uCZui
 TVhdPIibS9VsPWZ3mE9ycnWT+h2J5ETtNVLBzTrw2DShHNsLbZN9CnoBJf3wkUv/TZH859ROmOA
 RN4vAHf+SzrlrmS1Kew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130327

On Sun, Sep 13, 2026 at 02:33:33PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
>  .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
>  .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
>  .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
>  5 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
