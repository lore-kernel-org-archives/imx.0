Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826842;
	b=eWOyl4E6B5BLv+7FiI2lq5CTYsTJrZP54gvI0ccNDZrSZW3MC6riMgH09mbFMp6K8Lkl
	 erokrJUY8L84Z8xQsALocWF9MUw2BWJvuCjTX3ph8I4QRgxZZc5Swql9pi0fbWVNITxRS
	 UcilffAFwi/AnY0skV/kVIyQ2DidxR96o2dv51z3KZGjKxsHcY6upSqgs7btdABBb6nv9
	 JEIYR9ylTb/+3f9I8wt9PYqG6KhHvIRSxbv3kxwFh1hoA9y4k2n4b4ZiJQ8fZSKyfFZqw
	 OBeyC/VQUHmQRw3kiDSDOtWvMkd6Zb8R03UzIcd8gB/fOd/p9zNgC34KVH7Mlfkr/Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q+XKeteplK1QAM0q8mQGCIWBTuExNUI4WhBG5cj2vL4=;
	b=ZqvOAmlDgCetcQRW/+Gcax0LOJ2mxGkXKVzypsYNdYm1tPMCbfq1CilX8uEwcfkbeF+8
	 Zs7hvSXO/C0vbGtqUS5WUZr9kuaufmEnuE+6GpiUkS0KOnIPAsG5Bs4mHp6euMEULf2/R
	 R8TaclWAX6ke7hpuAzI6g+uP6ZtRzQM/8K97OsLDcDai4kG42L0jE+GjsvmDJe/g3bZUY
	 6pFOaTNLANAPaJX8i9BMyNOCTb/6lDf732uFvp48thne11w4e6G+R9KpgAGbVdl4Mhnsq
	 MXCRVh8t4N4qqDWf6BEdPLE+ugC9uXLkVdAbvkbUxuSrn9JCccG0F4NkagUzDMkfDuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVILch4N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27F4606A32F;
	Mon, 16 Nov 2026 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVILch4N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B3A1F000C8;
	Mon, 16 Nov 2026 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826841;
	bh=q+XKeteplK1QAM0q8mQGCIWBTuExNUI4WhBG5cj2vL4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UVILch4Nem2cA9YybFl3BS6qtbmpqV9xesf1KgsHK3LzklRF81ccA/RW0280lkaPd
	 gLF3s1ycPFIerBhTjIEj1jP08m5d67h3BlvPLdraP69mQiW5mEcZmSZ70nhEDqvFlD
	 PV0Ek+wGLuqme1VHFRFrVUDikuyil55o0ekuXUa7ydWoBPLuSxUPEzvijrKwbiCH5l
	 2Rcb7/lfgts9C4RqdmxftVGUomR7ouJKrTCItf4pbNo47eehOxshYPbmxQjJGQPeN7
	 UoERM/oO9eSoU53X8xxMHMq+rZMWl3oCmqk9qtj5CB6gNlBEzrJvi6gdiNZVybsyBP
	 CMKHUZB2y4zEQ==
Message-ID: <sashiko-outbox-216820@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: silvaco,i3c-master: Add
 Amlogic A9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261116-a9_i3c-v4-1-3d3222b7128d@amlogic.com>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-1-3d3222b7128d@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:00:40 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: i3c: silvaco: unwieldy per-compatible clock
  conditionals
--

commit 251ed23fe4de97f3ef90597eebd6c64d8acd188a
Author: Junyi Zhao <junyi.zhao@amlogic.com>

dt-bindings: i3c: silvaco,i3c-master: Add Amlogic A9 support

This commit adds the amlogic,a9-i3c and amlogic,a9-ao-i3c compatibles and
their per-compatible clock constraints to the Silvaco I3C master device tree
binding schema.

> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 853092f7522d3..d892d42bee65c 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -13,6 +13,8 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - amlogic,a9-i3c
> +          - amlogic,a9-ao-i3c
>            - nuvoton,npcm845-i3c
>            - silvaco,i3c-master-v1
>        - items:
> @@ -28,14 +30,14 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - description: system clock
>        - description: bus clock
>        - description: other (slower) events clock
> =20
>    clock-names:
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: pclk
>        - const: fast_clk
> @@ -70,15 +72,35 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - amlogic,a9-i3c
>                - nxp,imx94-i3c
>                - nxp,imx95-i3c
>      then:
>        properties:
>          clocks:
> +          minItems: 2
>            maxItems: 2
>          clock-names:
> +          minItems: 2
>            maxItems: 2
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,a9-ao-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +          description:
> +            The "ao" variant is the controller instance in the Always-On=
 (AO)
> +            domain, which has no separate bus clock and derives the
> +            bus clock from an internal divider.
> +        clock-names:
> +          maxItems: 1

[Severity: Low]
Should the Amlogic variants be split into a separate binding schema instead
of adding more per-compatible if/then clock conditionals here?

Neither amlogic,a9-i3c nor amlogic,a9-ao-i3c uses the silvaco,i3c-master-v1
fallback, and accommodating the single-clock AO variant weakens the
top-level clocks and clock-names minItems to 1 so that 1-clock, 2-clock, and
3-clock integrations all have to be constrained through separate if/then
blocks in allOf (including a variant-specific clocks description inside a
conditional block).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-a9_i3c-v4-=
0-3d3222b7128d@amlogic.com?part=3D1
