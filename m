Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBD1F3BAC
	for <imx@lists.linux.dev>; Sat, 26 Apr 2025 21:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704084; cv=none; b=h4RbpyJ+nZqRLaf3iHVHfY4wO//Ab5UJJr8/tSdO2EeDwlUYLFOKBCLhCawEa/XPAAIW/kHC4nRiLnxzXS/g56pWQt5uRDnV0pyeofATtYqZlxfoGmBOcda93cfc62s9z/OkJWSEo+AWMFip8C+2RigTHQJsXdLOcMkycjJrYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704084; c=relaxed/simple;
	bh=oWYLX7dpN+fD/9inCG2hgdQ2kFKwj94e3UoW+HiolvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBdjo0QlT2X3X6CdzdYvdZB28ihLNFgyHrShrE7mLMsozZlPwIB5QPK3Z8X9xFe86jFYkh9lAS0xeX0JRx5+z24BBxwpaFVUkoVoLpJzqxuJ635cgd/N9pgGlwH37j1jrZre96NaJTOP89ldr/8cFMpv3oXJpIb7gJGW9T9QGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLQ7QfUQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLQ7QfUQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6640103a12.0
        for <imx@lists.linux.dev>; Sat, 26 Apr 2025 14:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745704081; x=1746308881; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=;
        b=HLQ7QfUQJTUgvwY/0egBODGQPMYzyM61VJL/bi4922QjHBMsNd5pWUF3Msl7H98Ax1
         UiDRrw3J5s4VTKxs4CvlszoZ7F9tlsIhz94GnaS5GKcOaB0rJhikqBXeNIxYAOtsVY+O
         SCxTfcB1Pxh4QEzJYiVr7gBIoD1iKRZjBVDZ4pkk8I3fkdfsjXNIWa5KHhA7Lvmp5JyS
         oT7irJkg1EVpMddozfXXHuGhswAqHSrYz2QqGqyjWNSdP+R7G8KFC9h1XfXGyB56ncf3
         NMd6+vh1TNh/azw7d2RXDrjrmkb3agbYDioczVLlouuyzAnB9xItYp00fIjKAUJDX6im
         g5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745704081; x=1746308881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkBG4q84aKP7XuricBxZ0SqZkCQnMNoFILLSDq32ATA=;
        b=KjWcnNVatXWitLcwKjw4gTY2DhbsBVA/9uYQ1JGO9fqDCKsBWHbQs5UK0N60VItiYB
         2nKO0DxbzdJgJMBFmCOqc+0NMYLIEdH4ljud5HkXtY4jPYjb3WhjMzihdACwBRIyXbEw
         o4bB6v27bncxTLFelbFBkZkKMNiiedcBr/mNKUYaOPYyYQcfwZgW46q68Wwdyz3jnF3V
         7pAlimNuRgb66yYkMmGrIEFB2xMLtMXgUKrJx/KoXW/roKv7Ol4jEftfPV/uFnCY0ra+
         j5GC9bXIEF6RCvNAkx+Va5KsKBIOV3B5vXzMkLflhzNIjK+/mh9K0XS+qe4p9IEhBDMT
         OiSw==
X-Forwarded-Encrypted: i=1; AJvYcCWW6eOZdx68ijafkI0dviZslJHPUff+BIVwvsTz3zPtE4k++catAwB7czHEXwLT3NyGiO8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqZgPFO99cKfHT6Ea9Z3lStORqzZRhtrUm3EPg8b+zZRRh3sc0
	EHnVmKl8/fcvUh7jGmo8qjh48QmULLXUq6inNEOSYgL+PUjUV9GXxs0gYcizCCY3xZpTeSqqtoG
	s/qtujB/o2rtL5M3k4rIAqn8pWq6IeIgbvx3lWQ==
X-Gm-Gg: ASbGncurieF+UXBybAp0ftvIiJW8kRyVrQPJKOl83O1Nse1o96m4nFi20jq1uNPbztP
	yv/WAGMhnaklAJasuWPP6At66r20fWZzcexL1S+TOwjwyKtAxD839LZ5e6j1qqxycENoNNzF3A0
	k7itZH55c9IRrFbpO1NrbEZQUdAGZOX1Sn2hJq2hctosKPwWj8HNCz5+9Oat3l9/7DrI4=
X-Google-Smtp-Source: AGHT+IGQG+/iNDNxq2Wojrkp26M1m1o/MKvGupfTVFI6rnZy3H/DlTzVUpcASBLitbwtfzmCUVICXWKVbeUjUf+UKWY=
X-Received: by 2002:a17:907:7ba3:b0:acb:b6c9:90af with SMTP id
 a640c23a62f3a-ace848feea2mr331721366b.16.1745704080990; Sat, 26 Apr 2025
 14:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s> <20250423192156.b44wobzcgwgojzk3@hiago-nb> <20250426134958.GB13806@nxa18884-linux>
In-Reply-To: <20250426134958.GB13806@nxa18884-linux>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 26 Apr 2025 15:47:50 -0600
X-Gm-Features: ATxdqUEjP3yZ0cE-UqcG-bjotjV4NxJHuMem2scnUTZE4sa3KXJBizNJEQMu5o8
Message-ID: <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com, 
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 06:41, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
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
> >> >    if (dcfg->method == IMX_RPROC_NONE)
> >> >            return 0;
> >> >
> >> > -  priv->clk = devm_clk_get(dev, NULL);
> >> > +  priv->clk = devm_clk_get_optional(dev, NULL);
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

Remoteproc operations .attach() and .detach() are implemented in
imx_rproc.c and as such, 2.1 _is_ supported.

>
> There is a clk_prepare_enable which not work for case 1 if adding a real
> clock entry.
>
> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?`
> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> if imx_rproc.c is built as module, clk_disable_unused will still turn
> off the clk and hang M4.
>
> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> unless pass "clk_ignore_unused" in bootargs.
>

Isn't there something like an "always on" property for clocks?

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
> >> >    if (IS_ERR(priv->clk)) {
> >> >            dev_err(dev, "Failed to get clock\n");
> >> >            return PTR_ERR(priv->clk);
> >> > --
> >> > 2.39.5
> >> >
