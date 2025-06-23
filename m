Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C87284694
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691759; cv=none; b=pAt0gyQ2lwDwkJjcv5LBu3vv1pWBNhURQQ3oifNM0+Zt38iuqzloL1MFiv3W19Q9wYs5/RKCjdXt0Q9WaBugvaAQbdZJ2rQ4EsujBOuZnLdE9BW5LHElLFf8ldhDqo+2QYgR1tTAnxJN+3yOZTaS8jZ5PK5Ts5NS61OiCgLAyCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691759; c=relaxed/simple;
	bh=hY1AO9wd7FYeyL43dCiTnguCwp/cs4kPIauJ1coyPFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOPNhH1dmIFgEs+0kI4KOgdD6JyCn6oYG9jT/NGHobS3uv46wSGc82PsOvGN46qB2x5P4GSiqFCbgvGn1soXbKOMiqGICqg1mu3GlSpxGgtwrygvrtRKCf8Qj2o/+nqVxXVZQ/IDRYqhN7KDPUo7zD/3EQQ2Pkns3BSwq/6zl/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGKmar7/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGKmar7/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23694cec0feso39407275ad.2
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691755; x=1751296555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=;
        b=sGKmar7/9uY1o5gayBcqpn8gM+XG495Jalyv7vOlne1nMQE1vL5lrBABwkWVQlsbdF
         LqqOPTA9Lq1oFZE0bmSz4TpDYh+W8nWauwMzWxeCDM0JDjA+8GOExlh8yyomCHCg+maD
         IWdBPCWqY3kBTWY0YyUu/UhgBkO98NMQGzS4lb7cxR43gD9KT8nEDZHHf0RtEVC0+r8W
         o0/ITGdzV9ysz/s29IXz8UNHRzCpG8m8+N9MAL4PPOxPrtC7nmOQ6B4RFBQxpRIrAduR
         4Hv4cwzQZz4EKkWTIlXCSghJpv6u82CoeCMYPGL42xmg9Stqs/UirIlKhMYD6FBrB4wY
         TkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691755; x=1751296555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=;
        b=XMC3w/9AwabS9iQcJpFDswNwmuqkx3eT0qQkXIV05kVDlDCJqZEJw2M49jKMEn5VmZ
         9P3kAA2NV6NBNss4PvAVnjFOJwDyp5xq9mjqfeNggB/fNQ6u2AWH/VxwHICPPQ6VOxxe
         mWThTVG8V4/n5lkkfzg7epq02Kf3j7Fi4nFqnn45KCSFhuwvWiAk+hXVYvL/qeL4YXhU
         ZfH4S5Ob6cf0NxSWmoib5ZlcOh5MpYJGXZlwprG4n3irf6bCf8aRmLWH/VI40SA+agoq
         Q4NzXBK2a/NWvgKXUMJ5jvEmxvSuJckXZcgU1IIVXJRZQtp5BO6QhfZEVM02aQsR4vRV
         V6FA==
X-Forwarded-Encrypted: i=1; AJvYcCXKerpzLFjIyqtoEWDw+p4rbtsA4xQ5PTKObZjRG73G6hT0xtQcEX0FD8Ll+zYvsm/hO/U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUs8jIQsEsocbHdvkhTlIx2ZrguFn7gFaefXYtnP8v1ixwmroy
	1eM/A/wWId0T2xjsvdlRDmDQ0xgFoa2yX0Ewv0ArJzhLP/AgdGu2mSYKdp2YbulNOT8=
X-Gm-Gg: ASbGncsh8sH3DZjPck0r+ZbG5vXTXdCmbh3QfgyiyVMrJE/eGDKsmWJFfAY1wPakc7W
	YYTTNMR8tLS0nDo9CbxigEPZ5mhCWtRSHrCXf6LQniovN+CgT7G4XvE1MxDcXBZnFL+9qOnXbkN
	Q8JIjUpYE15K7rzGKorQh/NUszsjPFOrEm+ju7OiQtDlzG7Hwz89XjK1Fh/o9rSnVzCcVpIEqXe
	TMZGwE5wJhvKl+dScLcBPVg/Uw3OPqmQ7mHqumC4HNEMnEexvRuTsBdZ6nGHjMdlLjtvMqzQmlA
	N6y8LhX43i0XBRS4EI54mwrzLswlxVS0aea/uktRIp+rfN3a1CLsyrdjxRC/hja+
X-Google-Smtp-Source: AGHT+IGEfd7ew/DbegL4/ehEu6z8rdU2NqGKWQUxfqGQJFlSmPlquHaa0QFJscSdtTcWRu86BS4OCA==
X-Received: by 2002:a17:903:1b66:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-237d96dfe41mr236501275ad.10.1750691755197;
        Mon, 23 Jun 2025 08:15:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866488csm85961605ad.158.2025.06.23.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:15:54 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:15:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when
 M-core is managed by the SCU
Message-ID: <aFlvqK6SHvWHIpMn@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-3-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-3-hiagofranco@gmail.com>

Hi Hiago,

On Tue, Jun 17, 2025 at 04:34:49PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> by the bootloader, M-core and Linux are in same SCFW (System Controller
> Firmware) partition, so linux has permission to control M-core.

Ok

> 
> But when M-core is started, the SCFW will automatically enable the clock

I find the "But when M-core is started" part confusing.  Started by who?  And
are you making a distinction between "powered up" and "started"?  It is not
possible for someone that doesn't have HW documentation to understand what is
going on. 

> and configure the rate, and any users that want to enable the clock will
> get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> fails because clk_prepare_enable also fails. With that, the M-core power
> domain is powered off when it is still running, causing a SCU (System
> Controller Unit) fault reset, and the system restarts.
> 
> To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> because SCFW will automatically enable and configure the clock.
> 
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v4 -> v5:
>  - Unchanged.
> v3 -> v4:
>  - Unchanged.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Commit description updated, as suggested. Fixed Peng Fan email.
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..627e57a88db2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux */
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	/* Remote core is not under control of Linux or it is managed by SCU API */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>  		return 0;
>  
>  	priv->clk = devm_clk_get(dev, NULL);
> -- 
> 2.39.5
> 
