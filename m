Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6CF25392E
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860386; cv=none; b=SYP5qenUnVOwjxEyxj3xL252/Zw5UUU9jA5GBqW8MzSvroMbJJCCq+DyhRdcD1WqpgFbCPXz1zJZC66DS/6z8ZQEGlzFPgPxJq8T42AF/7JwTxKom4Zjpwu7rbyfdiMDaJRGuTMb/P837DG9N5qZISUMFhZPv1OtxlfOi/zhjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860386; c=relaxed/simple;
	bh=yPImR2FR7PHscbj8FO5MYpY++3jeaaS6t1jVeZ0eY/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSPaazvIL8gj89VT/zCVSTvK1VMXNChjbfNBWy1jWeE6Ak/UJ8Z04FGSQIRdWm8dA6n+/yOokDhBKpBgK6nRIXxsJ+Ldn1qKgbqrIbiDlnrXA7gJBnqMs5DjHpbyrXxiffzWXfmKqOhVPVRRhQkZmOa+nLAgtzFgNH0pqECPhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Unj/yRPD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Unj/yRPD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-309fac646adso2843064a91.1
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860384; x=1746465184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0aWcmtL95uQeYsQHUGFsCmGq4ARE/rjVxbyBKZAibqk=;
        b=Unj/yRPDiFff93KHackW3z/oNPFcRJivVj/P7SYFIOIB/PnHkh93BmLa7/fvik9Bhv
         IT4DZliTeq/gNmRR14yKObZsCRZvAeZGSLX5YcPkbDqTZd8fUCj9LI1D11/AMxMXA0fT
         H2nFKi3EQrCnyam/H+mVoJXey/+b5uPiBvhHoUEMdl5+iJu+xstVvSn6z8C/ltqrAs3h
         TauwRHI8T08W2nxSvp3maI0PCTojuTCvCz1kNk5DqSKUliUgIC7psZjS8tIYR+YrdLeA
         pGBF87S5SuMDZzGQ/dxdkx25WwGwW1o/V5TbdoFUbOAAPJ0idzvi8x8nnSKEL3398Mgn
         MD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860384; x=1746465184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aWcmtL95uQeYsQHUGFsCmGq4ARE/rjVxbyBKZAibqk=;
        b=XEq0iWinJQ7s5QSeT64xpzp2zI6nq2VtjN1SpM306sCIbVKCdxQX+3bXsScL54b9jD
         3/uj8P9ltye6eXqoHAA7Vjdj2HaKZyQe1LwVK19gsBkhAe2b5SydmtdBibXanfdqBQ71
         BFqPAVSnLE0SLPd2/0oiqK1/qlTBC/yn+QYlHISbNyVG53BdX4aNRr68Gde09iDDYLlw
         q3707FBu3EG5IknZYUSn+37Ha2afwOxAA4l0UdNLlnjCDXgYkGWKH6XzDyLkr6cspqWP
         YVIygn8JKWXcXsqJpWD+4AxLsp75/Qv8b00PVHoWXiHrH5jfdfF0Ci6Sho9vATGKYYSM
         4CAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPBT0q484nMTH1ET8qaQuyOa5QiVD6/pInKojau23rm2zXDI1r5aTosTKmgaVFsweCOLA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGBtT4QJmPFwLZ6UQOrgE2GIHvoiGG8FEbftOQfW7X8qJkMrCo
	LVxqTw9mADE9pgfLMZUWGNG71yrSkTsUYMPuT/8tpAV6ebRWAcSt
X-Gm-Gg: ASbGncuMtcBkuxOeKWI0erCn0w8q+B48SFgrCEzzhTtRZ7/qgCY4EBjWcf60x+GGolm
	zQiUP31kaxKsdS+ZbvMH+/65r5RnaihlkMYwMmWb/e78s+9t93iECqmFomf8FVr0lvxHIlGu1uE
	PyVVi2Wwopzuv4rXe1kog0EjM/IrakeCMecejUyGnyX7w9O5hU8Cx6o6T2/DSRrOJ0E9AsYQc9G
	yk3xKXY78qdKEsfaoCk43KZzUwNwM+vRrxBo7w9epPk++NflHGm083gyAEthtRK55xPVZJWVwn8
	+otwdrYPJKohyQtNQERbO64BYMcV+pv2U/IUTCc=
X-Google-Smtp-Source: AGHT+IHWOIDd9y6vr7huqtxupJfN3hpUaBQLaUlNnozyWv6aH7mSCdhg1ZQngv1XQveJdMkPOacF4g==
X-Received: by 2002:a17:90b:2550:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-309f8a24cc1mr19035414a91.15.1745860383598;
        Mon, 28 Apr 2025 10:13:03 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1475c1sm9321785a91.45.2025.04.28.10.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:13:02 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:12:57 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250428171257.276bqhaupe4ksu5l@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426134958.GB13806@nxa18884-linux>

On Sat, Apr 26, 2025 at 09:49:58PM +0800, Peng Fan wrote:
> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
> >Hi Mathieu,
> >
> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> >> Good morning,
> >> 
> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> >> > From: Hiago De Franco <hiago.franco@toradex.com>
> >> > 
> >> > The "clocks" device tree property is not mandatory, and if not provided
> >> > Linux will shut down the remote processor power domain during boot if it
> >> > is not present, even if it is running (e.g. it was started by U-Boot's
> >> > bootaux command).
> >> 
> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> >> unused and Linux will switch it off.  I think that is description of what is
> >> happening.
> >> 
> >> > 
> >> > Use the optional devm_clk_get instead.
> >> > 
> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> > ---
> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> > 
> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> > index 74299af1d7f1..45b5b23980ec 100644
> >> > --- a/drivers/remoteproc/imx_rproc.c
> >> > +++ b/drivers/remoteproc/imx_rproc.c
> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >  	if (dcfg->method == IMX_RPROC_NONE)
> >> >  		return 0;
> >> >  
> >> > -	priv->clk = devm_clk_get(dev, NULL);
> >> > +	priv->clk = devm_clk_get_optional(dev, NULL);
> >> 
> >> If my understanding of the problem is correct (see above), I think the real fix
> >> for this is to make the "clocks" property mandatory in the bindings.
> >
> >Thanks for the information, from my understanding this was coming from
> >the power domain, I had a small discussion about this with Peng [1],
> >where I was able to bisect the issue into a scu-pd commit. But I see
> >your point for this commit, I can update the commit description.
> >
> >About the change itself, I was not able to find a defined clock to use
> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
> >something? I saw some downstream device trees from NXP using a dummy
> >clock, which I tested and it works, however this would not be the
> >correct solution.
> 
> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
> i.MX8QX. This should be added into device tree to reflect the hardware truth.

Is this correct? I added this clock entry and also updated the clk
drivers to handle this option:

diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
index 585c425524a4..69c6f1711667 100644
--- a/drivers/clk/imx/clk-imx8qxp-rsrc.c
+++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
@@ -58,6 +58,7 @@ static const u32 imx8qxp_clk_scu_rsrc_table[] = {
        IMX_SC_R_NAND,
        IMX_SC_R_LVDS_0,
        IMX_SC_R_LVDS_1,
+       IMX_SC_R_M4_0_PID0,
        IMX_SC_R_M4_0_UART,
        IMX_SC_R_M4_0_I2C,
        IMX_SC_R_ELCDIF_PLL,
diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 3ae162625bb1..be6dfe0a5b97 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -142,6 +142,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
        imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
        imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
        imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
+       imx_clk_scu("cm40_clk", IMX_SC_R_M4_0_PID0, IMX_SC_PM_CLK_CPU);

        /* LSIO SS */
        imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);


However I am seeing a permission denied (-13) from the imx_rproc:

root@colibri-imx8x-07308754:~# dmesg | grep rproc
[    0.489113] imx-rproc imx8x-cm4: Failed to enable clock
[    0.489644] imx-rproc imx8x-cm4: probe with driver imx-rproc failed with error -13
[    0.489708] remoteproc remoteproc0: releasing imx-rproc

	imx8x-cm4 {
		compatible = "fsl,imx8qxp-cm4";
		clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;
		mbox-names = "tx", "rx", "rxdb";
		mboxes = <&lsio_mu5 0 1
			  &lsio_mu5 1 1
			  &lsio_mu5 3 1>;
		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
				<&pd IMX_SC_R_M4_0_MU_1A>;
		fsl,entry-address = <0x34fe0000>;
		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
	};

Am I missing something?

> 
> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
> 
> 1. M4 in a separate SCFW partition, linux has no permission to configure
>   anything except building rpmsg connection.
> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
>    In this scenario, there are two more items:
>    -(2.1) M4 is started by bootloader
>    -(2.2) M4 is started by Linux remoteproc.
> 
> 
> Current imx_rproc.c only supports 1 and 2.2,
> Your case is 2.1.
> 
> There is a clk_prepare_enable which not work for case 1 if adding a real
> clock entry.
> 
> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?
> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> if imx_rproc.c is built as module, clk_disable_unused will still turn
> off the clk and hang M4.
> 
> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> unless pass "clk_ignore_unused" in bootargs.
> 
> 
> For case 2.2, you could use the clock entry to enable the clock, but actually
> SCFW will handle the clock automatically when power on M4.
> 
> If you have concern on the clk here, you may considering the various cases
> and choose which to touch the clk, which to ignore the clk, but not 
> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
> 
> Regards,
> Peng
> 
> 
> >
> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> >Cheers,
> >Hiago.
> >
> >> 
> >> Daniel and Iuliana, I'd like to have your opinions on this.
> >> 
> >> Thanks,
> >> Mathieu
> >> 
> >> >  	if (IS_ERR(priv->clk)) {
> >> >  		dev_err(dev, "Failed to get clock\n");
> >> >  		return PTR_ERR(priv->clk);
> >> > -- 
> >> > 2.39.5
> >> > 
