Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939719DF62
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755887537; cv=none; b=seXBAXcXL9Yl3LWW/K96r9p8M0q3iI1bept2dA2lDv6CLttlgsi9F4kzVbTipIXvuk4Du20VWzq00KwI6UU1IvSiHfmxM3s4dmq0wV9AM3799VlghI73zNa4ddEiuOKsswX3jCHmEwqp6aTey1cgetJp3oUFi+MiMtaXa5zEYKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755887537; c=relaxed/simple;
	bh=t2Ssh7nG32987+a8+QxEIMoJj2YqMDm4ueKdOaDDhf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGAuDPro2sio3NzZWKL63ZXfvHnAqaOMAtQPirAJWD1n+xNK537NOzoEarwZCPe9fTsILm9130tlKcXbAtYi5gJazI+dqLzL1pCJpEN47VJyzJcGumr5AfaltOSyGeNxp8QAe1hGa19XT+NLEE7Rh4CNd02p2P+vYv0dQeRDDRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKw7bP4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKw7bP4S"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHZxba005096
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 18:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2kF+UHt3RQZ9sKwYUnht3JJb
	3AN4kfQFQklzuuzACdw=; b=HKw7bP4SgHZje4mEEpfk1z3YhOK/4j7A8Fbaw8Tz
	6kTekaTVK50xtp+mTMkKWGprk7V4i8P0sQf5OjbCSXWdLGDPBye6e4Hh6fBp1dMz
	ewG1ZZXU9izkXM7D9Pp2cI3SzrodO0rSr3TMaXkT/pycqmbaN/9VSohd6q+keLQ/
	9CPEiWVBInMyX6j47qsl/ihYz6zP67lWJS+NqpmawHwpJsoIHlFWRBwroJbZ3COy
	YsuXRwXtV7QhvgROmphYmH1redEOuP4Al6568+u7qq1a4BOCOZZv5L43i+4fPTWG
	i7pzLbLOaeezuvqMUh48mTxmpkRSG7SgJ9WdfwlsdBUVog==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3dr56n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 18:32:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e972eso56248326d6.3
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 11:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755887534; x=1756492334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kF+UHt3RQZ9sKwYUnht3JJb3AN4kfQFQklzuuzACdw=;
        b=BsS93Q2pCo4TB0r77kac8xjDE9BMA552TOM6d7UfYbUKPfBdaDAN9qGsoAFYP7tUhV
         +QaNWaqOcbv3yptYviHnqMjKUKMROoDrexrBqGati+v42eIrR4oAKEoW4gCfuqNjG0wX
         gdAip+q1Q76MK7O1lcnZIQdh/17MdmnFOsc4I2womIDhF0hYO8t8oO4E6ot4eD4ZrE2f
         j5en6kQFgTGUt8ZoY/6oYJcBwCndbOrfqAV4HUwdSt6IqQKGjpLPv5PQn4CfJENhFmZm
         BKDBYghBlpI48xtr19zJVDBVqxMUlhu3JzCXCsg40veqz2hOTTUmYA+5VjyJtGH5zR7V
         jkJg==
X-Forwarded-Encrypted: i=1; AJvYcCUVEYBXCYg5q/hXJqV/OtMVUrT6//sxLmg/FaOMxsHgG2h5PscU5r0zLcr/qVxeU/pAboE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya3IA6WWI2RdbfPMC1bJivhplgZG1t2ZwKv84eVC7MSRsMah17
	3rsz7/kNozaaqM5QcztZSNN7Wq0beZAasA4vmFVD43Dv8ck723Sxpyyxyy1aEVs50BDg3fY/brg
	KLgGF5qSvv94IKDoaEp8fygm/LnPEESGw1wsaICoyZIk02hoLxqjTNhw=
X-Gm-Gg: ASbGnctZyT/P1A9IfcmhTtAARb8ECngW9K69YIkmiid9QOO88PFkw9Z8UonYvBYqJb0
	CkrJV/Nrig8s0o33yzZhrjzF8eUuc5jDxm+ZJejFdKOt0O+d357+SuH3mJs5Mg1b8FVRjVKh0ol
	HIAJNB/RNg6ysFpgIe07r2dxVhNYDfFnZO5/QCH08A6wrVQmRLltBoCqK6Hm7tZSnKf5BMDxA6+
	AeDC9zdkHHrZL4YnhdfPl/bfSFHvWQSijb5iqYY7SkWHFfv5Z0b97cttrky6Vh3lzNkQaZd+EJN
	5uVPRB+KAZ9Z9eb7C2xKy4Mj7+yP4mduubevLTtUG22NoC2I6VMw+kDxF3fNtflcBouWjrqcFNZ
	XfzdUk3yZhihlrT2Nuxr1biwQdKEotSsDsUiY05tJJQdzyzhdfSy9
X-Received: by 2002:a05:6214:2463:b0:70d:8549:a9dc with SMTP id 6a1803df08f44-70d971ecba5mr45207956d6.46.1755887533704;
        Fri, 22 Aug 2025 11:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUwecfBarwnXQpcnjnUt1xcMPQBcCSeakWpQc5KmvE+AdTu302f3u+QjNzhIWHgctycCfdw==
X-Received: by 2002:a05:6214:2463:b0:70d:8549:a9dc with SMTP id 6a1803df08f44-70d971ecba5mr45207446d6.46.1755887533192;
        Fri, 22 Aug 2025 11:32:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35bfcb27sm96296e87.19.2025.08.22.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:32:12 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] drm/panel: simple: add JuTouch JT101TM023
Message-ID: <4gyzjoshra7mwkagkhbk2uzxsfeb57ufkr2qilppunka4cem7n@zf7rm75hdd2n>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
X-Proofpoint-GUID: akLwmXMpr12Z0W7UexMBj5G6bc0g9-VE
X-Proofpoint-ORIG-GUID: akLwmXMpr12Z0W7UexMBj5G6bc0g9-VE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfX9cArIgPop3lj
 JVRJJMP7Zc3fQmCZvRUsJVM+TqL6zMi1oDOxPvWXpI0Z1RD3bLFi939z2kUzf40R8COKRdag2X6
 I84iMz6UPEbRsyyfYKlo+++zZSEPG1TL2TeOZK+UgGUlGUhJ6EC5alpckxYDn2kyyUI8oBPqYQU
 JOReUKw3PmCf26wkPieBR/Pm6Y0v2+ZwTiEGowV0YNCFkjTSmw4LIE9Y84jGc3Tuw0CK0zN1VSC
 uDMHzWx1MXOo0ppbzjiJyYQKFMMm5y8AuTDP+V+K3u9YLh7jCGNEVrq2LcHTG7xuZL5fRUDTQSB
 xeWgIZNtDUK5+QnWcPa3V0MX2XfKVdjUeZSjH4Qi2rfM0rrfSFArJ336ug2dCoADKKVALa+du+4
 4y8fV9Lr
X-Authority-Analysis: v=2.4 cv=WId/XmsR c=1 sm=1 tr=0 ts=68a8b7af cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Acj4BH8ZA6BBt8B7gSkA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161

On Thu, Aug 21, 2025 at 09:55:30AM +0200, Steffen Trumtrar wrote:
> Add JuTouch Technology JT101TM023 10" 1280x800 LVDS panel support.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
