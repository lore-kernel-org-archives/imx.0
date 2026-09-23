Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DF399372
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197267; cv=none; b=Tv5gVm1JWTX2L4/YJEylAgTRUdlbNK5oW+v7EcD4eEAkWRHwudY0yPlsL/SLrAPrNeQgUe2A5CL5yeagRoXii8idsnQu+pb4Sxd9GJgV0spkF+L3+ynjt46FFDQs7yLi0R9YUr4TEg9NCzOmmkvKT7wHUoo+eB3UD9I+vXa1Ljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197267; c=relaxed/simple;
	bh=XqpqZlTInduldJGK/k9p45wY9O0vx4/ZLKo6TIPnC6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov8OYpFfWB8updfiHgerl+QmfOoLHdAs0+tpx6a6HQulwXGAdjC4DrjI798CD8aqe9J0LpdCe8sm4sdOqoNQ3bCH+xEt84QzrrYITMrfU0GdaOcR6miBeB3PjFwuClem1gihdZ3QG6zOA5unHnOPqN8iFXv4p6uRvS9FlV37Bzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/YepFpg; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/YepFpg"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1021358a91.2
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197263; x=1790802063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=;
        b=f/YepFpgG6PW24ExNw4Im42WdTwya53CYt2ZqcZC7hHYpxjgB4NYrqnRDlllo7E//5
         EB1zYnIja3d0UQhxj5A2ThIkAsUvNuziYPJXvSkGvb6387hnQZQZ7t1RIPvwMoKXptIs
         XrtCKnoGQKbFao5uS7g2QfeoiFvuFFci7+ZqWE+JFwMYW2VbjBa92TCvGYMmj8bV1G+a
         EoZR5oAs8nJqJWuLz24BPDX6d/zWvymt+3LRk1xAfzpPafdDNWkD2a9wfJ4nMZVYc5In
         B0w6lKmGFdtY1OFpfei2lCb8UWhr6lezcRkjXUPsiniv06/LUHk8aTyNPHRHachqjVJJ
         vTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197263; x=1790802063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=;
        b=lc80ea7FLuSHj2gjWTZq+AVylKDNzUheP5VX7kijz1uaEFPg/PdAFLpbKN+lc98syW
         iP5A6E9mH2nOBzq5RFzLJVwAMVxDeYkSohET5fRMYSq+Ug7bGZGJ1nQDq0TsAFUanwPm
         3Gw8DgGLLGaT1J01EsYGAYjGcIHJwaluywXoTliHlJhHe/xGKbSexCWtfof7c2YUDV7R
         RMDExNy7YkCohoE113B6j6ssirs+2oDOLCtoeCRfXLu0ywtjuY/1Sk00RjSwniqzYAPY
         +21coExzQk4A+vVkwctfUPpbS/B49mP6d6E5bjInIFMseNIOKzGEqmzEwwYw5/NQBVki
         MJ9A==
X-Forwarded-Encrypted: i=1; AKwUvBxF3uZWLPl/7BzHIS0OA11Osn+pEk8T+bpOgN3LOm6Il+9F89XDvwsRMxFqRV/ldsck0dc=@lists.linux.dev
X-Gm-Message-State: AFuF++nxJQU9ZdMaskn1plqh87zsXcFW3cqARaVPqpjn7EJBzCUFOfmC
	/BrtDLnKE/jJ8UpvOlBIAZyEMPfyIH8cySGQWOt697PoZVBuvummlnVA
X-Gm-Gg: AYBFou3FkLLWf92W1FU7V/XoivTtDb590QxOzAfii9scPfto3DZDDOZlRHWZ5TC3AGf
	i+W0YFvJjkFe/9gq/Oy8x59V7lnza/PCVLd2Iocjr1R63DdhKngItJ5defvvX5obwErBrIYVbLc
	7K5GN9BdBIZB3z3c6BqZhqh9/z8MZFT1MO+fCPb715mVGvke/OouxCiIZHZxdh81HCBIN2PbARN
	gf0NCTtCKzaXKyRbSYLI4HegorsBk5LNOO5unsBAH73AG7KxOOKOESpp02B2WG/a/R8c61PgBWs
	eDUkXcam+MA/fdr4AWzvwjs+gm6GIorCmUEwVuwvwH+/grB4ceneTn64MHyIPmq1WHEt0+BgJrU
	VIO5PoHgkaDV/o/cKhz1HpFjGH4w7mZibmXyJFuV1Jt306ktJd+DgHlmveDo+qt5qAolGhOxJLF
	TM78WjvWFEVPAiliMiY6Q1P0u4YtZ4VZQUMZEycqNDf2w5bVGJBS2E+3OeZPgsgqIF5CtxzcCoE
	AKP5aCQKDlP
X-Received: by 2002:a17:90a:d406:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a09872c528mr260420a91.21.1790197263197;
        Wed, 23 Sep 2026 14:01:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097344841sm850282a91.10.2026.09.23.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:01:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:01:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Message-ID: <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
 <20260923111719.2032012-4-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923111719.2032012-4-primoz.fiser@norik.com>

On Wed, Sep 23, 2026 at 01:17:18PM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on DT
> binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
> of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
> clearing it enables POWERDOWN mode on watchdog timeout.
> 
> If no DT binding is specified the WATCHDOG_SD bit stays in default
> configuration, not breaking behaviour of devices which might depend on
> default fuse configuration.
> 
> Note: This patch requires that the config register CONFIG_I is
> configured as writable in the da9061/2 multi function device.
> 

Please reword to something like:

Implement a method to change watchdog timeout configuration based on the
"dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog timeout.

If no devicetree property is specified, the WATCHDOG_SD bit stays in default
configuration, not breaking behaviour of devices which might depend on
default fuse configuration.

Specifically, "There is a possibility ..." should not be part of the
description at all, and "Note:" should not be part of the description
and be moved below "---".

> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  drivers/watchdog/da9062_wdt.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 3d7bf2f351db..7ceef8cd7425 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -204,8 +204,11 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	unsigned int timeout;
> +	unsigned int mask;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
> +	int ret;
> +	u32 val;
>  
>  	chip = dev_get_drvdata(dev->parent);
>  	if (!chip)
> @@ -245,6 +248,30 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
>  	}
>  
> +	/*
> +	 * Configure what happens on watchdog timeout. Can be specified with
> +	 * "dlg,wdt-sd" dt-binding (0 -> POWERDOWN, 1 -> SHUTDOWN).
> +	 * If "dlg,wdt-sd" dt-binding is NOT set use the default.

This is not really what he code below does.
It sets the mode to shutdown if val is != 0, not if it is 1.

> +	 */
> +	ret = device_property_read_u32(dev, "dlg,wdt-sd", &val);
> +	if (!ret) {
> +		if (val)
> +			/* Use da9062's SHUTDOWN mode */
> +			mask = DA9062AA_WATCHDOG_SD_MASK;
> +		else
> +			/* Use da9062's POWERDOWN mode. */
> +			mask = 0x0;
> +
> +		ret = regmap_update_bits(wdt->hw->regmap,
> +						DA9062AA_CONFIG_I,
> +						DA9062AA_WATCHDOG_SD_MASK,
> +						mask);

CHECK: Alignment should match open parenthesis
#157: FILE: drivers/watchdog/da9062_wdt.c:266:
+               ret = regmap_update_bits(wdt->hw->regmap,
+                                               DA9062AA_CONFIG_I,

Also, this does not require an additional variable.

		ret = regmap_update_bits(wdt->hw->regmap,
					 DA9062AA_CONFIG_I,
					 DA9062AA_WATCHDOG_SD_MASK,
					 val ? DA9062AA_WATCHDOG_SD_MASK : 0);

> +
> +		if (ret)
> +			dev_err(dev, "failed to set wdt reset mode: %d\n",
> +				ret);

			return dev_err_probe(dev, ret,
					     "failed to set wdt reset mode\n");

Thanks,
Guenter
