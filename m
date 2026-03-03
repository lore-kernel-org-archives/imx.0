Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6032DF151
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524780; cv=none; b=UNV8wq/CN2dDApLYSBRaiqfYK3/mVHkfmjZGbzHAFPWHP+7F9zhAVv/+atLpSC9KRuMF83buBX3xxRsizru8HVjBdm2YQGy6IGoFQh2sVBR86Db4WIXbHr55Sf6/iObNHCY2kigHI5aPXXvXEoh+HWer5ucilU+evh8CsamFHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524780; c=relaxed/simple;
	bh=kDiWfbOjDcW3IBCAOKRBRAZKSl/xaRIAMX84tuGbo4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/T9FKhuA32MIcnq/besX36wZbqkg0XSyZGsqz/yERaFP+hLQM5P3agZ+zhI2KWUCevP0mFe6DugoGZs3KVhu69IdwDvgCv1SFl5JO6Wb3Ha0EK03FEubIVj0C7hWdjwZd4e5DKM0Fxq7R4PptFrM01wDw+CsadeTRaYDv2LKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEpw3x2Z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEpw3x2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772524780; x=1804060780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDiWfbOjDcW3IBCAOKRBRAZKSl/xaRIAMX84tuGbo4Y=;
  b=BEpw3x2ZEf1YCc5Wzpe7G29Clslu6gx8hwairMo+NV/LZhJbvzuAPhTh
   cP8GVfApLwDoXH0XjsMvSpSXyR0h2nziuyNY60rZm3bhVRjiJyOfJXlDC
   DIWDX7HLGB5QcgOV4b1jve0twR+CTktOzhbQTUNknjFD11QmWUSo/Ep3a
   7bhvkyliDhheledW/C95kLOYLIpVOWBdVy7vZ0cfZx3lAqVC59JQIbLeN
   oV9IKoOGYBcOmeW6i+IEBrUs+jwG1dXHmXJuNRjjD5tBZI83EP4yKgaJ4
   5jYRnqSAU6Rxg7mXGkul5BOIkjmyqClly9oYciqIM/YDEUOdpH8DbIw4f
   Q==;
X-CSE-ConnectionGUID: lS+BBBqzQuqYIz1ohOV4fQ==
X-CSE-MsgGUID: WWbToaS1RXmcJ468TRutIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73458275"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73458275"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:59:38 -0800
X-CSE-ConnectionGUID: p70psnfKTJmg2YUyuTGmHQ==
X-CSE-MsgGUID: MoJAbhe9QjCWyYZE9mCsDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="248406523"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:59:34 -0800
Date: Tue, 3 Mar 2026 09:59:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: auxdisplay: ht16k33: Use
 unevaluatedProperties to fix common property warning
Message-ID: <aaaU5NaLbmHBlgCH@ashevche-desk.local>
References: <20260302215956.2418494-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302215956.2418494-1-Frank.Li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 02, 2026 at 04:59:55PM -0500, Frank Li wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> /schemas/input/matrix-keymap.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


