Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0069A2EE5FA
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855570; cv=none; b=dDJRaaJ3m84EffLz0OvyGnJIqBmabNsBSzFkVR7rra1GBoU+cxWon5GvdpkryocA/6+KAhgSvu8sEL3UwVnK2+WEQ83iCSPqzi2c7oz//z2a0yF1DGvtN9F3mrFFp+SR6BlV2vqYVv0bAtSEOo2fz+uZ8zRKpXUQxGxiM9k23xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855570; c=relaxed/simple;
	bh=7TUjIdFSpxdPwhWS7KavRP+nexN6+krDK0zXKT3Z4nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdcYqx6UIbo+FjOUwIMpvYcGU5QyUShNQOdyerhkzDV/4i9T3TLNpS1Ep1M500rSHR7NbNJuGqAShqlYV956PQvKFW0UmoV1ob4eE4UhV1zBWU3c7rOt/0tyTPyhy4TXiymzdlEgN45jQ46XGXgrdEvYZfEhHux5PtTIrSnN8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGBIGLJS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGBIGLJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755855568; x=1787391568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7TUjIdFSpxdPwhWS7KavRP+nexN6+krDK0zXKT3Z4nI=;
  b=lGBIGLJS6HOSbRe2QS0LmpUWoJBiH68ex3L2pXQLrKtiyk5WqBuNu4EV
   2C7jTQv8iWL42BCFUOZ/kSZV1BoRew/kQ1TSgikzC92D2pMh+8ujd7lKc
   DwITehL27mL/oF9U+JOok3vS6rr5PkaQNssf9g8ZyBVMS6h1f+BIQyWxm
   qQTcDDe/3MJ5Gh+xjY1G5bEhNuGGi1MT3iLmJwggB/ZKWShn0oi/Rjwfq
   eFQw4QKS6pYif1it1lucWZ1s5QUnuHgS2QzGTsRdrviU7taowf3pSvTv9
   AwUsdb/75u8VJeu3mn5tfs3lGSER527f4YhK2KC5HxVNvvlFUN0Hnn8eK
   w==;
X-CSE-ConnectionGUID: I3Z4Zos0SmK+x2Vj5AWxOQ==
X-CSE-MsgGUID: hKP1+nZUSPujixaUXphbVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69260142"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69260142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:39:26 -0700
X-CSE-ConnectionGUID: f9G7SEp4RL+f9OQZP3DIVg==
X-CSE-MsgGUID: a3E0ehOpQtuXsOFDu60/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168177411"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:39:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1upOEu-00000007Tma-2yFG;
	Fri, 22 Aug 2025 12:39:16 +0300
Date: Fri, 22 Aug 2025 12:39:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 01/10] iio: accel: Drop unnecessary -ENOMEM messages
Message-ID: <aKg6xF4w2ugRqDMt@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 22, 2025 at 09:19:49AM +0530, Dixit Parmar wrote:
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().

Misplaced (), should be like
"...So remove the dev_err() messages from the probe."

Same applies to all of the affected commit messages in the series.

-- 
With Best Regards,
Andy Shevchenko


