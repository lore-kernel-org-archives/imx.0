Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7E219F6
	for <imx@lists.linux.dev>; Mon, 18 Mar 2024 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710792136; cv=none; b=Vxt6xcwNfaxURLAES/EU3RLBSxt8brIHJlKTN0rOQnyO+4E04Bmz0aZvPzhZPphF5S9IK8lqxHd+XilzI6j0TQ23wF7y6gC40ij7Hw4I9xe54aGFdz4xQ1krQGf413DZse8EVM0QRHHRp8SHie9NolUWkMH88OX8UL9KjylCHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710792136; c=relaxed/simple;
	bh=ioTrYBrdsE7izn+AcJYryuQbQLhywGSNPivL7f28es0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tv/Fx3Q8M8LxsNJzZpUFHteeNl5FGPwxbGfnMStMWnOmhpNXEVJyHgznJEAotkPdP/yPxaKp8IxkIxYO3QaEmvL7UdNzuyknvjDg9+I/j25RTRdF8kUTpkVSYvcP7p2CX2MhVv2YHthq3m3MwYg3xTEQX4j+CrWScGvSVnfg8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwTpHzWQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwTpHzWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710792134; x=1742328134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ioTrYBrdsE7izn+AcJYryuQbQLhywGSNPivL7f28es0=;
  b=LwTpHzWQmfnl/gKPoEvbrwS2UvHdYkQovVHo6LCaJbD+IcVPh5ETDqBs
   rM5SRXgJR+8dZmpDkWsJw7YHFECPuwOTxyH2aiPss/chHDabHFP8l1yas
   HofsJyQM9dyXkyFf1GShLZCQYHyGlvJrGwZnoXp/P7SwgnxUBo/xuiaJZ
   wet+5NPIhOjw/zjQaKMRZhgz1JYaa+38hxwWN9H5K2qyI2KexubhJiF1L
   RAayBTpSbr6Z9iIcwChJ+zaujErBjwpMgQVtaEmnykcPoyIIMG0NKLHYh
   BkGFJENt9c/66olH4vcaEQ0UL/CpGqxfQBZmXxAoRv5SVzp5f/piA1bej
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5508538"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5508538"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 13:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="914603538"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="914603538"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 13:02:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rmJBO-0000000E40t-2XpO;
	Mon, 18 Mar 2024 22:02:06 +0200
Date: Mon, 18 Mar 2024 22:02:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
Message-ID: <ZfidvrfrwMmYQBcK@smile.fi.intel.com>
References: <20240318195837.180069-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318195837.180069-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 18, 2024 at 09:58:37PM +0200, Andy Shevchenko wrote:
> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().

This won't compile, sorry for the noise. I'll send a v2.

-- 
With Best Regards,
Andy Shevchenko


