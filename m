Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459804;
	b=iTCW5cvuzzVtkqeQYr2bzSLTnwMNhcvAjQJEScf4JpZJ54HzYbjMRolXq6f0BFm2c2l+
	 YavPZBtpuaZEZbm4rLejQrYEI+qH5Fb7TqSBmmq6fNtb6J17C+xZBGwSLDk2ZHKT1Q6y+
	 UVUdtc7thBdLtR9AWBDnCE1XE1GCuurADkGoF98invZG3nmz1BqqVwz/VvdfC5twJVKZB
	 yZ4q9rKFrwpORKmjsCbPHCz5GBeu+qUhPZjU1s6GHV15abgQoxsFwcLekA/kJ1DurYp6V
	 SxdlDskqagyZ+lHCl46JlqT4ORzEkHzuNPmvxDhQo9NV0X2GcJ3/mybOqNDvXtoK9xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459804;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=Rzz9rMTxPu5h4zXuwInMggFJc9C7/q94I+f+8DTqNVs=;
	b=5RYJCqrqIWVYDEhaHs2EbYWl8vPY7k8IlDiZF4cv3u6YZUm5TZzMNGbcdruPVY+Lv/5d
	 H2lyFBMCXrKRaaWcs/dPqpwPFSh9B/ns44rAXxW3Zyg55Gn6tFj94G87FTEj6FGU5zKxw
	 gqZBHkfnM3jYuEZIKT1QKvSDwCzUI/VDhj5LxomvYq03ArfF0hKv4hWSiFzTYvN8oCQtB
	 g64hDEwS2/Xd/Xk3VWggwgguAZUtrQj0KDqTPaNC0tyYBzXOu4QDq4xWfXCKZ51vIoC8y
	 GYboZPOjtoAK4siksPxOLD++qHhYcOvAq/xuUqC7AnErSOfH4JL5dbzYzmKs/7cFHyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqirGTVU;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233A2606A338
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 18:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233A2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqirGTVU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795459804; x=1826995804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cjeMKRm7en+iyA3bcXvhdG5tSoNAe/JoC/WPf09zNkA=;
  b=iqirGTVUbzEOMC1XYp1DSBhTy2vrqfWX+qeC2ASU5Nb7sJt7MF8wF8Ev
   4xMsHTyi1/3shg0cX/1NXOLzzjPH9FH8vyJZZVn6TNEw8AYfX1VOcJKUO
   D7Z8OLjdUkYHp2iK599XCDPFqz+srx9W7Yc3iJ7uGHtax7SfxLm2yeaDR
   Igd5Fc5VaD2XQeGM1mgiruja5A4ggUhSLmWL6rC2PiLg9chmfXw/T9C6H
   knbzC9TBd5dzhEZKfOun2iZjIys7MghBRzpgUBFmDk6LA0eIZQ7Ew0ifX
   5g5MblLUev+UXfiDGeyoed12PD6DttJPqfqLRtCdQvR5T5XN0lT93M3J+
   A==;
X-CSE-ConnectionGUID: xNsN0KjkQQqRBZG+KTBySw==
X-CSE-MsgGUID: nciiVNlDRPOkQhXNclmFPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4176996"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4176996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:49:56 -0800
X-CSE-ConnectionGUID: zr2t5mSNRrKoMsxKB4AbwA==
X-CSE-MsgGUID: Ee1aOYQAQ5qEWJP8jTM6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11776613"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:49:52 -0800
Date: Mon, 23 Nov 2026 20:49:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: imx@lists.linux.dev, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Johan Hovold <johan@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: spi: imx: Use devm_clk_get_enabled() calls in spi_imx_probe()
Message-ID: <awSKzgNGzuxl2OXO@ashevche-desk.local>
References: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
 <awR3jGcH97PrYNqc@ashevche-desk.local>
 <797d8f02-2e16-4ca6-bfda-8b6e40742a84@web.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <797d8f02-2e16-4ca6-bfda-8b6e40742a84@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 07:24:21PM +0100, Markus Elfring wrote:
> >> * Reuse existing functionality from devm_clk_get_enabled() instead of
> >>   keeping duplicate source code.
> >>
> >> * Delete clk_disable_unprepare() calls on error handling paths.
> >>
> >> * Omit the label “out_put_per”.
> >>
> >> This issue was detected by using the Coccinelle software.
> > 
> > This now messes up with the PM callbacks at remove stage.
> > It's not trivial how to make it correct.
> Is there a need to adjust and extend devres programming interfaces any more?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/driver-model/devres.rst?h=v7.4-rc4#n242

I guess you did get my point. You can't simply do what you have done in this
patch, because the devm*() will do something with clock reference counting on
remove stage _after_ the driver.

NAK to this change.

-- 
With Best Regards,
Andy Shevchenko


