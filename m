Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1FB380FF1;
	Fri, 31 Jul 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785538772; cv=none; b=BzLBh9gheqnOrtE8gplGiVYBSgDTSGLqHj28+2cGPTpxLfWSHYjtVYqjPtCJ9ZwD0ghkt/TJEGgMits7UXJuXQyIpsmIaiYBzUfTlj6Gt0DUSDnDdBDyPrXpbWfRO6bZ3f8497+spElQofPv3YIrVDnYz6Tc0JeD1UE0VJtNizQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785538772; c=relaxed/simple;
	bh=9YYJPQbrlMR9JjIk963U+j7eb4iwmaVP4OuLMavYfUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEaqHHl0VxGqZiUqr4iLh29wFfcmq/4zBnCEho/wn6VIEiR4rrq2MAtZT2uE/DYSRi56kh6iJBGtnOmmB5YJGcjvWKBR7dGDIq5vqW4vAmGE2p1yNM/vxQ9RR2N+qIBhKJSoSm5//X96ua/hajN9ls0YPS/Ehwa3tf48QLjyNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS9G3Tec; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS9G3Tec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72EA1F00AC4;
	Fri, 31 Jul 2026 22:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785538770;
	bh=MfyPXuzHFrgeP1BY9ER7yd6RDg+vnAlA5a1UueZqk9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bS9G3Tec/7Iy9FTjR8vc35fepxYxeZolPIHJV02pj2ppUGeoTRKcFKKGhRbqiSXew
	 HsOvWKZBgUpMdQ/eyCcedegXjjYiRJwoWtzh61y7pDRek2U2DCufuxMLjYuCaDsRD/
	 BPreSUDR6nrs8I/HbLH1ojemW4lQ3rlq1E/EpeW3aylLWZ/blntGAjantnwPuabuGd
	 GnBywAxhFeSOEeLz0MQySmdvT6qj4wfTxvDMR3vjK7GAyVSDUjaVtaKu6j+txfsZTq
	 EXoV9Rp/xNnSavV7kTsyHEVeIOUyVSX6W5j+3+zd5YL0q3iFt3WaFGvMJk/gFCOxNK
	 sWLwJX8xX0c0w==
Date: Fri, 31 Jul 2026 17:59:30 -0500
From: Rob Herring <robh@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port
 binding to support multiple pairs
Message-ID: <20260731225930.GA2098187-robh@kernel.org>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>

On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> The existing binding exposed only a single generic audio-graph port,
> which cannot represent the individual pair endpoints.
> 
> Add a ports container that enumerates three named sub-ports:
>   port@0 -- pair A
>   port@1 -- pair B
>   port@2 -- pair C
> 
> Each sub-port references audio-graph-port.yaml as before.
> 
> For backwards compatibility, keep the old single port property but mark
> it deprecated. A schema constraint (not: required: [port, ports]) ensures
> that both forms cannot be used at the same time. Update the examples to
> show both the new ports form and the deprecated port form.
> 
> No existing upstream DTS file for fsl,imx-asrc uses the previously
> documented single 'port' node, so this change does not break any
> in-tree device tree.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../bindings/sound/fsl,imx-asrc.yaml          | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> index 608defc93c1e..18d252722aa8 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> @@ -78,9 +78,29 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for pair A
> +
> +      port@1:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for pair B
> +
> +      port@2:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for pair C
> +
>    port:
>      $ref: audio-graph-port.yaml#
>      unevaluatedProperties: false
> +    deprecated: true
> +    description: deprecated, use ports instead
>  
>    fsl,asrc-rate:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -125,6 +145,10 @@ required:
>    - fsl,asrc-width
>  
>  allOf:
> +  - not:
> +      required:
> +        - port
> +        - ports
>    - $ref: dai-common.yaml#
>    - if:
>        properties:
> @@ -188,3 +212,57 @@ examples:
>              };
>         };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    asrc1: asrc@2034000 {

Drop unused label.

Presumably the existing example uses the deprecated 'port'. If so, just 
modify it to use ports and drop the deprecated part.

Rob
