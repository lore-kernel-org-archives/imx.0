Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF825DB1A;
	Wed, 10 Jun 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077605; cv=none; b=LpYczGysHe0dcBXhJdn/QwQmv0nQJoRUhQZb2y3+afG1yIpBDT/ph+Ji2s8fbNQitL8MLsJABqp1a02a0IIi4J93ojXjwGG0Jgic69PqKEk1S9GKxe3AuUzyBk6vYPP6vdZI+ZHLB0exGBthO935E2tMXniNwf3e9kWGviye3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077605; c=relaxed/simple;
	bh=8S7akcT8uaQWC6p2KMZELg9nKSWUeAfJGykElD7KJdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxcDAhpCIjsb83jbay/9I9feid1Chs/BNpX9G908Jflyp95+ji18sj2wttLIGGOAWAcuyvwD8W8tWJdbJmb/vbTVjlrQyYMHX/fjtE4RgcHfbtK4OfxzEnAJdqAuditHTUXo0l7CKbmHexvMDynACqgP8gZApd8/07jUf+BiMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C49aIVZA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C49aIVZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3301F00893;
	Wed, 10 Jun 2026 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077603;
	bh=fCCH/VgbRHBb4PmFFXzngg3cdXaL0zFP6UWahwSZ9uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C49aIVZA/Wo8M3MQ58t32Z8sViV9FAODsrfwDWa9zaffeyyBxe4PXOpYIkhCTG8eJ
	 gvZ99CFz1P3jMBjjt8OJ7vhEr9gDwmdJC2Sx0CjQJENvJk1/5ztlpyELULPn80YKJC
	 643XiP6fewFkVf52h5eyVaMeX4e3RmA01e+UrmbF+btfOzDVA+PbIzXLgl8UHxPAvQ
	 AEYMRR9anqkCQ29eoGSWVuup6nRub3Po/i+nqSewCmf3vzzlSyj5pxD6P4pSRo4wCB
	 /DVuaUTlBnFoYR2XjSgavxsconKFmiTiNMS7KNGaFIptEfNrx6xCCvb1+VoXHV7VtE
	 yY/BBydLJiXnA==
Date: Wed, 10 Jun 2026 09:46:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Message-ID: <20260610-large-just-lynx-d8cb7f@quoll>
References: <20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com>
 <20260608-imx93-ldb-v2-1-1b1fe621bfda@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-imx93-ldb-v2-1-1b1fe621bfda@nxp.com>

On Mon, Jun 08, 2026 at 05:04:22PM +0800, Liu Ying wrote:
> i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
> register which control video output through a LVDS interface.  Allow the
> LVDS Display Bridge(LDB) child node and add the child node to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index d828c2e82965..124f5c206ee3 100644
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
>    '#power-domain-cells':
>      const: 1
>  
> @@ -92,6 +98,11 @@ properties:
>        - compatible
>        - ports
>  
> +  bridge@20:

You have dpi-bridge, so this should not be different. You should not mix
addressable and non-addressable nodes and NXP decided recently in
3feaa4342637eef673243dd38ccb32e8dc8efd5a that everything will be
non-addressable.

Writing bindings ask explicitly to post bindings, so if you decide to do
half-baked solutions it's on you. Half baked solutions are not allowing
to bypass standard rules.

Best regards,
Krzysztof

