Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F14212B14
	for <imx@lists.linux.dev>; Thu,  8 May 2025 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731747; cv=none; b=XFipM4bTVsSCDVn9yo4V5cjTxtX345Thf7j7BrCydyMFtIHoqP54FGc//zic9U8zEd4jPtuOTMP1A8aL9wXpBrTa2IDKW9F5vSvRgEr14FPl50GYiBln1dYSPciUyO+ailJ5H0Pj0Aw8VPYRHfCVQX79fctnyrfruMwNuSoMl+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731747; c=relaxed/simple;
	bh=kc2apVHoDu/c5UkKVj1TkV8BatDP+BUXsduJk1vXdY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZARyeSDUXTOkCIzvAybHOglcmGL2ENE7VXpPlNrGuCPk+5efFeA9ooPATrwKHc8ULmSfopVVu0f474rON5oM/9BuZFBjZ6M8k0hvZxOU1b0Oo9BAsLUKnaCyn9xjR1AX9s8TJB8m3fBgKJmn2KOrNU7yOlb1rJjsBcWOzi6vDuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsam05UR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsam05UR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746731745; x=1778267745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kc2apVHoDu/c5UkKVj1TkV8BatDP+BUXsduJk1vXdY4=;
  b=dsam05URfqXXIOa2V1/3+mnkeyo18su+K7mEfVFD0g9SVeyvMvLTggdw
   gfBeQWAtaNjliOGgtWx1yKSZhtHhUpJcDoJPMqdGMBadbhuGbgN/H9l6V
   Wgf9Ra6/k3aYF7ohuUdmD5LRuJFqeNlwc04Kc7kqszucvUSotfUGwYY5e
   bvydT3XBmDXk72CJLf+3YnhnIfhgMv9IseLYR7FlCFh7Xa5tl9rHwpdkO
   kO9M3AapZfVFI4TB6NYHndZAKf6QVoTfnuwC5GOC3lw7A+l00d6/3rs0J
   IvcbAsjxxlTKjKJAGQrLTcEhMWsHElEx0MyScasqEa8SIBv/s5JV6BqVK
   A==;
X-CSE-ConnectionGUID: HY46WZcPS2aZ2J/68nR1Nw==
X-CSE-MsgGUID: C5HwbxyfTHWJ896csCSlFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51198435"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="51198435"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:15:44 -0700
X-CSE-ConnectionGUID: bMEPplM9TIuxI2f+ID6KOw==
X-CSE-MsgGUID: tTrlCkqcRDSjExAAr9K+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="137383198"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:15:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD6iR-00000004D4L-4Bgk;
	Thu, 08 May 2025 22:15:32 +0300
Date: Thu, 8 May 2025 22:15:31 +0300
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
Subject: Re: [PATCH v2 16/26] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <aB0C05WnKkgslAuT@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-17-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-17-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:58AM +0200, Herve Codina wrote:
> When removing an i2c controller device handling an i2c bus where an i2c
> mux is connected to, the removal process hangs and is stuck in the
> wait_completion() call done in i2c_del_adapter().
> 
> The i2c_del_adapter() tries to removed the i2c adapter related to the
> i2c controller device and the wait_completion() is waiting for the i2c
> adapter device release. This release is performed when the device is no
> more used (i.e. refcount reaches zero).
> 
> When an i2c mux is involved in an i2c path, the struct dev topology is
> the following:
>     +----------------+                +-------------------+
>     | i2c controller |                |      i2c mux      |
>     |     device     |                |      device       |
>     |       ^        |                |                   |
>     |       |        |                |                   |
>     |  dev's parent  |                |                   |
>     |       |        |                |                   |
>     |   i2c adapter  |                | i2c adapter chanX |
>     |     device  <---- dev's parent ------  device       |
>     |   (no driver)  |                |    (no driver)    |
>     +----------------+                +-------------------+
> 
> When an i2c mux device creates an i2c adapter for its downstream
> channel, a reference is taken to its adapter dev's parent. This parent
> is the i2c mux upstream adapter device.
> 
> No relationship exists between the i2c mux device itself and the i2c
> controller device (physical device) in order to have the i2c mux device
> calling i2c_del_adapter() to remove its downtream adapters and so,
> release references taken to the upstream adapter.
> 
> This consumer/supplier relationship is typically a devlink relationship.
> 
> Also, i2c muxes can be chained and so, the upstream adapter can be
> supplied by either an i2c controller device or an other i2c mux device.
> 
> In order to get the physical device of the adapter a mux is connected
> to, rely on the newly introduced i2c_adapter_get_physdev() and create
> the missing devlink between the i2c mux device and the physical
> device of the adapter the mux is connected to.
> 
> With that done, the i2c mux device is removed before the device
> handling the upstream i2c adapter (i2c controller device or i2c mux
> device). All references are released and the i2c_del_adapter() call
> performed by driver handling the upstream adapter device is not blocking
> anymore.

...

> +	/*
> +	 * There is no relationship set between the mux device and the physical
> +	 * device handling the parent adapter. Create this missing relationship
> +	 * in order to remove the i2c mux device (consumer) and so the dowstream
> +	 * channel adapters before removing the physical device (supplier) which
> +	 * handles the i2c mux upstream adapter.
> +	 */
> +	parent_physdev = i2c_get_adapter_physdev(parent);
> +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
> +	if (!dl) {
> +		dev_err(muxc->dev, "failed to create device link to %s\n",
> +			dev_name(parent_physdev));
> +		put_device(parent_physdev);
> +		ret = -EINVAL;
> +		goto err_free_priv;
> +	}
> +	put_device(parent_physdev);

Since you are not checking parent_physdev for NULL, the dev_name() can print a
"(null)" string. Is this by design?

-- 
With Best Regards,
Andy Shevchenko


