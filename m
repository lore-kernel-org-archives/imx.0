Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A61C317155;
	Wed, 15 Jul 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095715; cv=none; b=UUlBaz9EGEIGG9dEiuKDKN4MlyFXzdZACYXQ77T4s3gxszwTh3m/LzTgEJ4G91GNJUE78+JZxp/osLS3hKefHCuquOtqwtpuFzJUjIxou9hRGav60NGb0wU2cITm2KoLm6nzAFoJIKtpcZF4itjo6U8pE7UvxQwhNB6PnmMjap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095715; c=relaxed/simple;
	bh=xeWK8Pvy7I/PQAm2xMzZpwUK7gQqysr4k0PHvmrkIF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toHbuAMOJXZqfO1FqOS1WNUQTVXb28xjpN+PuBWIroeOIGZq04i7ppne+JGOi7/z7ah6xL49jBG0yW68yxQnwsrSRoFBy43CmiEyUfy0RLWrhG+zPd4R2AH1ZG9oAVIoY7ZX224A/AbO4fBLX0hzfv/3sK9bDsOttSKGktmwkIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msrmTNsY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msrmTNsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52BC1F000E9;
	Wed, 15 Jul 2026 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095713;
	bh=1ULBlpWcCMHL+k8mUwAGMRXmL/LM436Hb11RBQxXZXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=msrmTNsY7g4JoySUPK1RxwcFJKZNddLzswjgd1NLJg8MrXGz/iMisVd21N+dWpBWt
	 Gby6reU0jSVj1jFxQX9VGOyQS+YV04CgK+CUbPmSkLm0JCq8GGRFnh6jeWaSo4HzWt
	 OkKBNsumCIOF806T+AhormuIIC2LFCMzIq1CkXvekB85W5fVVljuzTxChVTHoRElbN
	 oSFdtpLEDDXd2nVyBAHMHhUImInQ66Hh/Nm6nbacyCP+UD8aLrvUQiH1hFx8dnyhm8
	 0J6Y4eCbqKSnTrquLB5g1SwmhUpYRyMEqp5fkoViZLLoXFS+vBK77mWZO9hG1BYXXC
	 TI8YW4af2ZwmA==
Date: Wed, 15 Jul 2026 08:08:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: sn65dsi83: Add output
 data-lanes
Message-ID: <20260715-successful-quetzal-of-amplitude-bf3cb8@quoll>
References: <20260713082622.52985-1-wojciech.dubowik@mt.com>
 <20260713082622.52985-2-wojciech.dubowik@mt.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713082622.52985-2-wojciech.dubowik@mt.com>

On Mon, Jul 13, 2026 at 10:26:19AM +0200, Wojciech Dubowik wrote:
> From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> 
> Add an optional output lvds data lanes property with
> two allowed values. The array <1 2 3 4> for standard
> layout and <4 3 2 1> for reversed lvds output lanes.
> The latter informs the driver that reverse lvds config
> option has to be set in config register for the respective
> output channel.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8eb..2693c0273f9a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -86,10 +86,62 @@ properties:
>          description: Video port for LVDS Channel-A output (panel or bridge).
>          $ref: '#/$defs/lvds-port'
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/types.yaml#/definitions/uint32-array
> +                description: |

Drop |

> +                  Array of physical LVDS data lane indexes
> +                oneOf:
> +                  - items:
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +                      - const: 4
> +                    description: |

As well

> +                      This is the default layout
> +                  - items:
> +                      - const: 4
> +                      - const: 3
> +                      - const: 2
> +                      - const: 1
> +                    description: |

Ditto

> +                      This is the reversed layout

Honestly, this previous description are redundant. I can read 4-3-2-1
and I do understand it is a reversed from 1-2-3-4.

Do not explain the obvious code, but rather design behind. Just drop the
descriptions except the first one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

