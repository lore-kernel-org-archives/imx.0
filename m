Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE8B15E800
	for <imx@lists.linux.dev>; Wed, 24 Apr 2024 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713968127; cv=none; b=gotASK/l+X1ojWlG7laYfx1z5kWC6oJddQeOfOpnBZcbGXhZqu07zSvqHlzIdh7IC9wjPI0/6RVFaPXU8J4Un7MdnPZmwRx1eLepTzSIN2FMA3TSJ74qw8yx6LMiHQ7xwxyiOAgFjtN4qhdE3cQExbz0wkkLtKBomsmJ+tQa4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713968127; c=relaxed/simple;
	bh=gMosq5KDq4+veBQ/DQ6irfWO7y5x/xROAoojLy7Xjtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5n0v04+43cCXJ2MyZrNUpw//6oT/WXmyGnYaDjutALhT1s8wGXHx+IledQTG2/xqC6Vh/GRSPXkjcVO41CXJ5imZJK7nrsrwVaX55Dsapk6qRJsJxpQpf717oIW4rW4ovoYX4B/iundXEAeg7p4jTJj8AtT+DMOwyd/bdonrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVGnSlhR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVGnSlhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713968126; x=1745504126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMosq5KDq4+veBQ/DQ6irfWO7y5x/xROAoojLy7Xjtg=;
  b=dVGnSlhRZV7nhbWNdiW3nqfhhKx2kJ7Genk8wkXUFBhL8E7k9h9lSIOs
   uSdudpEtYFiY6AIooMhGghqmaNcLfcurq7jKdAdXmpZPYuLtcQJmnQ8H6
   RBJG4AsRvB1xgLPrv5pRslU+F1+u6aSORZi6OIaycav8P1sh8fKQU/UMP
   Z26E8gXX0zNi5N3GtPWRmXKuTCFdpcoHN1YU5KNlcBLp/LyNlnPINGY68
   5zhz4owj6aee8+43IWpbZWGyad52lzi8mfjg82Mfbl8d4eUjpg485TOce
   nOfsfkG7nfLX3x/g1sSV4kevKfqZAUUYyuSI1GxqGYGRGtPzSrBL11eYh
   A==;
X-CSE-ConnectionGUID: j/fj34D5TW2PTATtOjGfCA==
X-CSE-MsgGUID: XwK72EkgS4y68TVLeiCA4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9452610"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9452610"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:15:25 -0700
X-CSE-ConnectionGUID: 1PwAzvoPSYuU9xCed7iHNw==
X-CSE-MsgGUID: H6Za2bLiQaqX+cjCsv32Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29527516"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:15:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzdOz-00000000ffl-36yR;
	Wed, 24 Apr 2024 17:15:13 +0300
Date: Wed, 24 Apr 2024 17:15:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZikT8QczxkIXoOlc@smile.fi.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
 <ZigSiCBIwoEIPYoG@lizhi-Precision-Tower-5810>
 <ZigUL7exXBSbWDIR@smile.fi.intel.com>
 <ZigXJJj4e+oaANAt@lizhi-Precision-Tower-5810>
 <ZigYqtyn4BTbWgRu@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZigYqtyn4BTbWgRu@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 23, 2024 at 04:23:06PM -0400, Frank Li wrote:
> On Tue, Apr 23, 2024 at 04:16:36PM -0400, Frank Li wrote:

...


> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


