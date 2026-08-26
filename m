Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891C3D522C;
	Wed, 26 Aug 2026 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753134; cv=none; b=IVNx6p27qLfgpHHd551X+kVhtN6yOxQb8eTRQXRjmPLg5R+Whm63Nuaq9fNnxdvm0NPCzSVOe/HPU+lIHyZmh4jo/XPfccGyikegZ/9bG6tm5NkpRMXccpW3gGfqEzrKmvjm3GAzKGxCuuZQbXHtUyeTugzbve/A4ID44FrmKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753134; c=relaxed/simple;
	bh=zp4ZxFvHpCyZaEKvO6J2cBCPxykmOIHLHvOYN+zVeBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuGc03RivI+WCowCv88j8nnrnWmEZtUFwgkqZ9Eyh2wGajeb/3B4gzziV9SxSIew+R+CYqAOPo4azLNY64nidwnQXg6sbEd0Pymd/rK/NFmVTL0AfcEedFjDhJqjkvMb5CGEJJseoXr+WaIBe4iqYL1I5inXJLRKnfFHnHq52TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cx5EqQ6i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cx5EqQ6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787753132; x=1819289132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zp4ZxFvHpCyZaEKvO6J2cBCPxykmOIHLHvOYN+zVeBI=;
  b=Cx5EqQ6iXFgXtNnaE8r9PRoqiQ6W8bs59xIaNJd/WGZUBS0i4pxIXHWW
   jMydtMIHNEsljLeTsd7VZCo33BfxvENbUStQSIqJPlfOUosv8oqJ0/dSp
   wqE5CEDGs5Hiwud/BLYe77T5wcTEab7jBQRwCH9NqKaHrjkNXd6S1MExT
   sTq5I9Ow4IsYTO1+57TmVGkCCKkHmfQowKn2CNbzrSSDRPasg+lNwI0HU
   yLl0Am2IeYd0qL/IbUo0iJJPEv1+grr35ulFNjEpI1NLirKB/8evFILHh
   2ly7sWOatoTkdrlIZsNTSwoLKcWn6uj9C4IOgLHtBHazYp57OT/jbDw3H
   w==;
X-CSE-ConnectionGUID: y7lMAIQHR9CVL7x1M853tw==
X-CSE-MsgGUID: W/EllxAeQ8ygsC0KJnzaSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88362961"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88362961"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:05:31 -0700
X-CSE-ConnectionGUID: MfkaBtSDSpmzcaUT3yBSlg==
X-CSE-MsgGUID: ntLGhDOUTCuyxLKkJe4VcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="271090744"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:05:12 -0700
Date: Wed, 26 Aug 2026 17:05:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>, info@mocean-labs.com,
	Olof Johansson <olof@lixom.net>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	mfd@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop redundant white-space around values in
 <>
Message-ID: <ao7ylZTVJFeUJ5h3@ashevche-desk.local>
References: <20260826102044.142986-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826102044.142986-2-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 12:20:45PM +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues around <>, which will be flagged by
> dt-check-style.  No functional changes.

Don't know which file triggers my name to appear in Cc, but the change
I like, and indeed it makes style better to read and consistent.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


