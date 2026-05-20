Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B44F38E5ED
	for <imx@lists.linux.dev>; Wed, 20 May 2026 21:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779312796; cv=none; b=jN0f/CgzU0641xc+iPhTXPGvWji0QsfHZqObdc1boRaEVtKdLoS6O6J/HknzwV+cd638WOdaYsa77znUMGUB7pfxC72uH6u7z9Z3berfxpP5n3lXYdifBZco14gtQwdN7h+tQlHhZ1X24rn/BqZqH9MuQm81vXuehCj37hxsxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779312796; c=relaxed/simple;
	bh=L/KHVtTDW88QxjxlnEFS3VYmEGhFfqA/+fZQrK+UQoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nnvp8DnNrZy69V0F8MlG3DhWY9BtRLm1G87TJqOZeAdK3977c8p2yHt9lggP8dzQqSbIrtoW8SUINl/2Co63unn+jDzh4ZQLkSIJI2trwe6daIv9FZS3brpo59TAnF/uqaDsDwUv9bdBZnDkRtNM1G9e6kHsePqDEbsDE2n0lzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pPW3ypHb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pPW3ypHb"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCB7C42B;
	Wed, 20 May 2026 23:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779312779;
	bh=L/KHVtTDW88QxjxlnEFS3VYmEGhFfqA/+fZQrK+UQoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPW3ypHbJo5+ceeia8lepbKyFjdpFKAQy9hXuyC+lKEDGPgm7jVYeBw9+Evjs/Qm1
	 QLY+YWPzkAdUjouo6v9VSJl5ASsANjFBIdU9Ocsv2Jr4XTJ230Ws5nMkoq8/qf13Pg
	 Qiympsnp+IgQ/sva+hZS9Vz1OaUwQJNaFw33zhsM=
Date: Wed, 20 May 2026 23:33:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: Re: [PATCH v7 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260520213312.GD9017@killaraus.ideasonboard.com>
References: <20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com>
 <20260518-csi_formatter-v7-1-562b750557e3@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518-csi_formatter-v7-1-562b750557e3@oss.nxp.com>

Hi Guoniu,

Thank you for the patch.

On Mon, May 18, 2026 at 10:19:46AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> new file mode 100644
> index 000000000000..28adea06c494
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> @@ -0,0 +1,87 @@
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
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: MIPI CSI-2 RX IDI interface
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false

What properties defined in video-interfaces.yaml do you expect ? The
example below does not use any, and the driver in 2/2 doesn't appear to
parse any either.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Pixel Link Interface
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
> +    formatter@20 {
> +        compatible = "fsl,imx95-csi-formatter";
> +        reg = <0x20 0x100>;
> +        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +        power-domains = <&scmi_devpd 3>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&isi_in_2>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
