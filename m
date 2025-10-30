Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37736C259
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846375; cv=none; b=kSxn1OPZ/qqFlU60WDJ9BASUPajmcdxmY8XETC7CEjMKKapK6sj3JUVStA3lEBDPwxXwafEJIozlj6A2aqOaDnN+DHm69CX2hPVmMGGq2bh49mo6DeHBQebS8LHyh7zljUq2jlX9Yiiue23Hml1F2/Sr0dfSMmHN6hYhRjIeWPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846375; c=relaxed/simple;
	bh=b2xexS6Qluhsr9ZmEqlGOXtDsR48B9OmLyAHTqqnzbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHwj6g3ufPpZJJ4v6qovA8BYhu8TAj5Bm7pdFrtYkvo525jry7AHMIC8FSe7PQ7Lak3Mji955K5S/TxPE6zPF+NJFE8AZeoM2ffenaDXJYgBUlbWAwnVEuc5JH4pSgtKu8LfSIUSS4StdGpGGH+hscjdV/WVSTBxmBaRsj7duLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWZDikB2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWZDikB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761846373; x=1793382373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b2xexS6Qluhsr9ZmEqlGOXtDsR48B9OmLyAHTqqnzbk=;
  b=cWZDikB2Lhgy3MPpUvx6ZgPGwsxr3diJ0NFIGfSymZuiW8bHSyZeIstQ
   9X5a8ByRVGmkOngtXTkaLaQYlbsyIA4A3/sOaq5JQDt2jFRjK369G1tlI
   +/Jgg0FV3WSkj7sFLf8DDKMSu/9eaBf94g7iBAPMX3nm5Y1bPSwPEVHmM
   ADqkR1v6U2hzOntDLXZoWnWlyvWTG+LrZlndS1dRfgyaAhJB7YMgvuEOQ
   rdRUBUN/Ucu60086/CHOP8uHiISULBGINeUg1YeoGW/uh4Kq1ujddmWW1
   /GUVOWnwKQgJXuiLLYpdfEQ3SVzd0iCdWmji92phRNE7xNwANA62a6sfu
   Q==;
X-CSE-ConnectionGUID: 41hSNk0RSbSVpjUwSj9owQ==
X-CSE-MsgGUID: Up3YsDcPRomqriG6gaRCmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64147430"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64147430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 10:46:10 -0700
X-CSE-ConnectionGUID: b/GmOWjcS2aKDC4H8SgNzQ==
X-CSE-MsgGUID: HAspeAjwQ7KrOmmY4Vdu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="191158265"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.174])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 10:45:58 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEWif-00000003zFy-3ih6;
	Thu, 30 Oct 2025 19:45:53 +0200
Date: Thu, 30 Oct 2025 19:45:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 18/29] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <aQOkUa1IwuiOeSvT@smile.fi.intel.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-19-herve.codina@bootlin.com>
 <6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 30, 2025 at 04:23:24PM +0100, Andi Shyti wrote:

...

> > +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
> 
> Not to call twice put_device, I would add it once here and then
> check for !dl.

I was almost commenting the same in one of the previous rounds, but...

> > +	if (!dl) {
> > +		dev_err(muxc->dev, "failed to create device link to %s\n",
> > +			dev_name(parent_physdev));

...haven't you noticed this use? With your (and my old) suggestion this may
lead to NULL / stale pointer dereference.

> > +		put_device(parent_physdev);
> > +		ret = -EINVAL;
> > +		goto err_free_priv;
> > +	}
> > +	put_device(parent_physdev);

-- 
With Best Regards,
Andy Shevchenko


