Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7519F40B
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263671; cv=none; b=QYIcMmkArymd2exorFlYZmPk/6RyPZ/o0uqZoPriMZ53B1YaWhrw5Nh0391MlHlcFHTZ/eybNtcs3QG9mAp4gQHQeiUlYzkTSXY7g2LPfrDqkFRUtZUiU9JD4gjGcyRdYXCWOA4OupKCriSVJiLwW9Yu7j6aBJXzD9AdvqKbvl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263671; c=relaxed/simple;
	bh=rxceyoBHzvM4ZjFAVY6FkDDrXnSA/1H3WOTMIrvT6vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqUHld6yIfjpHJ71iaWSkj2HTs/QKrAprJJVA8hcFfLhAW99K71IW22QUOplFdHewa6swVzqDNL9vvoU6hDN1p7tXMaJ19F2fGhAu5W2i9RTQpkG7nTyLD+vBntRxA8mOgZWvN9ph/+5YojkRheGjrRpLUBrsroE/OehhLKpTmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKIFGfsA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKIFGfsA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UK4GQI009323
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VFb0crc/qOwGeBvP/JtK6gr
	pmOtlDvuwQF4VkTnYOY=; b=OKIFGfsAMS6m9Xdz77R/OpPAtDirEHauS58EhqBK
	TFdGF65sxJhhca0WWxoGIJzqTzensMRHi1C4MUxrjEccLsQPnreEXG/IYa96Epp5
	vp2O/DWSYZSHs/H1Tcw4yEavtsgQB+LCBGFbhwfq7vmCvhoch6shAXdozWriH1vd
	SGRy2WHwYItvrIRcm2jYNTe/BAZROnuMzfXh79HwM4h/oA7e5RSs1p7Hxtx0y+wD
	0MlAkDlzFu54pcauGfmFnSyJJB/MwnHpl+KEvIaoUsXbqsuwFSOQZWe3U0MkjR9q
	xp1n2t3tcxIZ6Pg9Z+nVVQS/wRiH2YNRsJxFZecGEJpOSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977t4ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:21:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df7cdf22cbso7351991cf.0
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 13:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263667; x=1759868467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VFb0crc/qOwGeBvP/JtK6grpmOtlDvuwQF4VkTnYOY=;
        b=N0ACKfoaygSKuonuBmuiVjPaYSlu8ydG4ximm09R6AHLiG8KYG1Pdm/ZizmNE3i636
         JLcTkb2+hDIa4M2slVI3S+S+86R6Y5gefb7Ilg2+THZiTE+FaIhvFNTjPAUN4DmWvaTf
         6NaM9Nm+ePlwNaqHCu4ckThVXXxUiL9KBdQdYjWFWlwBxAo+j0uQyEeOu879rMnCERrL
         svZ95GLlRKDPFYj0iiV8131hUTmEQGM9PuSkWPUIrD4ImwuBbkz63Vj5/n+e16dTDRe9
         nRNMKe1K1LCLerZ8q+kPw8kfoOMqpZPqa/fSGJPNnCzGFYjeJvCRR1uus/UjputeGhwJ
         5z8w==
X-Forwarded-Encrypted: i=1; AJvYcCVqir1zX1NuOyHCcOYj4ctcQeAWLZnLBfPaBpDCSDG4vdJjiHRv9VDviuIgAJxqmK93xUs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5lt1dAcYzcDZ29RdsAc+mfsTN1UG5mg1wC3r5IinlPbxvwyf8
	DxFGuKTGAO22WrCA1zB3YY8XxNw9dtHgTNak9w3I7Asw3/09P3s9PmkUhnO/XJ6+YJIjRcChdH3
	q/TLPPkwdXaVkuOoyG2w7wvmlJ/PZ8jPmkGkp9IUVOTJr/r3hUiRfZ6w=
X-Gm-Gg: ASbGncuoaR1KrmccimfqGMMcbtce1LUUYy3X0Qev1InV6UKb9wEzWjehE7UVZMjZa0c
	X2A+TeFZyH07rM5F+I0szdP7uYI/Dlt+WnpA/kXbGCs9ecr/2cpTWC4unxsKWN+2pcSVSxPGhPk
	9p5VLsF4LX/qBdMF9iaLg08Cksr8xJ1gqaJPdUbQGbYSHR9m1H9Ez9utLM0/f+w5B5EYUeh14Uh
	0QElN2U1K5BPjXvKRrdaigmwpyBRb4aewgN77kgHHGbyY8T3RDQ105lclg+0mD5BXFG6kfMOGJW
	rJCEfmiecRNNfkrdbx26QT1MWe8KRE/1ozfqil6y1oqzbNZsoyjT1QPEdcKpO9+hBdMTt+N/WFS
	m+KVLSKp4xqg1qmSRDOlZx3oJa4vwMKpo6OoPHw2ocqRItnuSNRHipp7xgg==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e27faf2456mr85876491cf.33.1759263667334;
        Tue, 30 Sep 2025 13:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs3xT3p2rzPd59HRBIpsMj0tVPI+tZJQCN5NZbJA76QgFcZCY2wPZXNF7YjDhP63JSlWg6Kw==
X-Received: by 2002:a05:622a:5d4:b0:4b2:8ac4:f097 with SMTP id d75a77b69052e-4e27faf2456mr85875861cf.33.1759263666813;
        Tue, 30 Sep 2025 13:21:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a32113sm5289277e87.102.2025.09.30.13.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:21:05 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:21:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <4r25h5uaamfkprrmvrtdqfjlcgcnkfyca2o5q53hteta7rlrbq@xqlrjxhi7z2u>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-12-damon.ding@rock-chips.com>
X-Proofpoint-GUID: 2u25qP5fFOHRt7MSKtGVvN0R_5GA_jkW
X-Proofpoint-ORIG-GUID: 2u25qP5fFOHRt7MSKtGVvN0R_5GA_jkW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX58vftqXAnSgH
 Hzi6ph0II8yGoyHYmzC4T+dwvIiVrSFQn5Po0FxIus3iCn2fhwybBEzQMSVREHvgMf96kB6fvWn
 erg8a/rY9GR8fyqoidJwx3uuAH9kW6rWuDvFNKD65ZxneIwiQmTPvrQ3no7jjs0Hg523NNSONP0
 YzWr7ev9ET2xkgRJ2xcYqE67aAm8/qAclrPRBdFoeMCUPsfsSjG+QMjFxU77kaljzz7TYyONT1l
 8SewCc3VHqbZRhzBH8nxVJObndovVIug4v7979/7lj+y8//FtNBGlvQn1O2rVt06hYwdMQo+Gf/
 cbkAotJT8tUhzDFxoWJ/rNdawn1lqdPWeyxlucdPWVzPO5CSl5K5GgmuGhOZLgtugaBhDMIRSGV
 mbl2n9cL811ZO4iu/qyxKm0NkOE5Bw==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dc3bb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=2L4VR2zxEnLzMnak7dgA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Tue, Sep 30, 2025 at 05:09:13PM +0800, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
> 
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
> 
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
> 
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../gpu/drm/display/drm_bridge_connector.c    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

But I'd suggest pulling this to a top of the series to let others also
take a look at it.

-- 
With best wishes
Dmitry
