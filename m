Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369A30C619
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394215; cv=none; b=PmMYmqd7hNRKVRs3y8lUDJzeExYzMmcqWUZuD6UqZzpRD+O627dHrbwZrOkWYxeLuOXOhbEgIl0xwEj1hbob77LgSWba5l6TzU/M1/xnP8EukIuRyhtHmYHBz/uew9lYuC4GVCxdeKro3AKU/I/HwWxrt15V412eefL3p+WwMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394215; c=relaxed/simple;
	bh=xoUbFm5BTkRiUAzdIjH86j8+cd5U0ieA8XUJf+QV+oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+q/3YcDrhBE2fGfwt2W5pLmKEwyA3mMovcecLVkQfUWJ2mL751FA1HSkXot0FLkdfFJFlrMg8JdAOhYdlN2Rs9MUVpWjvpjDtUMCbut5ulipOBpv4f1h8fgUUaeqLOTOf5etWzNigK6kZCAjLvP7OK++ye0bbENBPBojgrzeKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wk0XMxHr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wk0XMxHr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0c20ee83dso19423015ad.2
        for <imx@lists.linux.dev>; Fri, 06 Feb 2026 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770394214; x=1770999014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=;
        b=Wk0XMxHrfKFnE6gu7ElCiq+P5wp56+ilLd82J3LiIGOsKrPM1WK5F3Xo5SKLVZ2DiJ
         sWdEOkxON+LTqwhWHQc1m4cNFbr1sfjQKVG1Y9VguPsNecnRWoHJG9G1gLtdQenaz6Rx
         Agln6h+E0jzFrHvIFZI6lzTuJeZcYD0yCcd/3UTR6CXCTBTIgETXwwh1LXZ4wCpn3NA4
         5O+E1t580xS3xRL5qqOkEoaZ4YRcYQTX9RGdRGZJwVRkWjyAH3b4/1/2+gIrw34pMWSt
         7j/mnoFl794+P3EELTngNtcXQazuF8W3iyCvzEeCQ6yl3oGZeVAvrrq2LxcaUFEfTgEL
         o8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394214; x=1770999014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=;
        b=KQyapR2pkAeItLPipTYqv4iPFuaEincxWOcFgsskngH0wzyTwS6hoZGzzGVapYgUpQ
         rLiHsWi0ISaNO7dPHY1iyapY9Lh+J3f+V2k+sKsINBuXhFq0UmSx3/lPDtHCIosFi7aV
         McbCelCDlq5lV7LfNJeNO8QXjo9utELGorsCpZ2x526aulRubtMJRTb9VhyIRafhLScT
         VyD0DpClxOw2HPrtUfpasfIDmNRc6tRFKiFKM9yI4hmUoVG2toT+Iv0Ilt4Uq7yU9aFG
         pA0s2mkcFUpdwDwBELcHD7+7byofb83jsuUjOPRmVjwsZ5JEqDGL0s56eJkwqVDeTcMC
         qrIA==
X-Forwarded-Encrypted: i=1; AJvYcCUEQYd588mcvYzXgchrjgWEbla92T/+eQHWOF/2iHXQckJZk46IxBPnDNivfr+vFJ3KFms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb92GxoAcW9viTy/4AhBhGv9m3TfqeDyssdQeFdxoaGq0tTn/x
	SZ9UIzKCxa7DjfanuxocuosEv3yjn4qCvH9hjsSSYAhwSLMGyXzU2g+Fxdhz5ogeMDs=
X-Gm-Gg: AZuq6aIysHrMAhfNbRC8iuuGfFVz5BYhPN84zkD1dDYOp8+S0a3zpEz2+m24oe8EC2i
	kUce5t38jD85rrMlQIoVLfk8k9ne6zQ4jzj1gjC3iqVySdIlX38Elz8NNNM9FXmD1MxceyXYq0u
	IQVbXnA5Lg5Ozg02DkSzuEQoKHmGZSP77i44kLWS6vwFh+g31PMtL7UdQcMyA4FeZB3DkCjbzuV
	rTOXLTkQ4k8ChvOYMtD4+B5ULa5yH/+wjpLa1KISHj11pOwchI3CgV/1/FrstlhnCeTW6U8ru3M
	rVobVxkUZn/pQpzr0kRVXmqBTtnsw0CXwxJcyw1iQwxxjkOIxkA3dZJj+XWT5PzHlaF55USI+tf
	P0ufKErwdvPgppvHCDuOJ2clj9YQ3EAq4bgTWiv5yyAOSqcErbVK0cjiaGjPHMhno6iqD6DWZ13
	03j+t2OlOL/F36
X-Received: by 2002:a17:902:e5ca:b0:2a7:757b:35ad with SMTP id d9443c01a7336-2a95170b352mr36939965ad.42.1770394214292;
        Fri, 06 Feb 2026 08:10:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c722c3sm26045635ad.23.2026.02.06.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:10:13 -0800 (PST)
Date: Fri, 6 Feb 2026 09:10:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Chen Ni <nichen@iscas.ac.cn>,
	"andersson@kernel.org" <andersson@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Message-ID: <aYYSY3Rn3702zk3S@p14s>
References: <20260205050905.3031134-1-nichen@iscas.ac.cn>
 <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Fri, Feb 06, 2026 at 03:34:41AM +0000, Peng Fan wrote:
> > Subject: [PATCH] remoteproc: imx_rproc: Check return value of
> > regmap_attach_dev() in imx_rproc_mmio_detect_mode()
> > 
> > Add error checking for regmap_attach_dev() call in
> > imx_rproc_mmio_detect_mode() function to ensure proper error
> > propagation.
> > 
> > Return the value of regmap_attach_dev() if it fails to prevent
> > proceeding with an incomplete regmap setup.
> > 
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index f5f916d67905..0e23f519c247
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1007,7 +1007,9 @@ static int
> > imx_rproc_mmio_detect_mode(struct rproc *rproc)
> >  	}
> > 
> >  	priv->regmap = regmap;
> > -	regmap_attach_dev(dev, regmap, &config);
> > +	ret = regmap_attach_dev(dev, regmap, &config);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "regmap attach
> > failed\n");
> 
> 
> In the main probe, there is already dev_err_probe for
> detect_mode. So I would use below style as other error
> return in imx_rproc_mmio_detect_mode():
> dev_err("regmap attach failed\n");
> return ret;
> 
> Let's wait Mathieu's view.
>

I agreew with Peng's assessment.
 
> Regards
> Peng.
> 
> > 
> >  	if (priv->gpr) {
> >  		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> > --
> > 2.25.1
> > 
> 
