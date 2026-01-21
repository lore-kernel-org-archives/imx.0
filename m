Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9CB665
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988432; cv=none; b=eqjtENq2+YcHSTjxY2FVNlvV3bNNtR2M33+X1sXA4zSKCnrjIbdJWCC5oRE3JZpXh02vjFdxo+DCH6kUksruqpX2intzIXq8oMpgvDbN70mB1A26GgtSxjKRLTfe08wpMy5h3dFZ2TU93UbN6O0lghMHtCTiRmnMaYwT4GNZECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988432; c=relaxed/simple;
	bh=yZ6KIKCjfZ9H0kMIpeuGQVkM4uYbFD1fCFvB14ai6CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXa3FOSF61IDnIetMIcO4koRHD1cZZg1+Og/V70HfYKegp4wFiMlaXIjhHuTAe2yDgu9ZNEtbyYiW5bEV64pjYtzJZQkjrMzAnxVRhgfIDmGD38yldF7K0SuqFddHvVBq5XVL/GoRmRckAilvDnmycqHM7LoKyiBV0eIp9C8Nl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1viUgs-0003is-NG; Wed, 21 Jan 2026 10:39:54 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1viUgr-001jCh-34;
	Wed, 21 Jan 2026 10:39:53 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1viUgr-00759C-0R;
	Wed, 21 Jan 2026 10:39:53 +0100
Date: Wed, 21 Jan 2026 10:39:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	luca.ceresoli@bootlin.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20260121093953.2cfojrlflim7xfba@pengutronix.de>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
 <20260121021140.GA1677576-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121021140.GA1677576-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Rob,

On 26-01-20, Rob Herring wrote:
> On Thu, Jan 15, 2026 at 04:24:51PM +0100, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> > 
> > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Document the Parallel Display Format Configuration(PDFC) subnode
> > and add the subnode to example.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > [m.felsch@pengutronix.de: add bus-width]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> > @@ -40,6 +40,58 @@ properties:
> >      minItems: 8
> >      maxItems: 10
> >  
> > +  dpi-bridge:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - nxp,imx91-pdfc
> > +          - nxp,imx93-pdfc
> 
> Looks like there's a register for this at 0x60. That should be a 'reg' 
> entry in the DT.

We discussed the usage of 'reg' here [1]. In short: This single
hw-register contains not only bits for the parallel output configuration
but also for the mipi-dsi configuration. So there should be no 'reg'
usage and instead let the syscon and driver do the correct handling.

Regards,
  Marco

[1] https://lore.kernel.org/all/PAXPR04MB84599D676EC1E3879694579688B2A@PAXPR04MB8459.eurprd04.prod.outlook.com/#t
