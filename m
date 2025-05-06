Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFB7284693
	for <imx@lists.linux.dev>; Tue,  6 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544900; cv=none; b=JFypWP+yLqFgIY5v2/TiVk4tIWRZm16ZiIqpsf0Sq+/NDb3mUIBbXpoxDwmK87/19FikXDmlld5yjjVk9Pv8CDV/r0s9h1qTVqZVA0Ctc4nO3bOUs/7ORPHX4vh8kMRmQ2YhuCq5H68Ai8VmKadFLpZfW7GXkZbccNqymQc/KKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544900; c=relaxed/simple;
	bh=RrFCrLCDb2vVGDp7qDTtvDgB7VhO8TX1bChwTPYRekQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f34C4pX4oxM/n7jsybnZVJzhzeicfvMR9KEVSg0oow7cReUZ13gq/8+n7iezinV4+PsaUzpAGfYEtFLOM+oOz7Rrue6Ko2n0eIWUDzv4ae9+EYMsU3VRhtoSMjIBEm6KSBU6rLZ+zbExA37XDduta3jUYCVMpRz2NYxjEcN2HrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOCajwht; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOCajwht"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22438c356c8so58127715ad.1
        for <imx@lists.linux.dev>; Tue, 06 May 2025 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746544897; x=1747149697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=SOCajwhtQSDdAdUFQZE1oO2Kz2lwKJOdnNmVU7ZufwvDlD3WtvFN6a+brCbw/k8Hn3
         ViB0HrxBFvtbtdRXGENWFTiVLFKi2YJI0MhR9j3hmBgwl3HqGzxFYypCHYoFl4MmEbKu
         1r0wuRjBCbLifEGQRCM4jlY/I5h8EvzwXzXlffcGUuHz9eBu1MFL6M24eDJ2BXoZuXBU
         A477lHcLpJIE+MCFDXg/MZN7eesm0UM5tjO+ZjDBt905WfRoL31yAK1VetZlcE9ATo6b
         aJG9gwyxVC228LGvQcTFoY8z4vQVdEosbNx6rV0LwI7tZnzmWiMVvum/cKqM/BHo11Bd
         i3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544897; x=1747149697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=lOftXC25lNkYJwnwRolZJZ9JN+yYU0BO0FwMY7GEnejV01H5NE5nyClPdiDBYZih+6
         tJTZpbbUq4+JeYXuDsGPEnR5Ex88YOviymhX4k74ulCj/ebclME7ruaoiq1ALEXly/lH
         GOH7PvzJqK6/YcGcCj1zEhEpls6CO+ic4rXZ4aIE9hQ0/0uAt8vaPJjRs75dT/8hU48L
         TZBMW0rJYygF2Ktt1CG3OBolg35OJH1ggIv6H2u7muxbIWvSons5Wu7BEpPFydRDmx3M
         hSlFTYmFY169PYSNADEfMf5VljDUuNJgzLEu/5qHmZTm6EffOzSQBiFvfvo6tzLuKfM/
         9r1A==
X-Forwarded-Encrypted: i=1; AJvYcCWqONLhIxWHY9pibWSoX0A5tAJ+ATV7GJUZC1aoxQMEBLh5i+zHFJf0xLb/0RrMuvJhgbA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwisJkNMygieZCgvWKGXd+nIDAE9DFeRM+MxdlwP5gmTMs5RTcB
	oR5OPIHtA76ZQm/Yz6/OWlnrnxWkWAD+j4/Bak6GfqjWnyK/We9pWv46uQGoMP4=
X-Gm-Gg: ASbGnct3F7o0G4xHCPgxyHW+TZafC1h8eGgSqOvbYRsCjNfBSzygbiYVaEhhC1rPujM
	N4CriZVJ4wCtgo8EHCuTQ3P96mBRwQGbGlcI/jmKUILfoxiglvSUxTui/4cmwMd2z0Rnt7Xbwjk
	Oio5q5rtmQq8fmb0cNuf6dPQJDJS+s0zmygqGTmWVevUJcn1UXlIQeHj3BXFUXmtzhqG9bp8+9V
	COsBLy86qwaKdHHj+opKgk9Ab6pZl95eEdNwZffC32Phep2lotENt0J4WZ6iL+cY4SszhpDECci
	9yhHJxOgzxB3PiSZE1h9QpB/g1c2t+gJ1+UNr5iuow==
X-Google-Smtp-Source: AGHT+IG9qR+Bw2uygv8xQSXKT77iYKR8E4JwPxPN+b6XzkhfQ8z4EFuMOu2q9YdcGCpJtb1y5nY+aw==
X-Received: by 2002:a17:902:d40b:b0:22e:4a2e:8ae7 with SMTP id d9443c01a7336-22e4a2e9073mr19297995ad.22.1746544897093;
        Tue, 06 May 2025 08:21:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fc7c:b927:d229:c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232224sm75295875ad.253.2025.05.06.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:21:36 -0700 (PDT)
Date: Tue, 6 May 2025 09:21:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core
 is managed by the SCU
Message-ID: <aBoo_p1KlmOieJ50@p14s>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-2-hiagofranco@gmail.com>
 <20250506043835.GB24259@nxa18884-linux>
 <20250506123619.egobussm6b74imso@hiago-nb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506123619.egobussm6b74imso@hiago-nb>

On Tue, May 06, 2025 at 09:36:19AM -0300, Hiago De Franco wrote:
> Hi Peng,
> 
> On Tue, May 06, 2025 at 12:38:35PM +0800, Peng Fan wrote:
> > On Mon, May 05, 2025 at 12:48:47PM -0300, Hiago De Franco wrote:
> > >From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > >For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > >before Linux starts (e.g., by the bootloader) and it is being managed by
> > >the SCU, the SCFW will not allow the kernel to enable the clock again.
> > >This currently causes an SCU fault reset when the M-core is up and
> > >running and the kernel boots, resetting the system.
> > >
> > >Therefore, add a check in the clock enable function to not execute it if
> > >the M-core is being managed by the SCU.
> > >
> > >This change affects only the i.MX8X and i.MX8 family SoCs, as this is
> > >under the IMX_RPROC_SCU_API method.
> > 
> > I would rewrite as below: "
> > 
> > For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > by the bootloader, M-core and Linux are in same SCFW(System Controller
> > Firmware) partition, so linux has permission to control M-core.
> > 
> > But when M-core is started, the SCFW will automatically enable the clock
> > and configure the rate, and any users that wanna to enable the clock
> > will get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> > gets failure because clk_prepare_enable returns failure. Then
> > the power domain of M-core is powered off when M-core is still running,
> > SCU(System Controller Unit) will get a fault reset, and system restarts.
> > 
> > To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> > because SCFW automatically enables and configures the clock.
> > "
> > 
> > You may update if you wanna.
> > 
> > >
> > >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > >Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
> > 
> > -> peng.fan@nxp.com
> 
> Thanks for the review, I will update the suggestions on a v2. Meanwhile,
> I will wait a little bit for other feedbacks.
>

I suggest you go ahead with a v2 - I have a fair amount of patches to review and
my time to do so is currently very limited.

> > 
> > Thanks,
> > Peng
> > 
> > >---
> > > drivers/remoteproc/imx_rproc.c | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > >index 74299af1d7f1..627e57a88db2 100644
> > >--- a/drivers/remoteproc/imx_rproc.c
> > >+++ b/drivers/remoteproc/imx_rproc.c
> > >@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > > 	struct device *dev = priv->dev;
> > > 	int ret;
> > > 
> > >-	/* Remote core is not under control of Linux */
> > >-	if (dcfg->method == IMX_RPROC_NONE)
> > >+	/* Remote core is not under control of Linux or it is managed by SCU API */
> > >+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> > > 		return 0;
> > > 
> > > 	priv->clk = devm_clk_get(dev, NULL);
> > >-- 
> > >2.39.5
> > >
> 
> Cheers,
> Hiago.
