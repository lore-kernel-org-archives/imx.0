Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6C11C861A;
	Mon,  8 Dec 2025 01:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765157310; cv=none; b=reCBcxdRzD5PQAowzgeCd2R7Dhn52AzG3GUPTNx3UqCuDHsCZmhonQv6corR6HCm+4zKJRfP0cGq6ylxE2Use+iBXQdLqCEHeGIOjxAzPve7sNupk+AAU47qaJHTtGlLcB6zUUkrjGGDwt+wXEmm9z7DdzhJn+iZ/SRc44LYluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765157310; c=relaxed/simple;
	bh=EdG95QZ0thcwVxnSLXQVKWQuULwbEqcqlz9F/E2H+qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6KJcPJ3I9FWB4ilgvBnJmGbNtcI2Z0rNpits6J33iL6qLIQ5GaF9Ulc1pIc7T6BkR7ReV5Eo0SobYAEaanHavC5fhCabR2h5cLBvh0io8I7VVwHBpROhPi6TAA3bo54Nf2XjM10rkUNEdmTRINiMm0RqkewdzNO+YKiz/+B0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxCO2s6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxCO2s6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A2EC4CEFB;
	Mon,  8 Dec 2025 01:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765157309;
	bh=EdG95QZ0thcwVxnSLXQVKWQuULwbEqcqlz9F/E2H+qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxCO2s6scq9MCexy9brYAm+h5FqAHmgU/1NpJ1ZmA7T3ak9C9bmY7jMbOTNXvPjUM
	 k6AddidjkTquiCgFjd25lwHE4z3GnLgtNJVeE0i9BowE8dFByy7MQCGhhwqiN3X4G2
	 ZMdndUtqJrEDi59A2lnSZ5VEo4nEXM16V4l+ZZ86np5RDZLUt2EBDxNkbp9Xk1EICb
	 YXAJE1WP3iYxw5U6yq6wXBQoBadokref0b/nWAEPzcKVm2g8D6qznyhkmlit0fMybd
	 OQdjvbQflFlUM4FzXS+76JM9ca+jHqFT8zZZPLUCTfyLXAj+bxDTliLa8umsuxWeZ/
	 3HsOQmZ4VWo+A==
Date: Sun, 7 Dec 2025 19:28:26 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
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
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20251208012826.GA340359-robh@kernel.org>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>

On Tue, Dec 02, 2025 at 02:32:58PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +

And 'ranges' needed.

>    '#power-domain-cells':
>      const: 1
>  
> @@ -40,6 +46,60 @@ properties:
>      minItems: 8
>      maxItems: 10
>  
> +  bridge@60:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: nxp,imx93-pdfc
> +
> +      reg:
> +        maxItems: 1
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: Input port node to receive pixel data.
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/$defs/port-base
> +            unevaluatedProperties: false
> +            description: Output port node to downstream pixel data receivers.
> +
> +            properties:
> +              endpoint:
> +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +                unevaluatedProperties: false
> +
> +                properties:
> +                  bus-width:
> +                    enum: [ 16, 18, 24 ]
> +                    description:
> +                      Specify the physical parallel bus width.
> +
> +                      This property is optional if the display bus-width
> +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
> +                      is connected and all 18-bit data lanes are muxed to the
> +                      parallel-output pads.
> +
> +                      This property must be set to 18 to cut only the LSBs
> +                      instead of the MSBs in case a 24-bit RGB888 display is
> +                      connected and only the lower 18-bit data lanes are muxed
> +                      to the parallel-output pads.
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - ports
> +
>  allOf:
>    - if:
>        properties:
> @@ -81,9 +141,12 @@ allOf:
>              - const: isi
>              - const: csi
>              - const: dsi
> +
>  required:
>    - compatible
>    - reg
> +  - '#address-cells'
> +  - '#size-cells'
>    - power-domains
>    - clocks
>    - clock-names
> @@ -112,4 +175,33 @@ examples:
>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>                               "pxp", "lcdif", "isi", "csi", "dsi";
>        #power-domain-cells = <1>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      bridge@60 {
> +        compatible = "nxp,imx93-pdfc";
> +        reg = <0x60 0x4>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            pdfc_from_lcdif: endpoint {
> +              remote-endpoint = <&lcdif_to_pdfc>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            pdfc_to_panel: endpoint {
> +              remote-endpoint = <&panel_from_pdfc>;
> +              bus-width = <18>;
> +            };
> +          };
> +        };
> +      };
>      };
> 
> -- 
> 2.47.3
> 
