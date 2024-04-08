Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com [67.231.157.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1E69DF5
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712576675; cv=none; b=BYltMg7mcp2m1TlhCf6Ka/EQu4nJrXHEUAt7uXdzIlYJSz+3cn/IS6UU4q7IPzZNcmdvhDxdcZnbG+taL9fUAl5HMsVnUjuXM/bNKFCDuTltEcU5y8F53DyQ97Vm4yrwRSIcyglfeeXeHuF7c4b5X4/uAPnSkrrx7E1iQTGGSuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712576675; c=relaxed/simple;
	bh=gfhvyNWSMWsFDpAHxQSNSe8Ks7o5V+5CUEMbz1tB7jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBHDD2M18YmCwxBiLOG3Dt+4u4V4T+NU4b1Yzw6dIV9YnWKGyACjaVHBCWxUMy1p74JufdPxl2d2xfTiLsRzUF58qjnhN79gBNKQv8aSRTMehg8++7PSiIapj4uG5Tsb208m2DmPTfUlk0urghvaaQWJ3PFysVyrrYqBT09KAg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=jvXJB3H0; arc=none smtp.client-ip=67.231.157.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="jvXJB3H0"
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
	by m0048206.ppops.net-00176a03. (8.17.1.24/8.17.1.24) with ESMTP id 4389ojZ5022343
	for <imx@lists.linux.dev>; Mon, 8 Apr 2024 07:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=outbound;
	 bh=0zih8xpmKEGXnHl6kNe1okyw+V1Wkzcjhoafj6sdOQ8=; b=jvXJB3H0F3rO
	C+GYCNCtZWPEuamYLMa4B/+KbiW8eoS3qoCwgT7J9Px0umtcw2S8zHd1rgDRkB2v
	qk0AAsBSGlm+EQb/z4edS+1e0/JocJ5IfXL4nMffXtMwqByL+wXSxV5yXRKfVUS2
	/l6JpSkBXRUoMPEjPrhqSHzcpAQZXr7v1lscHexFa3wVOMO619gWvuUet+Qqns7V
	WFXpNwddj1cBoPndthFBQaED3+BIESml+rw3YzFIMQxpCDcAv04ZKkVag48EOn8j
	j3i9U3qG3YZ6aX0tZDkU1g4zKcH5FqD+afWmFbOsqpoej6HT8Jsz7oxFjDoUa0y6
	i2A7R04JUg==
Date: Mon, 8 Apr 2024 14:44:16 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add i2c{1,6} sda-/scl-gpios
Message-ID: <ZhPYkGLM_b5IEKs2@de2cfed78370>
References: <20240408092449.6-1-ian.ray@gehealthcare.com>
 <CAOMZO5B-vTRSfi=tNc_iZxnxYstL8JJOd_1rMf4ps9WHyfx0GQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5B-vTRSfi=tNc_iZxnxYstL8JJOd_1rMf4ps9WHyfx0GQ@mail.gmail.com>
X-Proofpoint-GUID: M-p17AxnN_vvA_DF5lnMLQVIFesZb0Cz
X-Proofpoint-ORIG-GUID: M-p17AxnN_vvA_DF5lnMLQVIFesZb0Cz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_09,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=676 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080089

On Mon, Apr 08, 2024 at 08:31:53AM -0300, Fabio Estevam wrote:
> 
> Hi Ian,
> 
> > +       pinctrl_i2c1_gpio: i2c1gpiogrp {
> > +               fsl,pins =
> > +                       <MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14              0x400001c3>,
> 
> The Sion bit is unnecessary in the GPIO mode so you could pass 0x1c3 instead.

Thank you -- I will submit a V2.

Would 0x1c2 be more correct?  From the IMX8MPRM.pdf, it seems that the
lowest bit is reserved.  Example: 8.2.4.158 SW_PAD_CTL_PAD_GPIO1_IO05
SW PAD Control Register (IOMUXC_SW_PAD_CTL_PAD_GPIO1_IO05).
