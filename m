Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299DF2DB7A8;
	Wed, 21 Jan 2026 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982639; cv=none; b=rmNVYYbmexxxmxuQFmYBUyWE+kkBSiOUxT4mm1ht2byZdgqja4MehZaOikJkmfAqt52uh21o1CV9q6sJ+MiXzgkSQdAT3QTPQNF/AK10oNntqw+TcshJh8zQnHoxVKNtrUhWoSkrDsI99WNzoDfyZoHZz9Z2ULOZcupt4O5KTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982639; c=relaxed/simple;
	bh=PsqDsmtUvSMoAGPchw0ANb9blEgv2FuLIEh2Q6T95uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwfRLIewEKqa6LNEbD1JMb8SySfAsrTWWUTpRjvqS8uIts5+ck5exdNW1lYQHavgwIu5qhJlPJ1C6klB1ln7gx66cu0CM/6tRDYLQ2Od4GE6nLu+Os0rNCVzbLKvlv6aHdEwLSbAzzI6xq039XRoLE39oNIjocnCGW0yJe3Rg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZ1vmbG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ1vmbG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E830C116D0;
	Wed, 21 Jan 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982638;
	bh=PsqDsmtUvSMoAGPchw0ANb9blEgv2FuLIEh2Q6T95uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ1vmbG+beB2iwfhyj3XVTL2l++mCmI6l5ZmExwsa68lW58lTMGsTDs6Xs+ZkM6oy
	 Og7ixvumC6seNlVkVoEBb/17yi/LiSgNvXmuCkRw6rtwKL+atFAfvaPCNZpzLog7q1
	 YDFBy3X69Liig5y8ZQy8ResbG6BcbU21IVgsfcLmDSjvmI/cQ3g02sqjxZpguNdKjC
	 OndH9JSnSqgOMh7/uw7/5d3igi6NzPxuluvUmUkxQQJyoKVrpR35g3GbSaDGQzOiFx
	 ItIpu/Qn7FJrpCpj+xKt7Xbhlkgk2ODhP6QDdS1xSDJeyfhExvHl77ubmICS9ntTE+
	 0pCtHucBM4DcA==
Date: Wed, 21 Jan 2026 09:03:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: fsl,sai: Add AUDMIX mode
 support on i.MX952
Message-ID: <20260121-careful-beige-iguana-c32bbd@quoll>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
 <20260120035210.1593742-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120035210.1593742-3-shengjiu.wang@nxp.com>

On Tue, Jan 20, 2026 at 11:52:08AM +0800, Shengjiu Wang wrote:
> The SAI can connect to AUDMIX, but AUDMIX can be bypassed or not on
> i.MX952, so add 'fsl,sai-amix-mode' property for this feature, with
> this property present, then SAI driver will try to config the setting,

I am still not sure this is hardware static property. You say "can be
bypassed", so I imagine same board could have it bypassed or not,
depending on use case (so mixers).

> fsl,sai-amix-mode = <0> is bypass mode, fsl,sai-amix-mode = <1> is
> the AUDMIX mode.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,sai.yaml       | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> index d838ee0b61cb..7808c324eebc 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -133,6 +133,13 @@ properties:
>          - description: dataline mask for 'rx'
>          - description: dataline mask for 'tx'
>  
> +  fsl,sai-amix-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Anyway, string is more readable.

> +    description:
> +      The audmix module is bypassed from hardware or not.
> +      Bypass AUDMIX(0), AUDMIX mode(1)

Drop last sentence and use enum [ bypass, mode-1-whatever-this-means ]

> +    enum: [0, 1]

What is the default? What is the meaning of lack of this property?

> +
>    fsl,sai-mclk-direction-output:
>      description: SAI will output the SAI MCLK clock.
>      type: boolean
> @@ -180,6 +187,15 @@ allOf:
>        properties:
>          fsl,sai-synchronous-rx: false
>  
> +  - if:
> +      required:
> +        - fsl,sai-amix-mode
> +    then:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx952-sai

There is no such compatible.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.34.1
> 
