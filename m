Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18DF28A1E6
	for <imx@lists.linux.dev>; Wed,  7 May 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630176; cv=none; b=uKWKieHvVx7Zsw0H4KpwhaylhwzLDuA3N/RNJEJqsbqQhRkVyGVb6IuM5K9p8rTkiOeFFpNB+qDwRZrwQ5lUVnzRG9JY4loW89ERlMuMKwUJWm7e/WYk35JMP2sWYMTijEf2hvM3e/tyju/z4rCP+3H+IBesukF69pnc0YTGMCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630176; c=relaxed/simple;
	bh=vtUHYngmcvy8/hID4LtvlRBZCfZROB/R+TjQOTME2Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vkg3oZlzc1nezsRxZTGcClrBE9qPCB+zFe3mELv1G0dMfbFV1sZO55ekzRCa/If34VtYuj2Omu8S9Fr+q4QdQky4uUOYdyWWPuaTh4GxnuO26Onzs5K1IVC1h5poo3A8RTvvINlK/e3SulWpBdl309ee50zyanlr2+0/lh1MiV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFkFaMoV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFkFaMoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630175; x=1778166175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtUHYngmcvy8/hID4LtvlRBZCfZROB/R+TjQOTME2Bg=;
  b=hFkFaMoVPDeZwlQkBf9nAxgHk3FnX2hqj2MM305TMlU1VQ5fAeuQrxY9
   8LOV1J6mhS1rkIOsxAIK1AqKBrGMHvNmr5fDYdoAusqX3jhjXuyrOa/EP
   IeNNAbRzS8o8ua+tqQa5SMIx0vBLWitwyXILQBXDg5QOPX2QFDn0tsuL3
   i3Lm1En9rkQcA2kSNanXrhJLRXUXB+tlFqKcCFx5GcJTbAgJwQ4YRj1Sf
   RauDgL7QUrfJ79UdVTqH11ppCd8GievMRKu6jpnC65kjdtaxcrl5Vqj7g
   nNPAMH1wRDUIOGU5gB4Zzj/8hAH8TFJfbnLDrJZZQFez+DcPi37NCaJXk
   A==;
X-CSE-ConnectionGUID: mwTCr5QsTGKZs0iRMAclOg==
X-CSE-MsgGUID: yL6/x1UzSse2V7RR6aqOXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52020387"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52020387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:02:54 -0700
X-CSE-ConnectionGUID: lRvf7inWQZi1tpGGkpwiJA==
X-CSE-MsgGUID: n7eeEJ6hSiWvPOaKwLixag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166908528"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:02:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgID-00000003lNr-0NGr;
	Wed, 07 May 2025 18:02:41 +0300
Date: Wed, 7 May 2025 18:02:40 +0300
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
Subject: Re: [PATCH v2 06/26] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <aBt2EHYf6j6Ulthb@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-7-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:48AM +0200, Herve Codina wrote:
> Setting fwnode->dev is specific to fw_devlink.
> 
> In order to avoid having a direct 'fwnode->dev = dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.

Makes sense, can you also mark that field as __private? So sparse can catch
the abusers up.

-- 
With Best Regards,
Andy Shevchenko


