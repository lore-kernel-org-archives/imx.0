Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1124657F7
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772136385; cv=none; b=OY4U3Qsfk2OLwbSSOmCGvouaZ8tFyTjOzmNznNRvOZoOodijolvZGID6rFcAP8/hqhCFaDRg7itanoy5DRaKttTOXuY9u/5DejKEfB89resiT2Y2zfrBGQzjFAku0VZTvmJDkkWhOwFtkCH+BBFsqvLW3dQeYMxYFHL76zP6qE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772136385; c=relaxed/simple;
	bh=KmOWNIRgBHtWMlabix2KX/fbklWBKHIUOM7hsUpVbZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNyCXjcXtGFgBClXHr3y60g2RCHRaWQeYE/f4+Au8k6K7iVr3gJ76R7kWUqUxQCmRz1VXb8mf7QQUeFCuhi11DJle/expTidn/TgLMAbyFLLKmWpli5pIOhvEmyc+8NQeCrVB9qbiyzrtCG0ccdXEianrUWcz/eJ+Nd958X3H1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jV9Qy09M; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jV9Qy09M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772136382; x=1803672382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KmOWNIRgBHtWMlabix2KX/fbklWBKHIUOM7hsUpVbZI=;
  b=jV9Qy09MBhv9FYG0/AVKqbQKS0cxtDGJQdE2QzkmshEUn6sP0iuCBc4G
   Wm2xlo9ppEjmdtYD4FL0qH+x+Onb1eNojU1VyTmuplUlPrEg6f4NJHtyx
   J/B/NeYvyjmeztVIQQq+DYInJUZAwNNLULzFbChDS5ZwGdPDEhXCQjzx9
   fIWqFvs+MPsZWzojy2fYBFsf/JfpN3rH279KpLU3E3cDHuM4SoYTbOkPq
   LqVSEAEsvOcpqTEqAfN7UC1csVrNmDnT55XiW8D9ZejWVjTdN9AvG/QuV
   LuxyGKv5tXdQY+quEQuVKIukPKaoVNX6vZlQLWpzE3ypNdVsurIX+Wuz7
   g==;
X-CSE-ConnectionGUID: KNW5YpFMRmq4/7c8KRpR/w==
X-CSE-MsgGUID: IIKw6DOURM6WQMZYiwKMTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77047366"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="77047366"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:06:21 -0800
X-CSE-ConnectionGUID: 8weXfwV+Q/Oabc0IuCwCUQ==
X-CSE-MsgGUID: C9Q0tHYhTOidXFABJm3akQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="220805385"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:06:20 -0800
Date: Thu, 26 Feb 2026 22:06:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND V1 1/1] dt-bindings: auxdisplay: change to
 unevaluatedProperties
Message-ID: <aaCnuYmWPBGVBb4Z@smile.fi.intel.com>
References: <20260226172258.257089-1-Frank.Li@nxp.com>
 <aaCIEs-65JQUkSyA@smile.fi.intel.com>
 <20260226-nanometer-reproach-8c87569cc837@spud>
 <20260226-observant-finishing-c07452049544@spud>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-observant-finishing-c07452049544@spud>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 05:54:54PM +0000, Conor Dooley wrote:
> On Thu, Feb 26, 2026 at 05:53:43PM +0000, Conor Dooley wrote:
> > On Thu, Feb 26, 2026 at 07:51:14PM +0200, Andy Shevchenko wrote:
> > > On Thu, Feb 26, 2026 at 12:22:57PM -0500, Frank Li wrote:
> > > > Change additionalProperties to unevaluatedProperties because it refs to
> > > > /schemas/input/matrix-keymap.yaml.
> > > > 
> > > > Fix below CHECK_DTBS warnings:
> > > > arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
> > > >         from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#
> > > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > Resend include Rob's Ack tag:
> > > > 	Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > 
> > > I didn't get this. If it's official, make it official.
> > 
> > Funnily enough, b4 picks up Rob's ack, although I think it gets it from
> > the original posting.
> > 
> > > Also, shouldn't it have a Fixes tag.
> > 
> > Sounds like it should, yes.
> 
> And if that requires a resend, the specific binding should likely be
> cited in the subject line.

Yeah, please resend with tags added and Subject corrected.

-- 
With Best Regards,
Andy Shevchenko


