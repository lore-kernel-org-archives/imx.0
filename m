Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3293D88F2
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788684; cv=none; b=JDeDTXEE/86chEK4FhNBc8E5NUZTVRmppxybEcMmE+BQz37V2atSmhTcCHhy+MLk7kzGhqBQD6poG+hbPoIpJhE+o+NgeyIO77FGK1vbzMQz6twIB/AIsSAPSey5tSZG/HyYkV/u78hsy7c4IVIVYNS3C6xDuRgquTXtSOV66aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788684; c=relaxed/simple;
	bh=U2+ZqPjvAiVmxd7qt0wOerBLfKuC1rSIN5i69jydn5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r78YH5m5TYXu2AE/5bKQn3wpxv+E3isglyd1Q6+LO+llbZUvb642Jn1Wdu88N2cEgc9mc3JNxVPaJFi0Avylpmmm8+nqbb7lgw4CK7TU4g+ncPCKPOaxzXR32019MPrMPC/IjWsX0JVP2zTRxBmrVhO03Z0XeqpGfgv0eFBC/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PvhOmsTo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PvhOmsTo"
Received: from killaraus.ideasonboard.com (unknown [146.0.25.242])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9E1A492;
	Tue, 26 May 2026 11:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779788661;
	bh=U2+ZqPjvAiVmxd7qt0wOerBLfKuC1rSIN5i69jydn5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvhOmsToRO3rC28XupWVRACpG//74c+zZot9GLddRpSbnxeuPf/vOixR7V9Bl3cpb
	 jCB7tuhVixoWh4HX02RVmNxldN6d2LGQq/vry4oFR6F1HwGIBhs6OJ4qKyydu2wSD/
	 jjw6GYpYF3RiFLHCYc/P4cHrI3LRDeKD8YxQVI/Q=
Date: Tue, 26 May 2026 11:44:38 +0200
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
Message-ID: <20260526094438.GE228394@killaraus.ideasonboard.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-towering-essential-civet-19a5ad@quoll>

On Tue, May 26, 2026 at 11:13:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:12:22PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > 
> > The i.MX95 CSI pixel formatting module uses packet info, pixel and
> > non-pixel data from the CSI-2 host controller and reformat them to
> > match Pixel Link(PL) definition.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop both review tags and request re-review since you made significant
> changes.
> 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v8:
> > - Use standard port reference instead of video-interfaces.yaml
> 
> Why? Properties are not applicable?
> 
> > - Add parent syscon node in example to show device integration
> > - Add required constraints for port@0 and port@1 in ports node
> > 
> > Changes in v7:
> > - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
> >   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> > ---
> >  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > new file mode 100644
> > index 000000000000..bc2f5d448fe5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX95 CSI Pixel Formatter
> > +
> > +maintainers:
> > +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> > +
> > +description:
> > +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> > +  and non-pixel data from the CSI-2 host controller and reformat them to
> > +  match Pixel Link(PL) definition.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx95-csi-formatter
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX IDI interface
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Pixel Link Interface
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> > +
> > +    syscon@4ac10000 {
> > +        compatible = "nxp,imx95-camera-csr", "syscon";
> 
> Drop entire node, not relevant. Or actually this example could be in the
> parent binding example.

I asked for this in the review of a previous version. The example only
stated "formatter@20" and it was not mentioned anywhere that the device
was supposed to be a child node of a syscon. The driver reads the reg
property and uses it as an offset to the regmap of the syscon, I wanted
to see where/how the node was meant to be integrated in DT.

> > +        reg = <0x0 0x4ac10000 0x0 0x10000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        formatter@20 {
> > +            compatible = "fsl,imx95-csi-formatter";
> > +            reg = <0x20 0x100>;
> > +            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> > +            power-domains = <&scmi_devpd 3>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint = <&mipi_csi_0_out>;
> > +                };
> > +            };
> > +
> > +                port@1 {
> 
> Messed indentation.

-- 
Regards,

Laurent Pinchart
