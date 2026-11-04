Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824681;
	b=HGbwJpizZkJixXPw+pQGA3jNV/qiB3ydJlP+sWMuBWqyuYT8nuWB/eCzDi/pqW/mZ70h
	 +1ygIdvcET+V5x1QNMo5V15efk4IV2YtlJEUdG9h3dYny/IdXc1L/1+BqMGm4ia281zrf
	 LISu1ywsYdPXkRGOOp6lYYL9ecBnyJPOHXuLScxi2O+vbgkoKzqIy1bLja2oYJ3VfYjml
	 p0z7UC6KpctMILPLDKVAcajsy+kGMgM7k9IW1ARr+dz06zARbaW7JL5YNS8fuhsMhRI3P
	 CNZ38P0/oETGf3Yug9SYErWmkp65D6oZGtiahgGxRJej/DB5jGI+wFubtZ4m6SjlsUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824681;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=1jWPBK680B87Pwa40LJBUzBrzbRi+IENeD01muXYKMs=;
	b=DSwdtMkgd9Q5l+uiz2JZhvcI9Lgqnfd+NHlCFJ7nGtTjHKNQEYSm/WPrhwa+G4HlGNDw
	 lpZxHObu9/5qBRSA/ZXccix2pA1RVgFtc7gvvkedWwrg064uDKfaQsPNwVA7ETaEqAdbD
	 8jgR6b6DbtWq/TEOiqCL/PuhvrvFxnp0nPyAbatoMlFRksUl2ZNZnIN4/epoD7+9Bctjj
	 u51V5q7ZxAPi/H+UIdCc4EoxQb/7LUWeY/R2bKsTdcD9U1QJZvUKyUaVXcYCh2pyTZv2c
	 +xhz1M7cIE/p3avB6zZjX8+X3cQDjjjEPN2c7dRT2E7zqJ2dbGSt7zQVCRv0qy34VPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ul0Abu8j;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F2606B397
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 20:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7F2606B397
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ul0Abu8j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824681; x=1825360681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MX9XH/QnJ8xvT9Bkrl0MdVDxms69I0ydfDn2qNE8rI=;
  b=Ul0Abu8jBn5SKb1ozep8rYr1x5qAgOhr0jvj4dEWaPW24aQBDWoreT8b
   bOCQnVHaEVgEYVu6KpTJfz/41kTXHqM70EQbTZdkhdc7hS0qryaM+V0wu
   MAsgRe8AAoAHXnX7wpswiwhvehmveKH0zBiUltQBI6cZjqFPMjQfW7mnW
   4rb2414+8RAAJzj6tJSsBsEu/2tX0cPGpPLg6ZCtOivs2Quf4FGgb42Zh
   rK7z9nrQt7wg95o8/40L6AsoBKZGZJsEcdzSec0xNTu3cQU/U8iAuPEa6
   eCIIO4z30XpFz+7Lv8wsN4rXvP7m6ZD+/TkT/kaM1lSQVxWtADS0TBiNl
   Q==;
X-CSE-ConnectionGUID: 1p45//bwQQyWnUCAX7XH1w==
X-CSE-MsgGUID: fiVFbB1xRfOfcUswsavFkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2634706"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2634706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:37:59 -0800
X-CSE-ConnectionGUID: 5O+tnyHnSOKwltP88zBZRg==
X-CSE-MsgGUID: QweoI2egTtKb4djJtQGSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7213141"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:37:52 -0800
Date: Wed, 4 Nov 2026 22:37:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: Convert to subsys_platform_driver()
Message-ID: <auuXnndiQOkEaOsj@ashevche-desk.local>
References: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
 <93534aaf-00f3-45f4-982e-7fd44ab3799c@kernel.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93534aaf-00f3-45f4-982e-7fd44ab3799c@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 06:38:40PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 12:33, Peng Fan (OSS) wrote:
> > 
> > Replace the open-coded subsys_initcall()/module_exit() platform driver
> > registration with subsys_platform_driver().
> > 
> > No functional change.

...

> > -subsys_initcall(i2c_adap_pxa_init);
> > -module_exit(i2c_adap_pxa_exit);
> > +subsys_platform_driver(i2c_pxa_driver);
> > diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> > index 15e14a6fe6dc..dd1f6f854a32 100644
> > --- a/drivers/i2c/busses/i2c-s3c2410.c
> > +++ b/drivers/i2c/busses/i2c-s3c2410.c
> > @@ -1188,18 +1188,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
> >  		.of_match_table = of_match_ptr(s3c24xx_i2c_match),
> >  	},
> >  };
> > -
> > -static int __init i2c_adap_s3c_init(void)
> > -{
> > -	return platform_driver_register(&s3c24xx_i2c_driver);
> > -}
> > -subsys_initcall(i2c_adap_s3c_init);
> > -
> > -static void __exit i2c_adap_s3c_exit(void)
> > -{
> > -	platform_driver_unregister(&s3c24xx_i2c_driver);
> > -}
> > -module_exit(i2c_adap_s3c_exit);
> > +subsys_platform_driver(s3c24xx_i2c_driver);
> 
> Apparently reviewing only a few lines out of 300 is still reviewing:
> 
> https://lore.kernel.org/all/9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org/
> 
> Therefore:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

In the similar way

  Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # s3c24xx

(Note, I specifically put double space in front to make this as an example and not overwrite your tags)

And to others, the problem with partial reviews are lying on the side of the
sender as it's not reviewer's fault that unrelated things are going in a bundle
and not in the proper per-driver series (where each of the driver may have
distinct maintainer).

-- 
With Best Regards,
Andy Shevchenko


