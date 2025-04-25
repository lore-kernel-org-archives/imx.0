Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371828E614
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595948; cv=none; b=kvfoSIFM89+oDlL8AOL2WUIA/kaohRL9Eeflx1+KLBtqGPTfeos3/0+bTwGaxeHEWWnBPp1PxyfQNjIt44xQ65npQFR//zEl7Fz/4fHQwOFOItwuu6H5BQBUfPqKxUMPj0oH02CLgcClrwP+QHgp5DjPB76ahDHUvXsTFu6icWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595948; c=relaxed/simple;
	bh=s6S6tqtAH7VBP94mPMyDnPIdCggzBtOxIijklT/Atao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6CHYhXC1oWZA9AEosQJaFQ58ozl0qfUaQJeSX/xUxAnXbZ76TxBBoDEBw2HYMQYGQvaQsu6hezSx12OZrZXeAUmhzYVtbcF6ianXN2aqIeKZYSjsDsxvuIcdPRRTl+WMb/WnkOf3s6+Ki47vo6WcUNGQtFKF6zwUeXZ4A83gHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sjdAs3p3; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjdAs3p3"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso4577200a12.0
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595945; x=1746200745; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=;
        b=sjdAs3p3pyf03Kmlj5reb2MT1/2+GgSpdgh052tA/AXx2nKN7vhOYRhWBziRw4wRbb
         WX/wHDVPmfACyU1IXRIJImS8C8y8yx91GZcntthZVLBacHUsENmmrTb96gu/5krkJIPH
         +JzGxlpLtagRxesPs/ad4Byt51aRNeJ4bPAfQgZGLh1kCNnaIZ+uQHVkoIvVDN2pcSrA
         hnrJocWxJN9PuGPv7+Woba+CrJ/URep+MZRwmQPbmn4DKbFkMr7nrXEKoTtfboGAvzKf
         26Y2+Dx3E3SrPI1k1evHOQUVWGvnfzEg8nM5JY8dAe00kFtVLSvGKRiS7nAD//Acuhp7
         fYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595945; x=1746200745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXs9FQjEaSP6AkNuUDmsL7Vk1LpHpl5rslliTD8xE54=;
        b=EbzQ0MioAMSg8N5IgiiJ9FXrAC7DxYocjACk9g7C0PblT1sAhNaUS14lfaZli7UmE0
         7QA99wiwlxLkjqA9wq3MKMZPc8b4veMRyWFugM4o73Yd+HY349i9cj3IdN56xz91EcIh
         BvcaZLoTnxgee23DaS3biPQd2+ZB7G563IUKrGX+Vl/ojUABlurH903xPKydhw7BOHlZ
         Tc4vBZWKoYP+fNui6ZayNg1okby77zNzjTyS1pQO+TBPTefarWMEvVMnECbGjQmL5UkO
         erH0+63T2x/u9jyBrkbSLz6c9UZVCRocuJMwDah2jnSvbO40kBIzGERdTeTxmXGBrxsY
         OBzA==
X-Forwarded-Encrypted: i=1; AJvYcCUKz30894zzvkJI3UudJ1GPwZQWv+fbRxbs6YfWCVYmFy2xnxmxQqtvemeLsn+T1uIj+Mo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOQyVdC5GmksOMwhHb5ZpnvUfl0cE+CqY7q4rlafBdTGxMoD4G
	atlI2uLTtVXWSTR4XmmC16MLF9abBsMWJZdJZWchJ1hqqvsctl1MNP1KITHZcvzXinSxAQOsGri
	ibxV36ex9VCBc0uSFMWFCHlwSi6xmJe/dzQeqDQ==
X-Gm-Gg: ASbGncuuAHImY70+53NCwOq9uzaxyEe5VuX+dxD5fye44CHAgDDgsghhTR2cfJClNy0
	nqrsaPJVcrpamDdmf0dZShqaHSE7Su7IP1rRYJc1V6QBSq3vk5NM3Q8oDFSJlmXTB8m+/tSuEKW
	8c8P1ZJXdwBFpZaeG4aNkT1AbCTsH0PhT0yy4Gvk02A9uQbu8y0u+pS0At
X-Google-Smtp-Source: AGHT+IFXUbwR8lWOZRe6i8l4qlKEaAy0lQrqMm3qm7cct6CH/tyqA5l2fVQXchZfGfEONa/1rSun0UddIdjxj4mkjSo=
X-Received: by 2002:a05:6402:3490:b0:5e0:8c55:536 with SMTP id
 4fb4d7f45d1cf-5f722673509mr2375476a12.4.1745595943758; Fri, 25 Apr 2025
 08:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s> <20250423192156.b44wobzcgwgojzk3@hiago-nb>
In-Reply-To: <20250423192156.b44wobzcgwgojzk3@hiago-nb>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 25 Apr 2025 09:45:32 -0600
X-Gm-Features: ATxdqUHU3-XEnukdUIRYxREV00XSdPXJg99nk4e8g7abiVI9-VXjzJzYla2eMME
Message-ID: <CANLsYky2OyrVLqm5JWOQaFhR3Fxt0d_p_HG4-F1o-Tnh=OP3dA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
To: Hiago De Franco <hiagofranco@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	linux-remoteproc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 13:22, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hi Mathieu,
>
> On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > The "clocks" device tree property is not mandatory, and if not provided
> > > Linux will shut down the remote processor power domain during boot if it
> > > is not present, even if it is running (e.g. it was started by U-Boot's
> > > bootaux command).
> >
> > If a clock is not present imx_rproc_probe() will fail, the clock will remain
> > unused and Linux will switch it off.  I think that is description of what is
> > happening.
> >
> > >
> > > Use the optional devm_clk_get instead.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 74299af1d7f1..45b5b23980ec 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > >     if (dcfg->method == IMX_RPROC_NONE)
> > >             return 0;
> > >
> > > -   priv->clk = devm_clk_get(dev, NULL);
> > > +   priv->clk = devm_clk_get_optional(dev, NULL);
> >
> > If my understanding of the problem is correct (see above), I think the real fix
> > for this is to make the "clocks" property mandatory in the bindings.
>
> Thanks for the information, from my understanding this was coming from
> the power domain, I had a small discussion about this with Peng [1],
> where I was able to bisect the issue into a scu-pd commit. But I see
> your point for this commit, I can update the commit description.
>

If commit 4f6c9832613b breaks on your platform then it should be reverted.

> About the change itself, I was not able to find a defined clock to use
> into the device tree node for the i.MX8QXP/DX, maybe I am missing
> something? I saw some downstream device trees from NXP using a dummy
> clock, which I tested and it works, however this would not be the
> correct solution.
>

If we make the clock optional, what guarantees do we have that the
clock the M4 is sharing with other devices won't be switched off?  To
me a clock needs to be defined in the device tree and referenced in
the remote processor bindings.

Thanks,
Mathieu

> [1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> Cheers,
> Hiago.
>
> >
> > Daniel and Iuliana, I'd like to have your opinions on this.
> >
> > Thanks,
> > Mathieu
> >
> > >     if (IS_ERR(priv->clk)) {
> > >             dev_err(dev, "Failed to get clock\n");
> > >             return PTR_ERR(priv->clk);
> > > --
> > > 2.39.5
> > >
