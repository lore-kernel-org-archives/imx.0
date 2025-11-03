Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8BF28DF07
	for <imx@lists.linux.dev>; Mon,  3 Nov 2025 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762157651; cv=none; b=lNRZjwOjobyn5anet4x4ruU+VuO3kinxOnw1uRm+2FdDwtHxawQ/eDKp/Hv22keCeQXr/+9vOef+CY3lrY6PvQf2mheOLZlnXQAdGCB/VAumtziLa3MdzTA4pznQKvUrvOx+GMbcdygWGVoAHpYlhiYUVf9XjSYlZuyayeIHkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762157651; c=relaxed/simple;
	bh=eUC7CdLY2n+Ok064KsLsxj3DXcXd7nr4SrWNiG96MhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgqNT8uqfurFKMhyvCM518VoKs9Vlc5M93tma1Jny4eYOj7QxkKpiX03GL3nmUumMDUhM2HHLApbChkSSP4nfFeURjNqvy8yub6/y/f4E2epQ2XJyFNWEKURf/Iw19SURGMsaUbKj5QJZ2A/30Ixp55ISXN8fD9DzbGv/Sd+LtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTEg7NhN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTEg7NhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762157650; x=1793693650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUC7CdLY2n+Ok064KsLsxj3DXcXd7nr4SrWNiG96MhI=;
  b=cTEg7NhN6ciEy+10lKUGFA8BGfIB6u8yv/7P4TOcP8MLU3bCwxipwNZp
   EYN0sJAY3iIBthiIDYeSsaPHdziNuH98WPNi0E4Tw5SYHV8A0HzWpxsPv
   an6R0UofyKgR3KvzTXfbrqEPc5T0y47QgTN5jprPaFAoct655G+GUZIc3
   u2oSljv9xS2BVkglfsruKZklbIIJrraRqshGYwE2vMxgl45GeI9E4Gwoc
   pS3u5A3EuqgwKXn6A24xhggS1TfO0USYutNYC2+Kuzl+3SgJ2HZGnRhgP
   jsaGPLDwzhW88hB8zbPcqh/eZaL5bCdCzf1acieV47WJRcA7bQjMjSqeK
   Q==;
X-CSE-ConnectionGUID: gEMnF+5xSoqe3YZZ1i0WVA==
X-CSE-MsgGUID: DEx150MuTk21U4NO/JIfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68066186"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68066186"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:14:10 -0800
X-CSE-ConnectionGUID: ndL/zb5NTZGkQ8kBQOxdhw==
X-CSE-MsgGUID: wc3i3tJZR1O9K3nOaBqx6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186952919"
Received: from smoehrl-linux.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.216])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 00:14:06 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vFphP-000000055OO-0fwu;
	Mon, 03 Nov 2025 10:13:59 +0200
Date: Mon, 3 Nov 2025 10:13:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
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
	devicetree@vger.kernel.org, linux@roeck-us.net,
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v9 6/6] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQhkRmtJMoB7vv8U@smile.fi.intel.com>
References: <20251031-i3c_ddr-v9-0-f1e523ebaf78@nxp.com>
 <20251031-i3c_ddr-v9-6-f1e523ebaf78@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-i3c_ddr-v9-6-f1e523ebaf78@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 12:39:18PM -0400, Frank Li wrote:
> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.

...

> - 1 -> ARRAY_SIZE()

Maybe I missed the answer, but why are the arrays to begin with?

...

> +#define MMC5633_REG_YOUT_H	0x03
> +#define MMC5633_REG_ZOUT_L	0x04
> +#define MMC5633_REG_ZOUT_H	0x05
> +#define MMC5633_REG_XOUT_2	0x06
> +#define MMC5633_REG_YOUT_2	0x07
> +#define MMC5633_REG_ZOUT_2	0x08
> +#define MMC5633_REG_TOUT	0x09

Are those _L, _H, _2 come from the datasheet?

...

> +struct mmc5633_data {
> +	struct i3c_device *i3cdev;
> +	struct mutex mutex; /* protect to finish one whole measurement */
> +	struct regmap *regmap;

Btw, have you experimented to shuffle this to put regmap to be the first
member, for example? Does it affect the binary (compiled object) size?

> +};

...

> +	regmap = devm_regmap_init_i2c(client, &mmc5633_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed");

Missing trailing \n. Please, double check all messages for this.

...

> +	ret = regmap_attach_dev(dev, regmap, &mmc5633_regmap_config);
> +	if (ret)
> +		return ret;

Why?

...

> +	ret = regmap_attach_dev(dev, regmap, &mmc5633_regmap_config);
> +	if (ret)
> +		return ret;


Ditto.

-- 
With Best Regards,
Andy Shevchenko


