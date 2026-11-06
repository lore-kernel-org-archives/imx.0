Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949780;
	b=WKTlv9Y/lYa76nxyGbotTgnRn9+AIB+tFagng5zE3qAJjkf4N3NIdj0yH3WyvdLJGgHu
	 uedzpjDw1LJiDm6FTO1X9kJEw2mt6YyiIojJzqyECejDe6xHn/XaNkicJlcmZrzHev6a4
	 fjuDH+AIbiquaK6oTmnTb0DU1T/0vZzzQY26nN0Ape8/dT3RuRvheXWbMHMq8c4312amr
	 /CzkBs4rKnYnLv/Bqhk+0wzjTBhimXPuDu8EGMgUXIcJ7USxEFyzYlVb4tWFpGaSjfuD5
	 OGpsMh9nmTH0rEutfB+gD6ch6qa9b63lrBlmlv7Ln4g+sJSlxUXGMqFeHsmKz5eKIyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949780;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l+JJGuwRJM3z7N4kO/kgTH54i4ethXSyzCMfLiGeBfo=;
	b=ustqvkwZkLnm06uz0hoYIkNpNh5tmNFREkiBbg/k/TtRR5JM5BciGyvTTWJ8/WhP1b8v
	 DVuSwQdBsMqKPJIY0SMyRUG1ljrzcAWa9lWPb1Vyh9R8jp0FScw3+g+kmmGlfZD0rJVBj
	 TTC3Fl34eiB53wHH/X6dBlsMzr5+iy2g7hVihaxNQszuaYvv1etemVBbPCTRw+xdWLqX2
	 ZDQ66G27rG6i+h14Ta4T6h+MWGss83xBx/UCfuYqZxsCvrvG/euknY4+UZD0swIlA7+VZ
	 4w/4VkERYodbHKn+D9XFOCkK8W6KsQQeoKfvQ4moZAO1snj6x49/l/oPto9D0ZEnipg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPb5vqkp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF1606A329;
	Fri,  6 Nov 2026 07:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPb5vqkp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3DC1F0089F;
	Fri,  6 Nov 2026 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949779;
	bh=l+JJGuwRJM3z7N4kO/kgTH54i4ethXSyzCMfLiGeBfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPb5vqkp5peh+FGlxrIgMbxTsFX0re3sCatibuw+wXpGnX23nZuzPubjmu6xawIPT
	 t0Hxcx27XKGjFyI7yEreLaIVcvB4P3PViVEdmTI5ymxZP64EzPduNxBt2X/4SnBEpA
	 KTZKM741SufHk5Jw4O4P/B4hlRjB1gA55MOu6a3YTqOBEsyBLDbBMMeNu2plgk1ak/
	 n3YLpy42Hp8f/l8CnltK/dKphS6VwyVuVJoQLZFtpam1tMJK5rfyLtLIz9fE0+ja2p
	 hCwY9yRaafS8Q9ARA+dp7MhTRnFsMLsjYBjDfSWi8QwVJnwcADgqkOqpkmbfQV3YiO
	 aLennEEUfvdvA==
Message-ID: <sashiko-outbox-200991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: i3c: silvaco,i3c-master: Add
 Amlogic A9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 07:22:59 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: i3c: silvaco: unwieldy per-compatible clock
  conditionals
- [Low] dt-bindings: i3c: silvaco: single-item enum and description in
  if/then
--

commit dbac4436ecc3f857ef0fa7dbe10d0fd5116cdb2d
Author: Junyi Zhao <junyi.zhao@amlogic.com>

dt-bindings: i3c: silvaco,i3c-master: Add Amlogic A9 support

This commit adds the amlogic,a9-i3c and amlogic,a9-ao-i3c compatible
strings and their per-variant clock constraints to the Silvaco I3C master
Device Tree binding schema.

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

[Severity: Low]
Should the Amlogic A9 variants be split into a separate binding schema
instead of adding more per-compatible conditionals here?

Neither amlogic,a9-i3c nor amlogic,a9-ao-i3c uses the silvaco,i3c-master-v1
fallback, and accommodating the 1-clock AO variant weakens the top-level
clocks and clock-names minItems to 1 so that 3-clock, 2-clock, and 1-clock
variants all have to be constrained via separate if/then blocks in allOf.

> +
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
Does this new if/then block pass dt_binding_check?

The dtschema meta-schema requires enum arrays to have at least two items,
so matching the single amlogic,a9-ao-i3c string under contains needs const
rather than a single-entry enum.  Also, property descriptions belong in the
top-level properties block rather than inside an if/then conditional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-a9_i3c-v3-=
0-804b69b9095b@amlogic.com?part=3D2
