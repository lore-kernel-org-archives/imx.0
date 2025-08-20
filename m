Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028114D29B
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 00:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755651031; cv=none; b=E0i0QMY/vgHRlat4MOuwykLZ3jDUP0veK2N1bKUifjPOhrsBeavliPGVeD3R7PQBOvVByzRW3v4119tTjyEqWSls0bZhTDUwBcfhQF7KQvxuwc6VsU15id5Qr3TgSMLZt79NG2MNq6RNpnsYsvAULUUD0tZcpBAiI2+oS+fKQDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755651031; c=relaxed/simple;
	bh=YIRpeSbZbQx4vA5wFVD+gkqsQApN85GMOE0/qPdsAM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut6XAaK0m3SfGqIM53HWAY2C5YRHDfKvygnkY8zEEYQTy8S0bK/xRKPDX2UMG7jVuvYf7WUhOdNnMf1rbQ4YhmHmeZREEeI9AcVh+H6wPRWgdMU8U7dbofeM9dPYMQDJgIkH1EwWAO0msNoUt/nAtQXUA63d8ql23paNWp6YUjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0G0lzwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0G0lzwB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0sCR027402
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 00:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fFHU5Uj+jXoPoAM1BiBDUT8I
	hXi09SdGNJ1NomSthLE=; b=M0G0lzwBza41VuZ6YB1X0z5czf2rGCswbu0hfe1R
	nnq1jEIb87cSyTsnH4s8YEg6Td7mYwIGrN+KkXxAMTcmpceRz+IIfX65QJxluT4Z
	HnsR0h5Ebpoi3zg1yiLhdNXfMwOWQIqwuZ2rm8y96Cl1GlXh4zFyvgrxvD0VbXlD
	YMl39iKdWHMpBAHB+lO3dNnLHnoriq8seVJp03cVsT6/2WEcJ/9tsm3sETjzOid+
	F+zAOJr3yzJfB5aV2asOtw6XMANoIs1VbcUlszRDU1kooZOe8YvXnmuYFkZ72naN
	4a/kjdsfYe3eWKd5/zWByF8GT+qEhoPUt7XeVIyEQsWKaQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0th0d7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 00:50:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dae248so9658636d6.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 17:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755651028; x=1756255828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFHU5Uj+jXoPoAM1BiBDUT8IhXi09SdGNJ1NomSthLE=;
        b=WzQ62wHxmED/GlW5XRq40puKjLs4+6g6h2yqFvLATIuOgCOoO851v3vBvXOTIEzH0k
         nwILuofkbw74bGRxbAg8KSHH5l9/6tUN+ELfZKTwQNx0FEeICXQV4eCURVmXDpGUaOZu
         2vnVPo6HGjdWK7a/Bo9sdIES/ZIPyTDi5i3+K43jQE/G3GJ5XocgR0cs0gSvrZKo69wT
         tPWIJ1Y+nHwaYwcAXiqoSGKhuqBGHa507zWYfK8HZAnTLKuuvg9croIMrWO5lPVdZmbi
         y4nij5sNO8BLHYRoVM4wdUO0lAjOZlwLlf52tl/btkBLN1nsPGbhC0Thlu/qSSKFcgcV
         IVFw==
X-Forwarded-Encrypted: i=1; AJvYcCXyItNW1zWqUogwKPOiRaVcl0AvR9GRMOabRuTi3M00YrjYmypg6lyLL2hddNP7LmDHgV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQBxlRGDhx3HjsHz497zMb6h7oFYBJx7irgpaLvY7KUopfBDah
	FdMhEieE7UOJ3TQi8QAxcoc21jfE+sEFY0x//DRcebZAkMFoivht2OI8gujFXunSCpT1mWHRwUL
	cjcJqbZtzN2lVm9RWAIcnuekZXuCZBNIM1DIgueTOW1+Q02HGcypTqVU=
X-Gm-Gg: ASbGncuuSRqtXzcFsFwXOfLvc/VByj39WPmQPnWxgFDQEcatQfu26HV4kXxp0o4myUM
	CtOixYAUkrJ3k0faTvLz7CNQCBrpHAifho1bgp+oKQGo93vvzfHQZM2o2seMVnx1cQQwngqFHMt
	XwBuiRqBZhJ4YjkmJ8Ys9U/7m14Bf8guex3dYDKqPnkP3mwEHRIYd81MB7OhTD4nuXX8dpRz6lT
	n4R0pSFJVpfEPWqU5n9NoxDRIW+7r8Tj6T3GiPaDVjqwZkEG8KBrEcAN/Vyzwhhz65A8fSWA9Y1
	h7rSGH6ah+3yQBDH+vPXHafHSc7t8CyMIO0Wq+JdMs/QNBeP+llzjQk3YnPOOMOMRhQTWZgvaf+
	kG5x+z4348CzL0DQnJgrCwdzwvzDIcXqz6oeNwnzwjXqOsalHkWle
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-70c6769d407mr51600296d6.9.1755651027805;
        Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESN0BIvM6CuJAs/DUGKSJfPhZ/a+kgpIoYK/BoCUIvKjOBaanSEDI8cOaQ20OdYtUduS4y3A==
X-Received: by 2002:a05:6214:2347:b0:707:6cf8:5963 with SMTP id 6a1803df08f44-70c6769d407mr51600096d6.9.1755651027357;
        Tue, 19 Aug 2025 17:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35a187sm2325712e87.46.2025.08.19.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 17:50:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 03:50:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <6lbathmvpjxdvcnhtncxclcdro7nv6gjwkvznnpv5zrbh2lcde@qw3gjj5lp7ev>
References: <20250819213831.1368296-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819213831.1368296-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX9LKgBrtQWV6j
 5ZHOyK6PTK19K2vzcPd9kItM08ZuYjaC60CGjhRQfMHpPPDl+KDTPQ/SRphHp3lAtx3ncKkmPG2
 g97JncFOX7zxbH2LtyFmK/ajzZ6aahAA2LlOb7rdJ+VasXtgqdtFE9oKbA2rx1f28xuXFWcbGxe
 95Wz4TP/N6e6Ru3GNeuUq0hPCqvYhELVhNDjE4Sdh1gndH2ItueouInfwG/BjEecwCGQFS4t+oj
 LB6oZ3wuFRXA6tfDWCOQ+1D2TYskTLjhdxg6cHte/LWjhrMjEy4jqHdDNmwxA7zkXDn8bkc1WYR
 cfZvCIWAdNqrIJVmwLbvqOZCtBiVC+Er85ewhVUOfLv8ij6BV/UlOHWmU3oh7zArnMUK4qINm/I
 XlSUJTUkoZPdyqQar0DgZSBt1YVU7A==
X-Authority-Analysis: v=2.4 cv=dI7/WOZb c=1 sm=1 tr=0 ts=68a51bd4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_lrZVZmJbgvpAXfrVDQA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: chC20PRbiSZaAQlPzLneSrxncBZho6Qx
X-Proofpoint-GUID: chC20PRbiSZaAQlPzLneSrxncBZho6Qx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

On Tue, Aug 19, 2025 at 04:38:27PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - Drop some inadvertent whitespace changes in qcom_q6v5_pas.c and ti_k3.
>  - Fix error handling in adsp_alloc_memory_region()
>  - Drop unreachable returns after 'while (1)' loops
> 
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 47 +++++++----------
>  drivers/remoteproc/imx_rproc.c          | 70 ++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c     | 24 ++++-----
>  drivers/remoteproc/qcom_q6v5_mss.c      | 60 +++++++--------------
>  drivers/remoteproc/qcom_q6v5_pas.c      | 69 +++++++++---------------
>  drivers/remoteproc/qcom_q6v5_wcss.c     | 25 ++++-----
>  drivers/remoteproc/qcom_wcnss.c         | 23 ++++----
>  drivers/remoteproc/rcar_rproc.c         | 38 +++++---------
>  drivers/remoteproc/st_remoteproc.c      | 41 +++++++--------
>  drivers/remoteproc/stm32_rproc.c        | 46 +++++++---------
>  drivers/remoteproc/ti_k3_common.c       | 28 ++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 53 +++++++------------
>  12 files changed, 199 insertions(+), 325 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry
