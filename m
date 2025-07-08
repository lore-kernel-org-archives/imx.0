Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD342E542E
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992802; cv=none; b=jQVKLGGevrXVb61lo0o2t0SWC/kt4W0kZRGSAaTUkDlpKHFbxrQXnwvSIKXt94ZCTTySVYK+UVw7+nvyEwstjtQCNcGfafsOQ1DSuEr03auEAbM9zNsvJu0lNgFxNxRl4+NhOsQFhnG+JJK+3y10slh5O6NhpbA3k1hcjPADemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992802; c=relaxed/simple;
	bh=XrRWcUPg0gmCaugL4AqdIxVcA/fgtzY2T3UQnwDgL/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXgzjwZ76G4pGX/MzD/Kd43L4OApmoJdja+CkkNojpnM1A0tkaMJsYksc8D2npmgkHMl0u8F/kvmgWSKr0/0KAcWAbL6xKNyI7GUQ+pljt/s89bdhcNCK0Mn3mOwRmlreyU4LIqMrIcLWYdKKBGzaPEklulolW/dZ8t/vxzYRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFJJdTkg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFJJdTkg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236192f8770so658005ad.0
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 09:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992799; x=1752597599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=;
        b=MFJJdTkgitvQ+Kz/wQsOvpaOF0SaOJPpmlmYGS+9QiBpRSHq1IzToImVcFO1KBcIZe
         5uL5uLLUmNxXAGzU4ubUcxYplpKwNkNCS7BMbkR8k+URdDX/IJUkIBdWKl86CJHlGFD2
         iWumOrsTbxwGQ7cBHiQvTUtFRv1z4SVdwZCWyyvCTUfDea58N7GMXfVaURiPLr/Ftsin
         Wl5EVCiYZZH8F1kRWIXWs1J/87a81fzE0YeKbkiZPpIGeTlofSDT+lqn5Mhwt856BxiN
         0p1Aj/IIMZDfHkviZIKblryBgRwqQlfL023f7W76B/MtcEV3cBYg6Nu/33zcyEo1Zvl7
         dd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992799; x=1752597599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3QtUO+mox2CABNnuiEmoJosMc/S7Dy/CWYLY5RAJ/U=;
        b=HWtd99XV1He9eM5cjiKcLg8TZ79/mKpKDGQDx2Gjd7aBQhaoczWevXB7zP2Ngs23fH
         1SfUzlBSg0v/AXcjFdvqdW3gKNus18C+ybNJh5B6NBEcO8WyeE9jogmrvyG8NvVI+ZUT
         f6Ol15VUGX9CqUKasko7KmRrF68mVAROezrfcfXEELIq3FW+h7zkw+wlIsvgaVnJcAbx
         9/IQCwiTpGD/EYf3bFo4Q1P7an4QlA2If/v7GWnLhISSKxX9YXgRLLcfhkt179kbkBew
         KPyNCO5+G+ijFKKJwlP5R61Us4XCHu7Pq0Ngg0UPCW+o9pN7YBGLu34gKfhFY57rtNRB
         +Nhg==
X-Forwarded-Encrypted: i=1; AJvYcCUYXSYk5ih707K4qWYpSaegzxNBR/V9BlhZihE7MHgPsjclYBjvY5yJDnTe/JG3Ke9YV5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA4lVONCjz0WWsHAqHyDp8oyA2561NIkMKV4UFqQz35ShpLxN8
	DAoeQe13imuXiIjhjQoie2jPAwHIRzLAgKvGojCVRM99xSwMY2ZvA2NZrrtYysv/WvA=
X-Gm-Gg: ASbGnctbMrd2zZrEtFjX19x6FrMdumlCR7cjeA7jifl2DfkyH0/S4PtBAqBUcOFBHNb
	hqQYxZ+nInNwKsElBEyPaWSqUPsfEqvZoJZbUa+CB6k2iDif9XixPJPeH66qLwhv/59ysiZAL1r
	IU2OAbtX1df0iL/dZwoNBqrwvgEfcyt4Rqcz6VXnSHq0HXQLzZSzziuzAJeko/7tr1mxb+DvKsK
	Oa9O+JE0yyPOAU6X5B2L9BoXDoGZLNwVXKB9XHVF/29xLprXfnU5azXWJZmGdpcLLdWI4/8s6eQ
	HhECOKr0SuT8oX6/365A2Jz5ZzgxXiXNSczfwwg0uD3Avt6oNhthOYvDqdkh0CIHFA==
X-Google-Smtp-Source: AGHT+IFj8nhxMS1GDmay5meyEAJ4wmQBHnfoxVzxfQ/DjVHpn1xffU3YRdB8/FjZpsJTq7vNTw85+g==
X-Received: by 2002:a17:902:f74e:b0:23d:d290:705 with SMTP id d9443c01a7336-23dd2900d0amr27843715ad.3.1751992798824;
        Tue, 08 Jul 2025 09:39:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c5cf:9364:ea5e:99f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e1c8sm123626055ad.42.2025.07.08.09.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:39:58 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:39:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aG1J2_nK-LkLQVRj@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>

On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -73,6 +73,10 @@
>  
>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
>  
> +/* Must align with System Manager Firmware */
> +#define IMX95_M7_CPUID			1
> +#define IMX95_M7_LMID			1

Any reason those aren't set in the device tree?

Thanks,
Mathieu

> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -126,6 +130,18 @@ struct imx_rproc {
>  	u32				flags;
>  };
>  
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> @@ -372,6 +388,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.method		= IMX_RPROC_SMC,
>  };
>  
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
> +	.att		= imx_rproc_att_imx95_m7,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +	.method		= IMX_RPROC_SM,
> +	.cpuid		= IMX95_M7_CPUID,
> +	.lmid		= IMX95_M7_LMID,
> +};
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -1301,6 +1325,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
> +	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> 
> -- 
> 2.37.1
> 
