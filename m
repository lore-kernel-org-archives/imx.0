Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428AE39F162;
	Wed, 17 Jun 2026 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693346; cv=none; b=SkRLYSXaDjuibTQy+lo65y/bjudDePsBt1yVeN9qLQA4u1DkcN7HMO+TygxBYP1iWMRL66S7d9HUVYNhV+oU7ubLTrZGjbYR5x3fD43teQ1/s5gIF59MOqEUhQ7NWQfzcugccr8XBmaFp/qR41d9bZR+o15mTsg58RyJAuwn6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693346; c=relaxed/simple;
	bh=z6KRTMkekpvvoRTAi7ZEq9OWjEgVSxaPLSyqn5ejeto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT8TDzUmy17BpoxMzIW3sUsV3BLoNPia5a5+i4y0VrlzUHfH1d2lv/Cv7Otf62Ln8ns8Pp70XwRBtBMT0bzcCOIQXB+fMu0NK/p96l/dEX1SCwU5ANVcO75CSHRzqhYsBwqJiGaPzvgmszPpodtFghwAr4EZIu/7GNibd5PjISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNoh+3xr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNoh+3xr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4A71F000E9;
	Wed, 17 Jun 2026 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781693344;
	bh=qMycG1ndqRl0cGcAck43prqsHHxJI4FoJfuvDdddzAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gNoh+3xrSW7aPhGluYFukYTIjASftnhZSltISCZsyqQqyizG+fvkuCeiIwSYnJz2e
	 JlwzBiStKKLaRwRZOPlss4wKLbkakM/djwoT5q09fKnJAaL9JpgYyMnzs2L19MWIu2
	 BkQmOsDqbl7JgH7qQ8szQOr0IKzoCQ97oy25Q5AtZiJA+1WeOwlVDozta8cBb/xPyi
	 uEXfhBUWqsv6xH2nTrNpfecrxDQpE1Y1rkDleHHMRsKzoFN/JnmHfeIfd7yKwn4za5
	 qG5F8O6sFVlLKUpMHY9lqM5brSR0CRkewrbD5cBrWq3QlwcJz4C7BiTAte9MgRsBUB
	 h/cbpNMcRoj8w==
Date: Wed, 17 Jun 2026 12:49:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <20260617-prodigious-private-inchworm-beae1e@quoll>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>

On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Some SoCs like the i.MX9 family allow full access to the fuses only
> through the secure enclave firmware API. Add a property to reference
> the secure enclave node and let the driver use the API.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index a8076d0e2737..14a6429f4a4c 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -53,6 +53,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  secure-enclave:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle to the secure enclave node

Two things here:
1. Here you describe what for is that phandle, how it is used by the
hardware. Currently the description repeats the property name and type,
so not much useful.

2. If you access OTP via firmware, then this is completely different
interface than MMIO, thus:
A. reg is not appropriate
B. Device is very different thus it has different compatible and I even
claim should be in different binding. Devices having completely
different SW interface should not be in the same binding, at least
usually.

If any of above is not accurate, then your commit msg should answer why
and give some background.

Best regards,
Krzysztof

