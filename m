Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1634CDD;
	Wed, 18 Sep 2024 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726646616; cv=none; b=L1E6IoYnE5aXovELpN7IfQ07GgcRSFjEtQ4G53RSyp6iExsa625G2U4IGrIkgnvCZXwjTWlqQJ8PZ95AJPOxy8rjvzldHus0udAFFARDrhbW8/Ap2rBR1NfHoHpASB6d20Nz1k9pDM0UaAl/T6j8F2qhnD3G01k1ygsAHf4xTN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726646616; c=relaxed/simple;
	bh=+COCs9MMQTEc5+Mtf047EbHbkcilVJgqVOki/L78Wck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOfKOyAiXb5WvaDaqoWHZmq5k1Wy4+c12gvnHYfuKxpHRQk31ZVEyT1dBhHK3602V4PSVLGt4Gow/EHdjtJLzK49GKzlYM5trVfMM9AxZPalFBYsOHFgqMTBl32FteNRPG0tQLVeEzlQZFZftzlEYPlLDyNLc58HbeONtjyMbTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlJU+qFO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlJU+qFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B498C4CEC3;
	Wed, 18 Sep 2024 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726646616;
	bh=+COCs9MMQTEc5+Mtf047EbHbkcilVJgqVOki/L78Wck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XlJU+qFO98URjZniLBmYVTEeNrohEUUxC62eJvQPdD7zlFgsdJaNLmYyxaIOq+Osh
	 4uzxRWr5alkd/RW5lzxMGxcr9eMWpP00tuM9sdz1b0lOVeJrcO9Il0YGrX1mXS8oFd
	 fs81NPbB2lxXe8/ZOC1EJksDkav0knecDW5Gsgdo5s2XksPSkRWYtCvS0A6Bzo+UMj
	 Pk9jYHzN8LkB+sprZUhW1cwm0ecKbvLBOQG659VyoS+inQGHmRv6WHn0flDBM9meC5
	 Akaf01hQm36J/HSBoZ/aJzWbZnGBxaNaBs+689Ur2Dcbq8WTDJXl70ZlxQvrV0GypN
	 SvFibrJjaY1SQ==
Date: Wed, 18 Sep 2024 10:03:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	krzk+dt@kernel.org, robh@kernel.org, shawnguo@kernel.org, festevam@gmail.com
Subject: Re: Device tree node order sort tool
Message-ID: <2fdfmn7wjt5tr6lsxee2qubjgiphys5n2fivlracaksilvvgmi@od6t76mpd3co>
References: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>

On Tue, Sep 17, 2024 at 11:43:53AM -0400, Frank Li wrote:
> All:
> 	I write a simple tools to sort device tree to make sure nodes and
> properties sort as correct order.
> 	https://github.com/lznuaa/dt-format
> 
> 	There are many dt files, which have node order trivial issue, when
> try to upstream. To reduce reviewer's time, dt-format can help correct the
> order.
> 

Hey Frank,

Cool idea!

> 	I just want to make sure my understand about node order is correct.
> 
> 	Rule 1: node@hexvalue,  	order by hexvalue
> 	Rule 2: label: node,  		order by node name
> 	Rule 3: node, 			order by node name
> 	Rule 3: &label			order by label

Some subsystems have different ordering, like expressed in DTS coding
style:
1. DTS: keep order of DTSI file
2. DTSI: group similar nodes together (e.g. serial engines).

> 	Rule 4: children node already after property
> 	Rule 5: "status" always is last one.
> 	Rule 6: property order as below list[unfinished], otherwise, order
> 	        by name.
> 
> compatible
> reg
> reg-names
> ranges

Up to here everything above seems about right, except above caveats.

> #interrupt-cells
> interrupt-controller
> interrupts
> interrupt-names
> #gpio-cells
> gpio-controller
> gpio-ranges
> #address-cells
> #size-cells
> clocks
> clock-names
> assigned-clocks
> assigned-clock-parents
> assigned-clock-rates
> dmas
> dma-names

I don't think we have defined order for these.

Best regards,
Krzysztof

