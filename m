Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4363D16E2;
	Tue, 26 May 2026 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786819; cv=none; b=eqF+zd9Plu83JDFxz/5YMiRry7wcLkrOvXZdu1zVQ01Cpav39la46+0FW8INO0+cBIyehFV8t2FUvq1wYxDozSqd3F233IBXcBdI0CdkgO6fhK9rRPDTetdGZShkD/AcYF04WYzqaeDck1YzS4BG+MGvSbfiYdiG0QtQcKzR8HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786819; c=relaxed/simple;
	bh=Pa5iZoahIK2SijGV/SGoVZWUmk6hSQBThMQbJBtYH4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElaIzidNuQHD6jTWkycgE/3cz4JR4ZZ8gtGd+mASr91YP9J/xLasLWYkkEPbPYOVleoRPxzvkXXvsbhuMvDbBWOTfx+KRB0qOADdmFSPsSg3HMTYjT07DjdRP4GbfLr6WbS4pDf2b6lb/uoaVFIylxWACRzDZFWQE/ML0fJPJoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6zxmQGn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6zxmQGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF541F000E9;
	Tue, 26 May 2026 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786818;
	bh=bHZrt2oEKfcUJ3Z2x7gDTIu2NBBHpvQFe8iNftnVzxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c6zxmQGnBxR+kA7NuN6x50uIQ68e7CIQ1zeRlwj6LIT/3kzkdt+6gfhXOj4R2NaVr
	 OMkuNnJKxCxkQW9STBVZeaC35K7/3kZb8tp9ER2jDnx025CkeDUAFeuJ67gEUM7FOD
	 NTaJ7Gg/v+R8L1EC8g1smfOFU24+CqmOf+3wmMaK5VdEmalhzRCrbZOZopnR5ZtWVp
	 eULAw84eA1Lxa7/xkARXVriKP0gyvua8QL/TJxu0ieVMUlJSNZxKzMBE1TJ9orS0Nl
	 mp+zaPOIHJLYUUABR6ikcht6+SXS7k7hDQ11OHBQG8gD1nLPFA36kj99hngQ3zGFZ5
	 gv3Rhlsk9bxrw==
Date: Tue, 26 May 2026 11:13:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, imx@lists.linux.dev, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260526-towering-essential-civet-19a5ad@quoll>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>

On Mon, May 25, 2026 at 04:12:22PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Drop both review tags and request re-review since you made significant
changes.

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v8:
> - Use standard port reference instead of video-interfaces.yaml

Why? Properties are not applicable?

> - Add parent syscon node in example to show device integration
> - Add required constraints for port@0 and port@1 in ports node
> 
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> new file mode 100644
> index 000000000000..bc2f5d448fe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX95 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description:
> +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> +  and non-pixel data from the CSI-2 host controller and reformat them to
> +  match Pixel Link(PL) definition.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-csi-formatter
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI CSI-2 RX IDI interface
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Pixel Link Interface
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +        compatible = "nxp,imx95-camera-csr", "syscon";

Drop entire node, not relevant. Or actually this example could be in the
parent binding example.


> +        reg = <0x0 0x4ac10000 0x0 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        formatter@20 {
> +            compatible = "fsl,imx95-csi-formatter";
> +            reg = <0x20 0x100>;
> +            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +            power-domains = <&scmi_devpd 3>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +                port@1 {

Messed indentation.

Best regards,
Krzysztof

