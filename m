Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466401FECC3
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592340; cv=none; b=j/5oV9nQo0KTlQeNgUbKWWvWr/KbF82HdeCZELiZXKEmWBhKijcWHb3vPQeqB7a00m2vBXovcWek37L+rdlRKOg4m/zwSNrNruUUNF0x3Ju46yOggOqaZW9rHomfCLTSIENy8KQFic/LOH2/A9aZ8eyZs4Vq2DEg8X/Gyqf5970=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592340; c=relaxed/simple;
	bh=C7Bt6ty4O6b5hObsfJEEwxiNOyTN1VXF/4lKT7wSu18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSN/ORWnfLTEqQTQ24kVrZLepxwScm2194Mb0h7W6IAGYWjq1W+9njv6b3rKcLQ8oJrBe+tTkXTZ1oWsVN0bEMEQUixfN5yhaT79uX+KogCIuf8bH7jki/duWdwQEAtN9KGgQf/9gup4YQdGay87RqwkUajuZyMqaRP1up4y0fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElfxlvT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElfxlvT0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FEl6TJ004347
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
	27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
	y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
	cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
	GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
	TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
	EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxb0s07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:12:18 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso114495945ab.0
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 08:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752592337; x=1753197137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
        b=FEZPJD35NTz3lUNS8WsDQTqsKehp6WjqESCfInlzKCQYQeKzoE+rNTplXfSy9QM3qs
         V4jekpn1PPJ+tYT8egL2AJIXLEO7KfQ29jAfEeh/DcoaXyEWLviYC4DvkmPXH0iZ5JY7
         4RvHUpLyE6P0XtXLu3N9VaogcX/hvGYW4iZLrHhKJ/CRpH8j2PCipnbvuHLiLVgP/lc/
         N2F+ks0PNuGNP/VycUCi/7dUVm+wtl+ujOmrWTPzkzvLi8Qrjsu/06kab0h54lGOqCam
         6k1Sp8grbZbf2DoGy+6xuJujnmX15AoVSHAoGXKIB3Gmt+munCM6LHi0CMbsYY5ZiQ04
         k3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJtBDwRmdJ4T9MCnYYP5NWx+OuzK0DOS8tp4GUTDyLxIDEaJmV4A9bP5JG5u3tiu0WRRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoARBs+8AvS4M1Z7FZ5qRBBl05tLklEELw+epy4U6qddcOm+t3
	ZN1lUbNLo9dkveAJF4oGqU5EIjD/nh8Mf4TcQ31ee8Q8DUIAEBDS86YG+UWxJDwzIe5RQRebLqk
	6It8XO2nAxLNjsRTkcbo6VwpSZHaHe6yX1+75PXJ3RJO7QVQ/lq7kVzE=
X-Gm-Gg: ASbGncsUoqscPvYbHSTWofmE7GPTnGluz5aXStIJiQJPuuEjIoGHbwXmYf2+uoUKQex
	e1H7UPZAFeN65U+OK/bBsYNPDvDqkSdZV3mUt5LCB2AcFlBYgnxGbhtORqahv6RJQEu2hNGCLmI
	JXqYIUB4QarvJIR981LXXcA69ejd3bZ2vqHiNDN1HeOydfKyihFe7499xxnN9/CU17qdM9Vob2B
	Gg87W4dri2Fhis7vI6QaGBCDWUHga4SIYLNv24ujxOkLC6wiFq2mxioURC2Ei+ChNDb+07BaoUw
	Y4D3OCpYMQ2NFj8ag0ny2EyjxbhSu9o730BU3PPohhuXigjq8HCw/KBAc2FJXC7fkEduPL7uL06
	YY5gHUiGJP+youuDg9i15/nJAYMf6q+glVRUq5M4J/ZO99V1P9JOI
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190550595ab.14.1752592336604;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031;
        Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
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
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-GUID: KRfw5VmDhg4TcMkxFKz8Trb7Br2tfoUt
X-Proofpoint-ORIG-GUID: KRfw5VmDhg4TcMkxFKz8Trb7Br2tfoUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfX5AQJBCzsk1V6
 y26F2j2d3sJ2OHBTuGKb/qV3Cf+WItYZU4jlMLVafdKGp0cxabxoi8IRpZv9Py0ZFKwVqUniuPt
 3QxcUK/0n/yQKLdv2XlaUaMt2adGc4wvArXwpXFhnhbTtl6APC2aQH+J/4nZnhHqXQ6I0rpV9r6
 H3v2V2TSytL2RWD49NlggZ0Sg5kiLmcumhKn1MROFSNdjaacS/VLraK/oBgaJuw1F+oo8chfoke
 lr4aIB630gGrg8gfh7wFHwkVWYwpxiPKFhnSMyqwQi8LTuujK9Gj2yKXK8NZp6lO8U+5zMrdq/2
 Xe40XukZgt2uSS5WAlJglvuJRJl03vsiGcArJECa0RVwusnm4JwzgLIINs0R6Qm74FhuP+4EOXR
 7Jr4IhKBf8dNaeEFROpel4OF38e1BlE8QGsJbLKCB0qUMzAfPIebPL29JhCa4db3hfjOmGcZ
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68766fd2 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
