Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C38230BF60
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946785; cv=none; b=TmdQO597PZ7D0UJ1/Qkme4B9fM8kWAU2GzZIz3h5DHlwiiCJ3PVDKINgDQfvvxwElPDsXWuuYGmQooMm6HtQsQedrBpgCj5kTjJtdKkBfJyyKItGQpkdt72DgtGxya3V/sJwb+CLVsTX8Sf3AtM7vyR9hGpLaGWsS6KsAeU5Ick=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946785; c=relaxed/simple;
	bh=SZsUCX/w3pUxBbcbMlcwv7f0jJpQxiT09A73W9+X7FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7CEtvXTga8bP8mVY1u3D3JtrIHGRdx8bNS9LRu3LkyPHKz95v+YjzDX3XO2D2uYNSBxX/478bL2k//gccM6tpsmAKQP+k4EbBZC+XfdMk4RLNBpmfnYKDvwX8X3psImIo26WAFsZSsjDe/q8zPNy++Ptw+LmQOXTh4wXq242g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhGMIiAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhGMIiAK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEBxu3031681
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 14:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCiPLFsgRo2egphdxmb1qzOQ
	5mme8yx2hExKNMNoSQE=; b=HhGMIiAKuz/F2/+8ITmQfIeolCgGFrHLten91PgH
	l4DBKNbJ0h6Ud7usSUwjs2iLHeWuPm+1OlcAtLQaUuAcTDr+TxU1A5Gg9nTVV7Ea
	S3aynEudRJFGuHFX6Ecded+KObji5Il6HG9I1ORtA5mEP6VFiGa4c4lwShLOVXgN
	jmImbcBG2bxsrFIWHOq4XgfScJ4D9xq9afhPeWgcwVRA1MSparaYEu6CPqOS41O1
	qSoPEFg/7QV4QshJ2G7DbqqUqTf/Eykdzf4w4EKa4VIF9T+c+XJU7Ry5f6szyfle
	Hayss9GLQh6BT5L9m7ru1lv2qf1dJW3I9HL+OnLH/kAUgw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma5ayp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 14:33:02 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54a1ea646e9so1038336e0c.3
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 07:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946782; x=1758551582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCiPLFsgRo2egphdxmb1qzOQ5mme8yx2hExKNMNoSQE=;
        b=SijJzK/PyftsO04vT14SC74p2WwnbHveAix7/o8lzrRH8zlV1DsQ+hxUMhfCN1if52
         Mip2608TlQoYoZF8Bq899w8XXhqAkO+ADZQJKLcY/p9+lqN78bLKYitjlVDEvZH1V2pv
         jaHA4QYBM/nOrmLbCHFrIz/m66rqMqfMbpTix1+WFB9cs3/ivPqMafiHFy7VzESkljQL
         yP/8O5r0Eb1GNDtHWAzsg+PlaUqiQXxOhUNreztFFZzZaCPSDIWavMJGF+9y3K6uBUqZ
         dD93pebxQMhd0GHz3JlSLO2GDWf2brdsFfWOt73ltYALRqUMC8ScedhO0tjpwHNIWtTr
         TAXw==
X-Forwarded-Encrypted: i=1; AJvYcCXXjTy6yhm/iWuNRk3sgOv9eKXqNwiNHMQlGFeLJxQTXBcEisrbXvhKqlT3DHCidagXFos=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIJiOhbaQ9x8VW6pF2o0gCgwaDwyfJ31VVBAW7s95+YIulf1zN
	AgDZLv91TND/sn4N4iHMKjRSObj6JeuD0HUzmmfD5w8N1iC0nzuiEFYfBYlxMH7cXwcmNIWTnnn
	SFQqVv/f09/CtJLONXn3bunADrYiN5EOB4VcPB6jxWyjSLEocRERIxCg=
X-Gm-Gg: ASbGncvIO52zRwUTaxd1unk0XCH84QyF06USMkz90ryfcDfSRVyXsH7EkIN2lsbXjk4
	ni5hg5im1XrsUNeN1fgMoP06YYlhW0ffb7dWHsiB1ozQ0COoIG9PRivk/i3NDjUahJsiqJZUlmz
	cBs/y2pmohGKde5zxTGfnogevcI4gy7+e+doJIovaDjmP0ou71+EPA480zAoltKFTnY8Md1NLDc
	i0nicyeh1Kuh0/g0kg/fNTKS53q3I6CCo/yC8PGIpudTE4qzjceZdLVjOmKLevQiufJHiRbrsfS
	lLEyt04R+21nn/I4Fsszag+z7/wBeCicQfT4hHgYw6k0KRJmLeP1daNxKG4z46vNyGQnHCpTajj
	Q+TOrOo3k6JyA+xLm1AY0fkdJy8wq6YdYTebIC55WVeQV90ll6v3k
X-Received: by 2002:a05:6122:2019:b0:530:7bd4:1761 with SMTP id 71dfb90a1353d-54a16cc2ea8mr3544707e0c.11.1757946781595;
        Mon, 15 Sep 2025 07:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuIXd3AXZPQsg6yrUQ/6TEB2uZ3QxUx6thouxmHnQ+pG1W7Rw+xHTFcjX/dtsAxhwpzcsAcA==
X-Received: by 2002:a05:6122:2019:b0:530:7bd4:1761 with SMTP id 71dfb90a1353d-54a16cc2ea8mr3544660e0c.11.1757946780789;
        Mon, 15 Sep 2025 07:33:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62b3sm3659056e87.5.2025.09.15.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:32:59 -0700 (PDT)
Date: Mon, 15 Sep 2025 17:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <bd6y7ckgp6nmnotyfibedhgyzemne7mz7ghcfwf3h4k6xdqpbd@i3zl3uellpex>
References: <20250912185159.1118209-1-Frank.Li@nxp.com>
 <ufmwjrlnaq6tucfpqishzvdpgsxartxgohjrgyr4eccahb5jrc@5ausrm3osivb>
 <aMghlBUIu0z2HqPw@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMghlBUIu0z2HqPw@lizhi-Precision-Tower-5810>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX/d7xco363v+D
 hDMC7Cm6sYw/zyKkuGSCgbC9+DnVhA1AWmiMii4dEgWWfWbTsGBmDKaJJcvePm917gZF8PyhJa+
 LjXbhatOdNWyr6Wrmt2d2whOmkbYl7lpiCMyvSKWkUc+avWgmItsijsKJbyPMwqR+Jk/fnKEucs
 Hchw1PY+Myf9wI0W4sdbhvLvXSrQRhDpTLaJFl4TPGfAm1g3nsSyYPmatMvVM6bt+IE/L+Jq9/u
 WWPzabM8gSNUWdXq6x8rmSBRYC0MEFgVqDTCzbTZ7CEonC5lP+og8O2+cL2EI4kIRKp4Xmr1Ryl
 OD53EJR3PjeAdkSk0Vjz4ImvIjhboEpjuVH7WCvxWiqjLGno7tqvcMMC7Nzyz5KWXyfS+8wF5Ek
 xyzNmCj9
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c8239e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8WGclHcmlfbBJmt5TOwA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: pFOZsp3IaQePgrtgq_C9eYRlf_O13tyu
X-Proofpoint-GUID: pFOZsp3IaQePgrtgq_C9eYRlf_O13tyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On Mon, Sep 15, 2025 at 10:24:20AM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 04:00:22AM +0300, Dmitry Baryshkov wrote:
> > On Fri, Sep 12, 2025 at 02:51:59PM -0400, Frank Li wrote:
> > > Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
> > > 12.1" WXGA (1280 x 800) LVDS TFT LCD panel.
> > >
> >
> > And no driver bits?
> 
> This patches just try to fix CHECK_DTBS Warnings for existed old platform.
> I have not these platforms to do test. It is not necessary to have one
> linux driver when add binding doc.

Please explain this in the commit message.


-- 
With best wishes
Dmitry
