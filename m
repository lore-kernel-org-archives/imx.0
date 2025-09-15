Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2144C2C181
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 01:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757898032; cv=none; b=PsqeTbaAlaSrBxev4ayNewdKbj/jn0/RraMr2/SqpdqIpeEAfEJ+XCYksnNyrs1M85HTWzWyIP41aUCMQO7moQ6jtyHm8JbYYOgxRFYOw1+fNpmce7Pg7fCkBUcoWnbT6/1RHcsVWEZk0OIehW8LfaV27JchSbRMlhx85H14u3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757898032; c=relaxed/simple;
	bh=0s5pIJRj2Ly706SK/vH8OJ7sZK45JIuAC7nedl4x0/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERXwDEhbySGvVGfecuSFE5MwH3GYBvAWmwImGrMai35iTv5Qa8um/inaYsAC1E34TyP211vp0o6+7/FV3EInN4oAaaTba+IvN9aprYPh2wrxCcw2fPpw96GYeKd6dkQEiYZw1xABZoTZ9Mx6B0xrHYAgkQkbfHkytyxkQsT5lWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxpcoiT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxpcoiT4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ELUCiS016210
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 01:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqfHnDEOnUdvEnKTky9oFQEnKcCdVMPVRKAhxqjE5l8=; b=OxpcoiT4hM+IRFi7
	bb6Fi9SXD6Seu0hGf8gqbpPvTbnhR54ccyNBLgEsGN2kWQ5TGy0FycY9D6j72HiT
	XaUYOypQsYYOd6GGFeOwSA7FOKDquOE7AlC9hsIIya92+yHZeXpDQ8uT9xvP835g
	1DQZFTx3qYU3qgZ+c71zKGHp5zXX+W1EhpDQiRzyGZryZPO6HCE8NccvHxD5HUL0
	b1/dnyyekBkzFiz8cPfdR36xJnJl3x50U/l/25TrGIJLOB4DqFGk8zP92G90DgwV
	LgIMd/vvxCrmokP/GpyYtKjezPwJbVq2k4yh6FUK60WxUAXp5kCN6ohpZMqlBaPQ
	mfCJ2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbawqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 01:00:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5fbf0388eso51802251cf.3
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 18:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757898028; x=1758502828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqfHnDEOnUdvEnKTky9oFQEnKcCdVMPVRKAhxqjE5l8=;
        b=sJJxYLGIhBkhuQ/y3l6Zi1hZjNYKbAoKx3EgNEYezqYH4NgQSZ5fCw0Q+s9AYtb+zW
         Y+rRAfQlF3ALkiPfl8jihphqCbfiu3aMWlCzdMAwezmXECdrrKzIQZTSI5Hv3VR9bCWT
         8M0j5VD1BkJTtLtESpuLudDKqzIf+xybtbTTPYFl6Y3wTpPrUsVI47HcdrZWc4Z2Vtnl
         kL88S8Gob/NFRRTy7964u/l4K9qmGs7JA4xKNpFgLDmU+htWnlVf7IInZh0qeeLUN4WO
         3OGoaitRRS/DLcQS32nEo/s85pggSj6M80WkCV8SwnMHUcvJ0KpWr2ydlWawX4L2Uy5w
         QqaA==
X-Forwarded-Encrypted: i=1; AJvYcCXGBdl1Whnqbiq9atjijaNp3eeIk/gst58NjA7QbFBTuFiZO4WciWALxjxVNICUVMdQCEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjOjJnF6cPI3wFOztzB+MZYZPLm3kwOeNLprkWYzGIuaTFPmKX
	pvYcpSsvr0jJKw6u1ehsbnuPEQFCTeoI17qgXv37p6ldoedKstyplUCL9ocCGoTRxhW6Tm5mHC3
	Cy4xlfMfvPAdLUMH9cKaE4eQbsHFppsjbDMXHOgTGJWkI3B+phKIKhN8=
X-Gm-Gg: ASbGncvRRTfATnVvJI46N8dXYouslfjm/YSivCoXOflYZMQLSQuGonq7wCe3IDsl3Qs
	vkgY4dPWXXSWFBxciNOfiRhP/wjNBvgHBmInsKjBk1g+6F018EWLLrpVO/ffXiB1nK+p54Lpe02
	AtJeEaOX3fGmpLmVzUkm6PuhfQ882GEZy8eA8vux+HPOV0xKj9/0TgD74tdf9qPLDZyPiN1rSyz
	LaxFvTNApQHdOrmTd+JbmckqovrG7N8AGQH8rE7g5JB12yrgJuDiZDot+kuQrSQsmDklZ1Nho6R
	n3aCtgR1M36P/OXCQUep/8sAFGKc8MQ7foyYp7mNsoxMFjDEREyXweb3grARkyYitmgqZkUzbNb
	IzMo2ADvHtLg1XAoqjb3oIUfLQ+Fr3xhm9/0TL/bZnxnci7uCagbF
X-Received: by 2002:a05:622a:15d4:b0:4b4:9062:69a4 with SMTP id d75a77b69052e-4b77d018f7cmr125417721cf.35.1757898027813;
        Sun, 14 Sep 2025 18:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQoKXTfHUZm4ewMDtxrD3cLgoJBG5H4zVtX42N1as3HFiF8AaH1mekFLSfDZC/KfKVIHKxMQ==
X-Received: by 2002:a05:622a:15d4:b0:4b4:9062:69a4 with SMTP id d75a77b69052e-4b77d018f7cmr125417221cf.35.1757898027212;
        Sun, 14 Sep 2025 18:00:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b628bsm3230962e87.15.2025.09.14.18.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:00:25 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:00:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: Add innolux,
 n133hse-ea1 and nlt, nl12880bc20-spwg-24
Message-ID: <ufmwjrlnaq6tucfpqishzvdpgsxartxgohjrgyr4eccahb5jrc@5ausrm3osivb>
References: <20250912185159.1118209-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912185159.1118209-1-Frank.Li@nxp.com>
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c7652d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=CqteVLWsAxVuTjZik0AA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: n3zRnkSjF61H2Ke6xRlRVEzzEbFa38MR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfXyAFUjqMMRZ64
 ld/jsflCCYybmHZseP6gXuzrIBvHQgOT8wu8Q7QmlCzo8yeBqAjIvBmXSbZIBgcrTOQanRcmS37
 jSubXpRAWPRKlMpRNggxk6Y/nB2oPU7P5QUd26YHNLsEwYziw4jdCa9d51vBR5lrpPmKqVe+ntM
 u8ViGOgIftHW0Tn6rZG+/jX2/aXoLmjtE6HBV5A7DxlCQsuv3UaQiej2cw2JcPPUMAr9lRK4rmg
 ibyK/0B+kbF0SzTrerngF7NST9h+zfCAWkCyyNUVIn19TxkckdQC/SiQCG1GJsz3nzzASXe5x8A
 3/GxU1XY4KvMKstBYgbrKhIUZRgLSmI3ge+RX+cY0FO8WWsBd847N/piSPLptOHcQUPunaOupUc
 vIp5pzo0
X-Proofpoint-GUID: n3zRnkSjF61H2Ke6xRlRVEzzEbFa38MR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042

On Fri, Sep 12, 2025 at 02:51:59PM -0400, Frank Li wrote:
> Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> 

And no driver bits?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 48344ce74a6e7..742ec6033b724 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -180,6 +180,8 @@ properties:
>        - innolux,g121xce-l01
>          # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
>        - innolux,g156hce-l01
> +        # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
> +      - innolux,n133hse-ea1
>          # InnoLux 15.6" WXGA TFT LCD panel
>        - innolux,n156bge-l21
>          # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
> @@ -230,6 +232,8 @@ properties:
>        - netron-dy,e231732
>          # Newhaven Display International 480 x 272 TFT LCD panel
>        - newhaven,nhd-4.3-480272ef-atxl
> +        # NLT Technologies, Ltd. 12.1" WXGA (1280 x 800O LVDS TFT LCD panel
> +      - nlt,nl12880bc20-spwg-24
>          # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
>        - nlt,nl13676bc25-03f
>          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
