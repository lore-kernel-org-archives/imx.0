Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD0828DEEF
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436123; cv=none; b=lktv5Qn5kbos5gw3I8DFo54KLdy6W5Zhk4y+bH3IYcWatwVfWFjSozMgGZoZo8c+hQ1h9a0Ty3obJuo4SKnt9jSxpD00IXrOoEJNfxKq8rgwaRujhNm44G2GhNm4ZZd9ipISTxk2gMfDljEZR6rpONaWpbQbkGGM23Kh0EkPvlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436123; c=relaxed/simple;
	bh=yZ36DcIUYOAwIVulLyUU2OqhGHYT7zDOk4WXuA2qzpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5PleM/ZbnFhBouStldWalrb6CTThHWn76wC3KK5u2oPu92qDehHj89h87V/w1Qt9Lg6RufIUjr2prhA+U/6IuMDgriCWYQPXqweMnZxWrOceB7tII25QfdQeMux6I6SbphdojBFY6jd6ddGOmt7lmppJr5nDd/ToV8YY0hpYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/en/pqE; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/en/pqE"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so164807b3a.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745436121; x=1746040921; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lnq/BqqXjA7ALdZiVAuLt5golqfm+gt94XkCsxvqdSk=;
        b=E/en/pqEVveFVRJLSf1RtpcXBlkyszoOsEU5uaF20xdNS74DpIwSydcpO7EObg+WJT
         URQ8cVrSux9uzWDbbmWhbPToeWIU1UeQ0/4WrozB+Y1a1R78jkhzrv0bmUiBSGcqdurv
         SCP1A61UGjWiH5+KKwAnnVfmmA5S+3YUDfPu9rWd8u5C3ug7/qsIhGZz9IKNwCk96zCZ
         q9bVTdL2kvJ55rSChlnIqEDuolqFdB5zZZM5yD9vX1s/+h0yfF0JEw6EMdXDT+fcWjwU
         3skq1hT6pW4Gu5a2ox7dXb0Us29Wa9OxIMRzSN/5ceT3VIX0XcPzamhgmrSHhRPkHjBZ
         6DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436121; x=1746040921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnq/BqqXjA7ALdZiVAuLt5golqfm+gt94XkCsxvqdSk=;
        b=j/JMUfVXihT5IItryxGK3gUufS7iGE6KajNFFzZ+fWm1+/Sd/yM2dgoSRn5b43S/PW
         3XUTpNef9zvGTYTSoBQUm+7Uljdcr9lv14+HfLK1GowGgE3aQ4wIee7h0QFmoVhgJzwX
         aEf7VtFdO7AF7saToF7zEsTJaKBhkwS+YwHv52r1o4iWI+EnTOa52yDGTXHVueZifoZd
         slFRgJVQxUZLG53tIYmCj6yBiHnZ0Ex932JTfjLw4XeLtDLpVgLDYCoxgUWB2ngMGqul
         VT4SmWaamyi6HJMgxDW2JhXVNPNkayWPS7xoXpFbH/HlXiZRp+zn+5jvkFLORSvUjmIq
         pjiA==
X-Forwarded-Encrypted: i=1; AJvYcCXpT9qIwdyCL4JPSUcvgpCCkwGaTFnpcJWjZrjFNicMvsqRZzjjiZV5Dt/97uzAc3O2YG4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvecR5dZvI5SL3rcIKET/m61Lk2kMAx0FYXb3bkQ6ftJNPZwLS
	ZyEkNyuYdrFLmameLPSTjSpIC9SyyH+OkHg5M/lHpH+omeDfg+c3piZjkMZZzGE=
X-Gm-Gg: ASbGnctr4kq7gblp5j0i1uksZu0IdMcz5NljtL96OqY2i37bEZChy/+SXF5LAwrAHGV
	EVpr1BwTSahX3hhKxqBveKtLABdoxAGnDt0m/6p6flCZ+VvBYAkY4me2TPKDBJyN3Yy111GryyT
	zQM3k7e4uJf2L+OSO6jZAJaJ1KdeuufbxNZtQZOv6/6EDe6a0dUpGYnT1AYcr8kHOD7tvWXxmHO
	8Gal1Hi/kE2LsCmBuvz3SXSJf64/nCI++2/ph3giEk0I4JvJu0hgLIwnQyakCifhVGoLFmO3uon
	bhleo6uXQSjq9xqms6U6L6PY6b0izIGVRnnGYsA=
X-Google-Smtp-Source: AGHT+IGC8Nug6p+sMb1GfXDXRxrkzVBgxlxPN8V+pT09fkQHcV/gyhAXznUpN3ozAU58YHARfCLCSw==
X-Received: by 2002:a05:6a20:c6c6:b0:1f5:64a4:aeac with SMTP id adf61e73a8af0-2044116a1a7mr886917637.33.1745436121299;
        Wed, 23 Apr 2025 12:22:01 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db139eecdsm9391156a12.22.2025.04.23.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:22:00 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:21:56 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250423192156.b44wobzcgwgojzk3@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkf6bxBLjgFjvIZ@p14s>

Hi Mathieu,

On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> Good morning,
> 
> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > The "clocks" device tree property is not mandatory, and if not provided
> > Linux will shut down the remote processor power domain during boot if it
> > is not present, even if it is running (e.g. it was started by U-Boot's
> > bootaux command).
> 
> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> unused and Linux will switch it off.  I think that is description of what is
> happening.
> 
> > 
> > Use the optional devm_clk_get instead.
> > 
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 74299af1d7f1..45b5b23980ec 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >  	if (dcfg->method == IMX_RPROC_NONE)
> >  		return 0;
> >  
> > -	priv->clk = devm_clk_get(dev, NULL);
> > +	priv->clk = devm_clk_get_optional(dev, NULL);
> 
> If my understanding of the problem is correct (see above), I think the real fix
> for this is to make the "clocks" property mandatory in the bindings.

Thanks for the information, from my understanding this was coming from
the power domain, I had a small discussion about this with Peng [1],
where I was able to bisect the issue into a scu-pd commit. But I see
your point for this commit, I can update the commit description.

About the change itself, I was not able to find a defined clock to use
into the device tree node for the i.MX8QXP/DX, maybe I am missing
something? I saw some downstream device trees from NXP using a dummy
clock, which I tested and it works, however this would not be the
correct solution.

[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

Cheers,
Hiago.

> 
> Daniel and Iuliana, I'd like to have your opinions on this.
> 
> Thanks,
> Mathieu
> 
> >  	if (IS_ERR(priv->clk)) {
> >  		dev_err(dev, "Failed to get clock\n");
> >  		return PTR_ERR(priv->clk);
> > -- 
> > 2.39.5
> > 
