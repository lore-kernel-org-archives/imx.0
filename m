Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827443D4FF
	for <imx@lists.linux.dev>; Fri, 15 May 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838068; cv=none; b=IOlbUysqyPTgkOMp0lE1+lnFY3oalrhZEAke/Avt7rVOdUXEBP1j21J8VKAqSaaUnscvv6qCkL8dFhRjVkztxncDdwSR2zll1jpRby5KGcx08bMfKrMTF6RFX4x7iMF1epdRMmVCFUVGX2pPHPJUs71ivMCUdS/lpI6NeXgyP+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838068; c=relaxed/simple;
	bh=jtzP8n1Vr8tjcuiyXDI7a1LkVoMXMwqoeEjfckMwmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8M9fD1Yd2luEBlooAZVLKKkr0V4DIbA5O10J+FQNWG6NiCHZmyZ27si2qHm1hosUBG/FcHR4fZfUJAod3Q05R3XepWWgcOn6ARy32xTYXv/73wW+ABEtYqoF01WFB/f6qA6NlfgFxF4Im+jk+SVglwUt/e8fwJ0AOg0poX6nH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gG1hPEsW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gG1hPEsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778838067; x=1810374067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jtzP8n1Vr8tjcuiyXDI7a1LkVoMXMwqoeEjfckMwmAk=;
  b=gG1hPEsW+4SDwDJepae4LGxMPvzYRWxdFINOhuteoCzuIiCMsR62FAmf
   aXKk9MdsD6Lt4NTjTBvKZeni/TE7OcgSeo6yY9hBfKbGJGi3MohLDhBNu
   M6u08PzHG8Z8X8zxzwtioGWpsUrWudrvEMVRH5OW4BPA5oLVWJPmLbnaf
   T6gzJbBNT82I1Hauhrt6sYj/T3Jn5kum/m77XBs11Kskx2UluC6NcO96G
   ORpGhj8oEihFe0fZz3Nz0RxH+NsyUh3K/9OUVlvyR5mWp7eW2WJcjdlps
   P3iUnuLytcDJwTgP2zJ6HlydAgRauWTPaVJeHFn9F/COgD46i7B79g+tR
   g==;
X-CSE-ConnectionGUID: d994CB43RIyHNccXOAJoEg==
X-CSE-MsgGUID: QyYLrVJPQ16A8/Sg9oijbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79820224"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79820224"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:41:06 -0700
X-CSE-ConnectionGUID: GuEN3hrTQ6WW4Q+k0SAkcQ==
X-CSE-MsgGUID: lq3SxU1uQW6mmchEyGonDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="234400301"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.89])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:41:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 03E9711F93A;
	Fri, 15 May 2026 12:41:02 +0300 (EEST)
Date: Fri, 15 May 2026 12:41:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <agbqLmzZ5p33N18o@kekkonen.localdomain>
References: <20260514183357.3088564-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514183357.3088564-1-Frank.Li@nxp.com>

Hi Frank,

Thanks for the update!

On Thu, May 14, 2026 at 02:33:53PM -0400, Frank Li wrote:
> +static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
> +		if (media_bus_fmt_info[i].code == bus_fmt)
> +			return &media_bus_fmt_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +u32 media_bus_fmt_to_csi2_dt(u32 bus_fmt)

I meant to use int and a negative return value here, too.

I'll pick this into my set and change this as well.

> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	if (!info)
> +		return MIPI_CSI2_DT_INVALID;
> +
> +	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
> +	return info->bpp ? info->dt : MIPI_CSI2_DT_INVALID;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +
> +int media_bus_fmt_to_csi2_bpp(u32 bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	return info->bpp ? info->bpp : -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);

-- 
Kind regards,

Sakari Ailus
