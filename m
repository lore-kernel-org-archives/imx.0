Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD15311C2F
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725246; cv=none; b=r/hlUNWYMeFxTboERj9VOryI3FryUliUnwcLhvCZXHeSQgu09CWlz3hfGiTCATP+8eZPOw/0wFU8Zd7Fuxzqa/tRq0U4hmoEnsqs0SacTXYQxQ38wAyjbn8pT7LGmraIqfXgwFktZDg6l+FEEwbo9NnVR74ZZDWV6Odache5vpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725246; c=relaxed/simple;
	bh=28lsY/xP5QLqKPIvrhKvHJ0CklqT6R1GJ9nsZJRxcNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lW3yeEIXS91fLn6mCtlMO1z9/WlYC5wVDP2gPkGTmCppySI4wa1ME+4fuBEpj8zQJT7/p7FvRfECYwFWSsaJggKBMDPFHaU/DQZpD1pVUsWJ57WVdASfETVaSzghkc8zPGedIlGI8wpcVyfEatj/W4YnbkrjyVU+3Gll54jgZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFFjwBU4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFFjwBU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761725244; x=1793261244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=28lsY/xP5QLqKPIvrhKvHJ0CklqT6R1GJ9nsZJRxcNw=;
  b=OFFjwBU4/a/8r/3fU+/bwXVJK6BIkMijH7fgSWHJSTJvR1Vyw3/rF9u9
   wKAbauBbPuasoUbaOkttk6TE5oLWnyXS29Ib80p6S9imnlXYf7mOt5f7v
   rbgG+fdCvR8ReecJZcJgg+BquvNo3XmoToCILuyL1GuT4U0pO2aoTqPnS
   F/6SmFEELguOK0X/2xjPcEeA4yfOeI+tqgd7A3+ucdR8giPmZJd2JcVC1
   5vvANpuBjVoTA73ZVpW3LY8mpUlMWy8gl71J4sdB196qYtpXLmA1pEQLW
   tv2HFBhJ1mLJP4LA76agrBnmshRnJs49Wv7aBnRsO2XRV2hUpFWfuqaas
   Q==;
X-CSE-ConnectionGUID: YMKHAle8TuKCYEqqqGLavg==
X-CSE-MsgGUID: ciZSZy55RlOmPUtmeVLdOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63539921"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63539921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:07:24 -0700
X-CSE-ConnectionGUID: LIDXKcu/RGm3nxaG4wzKIg==
X-CSE-MsgGUID: tiwr6C3HS+Wk4w+q89cWBg==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:07:20 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE1DA-00000003Y70-4Bfj;
	Wed, 29 Oct 2025 10:07:17 +0200
Date: Wed, 29 Oct 2025 10:07:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v7 5/5] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQHLNIKK4EknyWEr@smile.fi.intel.com>
References: <20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com>
 <20251027-i3c_ddr-v7-5-866a0ff7fc46@nxp.com>
 <aQCgD3iVOXoNr7uY@smile.fi.intel.com>
 <aQDhv/r0l0oOjb9t@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQDhv/r0l0oOjb9t@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 28, 2025 at 11:31:11AM -0400, Frank Li wrote:
> On Tue, Oct 28, 2025 at 12:50:55PM +0200, Andy Shevchenko wrote:
> > On Mon, Oct 27, 2025 at 04:08:33PM -0400, Frank Li wrote:

...

> > + time.h // for time constants

First of all, please, please remove the context you are agree with
(non-replying to).

...

> > > +struct mmc5633_data {
> > > +	struct device *dev;
> > > +	struct i3c_device *i3cdev;
> > > +	struct mutex mutex; /* protect to finish one whole measurement */
> > > +	struct regmap *regmap;
> >
> > regmap has struct device, i3c_device presumable also, and here is struct
> > device. Don't we have some overhead?
> 
> i3cdev is used for check it is i2c host or i3c host. If device connect to
> i2c host, i3cdev will be NULL.
> 
> Only if connect to i3c host, driver can use i3c transfer api. The HDR
> command is quite difference with SDR or I2C, which hard to wrap into regmap.
> 
> Anyway we need varible to indicate i3c or i2c. struct i3c_device *i3cdev
> will be simple and needn't force convert struct device in regmap.

This answers only to part of my question. Okay, let's leave it there, why do we
need an explicit struct device then?

> > > +};

...

> > > +static int mmc5633_suspend(struct device *dev)
> > > +{
> > > +	struct mmc5633_data *data = iio_priv(dev_get_drvdata(dev));
> >
> > Than regmap will be derived directly from a device.
> 
> I have not got your idea. Can you point me a example?

dev_get_regmap()

> > > +	regcache_cache_only(data->regmap, true);
> > > +
> > > +	return 0;
> > > +}

...

> > > +	return mmc5633_common_probe(dev, regmap, "mmc5633_i3c", i3cdev);
> >
> > struct i3c_device doesn't have a name, does it?

No answer?


-- 
With Best Regards,
Andy Shevchenko


