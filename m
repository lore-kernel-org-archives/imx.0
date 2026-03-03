Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AB359A75
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524826; cv=none; b=oViu1NDOvquBQpgp7hJq6K3W3m37K4ZGK/On8U7uvDn0qH+rSM63e2x5kpDm+eSAiVUCiLjzW1nrgcgnLLA83B2Smpql6MLW8YcN5HAUTMQAMMPe5xyfHHBtjul4ts5UfrvOTh1sfjLpwJL0NkVKUgOeSXwn0OEqN7r1d+T20yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524826; c=relaxed/simple;
	bh=t8/zSmsPSGd0EjmE6M2om0hRhvx3c0/ZVt/xg+RbkSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ/iQDitKDdzloR8x2UtrrtG2gtH/CDsHH9duDUmwAfU/gxISELbJS0D7dcOWWLeruZoGKdiczG6kPVxBMhbkiTnwUFth3sKIVQLva7UwAdqhKxJjgNulH3ezE7dXmR0AXs9jN5YrxGX6VmmP7DdPthLL1PDf3y4zYSuslbsCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKff-0004a4-Pz; Tue, 03 Mar 2026 08:59:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKfd-003Vm6-0N;
	Tue, 03 Mar 2026 08:59:58 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKfe-0000000FzRZ-1KFf;
	Tue, 03 Mar 2026 08:59:58 +0100
Date: Tue, 3 Mar 2026 08:59:58 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, frank.li@nxp.com
Subject: Re: [PATCH v10 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <4sofljffovrorpxe2os3jl745qfjoglvl54oqf3v7r5bk5f6aq@6y3jwn4abiqy>
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-1-634fe2778c7a@pengutronix.de>
 <7d708ede-a576-4eae-b319-ebd54dbc5163@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d708ede-a576-4eae-b319-ebd54dbc5163@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-03-03, Liu Ying wrote:
> On Mon, Mar 02, 2026 at 05:10:40PM +0100, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> > 
> > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Document the Parallel Display Format Configuration(PDFC) subnode
> > and add the subnode to example.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v7.0-rc1]
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
> 
> Cc'ing Frank.
> 
> fsl,ldb.yaml documents fsl,imx6sx-ldb, fsl,imx8mp-ldb and fsl,imx93-ldb
> with a reg property.  Since all of them are child devices of either GPR
> or BLK_CTRL and this dpi-bridge is a child device of BLK_CTRL without a
> reg property, how can we handle the inconsistency?  At least, with this
> patch and the current fsl,ldb.yaml, we cannot add an i.MX93 LDB child
> node.

This reg property was longly discussed and there should be no reg
because this 'reg' covers not only the PDFC register fields. Please see
the discussion:

- https://lore.kernel.org/all/PAXPR04MB84599D676EC1E3879694579688B2A@PAXPR04MB8459.eurprd04.prod.outlook.com/

The LDB node shouldn't have a reg property in the first place. There are
a few registers within BLK-CTRL which belong to only one "IP" like the
LDB. But these are the exception rather than the rule. To make it
possible to abstract _all_ sub-devices within the BLK control you need
to drop the reg property. The subdevice drivers need to handle the
offsets within the BLK-CTRL accordingly, like the LDB driver already
does. So removing the reg property from the LDB dt-bindings is the
correct fix.

Regards,
  Marco

> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - nxp,imx91-pdfc
> > +          - nxp,imx93-pdfc
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description: Input port node to receive pixel data.
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/$defs/port-base
> > +            unevaluatedProperties: false
> > +            description: Output port node to downstream pixel data receivers.
> > +
> > +            properties:
> > +              endpoint:
> > +                $ref: /schemas/media/video-interfaces.yaml#
> > +                unevaluatedProperties: false
> > +
> > +                properties:
> > +                  bus-width:
> > +                    enum: [ 16, 18, 24 ]
> > +                    description:
> > +                      Specify the physical parallel bus width.
> > +
> > +                      This property is optional if the display bus-width
> > +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> > +                      is connected and all 18-bit data lines are muxed to the
> > +                      parallel-output pads.
> > +
> > +                      This property must be set to 18 to cut only the LSBs
> > +                      instead of the MSBs in case a 24-bit RGB888 display is
> > +                      connected and only the lower 18-bit data lanes are muxed
> > +                      to the parallel-output pads.
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    required:
> > +      - compatible
> > +      - ports
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -112,4 +164,30 @@ examples:
> >                 clock-names = "apb", "axi", "nic", "disp", "cam",
> >                               "pxp", "lcdif", "isi", "csi", "dsi";
> >        #power-domain-cells = <1>;
> > +
> > +      dpi-bridge {
> > +        compatible = "nxp,imx93-pdfc";
> > +
> > +        ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +            reg = <0>;
> > +
> > +            pdfc_from_lcdif: endpoint {
> > +              remote-endpoint = <&lcdif_to_pdfc>;
> > +            };
> > +          };
> > +
> > +          port@1 {
> > +            reg = <1>;
> > +
> > +            pdfc_to_panel: endpoint {
> > +              remote-endpoint = <&panel_from_pdfc>;
> > +              bus-width = <18>;
> > +            };
> > +          };
> > +        };
> > +      };
> >      };
> > 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
