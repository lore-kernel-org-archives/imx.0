Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5874438B;
	Mon, 22 Jul 2024 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721689037; cv=none; b=N4ObIEAWiUzqvME6TiW4BfPTO6b/AilOEpJnGMjIKKmJvDEXrNKVOfxS23ZOKjejBsCxFJ9srnoCPcr2j6IkkhuV12X8mE7WrdlkXq3qxuPByn2+Ac1I0Tna2TUuHcBVWVivxs0Z++uBhTCLO9443CG6BPvz3sfBsuqB1ROwVP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721689037; c=relaxed/simple;
	bh=VZhVDGcfBlY3Ab/C7Fu4x1pvMjbLMBK7g+T6KGYHwQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPSe1vYvH+CbIYaCO2HvCGMdrm29t3unJp8Z6FsSKO912xbA3JBOyw8rpKWXEv0aXmc0imfwtkXSh36D4dGQpiYE7t5t8mCyUO1+Zv5ZTz4h+y2Y7iNSoHO6iamZKLmrwhUUm1xhkcD4AFYLMz8ileXY22nAynVPQB0jw2tplC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5pbGY1q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5pbGY1q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E428EC116B1;
	Mon, 22 Jul 2024 22:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721689036;
	bh=VZhVDGcfBlY3Ab/C7Fu4x1pvMjbLMBK7g+T6KGYHwQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5pbGY1qRhkzQgGP+ZmS8bBDx6eH26fvj7rph2fO6bFTddpKIAbgknpJWljqjORaB
	 uFZ1MPNE+6ldS8rVCvL3iVW3lvUfXnYvlnqAdGfe02YmU/r7ab22c5z7uQt0uyIr6G
	 sQuVFtdg/SfOCQqnUopKxbfo5LK06dQ932FR23QnSKYX5uOVvia4FXZLi1TOE4gHfw
	 tBNuNJcoXZGGwyTw6gzacv5pZMy8/Fjz/zqkCUHIigeCNqbRRFaD3eVSwMwMso1xgw
	 YE5QDWbCzpbosiypqpe2GTB3OhRdo9CdbY5Cm7bfeSb5QxXnJtfmobKQynxU8q3LIf
	 ZuZK7ebkxKydQ==
Date: Mon, 22 Jul 2024 16:57:08 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
	francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v2 02/16] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Message-ID: <20240722225708.GB183822-robh@kernel.org>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-3-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-3-victor.liu@nxp.com>

On Fri, Jul 12, 2024 at 05:32:29PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing units
> that operate in a display clock domain.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> * Drop port property. (Krzysztof)
> * Fix register range sizes in example.
> 
>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> new file mode 100644
> index 000000000000..91f3bb77d8d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Display Engine
> +
> +description:
> +  All Processing Units that operate in a display clock domain. Pixel pipeline
> +  is driven by a video timing and cannot be stalled. Implements all display
> +  specific processing.
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8qxp-dc-display-engine
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: cfg
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: shdload
> +      - const: framecomplete
> +      - const: seqcomplete
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^dither@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: fsl,imx8qxp-dc-dither

Doesn't look like this and some other compatibles are fully documented. 
They need to be.

Rob
