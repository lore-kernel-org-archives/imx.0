Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0A634DCEE
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214126; cv=none; b=aeI9dUaJZYvLlTvM7FUVZGRSgugvDefLML6hoeV4JfiNJ3esaQb7VoHFdAhFsrqKWuOosu+6GAWAjQ/3ra8LQLyazfd6sJB6NAKgGjY8YZzQr3kh9l4Fddi5zRTCZ2fanqKeSPfPVJ3bRO/yeSn+56OFMwbOVbZToPVRf6bnwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214126; c=relaxed/simple;
	bh=uLZDjCFgfzsq0FIprBHCwoTZtnqNId9JxICufdli1kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOBwg62BTbeB/r1LfMk8qrGw7NT+jDyR+USRtkDcf9F8cslt1c0UPWceYgRumIqDue39XoPfRFcQZeSNgFCD1L7LbLFc0VU+AReqPLCkZgSnoI56h/LOl6u+O8SWRZ9W3mWhveLGUKPrKweQVHbnlm5RUoPafXAxJdGPl2tYqfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJDqC/+P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJDqC/+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772214124; x=1803750124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uLZDjCFgfzsq0FIprBHCwoTZtnqNId9JxICufdli1kc=;
  b=fJDqC/+Pq1DBtVpgnUETNViOkWQfMEpxBbF/0/2tDdyjK89PpSihsDLy
   cBCLaFBfmzJX8jmBoIesumy7+v98zhZ49MI/v6ChABTxszwtSKUUb4LEi
   RNtc5gfbGDaZZOU7aLYq7chJv3vHyQVyqSqKrtG/PnHEQR1Yba0Mm+64P
   ZVSwyMjsAnnqwoMed/kGVBVpduNZ0mEnfLLjkt4lQkHFO7ygR2iVRGPyW
   junZz0UbFPWj3kOa32Dc+qQjEU5IHWrVcYKDHZreQ92PRnfc8cO8/41W/
   OFUSovUBTRPykf6F+kd417K3fTIIZ+DxI8nbMY23RBUA73yCEum4+hs8t
   A==;
X-CSE-ConnectionGUID: c2RNODjWTKG04wd7JcTN0w==
X-CSE-MsgGUID: yhT54rSYQj+uBM7jTueSUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="60875901"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="60875901"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 09:42:03 -0800
X-CSE-ConnectionGUID: JDy7mhgwQAOJSGtuEoCMWQ==
X-CSE-MsgGUID: 022vlSEySdyxoLVaQ0zMsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="216196541"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 09:42:01 -0800
Date: Fri, 27 Feb 2026 19:41:58 +0200
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
Subject: Re: [PATCH v2 1/1] dt-bindings: auxdisplay: Use
 unevaluatedProperties to fix common property warning
Message-ID: <aaHXZtFWpyW8Pn2l@ashevche-desk.local>
References: <20260227165836.3445577-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227165836.3445577-1-Frank.Li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 27, 2026 at 11:58:34AM -0500, Frank Li wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> /schemas/input/matrix-keymap.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#
> 
> Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to json-schema")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v2
> 	- Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 	- Add fixes tags
> 
> Resend include Rob's Ack tag:
> 	Acked-by: Rob Herring (Arm) <robh@kernel.org>

Independently on `b4` and its functionality this is incorrect way to put tags.
This has to be done in the same way as SoB above, for example.
I've just explained this already second time.

> Rob's Acked at
> https://lore.kernel.org/imx/175796984570.3379405.7210704746413204244.robh@kernel.org/

No need to resend _this_ this time.
Thanks!

-- 
With Best Regards,
Andy Shevchenko


