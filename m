Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A691332612
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772128281; cv=none; b=XIOol6Ur1CRdhNABdFdPFxivbQuFNOEvlFvjjajOtMdKxRXTLYso5PJ36GDLjZvlFybeoP1Vg+4QtNUWdJwAjEk8cHKoBf0Zxv/Mlq1k2miqysopcbzgHk+g+IAHsOPpBMFm1Nardnw1XArPymL/I5482ht6x+yI+Clkh8jGQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772128281; c=relaxed/simple;
	bh=+qK3PHCrqi1lnXheNRqOJUIPgXyJ0wM78kYFEAUUPOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koX67pCpz/EkXA+vNF4T5gruHe0NvSHQzHOdMNNb6NoVs5OKJpAUgdjmKHE33902ibBaiGMvIwMSamL5HRILopVgVmExqgLP2Jh4DiNBYJhmWTYRXnqB17UYXFBhcXIhmrNG9N/8fTWggKvX/HLofleF1xQ4EliUBCNBd6vnzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nh9GkyVp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nh9GkyVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772128280; x=1803664280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+qK3PHCrqi1lnXheNRqOJUIPgXyJ0wM78kYFEAUUPOs=;
  b=Nh9GkyVpLENWTI7SQ0N070XMZxShyXYNoLK2EA9VKLF7PWsgCY1ff6Jt
   CZ/2+Tsb0EtPiOBMdYeCLa0gU/qIs1Kc/w+E7cdexnPi7IbKght8qJffe
   QXwNPDIJHxYYJ3Fzgc54dxHXoBwUvIM1Z66L9ZWBSkuffrN4avoNqeVxW
   qqxfnnGruILL1gi7XzkQOGE70JMtFyfyGvFof9oME3C9aSxaESI8FY7vM
   45Up17/B1N4Bmt3dVfmMov93/ZDtV97RRqkfXk+4PiYXCSQYGVTQQINCp
   XsSc+vNxlcHuZ6TgBvcDRy/x0zLFWVGkvy04OzMcJLTMmCC7jTDtQGQuc
   A==;
X-CSE-ConnectionGUID: +QZYErfPQc6fwkEtp00V7A==
X-CSE-MsgGUID: Z+I+9UO2TkWYuQjIMMUnCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73305597"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73305597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 09:51:19 -0800
X-CSE-ConnectionGUID: G+bOsObvTpy3w3naMNZPJA==
X-CSE-MsgGUID: 443axLycSWiUdQJYoqtLyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216652160"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 09:51:17 -0800
Date: Thu, 26 Feb 2026 19:51:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND V1 1/1] dt-bindings: auxdisplay: change to
 unevaluatedProperties
Message-ID: <aaCIEs-65JQUkSyA@smile.fi.intel.com>
References: <20260226172258.257089-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226172258.257089-1-Frank.Li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 26, 2026 at 12:22:57PM -0500, Frank Li wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> /schemas/input/matrix-keymap.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Resend include Rob's Ack tag:
> 	Acked-by: Rob Herring (Arm) <robh@kernel.org>

I didn't get this. If it's official, make it official.

Also, shouldn't it have a Fixes tag.

-- 
With Best Regards,
Andy Shevchenko


