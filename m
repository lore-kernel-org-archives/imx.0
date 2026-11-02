Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604524;
	b=f56JDeeTKITpUVBaHx4qAzr7hOa4YcN/5v/UhBveH4xKiL+tZU64FEEkPAwbuZsro7m9
	 tUk0tkQysqY0N3Mqa1imkVVlowb80eBg2T+wmDidePcMapTOhYGoNnPgCOwAPASHluVfl
	 FuiGkp6XmymIoOFSF3UWkkkMSoBNdMFGKxEMDQsVrEe1Gl9I2eV7/PAWznVJDZch0ANYG
	 yi1gHTtETMBseI01qSp5Y6WfxCOLfM6zvb0YgWkYv9OcfXuMQAdPDM0lpALaWTXEOutx9
	 6HH5ON79L7H8nQ19BlA12ZUAV3NUcnEE8OUgo6spsTfx8NuFYSsahe65XjyHbHMmHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604524;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nT6D34lVZPsVnqv1Mv6DEijDwSntrg/yw0RnHBOVLDg=;
	b=0CDvGQqhMmaDU77E7AxSNN7Giy+kgBlDovGshncvcVruc5PUNxHGjW0EdYw6Jk/mhdfY
	 L7f4HMzga0zvvDGQNVZ58H78rutUq+gUxWiyETWjZvXsbG8csudsBSIAI5KCMT2PBzyGB
	 sdXgQut02SnboGmd+dfF4in/ii3J+vKULo6ggfJXQPjBMh9wQLsfdK2mKTp3fqXwoAPf4
	 iFTO/3IKAD4Kz33U8PSpKzWYSaBB8K55rH66pkUgrcLZNBjboarhBBhCfi6ioJ8zNNHUE
	 sat2KMlg1kFWqLDpRDkmv6m8d6ql8/d9/F8pUw7b3tneYWFGY1KfdSG8NE8Ga8CUqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+DLjyfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C2606A32C;
	Mon,  2 Nov 2026 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+DLjyfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD91F0093A;
	Mon,  2 Nov 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793604523;
	bh=nT6D34lVZPsVnqv1Mv6DEijDwSntrg/yw0RnHBOVLDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M+DLjyfXWAl3TaZNGPK/WK3ueOVhP76TGVIsMtlHiL0RZo/a/eOGecakll5qDIOyv
	 MyWCqUbF4Lm88Ultvdq2DWrijIptk5w0MM+lj5p/dHrwXVCuFmIeDH2uiH3XmkLe0e
	 eNTf4DmiURJRGNrNtoFjpIF/HpNtQz8ktbTXpWks4qVQLbUIbuhTosPchMAxIL7/vw
	 K3tEAc6JiaGE+kxbpoSVjPbn2UpSoSnJ2AMW8gt/pGWmEtFXQJfg7cVZrwSEI1ZGgJ
	 dlNi2GApENgDIeHb6o7CcxcahQ1Uq0xnm/zuIW9YnryQF6/ow7MB8qEnJjxmeMN2th
	 /00cRKquLMfsg==
Date: Mon, 2 Nov 2026 08:28:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP
 registers
Message-ID: <20261102-translucent-elated-pronghorn-cbb73b@quoll>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-2-wahrenst@gmx.net>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101200140.141642-2-wahrenst@gmx.net>

On Sun, Nov 01, 2026 at 09:01:38PM +0100, Stefan Wahren wrote:
> +  nvmem:
> +    type: object
> +    $ref: /schemas/nvmem/nvmem.yaml#
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx93-bbnsm-nvmem
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
>    rtc:
>      type: object
>      $ref: /schemas/rtc/rtc.yaml#
> @@ -88,6 +102,12 @@ examples:
>          compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>          reg = <0x44440000 0x10000>;
>  
> +        nvmem {
> +            compatible = "nxp,imx93-bbnsm-nvmem";
> +            #address-cells = <1>;
> +            #size-cells = <1>;

I don't think you tested your changes. address/size cells are not
allowed - see your binding.

Anyway, empty node makes almost no sense, so fold the node into the
parent.

Best regards,
Krzysztof

