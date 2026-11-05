Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869660;
	b=xRb66uob/v8aQS4ScpbvUtEJDkmIU0KNpJwk2FNp5q37zr4LnTeG/2rc047PjnmW/Gpl
	 8cHo6kvXm97b9CtD9uJ/3IZCnnGQKo4UNAT0ltFttxqLcijAUJwNqwzBirZlGNPO1uuJ7
	 8GK0cPP0gGJZqzPWWVx8ihUBw/nLkv8QBXPS9uT+iOhh08fpKTQ0VVKmA+a0KMypDQ9Bx
	 KVwyVjPDc7apg9YwaJ0ICQx8npp54zoRiHagorEnmpwsJ4q3ruElyqdUB2Z3rJJ8Xkr9o
	 Z5KaMyeqsg9+hZr/w/u9P8tywgP5wXt0eE7+2GlagclFKjIiTaJZgT4B9DIqUJCx/Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869660;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=n2xCmog64AGKMXZW1kunHj4ya5Tb7T8D0cVzpzhIyow=;
	b=xjhBtNHrAe+QUH0KUUzvAHqt4frCivs4QmXwKrSeyf15REYDW5iVE21DfblVM5JVXQmh
	 MxE9eVlBEtxhJEm+vd0s6kh013tbL1ORvt/UfRxNm1MZKTS5bcezfkLNDT15rQXWbjIg8
	 tGkDJqunai2n4HANQyBDh3DI8r/+nur0zfGTEDvjsuC+LILjOcfpKZkY/8JamsBCUwOyX
	 oDeawEAA8Sp6lyvQ9tY0DTT673B0pcSlMSAPS1OdYspcRvvmMt5bvTDeRNhxPAYZm+4dy
	 y7FhuO0EfzB+XVVol165eMMJdg76DHCVqtR8yFJ4pvD7eO/ZhC+SXQ5mn3Q5d4P3afg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dcd4l0yI;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A47606A328
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A47606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dcd4l0yI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793869660; x=1825405660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YJohrnn0X6YdnhzwUjJAKaTWxHJk2t2HvqKiuYmlRe0=;
  b=Dcd4l0yIwvkWk4UlAwrOKlv4yacne6B9U8oK4AenNg768gAyTg96uKmX
   5MX8m9xiQmmm69RRIv9RzPQBBanQIZBO9geEhuRSADMYap2otnqjaqwCw
   MZ26yJgbKcoDH5Oo8V/qN4k3sQvlZZK92pyijhtVkecuHqBTNF1JI+zRF
   TiwjIQbet1SVzbYsXluHAgpBJPYv0R2mXxiw0VtWF6Fw7cVkaN+Cx3PON
   sHCriyAdM72ECQADjzWu/F6Tt869HCoi1lHNfAWKnNK+hCs6g3lgRdJ9Q
   UDFn2S03VWD6hneoJ850fDzpfwT6b4crQBJ5PwoAyeFoWQVsKe37Pz1LA
   Q==;
X-CSE-ConnectionGUID: sknEKeyOQYWz1/I4EDs/4A==
X-CSE-MsgGUID: lrOekWCbQmmDSKpPrLcR2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2533360"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2533360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:07:40 -0800
X-CSE-ConnectionGUID: LhD/33EfRn6nz2oc2cFwKA==
X-CSE-MsgGUID: Sg2CeagcTPu0Gp5Gx8AUbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7514404"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:07:37 -0800
Date: Thu, 5 Nov 2026 11:07:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	John Ogness <john.ogness@linutronix.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Zhaoyang Yu <2426767509@qq.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] tty: serial: pch_uart: replace chan->device->dev
 with dmaengine_get_provider_device()
Message-ID: <auxHVrXvITqUpjzg@ashevche-desk.local>
References: <20261104145211.3209669-1-Frank.Li@oss.nxp.com>
 <auuaYxoZm2T25cU5@ashevche-desk.local>
 <3b390b39-c27b-4b62-aa49-5b1bb56c3cfb@oss.qualcomm.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b390b39-c27b-4b62-aa49-5b1bb56c3cfb@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 12:04:25AM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 21:49, Andy Shevchenko wrote:
> > On Wed, Nov 04, 2026 at 09:52:06AM -0500, Frank.Li@oss.nxp.com wrote:
> >>
> >> Use the dmaengine_get_provider_device() API instead of directly
> >> accessing chan->device->dev to get the DMA provider device.
> >>
> >> No functional change. Prepare make to struct dma_device private to the DMA
> >> engine.
> > 
> > Krzysztof, this patch was a split from the bundle by a reviewer request (not me
> > FWIW), and author obeyed. So, you can do the same in cases when you got something
> > you want to review independently on other content which most likely is a noise
> > (to you).
> 
> Do you propose that I read all patches and complain that partial reviews
> should be split? How does this proposal solve my complain that:
> 1. Incomplete/partial reviews will be marked as full review of the commit.

You mean the problem of tooling? Why is it problem of the tag?

> 2. People get same credit even if they intentionally did not read 95% of
> the patch as the people who read 100% of the patch.

This doesn't stand the same case when patch is split. I will give a Rb for the
full (but isolated) patch in comparison the same code being reviewed in the big
bundle. From my perspective (as a reviewer) I have done almost the same work.
So it's an equivalent.

-- 
With Best Regards,
Andy Shevchenko


