Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679892E7F3E
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158584; cv=none; b=KC+F3Zcus9FeJkskeU1TzUkUY+7gGfiE5DUhvWCLqEDFoK6CBH70UUZkr+ywtQ70exVrnMXI3GlNlVEyGfWm38poq/VzWqgw3dqDsvmMifjfey2Py90SHM1FegZZNQOAXMjA5Q2elSGpWeePModSiq3f0KYsE/rKGcQNQZCZ70Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158584; c=relaxed/simple;
	bh=m7MegrOzKTFcuwlQrPE7dR0OJQGRZMf1wfD9kD4mqSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUDSHGJH77R+lgPFHD/USjDsFKrxIbFZA5iDdFU0gH5Lq1L82n72lrwgukBEHJgn24FpVJ2ZLqHM+pNmrOz+qpc4FPCe6EELiD2E7ToG+Oe//kKT/iEWwRamJWGK2/t9ydilQl/Y1R0PvHXPSFOfBB27lkEe0nNs7x3bMSh/iIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWcW3-0005Ow-GQ; Fri, 19 Dec 2025 16:35:39 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWcW2-006Tjk-0a;
	Fri, 19 Dec 2025 16:35:38 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vWcW2-00GVDa-02;
	Fri, 19 Dec 2025 16:35:38 +0100
Date: Fri, 19 Dec 2025 16:35:37 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, krzk+dt@kernel.org,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
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
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
 <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Krzysztof, Rob,

On 25-12-18, Krzysztof Kozlowski wrote:
> On 15/12/2025 17:17, Marco Felsch wrote:
> > Hi Liu,
> > 
> > On 25-12-08, Liu Ying wrote:
> >> Hi Marco,
> >>
> >> On 12/02/2025, Marco Felsch wrote:
> >>> From: Liu Ying <victor.liu@nxp.com>
> >>>
> >>> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> >>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> >>> field. Document the Parallel Display Format Configuration(PDFC) subnode
> >>> and add the subnode to example.
> >>>
> >>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>> [m.felsch@pengutronix.de: port to v6.18-rc1]
> >>> [m.felsch@pengutronix.de: add bus-width]
> >>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> ---
> >>>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
> >>>  1 file changed, 92 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> >>> index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> >>> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> >>> @@ -26,6 +26,12 @@ properties:
> >>>    reg:
> >>>      maxItems: 1
> >>>  
> >>> +  '#address-cells':
> >>> +    const: 1
> >>> +
> >>> +  '#size-cells':
> >>> +    const: 1
> >>> +
> >>>    '#power-domain-cells':
> >>>      const: 1
> >>>  
> >>> @@ -40,6 +46,60 @@ properties:
> >>>      minItems: 8
> >>>      maxItems: 10
> >>>  
> >>> +  bridge@60:
> >>
> >> The dependency patch series mentioned in cover letter has two links in it's
> >> cover letter.  Reading the patch sets pointed by the two links, we may find
> >> Krzysztof's comments - the child nodes of the blk-ctrl should be completely
> >> documented.
> > 
> > Thanks for pointing this out.
> > 
> > @Krzysztof
> > Requesting to add everything seems not feasible if everything added
> > should be tested too.
> > I don't see why everything should be added in one step, since the base
> > .dtsi isn't added in one step too.
> 
> Because otherwise we do not see entire picture and people post incorrect
> bindings, claiming they are complete picture, like messing nodes with
> addressing and nodes without. So sure, if you do not want to post
> complete picture, we cannot review that complete picture, therefore YOU
> MUST POST CORRECT CODE.
> 
> I will not be taking excuses later "we did not know that such code is
> not allowed". You must know all rules.

We discussed the ranges/reg usage internally as well with the following
outcome:

- Situation

  With i.MX8M SoCs NXP introduced MIX domains. Each domain has a so
  called BLK-CTRL IP. There is no common register layout for the
  BLK-CTRL IPs. In addition to this, the register fields within one
  register may not related to the same IP. Please see my below example:
  
  The DISP_MUX register configures the DPI output routed to physical
  SoC pads as well as the internal MIPI-DSI DPI behavior. This PDFC
  bridge binding is only interested in the first part, not the 2nd.

  In other words, the BLK-CTRL IP can be seen as a bunch of loose
  register fields.

- Our outcome

  To be future compatible and extentible, we believe that the best
  abstraction is the syscon, no mappings (no ranges/regs). A BLK-CTRL
  sub-device has no address, just the node name. The driver needs to rely
  on the syscon parent device. All register(-field) handling is done
  within the sub-device driver.

  This way new functionallity like MIPI-DSI PLL clock provider driver
  can be added easily.

I will adapt this patchset accordingly, if you agree to rely on the
syscon (no regs/ranges).

Regards,
  Marco


> 
> 
> Best regards,
> Krzysztof
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
