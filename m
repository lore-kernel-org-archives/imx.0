Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B72750EA
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073330; cv=none; b=QKd2yn8vIsrWtyp3MfFP+qSD77K81g6rPkyjEY3+bQa1PSlQLf83IDqzJZGoazr2fL07XFcpsA60VjzBrq81hGjzd0j5OEIbR1+mlpn2Hnph2pAxE+WE1srZCviPtYmluGfyCDuXSr+4NSttbB7bQTX2YPBr/3ulqmQSGI71o3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073330; c=relaxed/simple;
	bh=tKv3IVxR4x+Lo88hvTXaRanXQjO9bR1OAuTbuJp33RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDSrFBwiwbjvBzUVMd8o8ANvi4xgYBC+Yfd7ei7ABAIsPHM2pOKtHjsMGxCtdRTBoKsRoiwXkhNrSHYF7sY5eLoAOUThQLFUH6Hqq7VZVzUxk4uyxkPQ9S2fgwqvJCb9TZvysypcupGzwe5F1VnvUCWXAv+f0VABdoZw5m3e9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfO4ujt7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfO4ujt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073329; x=1781609329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tKv3IVxR4x+Lo88hvTXaRanXQjO9bR1OAuTbuJp33RA=;
  b=UfO4ujt7eKE0Fsh5S2JDfkq8qYRgdPt3WBWTb2KIi4SxoRnVkUUava1M
   bwiV0Kk8ZdzotUuh5rBXidWkwUaRRd9VNhxUFUd+L5mw2fy6rRl+Lpnw3
   Optp5TzUJqKZE3X4PERqoeituhxNHTKE1E1gcxPjh1Oe8IWpwVHfAIzk5
   FelySVJhVBMMa/TAO90ocSIJXMDCj+39Pl9YaETh8Zf4WBMoKAjLCdI6A
   G9uQR8YeD03oXcgQgK1kLKRgFT02t1Uxa15jCaLOvNrUxOe0x29KZwXdE
   S/r2wB3/IKy8pgVoWdEsAuT6mTXcDAnvV+/n5UfHBv7WR3DbpEp5ep8Rm
   w==;
X-CSE-ConnectionGUID: azK0oYVkTqSlFMuvmyiO0Q==
X-CSE-MsgGUID: Za+NKNRGQIGHpjSwuu3+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56013991"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="56013991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:28:48 -0700
X-CSE-ConnectionGUID: CavMHqxJRc6wvzpGQZrJ0Q==
X-CSE-MsgGUID: 9jp8Syx1RJy/G1rE/YliHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179344519"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:28:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR80v-000000073fj-0ZrN;
	Mon, 16 Jun 2025 14:28:33 +0300
Date: Mon, 16 Jun 2025 14:28:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <aE__4I0vLIDgteME@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-6-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:
> The simple-pm-bus driver handles several simple busses. When it is used
> with busses other than a compatible "simple-pm-bus", it doesn't populate
> its child devices during its probe.
> 
> This confuses fw_devlink and results in wrong or missing devlinks.
> 
> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
> 
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
> 
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
> 
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
> 
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
> 
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.

...

>  	if (match && match->data) {
>  		if (of_property_match_string(np, "compatible", match->compatible) == 0)
> -			return 0;
> +			goto populate;
>  		else
>  			return -ENODEV;
>  	}

A nit: seems that now we don't need to keep a symmetry in the branches and
hence the redundant 'else' can be dropped

		if (of_property_match_string(np, "compatible", match->compatible) != 0)
			return -ENODEV;
		goto populate;
	}

But this might be out of the scope here and can be done later on. In my opinion
it will make code slightly easier to follow.


-- 
With Best Regards,
Andy Shevchenko


