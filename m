Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790801CEE91
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 21:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730409276; cv=none; b=LDwZvjq6C0NYxNMf71YGrhDJPQznc4oydwH4uNqa5VMXfwUw+8jCkC/gT/Qy0OxT1vO4/n1kM2Fp54XzHW65m0gbYAWbDgvy7Aj2kS/DalmOc8uk6qnXKhD9s42i+vNWOBNagyUZdsx5FLb4Udxuypz4746sW0NeM+RaYA0DBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730409276; c=relaxed/simple;
	bh=DTR4VLpPm15RWrWvWhTTUfDMUmkP5i7IJuNL+zw/5uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxWj4YmlY6CO7GkyOjRX62PbeCMmd1SPxWVymMymlIMxU9ltKHP1xlKwzm3hDQ8FBujpKVTno1GruHNIq6q8nusN8r7r+wDllv7Tv5GmFOK1YOsIYO9abcXd1Nkfvatvy8l36FfI1fjU7J+JfmloB+fp96SlnPX1afqxbjXHels=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bXyOxBTL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bXyOxBTL"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33A78581;
	Thu, 31 Oct 2024 22:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730409264;
	bh=DTR4VLpPm15RWrWvWhTTUfDMUmkP5i7IJuNL+zw/5uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXyOxBTL+H/6OJls2paSZCrx0iJDI/i+HuYKNmbd4SppA3nUKGgw4Hb776VapIiG4
	 ilX9+UOM42EfnoEqw/6AUkUCh/QPHGkeCTdi72YRhVi4MGtLjzaKy7ncmhRv4DNS5b
	 m5kQ0KAv6F0U+32pGWlGfbsQCKuD5E348ksal5so=
Date: Thu, 31 Oct 2024 23:14:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Frank Li <Frank.li@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <20241031211421.GG2473@pendragon.ideasonboard.com>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
 <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
 <ZyPmeippTU8SQLkH@lizhi-Precision-Tower-5810>
 <jfvvw7rnkxp4xbcmcikyxyfmisx3bmng6uqc7yqsvkzhc3hhgq@arfzqn6raxcg>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <jfvvw7rnkxp4xbcmcikyxyfmisx3bmng6uqc7yqsvkzhc3hhgq@arfzqn6raxcg>

On Thu, Oct 31, 2024 at 10:55:30PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 04:20:10PM -0400, Frank Li wrote:
> > On Thu, Oct 31, 2024 at 09:59:26PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> > > > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > > > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > > > 1, 2, 3, and 4 for port@1.
> > > >
> > > > Fix below CHECK_DTB warnings:
> > > > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
> > > >  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
> > > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > > index 350fb8f400f02..5952e6448ed47 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > > @@ -111,11 +111,27 @@ properties:
> > > >          unevaluatedProperties: false
> > > >
> > > >        port@1:
> > > > -        $ref: /schemas/graph.yaml#/properties/port
> > > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +        unevaluatedProperties: false
> > > >          description:
> > > >            DSI output port node to the panel or the next bridge
> > > >            in the chain
> > > >
> > > > +        properties:
> > > > +          endpoint:
> > > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > > +            unevaluatedProperties: false
> > > > +
> > > > +            properties:
> > > > +              data-lanes:
> > > > +                description: array of physical DSI data lane indexes.
> > > > +                minItems: 1
> > > > +                items:
> > > > +                  - const: 1
> > > > +                  - const: 2
> > > > +                  - const: 3
> > > > +                  - const: 4
> > >
> > > Why are they indexed starting from 1?
> > 
> > Not sure, git grep -r data-lanes Documentation/devicetree/bindings/
> > Most start from 1. Not sure latest DT team's intention.
> 
> They usually start from 1, because just before the property comes
> 'clock-lanes = <0>'. Otherwise in most of the cases the lanes are
> indexed from 0.

I'm not sure what the rule is for DSI, but for CSI we number data lanes
starting at 1 regardless of whether or not the clock lane is
configurable. Consistency help for driver implementations.

> > > > +
> > > >      required:
> > > >        - port@0
> > > >        - port@1

-- 
Regards,

Laurent Pinchart
