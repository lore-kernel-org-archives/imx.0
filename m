Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDD21B192;
	Wed,  8 Apr 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648771; cv=none; b=SyIjD+MjER4WIxOrV9FPbNlU8oOrBd7xZzQmdE1GEXxil1VjE+FrfMGZ92x0bgnSf8MgXGFUX69X4xM4LgehrSGNDJ3r0iOfQzED4X+TnI3aNkQZQxG18+gC2FbYYaNAo4zXkoWc+EqKPRV1+Y/lFfb5zoJpbGmrXauOa6nAMFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648771; c=relaxed/simple;
	bh=pXDdDq1OeM2ARLlFkfpX3cDC8uKfgPA6ypCaoec4WYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSabKfwjAxUfi7QgOw105c1lRdK2maIvw6WDN9P+a7EPx46at8iyp2TptWdDGeaTwSGWysbOKQIYtFyRXX1HbLkLghVKeHY+FtW5yuXukjrUVYrBLWfcfmTTBrF2LVbVHB9D8cqrhImaKgvY4qTJWWwa5UQBuzafB27CGfgId7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OYau3CYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OYau3CYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12E9C19421;
	Wed,  8 Apr 2026 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775648771;
	bh=pXDdDq1OeM2ARLlFkfpX3cDC8uKfgPA6ypCaoec4WYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYau3CYoCiinWGWS1IN9aV5DKhmV5bFEpiTxh8xGhRNciKb02kkXhbAQKgsD/Qpue
	 xnE6QPmxqn8QAIV8YzepAGlHD5P+GWSmRnWI/Ni3g4ryxKhlfxxPQGg2FH0ALex1P3
	 gYIWtd7TeEENTnvhX0Mkzj6BanGa3A3jqAzWZDOs=
Date: Wed, 8 Apr 2026 13:46:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: srini@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] nvmem: imx-ocotp: Initialize in subsys_initcall
Message-ID: <2026040852-crevice-hazily-adf4@gregkh>
References: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>

On Wed, Apr 08, 2026 at 12:19:01PM +0200, Paul Geurts wrote:
> The i.MX OCOTP driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink.
> 
> As the OCOTP driver is arch specific, but dependent on the i.MX clock
> driver, which is also initialized in arch_initcall(), explicitly
> initialize the driver in subsys_initcall(). This makes sure the drivers
> depending on fuses defined by OCOTP, which are initialized in
> device_initcall() are not deferred.
> 
> Fixes: 3edba6b47e42 ("nvmem: imx-ocotp: Add i.MX6 OCOTP driver")
> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> ---
>  drivers/nvmem/imx-ocotp.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 108d78d7f6cb..9b1e7bb14ced 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -638,7 +638,18 @@ static struct platform_driver imx_ocotp_driver = {
>  		.of_match_table = imx_ocotp_dt_ids,
>  	},
>  };
> -module_platform_driver(imx_ocotp_driver);
> +
> +static int __init imx_ocotp_init(void)
> +{
> +	return platform_driver_register(&imx_ocotp_driver);
> +}
> +subsys_initcall(imx_ocotp_init);

This is not a subsystem, sorry, but this isn't ok for a single driver to
use.

Please use the default level here, module_platform_driver() is correct,
and handle the deferred probe correctly, that is what it is designed to
do.  Playing games with init levels will not solve the root problem
here, as was pointed out by the fact that you could load this module in
any order and have the exact same problem you are attempting to "solve"
here.

thanks,

greg k-h
