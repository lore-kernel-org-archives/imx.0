Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F53B3C10
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643851; cv=none; b=h7wlGUCrHU8t7M2PAtprC3Jjhg3JjeW/voonDdm8pYgq7mBT+mifEW88O/go6y/HSG48L4O9ST5MvtaMZchZD4FxytSCO3q8kIqKLw7tsSu2qzj+L9tXegCgrla4qDhp/+UpIaVoa6q18HnMU+vhTyMolGRpxc+4Al8XovgI5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643851; c=relaxed/simple;
	bh=W6N8KADh2SvYZjm7PtZfb52lCZindsszU9QX/hsYNpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDOQqF8uvCOF4Oj03roOk4s+v76Ca/6U8xu1Zm/MJ3hc8A8n/tHq6CKL1sX89zsByeIqyWLSd4ETWmGqRvR+vipNRYKzaju9Aioh316jvsKDiiKVTLar+D6DHZPZP99IJEcnx1Y0v7VCsekTEm8EydLMYMJ49BHCpscul87VYyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wAQ4n-0005Ef-RL; Wed, 08 Apr 2026 12:24:01 +0200
Message-ID: <fabd81b1-0a08-4914-b92f-4ef23a6bf8a2@pengutronix.de>
Date: Wed, 8 Apr 2026 12:23:59 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: imx-ocotp: Initialize in subsys_initcall
To: Paul Geurts <paul.geurts@prodrive-technologies.com>, srini@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, gregkh@linuxfoundation.org, p.zabel@pengutronix.de,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: martijn.de.gouw@prodrive-technologies.com
References: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello Paul,

On 4/8/26 12:19 PM, Paul Geurts wrote:
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

Same question as the imx8mm-clk patch.

Your commit message doesn't mention what problem you had the with deferral.

> -module_platform_driver(imx_ocotp_driver);
> +
> +static int __init imx_ocotp_init(void)
> +{
> +	return platform_driver_register(&imx_ocotp_driver);
> +}
> +subsys_initcall(imx_ocotp_init);

Same question as before. What happens when you build this as module.

Cheers,
Ahmad

> +
> +static void __exit imx_ocotp_exit(void)
> +{
> +	platform_driver_unregister(&imx_ocotp_driver);
> +}
> +module_exit(imx_ocotp_exit);
>  
>  MODULE_AUTHOR("Philipp Zabel <p.zabel@pengutronix.de>");
>  MODULE_DESCRIPTION("i.MX6/i.MX7 OCOTP fuse box driver");

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

