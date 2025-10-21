Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861633126B7
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035639; cv=none; b=QRFWe25WJeHh7g/Hk5frKHF2mNenRBpNcFMNc64jMKtuOcitKZC6ONnSdr82Fwd/7t1gHq6JTr6RDjYJdYUkFl76q+WARf5zWmPB7/ajkmfLGJ4jOiaw4OhBCBFMGaFp+mQ0c8/XGs3mWcLmFlXWoek9RoaW2lN7kZH9AeD3zKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035639; c=relaxed/simple;
	bh=7AAkSbpCo8jTHoVHtc7747VTNL+ybmCSlgJI6u1AuBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzphZDSrbaqa75aANuza83C8D7+lqw8if4MEneQ8mIaS/+9X1JUE0dNu8O3FRHWQRH1ZEYB0rV9VlGJeC67YWiuE9mi6xbX7+7OKJAHgFYsty4oxo/MwMwe0NPXjxPmBCwiYGqdZEkGeaBFa0uz4jrq4lL+VLSKvpTDhfHpi3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hx1Dd60y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hx1Dd60y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761035637; x=1792571637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7AAkSbpCo8jTHoVHtc7747VTNL+ybmCSlgJI6u1AuBQ=;
  b=hx1Dd60yEzqWqHZLXcgTCep1fSGa+jgL/uB8OAXmJCIA5efF3KFRfJtO
   Y0b7Z2wO67XeX8hBQ5+I5ZM4/sG3zLT5QqcHlTkKejL7v0LpvbnU1CgWK
   Plq4m0z8++o7ItW632GhuZ6l66jfFTkcHx6Sc+XO0lr8fP9txF+Y16IIG
   8mc5HFJdcoTnXaMWsPRQnvlYt66Hz8wUJERyJFlKTQeaINz5+f7QDkaNP
   VacPgjT4FvZa6iKOh1GVa2o6Yr/ljdThfulLCOypSSllNUUaB7Kh6WKMh
   muf3kOd6BLZULUYzArqRBnmbU3mwDxkFE35Dna03Pm1aQVSDWhfRcJJe/
   w==;
X-CSE-ConnectionGUID: G+xHypbfTiSb0F/fEzIKcQ==
X-CSE-MsgGUID: WcYS/h27QbKfhHhUYvGkkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63197806"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="63197806"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:33:57 -0700
X-CSE-ConnectionGUID: ut0RFvqtQrKQBfNNscBISg==
X-CSE-MsgGUID: BakoZdPnQzmbK4b1wYotHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183242308"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.134])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 01:33:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 20BC71202B5;
	Tue, 21 Oct 2025 11:33:52 +0300 (EEST)
Date: Tue, 21 Oct 2025 11:33:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: media: Convert ti,tvp5150.txt to yaml
 format.
Message-ID: <aPdFcGvX5p3RQPt2@kekkonen.localdomain>
References: <20251014185515.2354668-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014185515.2354668-1-Frank.Li@nxp.com>

Hi Frank,

Thanks for the patch.

On Tue, Oct 14, 2025 at 02:55:09PM -0400, Frank Li wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/display/sdtv-standards.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bridge@5c {
> +            compatible = "ti,tvp5150";
> +            reg = <0x5c>;
> +            pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> +            reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                     remote-endpoint = <&composite0_to_tvp5150>;
> +                };
> +
> +                endpoint@1 {
> +                   reg = <1>;
> +                   remote-endpoint = <&svideo_luma_to_tvp5150>;

I aligned these while applying the patch.

-- 
Sakari Ailus
