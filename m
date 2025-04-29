Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390921FF60A
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928580; cv=none; b=sGAq0uuW3iwUOGUJJ/0/L0sdNBJ7Lw5ISLdQYj0Gxbp3RBaPzLLXONHeuAXlTZ16wcVhcq9d6kZ8CJn1QFKgujDQ5tvQ3XUfoBLEO4aWvGyx9JpP+kV+b2E+dCNWOtOJXEXCqd9gRZk8qOEiP1uJao1FA1xFwdu0I0sTlPdiqIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928580; c=relaxed/simple;
	bh=JI/M3TugvXmROCbZWvHzHoi236mkIUCGUMYXkYi7au4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okEV2v6gGAkyL+hDFfE4EUFLlmr/Tt4AI2qCuFE10pn/4nKO+Phyee0OxwQjk7UnQnVYZf5XNsF6hsJagj4uLHwN+VAnHrkhIX9Jd917Xcw3iG7+lVinMmoeRVMR8AbkqTqhmE/edbPdWCKOn9lSbhWxLp5F3ZwGVH+MVZ1anks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkGLmgB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9sAgJ000768
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mf76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2872e57so978543585a.0
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=Dxz9NDB8ZHWXtwiPSQpTij1tlCz5UbI516jGJyz8yQdu+6R4hv+CJ1FaYDSMhhGC+M
         cSXmu2o7cfXvFMac2AyUafiWnKZ3cbMeV3YlJLdZJh1iClSdFohLKHe9CKVHsghjbcaY
         hrYp3GhFNxF/apqBZb3CEYItSFj0iVsuRRkkOCN8hzXCky5np2aW8sqO3gBSc32LDjG+
         3HFJObLwleb9rSOFB63RrrZ00V6pan0JWdMcRstBgfc4ZSrk0Dy9aJqEHUWcPZ1+z0Am
         JQ1U28FNRlqwWrTn4a6ZZ1c8lhRHTrahy0WU9s6fKhtWDEanGf7eyKWDPcvthmF+I1xE
         768w==
X-Forwarded-Encrypted: i=1; AJvYcCV8zwxes811THzR8yw92+LgkRwAwBJr5jB0WC+tlw2GcJZqsTDJEE4t0qV+TuiELYMSPKI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHVgC+aVZGnmZZ5GYv8uFFR5mPHgt2NDnX5nml6Dek/mpHzWzR
	dBhWvkCazD2JjSB2C43d2wyPrpzXpUrVilYIcRek/5A0uex7KO4dfp/Zr2UssJkD3INJmoBCfjA
	ZbymREhSymdT8VnHDNgSC76bnTyqKbAVvXFIUwmshyqHBBdNTgvo=
X-Gm-Gg: ASbGncvpOaPYuSu5R1IAAuuZ0+t14sCsvhaNVqOLIoq/Bv64otN+GLopnAVWPaw/G/Y
	FO9Hm9CSjYlro3yoL1hJy4CoJRKWo83xQDyi6bWpkdELUWklHe6ZmWVqDADkX1hb+FdEP3q+hPy
	3WkE1ESogBPctacv8n/QJbjk7fXPMwwb6RzIg0pUJwf11evrpR7v8yeCNZIwb1DlTqHomikD6/X
	dvjJexHuHa3V9rbc/max3L/TJ94YNA81QpVW0bq1xyamrDDhxEp3hA84rF1OQnxZVO8NKN6Q2a2
	TpA81D/iSpuWqfJjEwgYqf1fW+JwO5S11tp1yLgtY+ar4n6k/sd0F6niBcR++soclZR/ISIFnWA
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556721285a.31.1745928576988;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
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
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: A-GW66n8Fzf81sXjZwRmQK7B6VaZxxpM
X-Proofpoint-ORIG-GUID: A-GW66n8Fzf81sXjZwRmQK7B6VaZxxpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX+F2rm6Ruxprp ksmrqh2+P2TBEqdvWgaK9oCRzrYIPnLWt+lvQ+LO3xYzSp9mgMXCPeNmY0PPWNbeXhG59bMmofO QMu0kHufPpMaCt8YmPJnNq59qUwkJhglZlm1o/1c9WtFaWUfO39zG8fX/Mrh4qaKsREk+KHu9zU
 zhM6ZFt46xOPNsUdoAAjm2g/KMbjCpgTeCkjMKgNCYhd1H2VAItiQCr2JpMtdi1cLz7RYR6ncpR UYZGWI4bXZCsfTm7WYxmEu4Oo4fSDyOHkv1slkEIiThLBaBkJ454w4o2TfK8oyUV207ctD+z6MB tFQH1eSL8Ku0Krq2ec4sEb3f3PhqTgD8wfELk9vtmBm0gexVOdexAwQ2BV+SwebsT/0tUPz1+CT
 OKT1XMUpsZCR93kw8eDrkMJTa/rwgIapqDwFRYeummB6xqmquc1AXJABULOc7mAMSwn/R/VA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=868 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
