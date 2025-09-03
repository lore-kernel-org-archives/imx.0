Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B069302777
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927273; cv=none; b=pWu9p1f3ecjDSOdAMzypEDam6znJQaZ0Lrvw7s760r2A7Sa2XoweCsA/za3tBMoFOInxvLX4rEDWIuXeU2R9/Ir3CWNPi4EHSQySw1mia68yDtXS2sXR/vtGxzCU8EsCWJf5oi34wEHJiYASMdGAzYAi5tZkXco2y0aCTRQEl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927273; c=relaxed/simple;
	bh=B0C3HqLjJrxPmuqoq9BR1gfOrlkFD/kDcF+bPmMHumI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyPq+8YrQwWyxkzKZ0v64vPu/KN8mK/2O15EdeGUbeM4CEVCyHR1FEhrac9kHmLMaIJUzSPo53a561IOELO7EWIMN/0KewHZxCcdd0ZLg0vMmRuurgHZ3/V/wWS4/o0f10hlV/X6z0szNd+xcdpbmzSJWK6hnQ2Xsn+HlBvqAY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiJ+lakO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiJ+lakO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756927273; x=1788463273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0C3HqLjJrxPmuqoq9BR1gfOrlkFD/kDcF+bPmMHumI=;
  b=EiJ+lakOEFf494NpkmCoC+vpfZkGhH+VsF3eZvhgqfEbe56zA/sk0BJN
   d/3Ojn1FRmR5SOIfjtDZ7jjEhnwO+7AwFkLPThBTYP/FQKdfufU4SFgOX
   +R10ldJoQLwu2TzMx3v4G+qAkz02fgmNaRKDwMl43uAi2oWJbBZLSFX3+
   YmK42ICRy2XzaaaFamcECMDDRsmaMekmYgzneUa4NmcEXnOK/vZiPmItI
   oVrSx1deTE0B/aQ7rE+2pIiWrnJAt7bY7IQR0Dwskkd2+U1xKArzQiAK7
   7Utu6tj6ZQLtMbfZmt6GemWInfZ1yfgWF9mDzQwxuDgCPb1+Wpw0JqzMg
   w==;
X-CSE-ConnectionGUID: 0WUcmcVaRguszb1g7W+sgw==
X-CSE-MsgGUID: 1MV74dn0RXWbx4+iHLzEAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="62898334"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="62898334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 12:21:12 -0700
X-CSE-ConnectionGUID: y4RB/p5LQzazpADN3Ik4ww==
X-CSE-MsgGUID: B3f1SfsnQGGOL5CGYAX8DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172120265"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 12:21:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1utt2V-0000000B4Fx-3aJG;
	Wed, 03 Sep 2025 22:21:03 +0300
Date: Wed, 3 Sep 2025 22:21:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Simon Horman <horms@kernel.org>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alex Marginean <alexandru.marginean@nxp.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH net] net: enetc: Correct endianness handling in
 _enetc_rd_reg64
Message-ID: <aLiVHw4WQW69A5qL@smile.fi.intel.com>
References: <20250624-etnetc-le-v1-1-a73a95d96e4e@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-etnetc-le-v1-1-a73a95d96e4e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 24, 2025 at 05:35:12PM +0100, Simon Horman wrote:
> enetc_hw.h provides two versions of _enetc_rd_reg64.
> One which simply calls ioread64() when available.
> And another that composes the 64-bit result from ioread32() calls.
> 
> In the second case the code appears to assume that each ioread32() call
> returns a little-endian value. However both the shift and logical or
> used to compose the return value would not work correctly on big endian
> systems if this were the case. Moreover, this is inconsistent with the
> first case where the return value of ioread64() is assumed to be in host
> byte order.
> 
> It appears that the correct approach is for both versions to treat the
> return value of ioread*() functions as being in host byte order. And
> this patch corrects the ioread32()-based version to do so.
> 
> This is a bug but would only manifest on big endian systems
> that make use of the ioread32-based implementation of _enetc_rd_reg64.
> While all in-tree users of this driver are little endian and
> make use of the ioread64-based implementation of _enetc_rd_reg64.
> Thus, no in-tree user of this driver is affected by this bug.

...

> @@ -507,7 +507,7 @@ static inline u64 _enetc_rd_reg64(void __iomem *reg)
>  		tmp = ioread32(reg + 4);
>  	} while (high != tmp);
>  
> -	return le64_to_cpu((__le64)high << 32 | low);
> +	return (u64)high << 32 | low;
>  }

Description and the visible context rings a bell like this is probably a
reimplementation of ioread64_lo_hi().

-- 
With Best Regards,
Andy Shevchenko


