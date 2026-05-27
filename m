Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1307C3FCB11
	for <imx@lists.linux.dev>; Wed, 27 May 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882311; cv=none; b=YdHKvXzBfagnOkJWtcPpiHxiTzhMfvaTBynA2QuPxERQHJglGazbaWsikS3QXgh+SWe66wXjR+h4HDdInuMYTbRaPym8+q9jWMyjr8qTdGzvF742CnpxEwCt/RjL4c2VeNOy0Op8eQ8tLm9tPcNo6RsZKAfJ+tzx/UhYlWkzNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882311; c=relaxed/simple;
	bh=J8HWEnOlJ6Qs7xGG5VUasoHKKzXrTRjUX3pcyYjgeGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBognu+fDIKxVNy6RmsEl3XnUTin7e4Z1lyFyDW8zOip6VhKfiq0tL+y1C1OJzGY4yZ19eiZMUtCnUSusia9NgLnEpHEG7Kq3yj+70k4t6+LcPn8IOAER6YDEdO4k8+yh5gcYSPjiupOBaxcKi+oJD3O8WDkKZCb9WhplMmG/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O2gawcK4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O2gawcK4"
Received: from killaraus.ideasonboard.com (62-193-63-110.as16211.net [62.193.63.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAB949D1;
	Wed, 27 May 2026 13:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779882287;
	bh=J8HWEnOlJ6Qs7xGG5VUasoHKKzXrTRjUX3pcyYjgeGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2gawcK4KnOj/A1H7gp8aanPxKgY9q8qdqLlmxYux04Nd/DsE69P7E95cc6zzdxeZ
	 B3c0LXeUS2T6iPXD82DZl0ED04r96Jtz0bPQlFxhYHDnwDELgyIDlYFpcEg1jgkg9h
	 9hPM1x19a0H7cMLV6xLy8UULktx7vc8VrCu91Fxc=
Date: Wed, 27 May 2026 13:45:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260527114504.GA480025@killaraus.ideasonboard.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
 <20260526094438.GE228394@killaraus.ideasonboard.com>
 <14f9923e-ae0a-4e69-b3b9-a7353b84b9f8@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14f9923e-ae0a-4e69-b3b9-a7353b84b9f8@kernel.org>

On Wed, May 27, 2026 at 11:37:34AM +0200, Krzysztof Kozlowski wrote:
> On 26/05/2026 11:44, Laurent Pinchart wrote:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> >>> +
> >>> +    syscon@4ac10000 {
> >>> +        compatible = "nxp,imx95-camera-csr", "syscon";
> >>
> >> Drop entire node, not relevant. Or actually this example could be in the
> >> parent binding example.
> > 
> > I asked for this in the review of a previous version. The example only
> > stated "formatter@20" and it was not mentioned anywhere that the device
> > was supposed to be a child node of a syscon. The driver reads the reg
> 
> Binding does not have to state that. Parent's device binding will state
> that.
> 
> > property and uses it as an offset to the regmap of the syscon, I wanted
> > to see where/how the node was meant to be integrated in DT.
> 
> Sure, parent's device schema should have complete example. But we never
> add the parent compatibles to the child schema - that's leading to
> additional work later with no real benefits (that's only example, so no
> real code except maintenance effort).

OK. There was no mention of the child in the parent's bindings in the
previous version. Now that it's being fixed, we can drop the parent
here.

-- 
Regards,

Laurent Pinchart
