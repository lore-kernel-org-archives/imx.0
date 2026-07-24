Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE9F145B3F;
	Fri, 24 Jul 2026 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784874379; cv=none; b=eiYae6lcW08QjUaICbZROuZEuyUXy6P3YkmznhGohOLjLP+8UaEpqpLJq6sEi7wL6jAXanvSqLzZgjhZziGuRvv9Ty6Z/1w6Bq/fr8mqI/Ip1J/b5n78qrOMu3P1GTuixg9pq0P5pVDpdcqkU3zdIzFMk8b2OwGyLBZD313pSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784874379; c=relaxed/simple;
	bh=9z69YQp+ASoqVtBCQreb1IiwbX6RSqN/6PEOXQMLEAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWUWG6q+BSygceJiipZNPYsZx8BgUEs4FA1sfswqF/jhjodYNR4d/OXkN3C3QIxIsbgrhwjwXHm35cIrc/1ghVecjho0UmPVy/wxIkfU0uJpIvxR/SPliPDqykMW8j7F+9fCMjnhnDBjm3hUwU76hv/zvHD8By0O/Mh3XdC5LzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/bR6F9l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/bR6F9l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7041F000E9;
	Fri, 24 Jul 2026 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784874378;
	bh=Jk6bAfs2+w41N9G+jSHsBfNZNGb66kO819wQ5i5s02s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/bR6F9l9ISgv1FUXiPIfTE7zbKxEabQDzJ91c97WhtR1BL5rllfywquFz9BZwJmV
	 EtTgsCx70uFKRKzMyge3wFu7u8JxScW8ChlJhnD+/txHLSGKLW1gY5kPA00JQB0XCP
	 QSdxahu7xYuQ75PzhA2HxQ8n9+cQl4gsY8nKeoVnosrgYnct0u59/xm3h5z1L4ZKvd
	 F/HQle4ai+ilUxmU1/JQZcJttt3nuXZUWXJVez2R0U963wJWqxkaXdLbHQ0nBFl7gV
	 AgOf7dehZC3E+mOqhFv18vzdyKm4zpBOHk/cnpz6PRSan967pLspwMrwp5cXnyxGIi
	 gfMWOf69X9iYw==
Date: Fri, 24 Jul 2026 08:26:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 01/11] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <20260724-purring-wildcat-of-virtuosity-59a2e2@quoll>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
 <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-1-e26930345b4c@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-1-e26930345b4c@kontron.de>

On Thu, Jul 23, 2026 at 09:27:23AM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The driver currently uses the limited MMIO (FSB) interface to access the
> OTPs. The intention is to support the firmware interface alongside the
> MMIO interface so the driver can pick the interface that is available
> (firmware might not be loaded) and fallback to MMIO.
> 
> Some SoCs like the i.MX9 family allow full access to the fuses only
> through the secure enclave firmware API. Add a property to reference
> the secure enclave node and let the driver use the API.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index a8076d0e2737..38fe451f808f 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -20,6 +20,16 @@ description: |
>  allOf:
>    - $ref: nvmem.yaml#
>    - $ref: nvmem-deprecated-cells.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - fsl,imx93-ocotp
> +    then:
> +      properties:
> +        secure-enclave: false

Please move the entire allOf in such case after "required:" block (just
like in example-schema).

>  
>  properties:
>    compatible:
> @@ -56,6 +66,10 @@ properties:
>    clocks:
>      maxItems: 1
>  
> +  secure-enclave:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to the secure enclave node

"... for full access to the fuses through firmware API."


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

