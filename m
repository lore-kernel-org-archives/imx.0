Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA81D2B10
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803993; cv=none; b=S1dsPrgkqutTN9ZBTnJWXKVKa5RmAagVGZmRDI2nFKYVvTIlZpPg4OXe7O/ZWXn+Pv50tvuWhyoWXl7T1d5Ek0CBD5y/CYr8k23utwcaDyKn+3LoE712WxvziTOi8Wwtv6Pfuckv5uThtWOzK5OgjrHQ0rfAuhu5vqM4+bOGKS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803993; c=relaxed/simple;
	bh=KVvcpQ5F/M9q98s+qccoETOvBMw6mTVjp58jf47uN90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HS38/ii4tFFLp+wHHyFHuxXMQEEKHOYCu9XNHypkNpyYReCz+suhkS0KXwS0aE0AEzHV0r7vKH9GEm8gHsXiDbFyG/EQclev1dhLVY7bp9nyzJaKtk5BWOgfCqWa94ivuGNZuf9Ic6M3BXlCoC7l3s9+yO96eneF7TP7rsWIIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIImtxyY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIImtxyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730803992; x=1762339992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVvcpQ5F/M9q98s+qccoETOvBMw6mTVjp58jf47uN90=;
  b=oIImtxyY7kNz+Cxq9MUThZhvLf5MZkkNQ9dhH6ZwiNRKEKoHOoc7FvmC
   HWgy1pcY9oNhP8KJZstnhboNtKGzYe2nFSP0p9xn58+1y65Of+ICy7cII
   gUV7qZbWQGDP4/5lcnFkeIs7KWz0iWx0cCVx4JBvzdO3vhS0y3nKTAMR8
   LP2vvKT9A/sZfqHxzPPqyFjJLIOxuCZ6hbS6SR3HXE0c2sc2IVxgMYbfb
   1SU6oo/EGAbbldI2/pdoqSzQczN7/hJ1RWkcT14ZYheIzpp2u3ozTCcjG
   vRSFBg/Vv8mJ3PrKm1AugxrmIrpyitN+Es5FhzSmfCUoU/9KOHZDD59vY
   A==;
X-CSE-ConnectionGUID: NjMPfhtJSEuB/NmBbFHSWA==
X-CSE-MsgGUID: ESrLDN8CR3uUnvWyxPwHfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30653510"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30653510"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:53:11 -0800
X-CSE-ConnectionGUID: h4i639knRvOKyDrJl0aW8w==
X-CSE-MsgGUID: dV0VB4bERsKTIxQsQJPO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88741763"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 02:53:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F131411F9C3;
	Tue,  5 Nov 2024 12:52:58 +0200 (EET)
Date: Tue, 5 Nov 2024 10:52:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	catalin.marinas@arm.com, will@kernel.org, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
	nfraprado@collabora.com, thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 04/13] media: uapi: Add
 MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Message-ID: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-5-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-5-victor.liu@nxp.com>

Hi Ying,

On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> Add two media bus formats that identify 30-bit RGB pixels transmitted
> by a LVDS link with five differential data pairs, serialized into 7
> time slots, using standard SPWG/VESA or JEIDA data mapping.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

It's fine to merge this via another tree, too.

-- 
Regards,

Sakari Ailus
