Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74D1F9F47
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040649; cv=none; b=S9JVbBSF6dlJ8lMnW0pWdB5oNpxtBrSgBQ+8vZdXR546EsvPSPIIVYk9tG4khRwyS0GUUYy7IYiA4f+o6+pJrrCwY5LqKKMx8gACv4dz9Ks3t78plJBEXsBVo7cnGWkKI9SezIn+YsYTJSES9h86B1MF99n/M8T8FIQJf5c0tyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040649; c=relaxed/simple;
	bh=qdp7S8zYZK2tNWGM182FxMV42Ekv5vQIbw5ek6+RIF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma+FoeVhxHP/1wMxz+vqMzkrE6RAa/FZRglDt95JdLX2XwtRx37OC37HOD3MeMoh0uxNUetdJwRezQDcd1L7Z1z+OJ5FzMFMaBtLD7vXfwf8Q+QLrUqEGTg+5bh/NejSKxHrk7k4g7PQn2f66N8fEu3MUlQUmIZJjdYCRbyJpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5el0L5s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5el0L5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040648; x=1775576648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdp7S8zYZK2tNWGM182FxMV42Ekv5vQIbw5ek6+RIF8=;
  b=j5el0L5sYGtPGOdg1ruy1hmZR9u1R28/2RiYHyHpic/yjsowt6G0E9Ni
   UiAvrCjeq9adr4Hte37jKwH0WyOaLi//vOJu/sm9HDvQ/3C9xY3aoYepB
   P3PRHHO4mpaxf1+KEDb2KOVALVJhCXUY2y2N9mSCeB3/svBzXxdU8rDhp
   WrL9r7DevdQcxuMmbsyD3pFPgGQSqnhBoaaRsd95Vb/EC9k6UtHB5nvN0
   m9f3bNKo5oyfMS9SfqdQ+VPmeltbCC9IBj1e9VQV1mwYhGW8HaFwVgPhX
   tMEDKg4aO3Gou3+rB91/NswNKLHZk4KrTacMOVnDvX9yxIArdjMa8iuX2
   Q==;
X-CSE-ConnectionGUID: DvXUnRSVTM+wyFUSRQCH3Q==
X-CSE-MsgGUID: nNy9pASJQc+qXCPZLPmFWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44579328"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="44579328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:44:00 -0700
X-CSE-ConnectionGUID: aDcNRujzQ4iOgfKhELhzfw==
X-CSE-MsgGUID: a8eRIMDVTc+cxIlKZ8rSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128327640"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:43:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1odY-0000000A76j-0Bhp;
	Mon, 07 Apr 2025 18:43:48 +0300
Date: Mon, 7 Apr 2025 18:43:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 16/16] misc: lan966x_pci: Add drivers needed to support
 SFPs in Kconfig help
Message-ID: <Z_Pysw4apeyWtHrT@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-17-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-17-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:45PM +0200, Herve Codina wrote:
> Recently, new device-tree nodes were added in the overlay to add support
> for SFPs on LAN966x PCI device.
> 
> The LAN966X Kconfig help section mentions drivers related to devices
> added based on the overlay description.
> 
> Add drivers related to devices described by those new nodes in the
> already existing driver list.

...

>  	    - lan966x-serdes (PHY_LAN966X_SERDES)
>  	    - lan966x-miim (MDIO_MSCC_MIIM)
>  	    - lan966x-switch (LAN966X_SWITCH)
> +	    - lan966x-gck (COMMON_CLK_LAN966X)

> +	    - i2c-mux-pinctrl (I2C_MUX_PINCTRL)

Perhaps keep it alphabetically ordered?

> +	    - sama5d2-flexcom (MFD_ATMEL_FLEXCOM)
> +	    - sam9x60-i2c (I2C_AT91)
> +	    - sfp (SFP)

-- 
With Best Regards,
Andy Shevchenko


