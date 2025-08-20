Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A835D2E2289
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755697449; cv=none; b=gi78Nj5zVNFfCvhkMWL2Z1F5tKmCR8uDgBqHktDi7EmjuFywlCvuueNhTne2YbMIvTaYFdCtqz0aAXfCWKhIToFNwicLvAfxoakXnoRllT+VwqLpCSjPX6MZkBuQiqwL6RyoXJpTR3YIqtFN9/zp5KyN9dxRI2+WC1GDLQWXsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755697449; c=relaxed/simple;
	bh=ccW4DJ+w5B0tvFfy06eJzbjKks79ZjN2ZpCdAnZH4Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYXfgz2uDZcaXrMa2BaIJo9rnmN59vnDbnX/ERv5j6LYmGXcX9Op9/U2sYEIi84gmQGI4K8Bt5NnUmaoUcL5RkZPciBcZ6fwwv84leitFFKPjpW93cZh2RUQ99r0yDS18KU1hgVJCjapd/gP1Dvwo8UT1P8fPsMc2B6Ig7XQkD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+niXZTa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+niXZTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755697448; x=1787233448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccW4DJ+w5B0tvFfy06eJzbjKks79ZjN2ZpCdAnZH4Ak=;
  b=n+niXZTaP8gHIc5QcLpemeHcez9QOY6oX143hodzDE2oAllgKuos39xG
   usVqmk99mjLUFF4xAdX35RUjZgFYIYsH1EfuCJLCSj6LlhcA6nMlO3ZlY
   PvIwSdZtZbQSjm3fwsLRkgFK0uA83gMmDhH2UZkU891xPDXFra64By/GN
   N/DFV+NRNX2D7ZLo7JoVO3wr17FEcVTEfniwdbEKMhuPZeX+JRwWdguuA
   pYJsmxNiJTkkVI1dGuhghk0wucPYA0dDogrMZsIYAJ3y8OaZQx0XX6LBN
   RNQwSe8dxw07NU9/P4mNEry9UcEumZMrffE4FcVse/pUHcD1m/NOqDei1
   g==;
X-CSE-ConnectionGUID: FWcNwl6LTCqAxqB/Ce2OPw==
X-CSE-MsgGUID: KHi8aS0TQUiDDmlM4rcIQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75413016"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="75413016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:44:07 -0700
X-CSE-ConnectionGUID: 4QaIxjvgQ0aK7kjMmX1XtQ==
X-CSE-MsgGUID: q2Qzs15iR/Wyot4b2RKPmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168481230"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 06:44:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uoj6a-00000006wmS-3DCw;
	Wed, 20 Aug 2025 16:43:56 +0300
Date: Wed, 20 Aug 2025 16:43:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
 <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
 <20250814183609.3788a6df@booty>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814183609.3788a6df@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
> On Wed, 6 Aug 2025 00:55:02 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:
> > > Add an equivalent of list_first_entry_or_null() to obtain the last element
> > > of a list.  
> > 
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks Andy!
> 
> However I'm not sure when and where this should be applied.
> 
> Except for this one patch, all patches in the series are for
> drm-misc-next. Also, patch 1 is currently not needed by any other
> series AFAIK.
> 
> Based on the above, is it correct to assume that the whole series can
> be applied on drm-misc-next? (when other patches will have a
> R-by/Ack-by of course)
> 
> Also, is Andy's A-by enough to apply this patch?

The list.h is common for many, I think going via DRM with my Ack is enough
based on the Git history of my changes in this file. But if you want more
reliable source, get an Ack from Andrew Morton.

-- 
With Best Regards,
Andy Shevchenko


