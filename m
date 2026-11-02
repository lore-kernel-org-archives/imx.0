Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618211;
	b=Lq0962Zv8POw1+4XcCoGtEKSlAFfCDQa5jR/zesYmXHJ9YvOv27JR1T/obPmWLxNdPQ9
	 P0oB50eU0bKTr9a5/4cHPqtvrNNKF9byxmOBwYGGuRX66TPLqTF0qHIIYBShFJeCIMUE7
	 515/hVy2ReHScULo5/J4zVREJ8a4A5wBWbp/E4Am47R098F2FU2hTawv7V/xyJ9lL3wv1
	 bjHWc1Y5R6fjyin05+bUVqt5E0NWPnJGskfJqfeKdEJGakMxPxdb3UbrPm6BxIs8TvFpJ
	 4aAkU5Qh+b41jJ4iwpzK82eebk+kFSv4F/pzfjjTRaMVy1QtS7SB24tlTWib3ktOOYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618211;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yAiN693EoE8Bv9AfkhxHQHZO02i5vG4nfF8UEUAX4DM=;
	b=ql1d2IvMZVkpZF0JimRBsBpg/gz9u79RPVS9dgfxlaYxfh07cCfX6cRBdoN6Lnfq5kzy
	 d1f+1eghq394pBXjDdPbOnemb8lzj9Y2hwn6uwq+23NmAutEoRnNmrADEsAbAtkHJOsLZ
	 93m/Oa2GkcUxix/8YohJRqbOW80u22OiNZXdGr5tvhOezSVuvFOcH6azGcErylEP+SbHp
	 ObwAILlyo+4z1LTlFwc+ug1a7BnPE0lxbx0ozW9wN0zeOGvfYa2XpHsICdP9xGfRu3lCI
	 WL3w46GYjIqdEKDTAfCdcGatvJEiJmICg/APQ8V28Q/OXb1J4WMjlRhyyBiscYbolBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBJgUvxg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC7606A324;
	Mon,  2 Nov 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBJgUvxg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CF91F00A1B;
	Mon,  2 Nov 2026 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618211;
	bh=yAiN693EoE8Bv9AfkhxHQHZO02i5vG4nfF8UEUAX4DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBJgUvxgoTPg5T5Qmv2EvBcUPlsR0aAeYVYrqLoA8ZnCl2H4A8+uMEy82wjHu6eJA
	 rxKwGH8Z/uJnhtLLLhrMriJ2OyBIDS81m5uTjET7CZIXIETX4MSrcTv2ruEbUpAtVd
	 xdBxAaffXh8yGAcsCvEsW7t17gIum9IlVPmJX9ffwCOqsVeWLXAU9UYGErVcrKagNU
	 7NIjV3Y1b6Vy9yv5rNzDWjzG+XvKzmcthqOFOjK41wJqBsfMAIrZDaJ3rIQ7wHFPau
	 hc9xc9XjBOGZ1zWmhqY/E9NJb+fff0Ri8przHBzMEWA/MGzUHuo6rDWqVWzJx6kubr
	 lHZW4/JozhRgQ==
Message-ID: <sashiko-outbox-193325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i3c: silvaco,i3c-master: Add
 Amlogic A9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-2-0c474bfccffa@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 11:16:50 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: i3c: silvaco: unwieldy conditionals and invalid fal=
lback
--

commit 0af7894c213f5346efb5a1f1360dff5a7a1704bb
Author: Junyi Zhao <junyi.zhao@amlogic.com>

dt-bindings: i3c: silvaco,i3c-master: Add Amlogic A9 support

This commit adds Amlogic A9 I3C controller compatibles (amlogic,a9-i3c and
amlogic,a9-ao-i3c) with a silvaco,i3c-master-v1 fallback to the Silvaco I3C
master Device Tree binding schema and adjusts the clock count constraints f=
or
each variant.

> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 853092f7522d3..de1fdec654a26 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -19,6 +19,8 @@ properties:
>            - enum:
>                - nxp,imx94-i3c
>                - nxp,imx95-i3c
> +              - amlogic,a9-i3c
> +              - amlogic,a9-ao-i3c
>            - const: silvaco,i3c-master-v1
> =20
>    reg:
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
> @@ -72,12 +74,30 @@ allOf:
>              enum:
>                - nxp,imx94-i3c
>                - nxp,imx95-i3c
> +              - amlogic,a9-i3c
>      then:
>        properties:
>          clocks:
> +          minItems: 2
>            maxItems: 2
>          clock-names:
> +          minItems: 2
>            maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,a9-ao-i3c
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

[Severity: Medium]
With the top-level clocks and clock-names minItems lowered to 1 and a third
if-then conditional block added under allOf to handle 1-clock, 2-clock, and
3-clock variants, the per-compatible conditionals in silvaco,i3c-master.yaml
are becoming unwieldy. Since the Amlogic variants (especially the AO domain
instance with its internal bus clock divider) differ significantly from the
base binding, would it be cleaner to split the Amlogic binding into a
separate schema document rather than piling more conditionals into this fil=
e?

Also, is silvaco,i3c-master-v1 an appropriate fallback compatible for
amlogic,a9-i3c and amlogic,a9-ao-i3c?

If a device tree node for amlogic,a9-ao-i3c binds via the generic
silvaco,i3c-master-v1 compatible (which uses svc_default_drvdata without a
vendor_init callback), svc_i3c_master_probe() looks up fast_clk in
master->clks and fails with -EINVAL because fast_clk is absent from the
Device Tree and the internal clock divider at offset 0x304 is never
registered. Similarly, amlogic,a9-i3c requires Amlogic-specific fast_clk ra=
te
setup in aml_i3c_init() and hardware quirks (SVC_I3C_QUIRK_FIFO_EMPTY,
SVC_I3C_QUIRK_FALSE_SLVSTART, and SVC_I3C_QUIRK_DAA_CORRUPT) to operate,
much like nuvoton,npcm845-i3c which does not use silvaco,i3c-master-v1 as a
fallback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-a9_i3c-v2-=
0-0c474bfccffa@amlogic.com?part=3D2
