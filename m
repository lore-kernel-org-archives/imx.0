Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137362AE77;
	Sat, 17 Jan 2026 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768650250; cv=none; b=NKoc0S+bR/GsJSuOwTyrmqozPKbn/CQThXzCWt0W4YC255jrZAMIEyuaB0WEaDSlWOQLm54czd8ULZloxM8HL5d06kM24VgiNuF1PAMpLtqLB+sqivBJaLB8gzSRzE1AlxnYeBN4eU7nFKE4NCyxkfAgh1xzgS6qFIupK8QNOow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768650250; c=relaxed/simple;
	bh=7lknc6FIsN8kTaQ3hRHqL8L6jIldGI7xwi+wz3k2pVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3rm0PzdgAf3SSCvbJreahj2Yo+AmIMaNIq5CKI4k/fMTIwJkllEz2+mSko6uUtWvqN0IMyoiij6BBuKQm/NctQull8+n4xcLfpsF/3VritIeL/rxCKhSXDEw6raO9i5O6LVrSueILIp2zJnT1GLXRh0ofwrCMjEmVz89SCByUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUrkHI3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUrkHI3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1EEC4CEF7;
	Sat, 17 Jan 2026 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768650249;
	bh=7lknc6FIsN8kTaQ3hRHqL8L6jIldGI7xwi+wz3k2pVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUrkHI3TVz80ah/2V2OAa3YVWKUKlfBKTjrVaFB4AvpYJLenjYw9sIIbogSR970f8
	 cvGB31uAzYakxyaHsj1BFcCz55w8Mz/hymC0nr0RrfpvsMeLZdfb5ZxTU2A9814g5j
	 t1loXK3qayAfqBwBD4uwBn/HIh14LsGlngm/Wwm7DzHcqI8DGBM3giqP1+TjCTwFEX
	 SqlVmei7xQ2O9BMJZFQXZQ75mvE1uaGLhMEdvvTUHmRXhSM7CovoKwl/Hi4f4WaWEO
	 MGLT1KHJBv3T7Wk0UQgD5CBJ84TbxroJ9OcVHNYDcH4QkIx2XPUzMCWo0FHWVuIaQQ
	 wK0e+49RC5ceA==
Date: Sat, 17 Jan 2026 12:44:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-2-shengjiu.wang@nxp.com>

On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> so add fsl,amix-bypass property for this feature, besides this there is
> no power domain defined on i.MX952, so make power-domains to be
> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> index 3ad197b3c82c..50fb08460b4f 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> @@ -34,7 +34,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: fsl,imx8qm-audmix
> +    enum:
> +      - fsl,imx8qm-audmix
> +      - fsl,imx952-audmix
>  
>    reg:
>      maxItems: 1
> @@ -75,12 +77,41 @@ properties:
>          unevaluatedProperties: false
>          description: Output port to SAI RX
>  
> +  fsl,amix-bypass:
> +    type: boolean
> +    description:
> +      The audmix module is bypassed from hardware.

I don't understand why device AUDMIX would have property saying AUDMIX
(so itself) can by bypassed. If you bypass the device itself, what do
you configure here?


> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-audmix
> +    then:
> +      required:
> +        - power-domains
> +      not:
> +        required:
> +          - fsl,amix-bypass

fsl,amix-bypass: false

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx952-audmix
> +    then:
> +      not:
> +        required:
> +          - power-domains

Not sure what you want to say here, but disallowing properties is shown
in example-schema (:false).

Best regards,
Krzysztof

