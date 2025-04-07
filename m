Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9BB1BEF74
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039125; cv=none; b=Kc4jqjoqjPpas+OpujgpRnlVri3OUo6pS33Jcv12JqP5I2om1aV8MmUrnQhJwGLkwLvhVgyxfC5m0UMexqdf2ldssWfjirkfapBiK459KKauyEMtf3oqSnfNjrfu/y7D4VuvRRrrgKEjbH8nkRAm7Lblh9USzhSBYp9PRnJ0sSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039125; c=relaxed/simple;
	bh=1NJRt6LbnYr5vWij5ePJd37xgMVsqCx9Jmee3+UErzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4RZS7a1mD6QV/+UZ7xVP0jfm9Qq/8S/V/jOhSxtAcjtq5dMGmK0iLHbxf7WMFWHdfvXgaL9Lnb4GSgtAFJGEO1W+EeQMBVjPVCTyXhi58/4UJjuqAONrp0/jtE4xXBopKRT6ZdcFXK7DxiD4CsSuIxqs+EbtxtFGqhZMniCHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cotl3hj0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cotl3hj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039124; x=1775575124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1NJRt6LbnYr5vWij5ePJd37xgMVsqCx9Jmee3+UErzw=;
  b=Cotl3hj0Cfep0T9Pc4jViwGxS9nrDIeohOX9ci3fcvciQSJiAKvAMr0i
   NGxshsrGmK8g010rGdDQKAwan0ugGwuAAGR91/RDF0kqIq8XjbsGTZIwj
   ZXvKw+wcvhoiWzvBdhTmi69Sua+y1Zrek9vVRXvtgFfFsXWEoAHvWBTFa
   OVpIPNsgSMVL2+IKoK46V6yKYs/MolxEUc/DkxuAvr9900Vjqujct84zA
   bmatQjp393LYBxl1Dj16OMMwa4RKphEvIdL/Gsq2tD9rtRhiXJAO3/870
   5W6knsPu0hY8Yt8XLHNVBjR+93XOYm7QQw83Y+X8f43TwlF2kkftgL7iP
   g==;
X-CSE-ConnectionGUID: hmt6S+vdTtK+XHDZvtCGkg==
X-CSE-MsgGUID: 1NBfjJieRuCxZjom/OJ8PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62978222"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62978222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:18:43 -0700
X-CSE-ConnectionGUID: IqMU7/H/Rw+TqFJhz588Jw==
X-CSE-MsgGUID: TbsEHfwYSTaH3B2GpUiTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127866370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:18:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oF4-0000000A6jQ-1MZV;
	Mon, 07 Apr 2025 18:18:30 +0300
Date: Mon, 7 Apr 2025 18:18:30 +0300
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
Subject: Re: [PATCH 03/16] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <Z_PsxpQC-I5abp0o@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-4-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:32PM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> From: Saravana Kannan <saravanak@google.com>

Same here.

> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.

-- 
With Best Regards,
Andy Shevchenko


