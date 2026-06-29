Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2124185B48;
	Mon, 29 Jun 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739975; cv=none; b=nUZpXeH/7Duqlzd4VcAymLvdiqvk65mlJqrMjcptGmzhIBWm1UWw+j6FepMlKdgVzuJPzeF11xvTGjH85E2RJfnbZyRa0xvMoPOGKQvAxP4b5ZA7Mub3UlWGm6G0P+orTvSz0ldvWNAKyZP6T/Pqd/cGeTkQWxOpTWQdoJ963TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739975; c=relaxed/simple;
	bh=8VTsBeJsTItTrYLIla5gsOdK1SUroginizbkezRNh2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=helZ+9AG34QhiQEPr1ATSU5Qj/Y0XNCqcupBDct3oKMrs+wllRctCmRCVYT5tqdWRlxgJxTakGdyWfa4J6SjT5CU7lhrCYLHjaZ6u2jCn+pjCqx4w/93fpgxif/e1gnNtLDReU1esdTEIzQA/vEgdt4HmmC2RbNuMWLfZ2oiD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQxSl2C5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQxSl2C5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF3F1F000E9;
	Mon, 29 Jun 2026 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739974;
	bh=Ah5EDiHoXZZ+lJdmyeIH71Txk5rReWMRYVm4i/71Zto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IQxSl2C5ZVoL+RZJnQ3IGrU4zyMNjh1eQY3r2zP0WlKD7IATkcPbK7dfca6hsG4pS
	 pxjIWksqD+fcsHFRVIPvbQ6FTsyowM/bEaqgt+NVPjJCSiRYd+l6crhjRUhImCH19w
	 9I6J+a/uYOHnEzIIuT7pFCJk295i8ji9aSw6zH/6ougbdQwIKenkRyWE2agDpYPaZd
	 WexRZ5Gk4UluaTfonEeEXYmc+VEBKlpLdLb7mKSr3gxNOyytLSeGUpSOGGrljN6vhe
	 shavK04GKdJYbw9MOmNjGQJwg2mstrjuZDbIHCHdSSIKzM03CI/PHPFeooC9mLYtZ7
	 stxgnBRbClUQQ==
Date: Mon, 29 Jun 2026 08:32:53 -0500
From: Rob Herring <robh@kernel.org>
To: chancel.liu@oss.nxp.com
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <20260629133253.GA2593312-robh@kernel.org>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
 <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629074734.3643227-2-chancel.liu@oss.nxp.com>

On Mon, Jun 29, 2026 at 04:47:31PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
> 
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
> 
> [1]https://www.nxp.com/part/IMX-AUD-IO
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> new file mode 100644
> index 000000000000..5085574d221b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP AUD-IO Slot
> +
> +maintainers:
> +  - Frank Li <Frank.li@nxp.com>
> +  - Chancel Liu <chancel.liu@nxp.com>
> +
> +description:
> +  The NXP AUD-IO slot represents a physically present I/O connector on
> +  the base board. It acts as a nexus that exposes a constrained set of
> +  I/O resources, such as GPIOs, clocks and interrupts, through fixed
> +  electrical wiring. All actual hardware providers reside on the base
> +  board. The connector node only defines index-based mappings to those
> +  providers. This connector type is present on i.MX95 19x19 EVK and
> +  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion card.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx952-evk-aud-io
> +          - const: fsl,imx95-19x19-evk-aud-io
> +      - const: fsl,imx95-19x19-evk-aud-io
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 32

You don't know how many GPIOs are on the connector?

> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xffff
> +      - const: 0x0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0x0
> +      - const: 0x1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-map:
> +    minItems: 1
> +    maxItems: 16

You don't know how many clocks are on the connector?

> +
> +  clock-map-mask:
> +    items:
> +      - const: 0xff

> +
> +  clock-map-pass-thru: true

The purpose of this property (for GPIO) was to pass thru flag cells 
which are standardized. That's not the case for clocks.

Anyways, these properties need to be defined in dtschema first.

Rob
