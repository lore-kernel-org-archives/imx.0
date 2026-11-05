Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861946;
	b=dM+SyAsznrLUZ9MAk7oJ6ai0uksJu2WDBRIZaAPtBrDx6/bF8XmcRG0+0r3bRDDiDjXB
	 8PpPs+BuCbcq4O0S5eBOzCGtHi0b659LvPfKC3rSrJSU1u43rNqAqVW9X1a5gQH9/2VjV
	 zc1r6jHsLXUhxmnz7JwjJVEiEJ52xjCJ+M9m/Xv2Mc7M7IQEQBlDwiBiI9DWdMMutRgHi
	 /j2RAYHXUu2crIYzVUd9/nP/+K5HjsRphq5XjVMYD+mJxmA6HIpbUO3dFEQMMmUTi26yW
	 2fVms0PE2c55DHHT8rC2Si6+MHM0dFj8/Menb24Ffro7zGORjEFTxnMfhupcC0QigaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861946;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yjgn+T9A78MuXsRZ9T8vNdmzoVes2gZWY0ZRrkqv9Dw=;
	b=SBjKAqJjTMCV0cILTtINO97Y7lgrO6h7smmXaJfkfqjUzROHhRXnZDrhi6oY8iXiCi2X
	 i1fGUJ+muDGlQ+PYlQVc9Hdj1L6ZHRBKnXPNCBk3yBqLuC4sFVgUSclLykbKGJK5lNZ+G
	 e3f2BExU1ZHYqU4SKz0Dk1wM0lW5Ul/MttgnPp6jUe5dWOwHcrmJP5DidWy8Bx805p8Xv
	 n0SEW+dvQygukN1efXzVQ9R+BUfD+9+yASCE4T9Md+RdAV+ABBeVN3WpgslkZzturMrzj
	 PH8RU5gMwjSm9IXTvcXt8In5034D4kKiAsaLy+K017Ka2SvRESQdPKkCQh7TvGbpScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivAYKxoA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76539606A31B;
	Thu,  5 Nov 2026 06:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivAYKxoA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABFA1F000C1;
	Thu,  5 Nov 2026 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793861946;
	bh=yjgn+T9A78MuXsRZ9T8vNdmzoVes2gZWY0ZRrkqv9Dw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivAYKxoANFb3uqOxfgROCJDscFMs662/NIAsEXr1++a48cHJVichgfFi+JBRiAG6K
	 O2WDE+BroKOjGLN9E4W2fLdZPWe1EM2Okp8M6KBC6Sh9d2cBjXV4A8qSAQl1Z9s59F
	 4BOMYs7pYszQuTrfTLkYDSlcKyoeCWgolxkiLS8XLIW3H6oEpwd4M875+9Mzz9jfo7
	 iTFJXLplkYGukiBpJ3fjQ0wGmdQTTmYgRt0Y6Y9OlPRk9weDXVRB7y0JMck5GNEBE9
	 0Hf4gQKKDwFINMrKAMd4RxJi8klzeINKeZRWw6Z+KD9iMTUKKwX7uGgfxJeoSiKIyI
	 jiYyktXYDd56g==
Message-ID: <sashiko-outbox-198641@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261105064117.277495-2-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
 <20261105064117.277495-2-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 06:59:05 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: connector: broken 2-cell interrupt-map-mask in fsl,=
aud-io-slot
- [Low] dt-bindings: connector: missing constraints and docs in fsl,aud-io-=
slot
--

commit 1ab07ded804d101088853f33b8efa1603244b3a0
Author: Chancel Liu <chancel.liu@nxp.com>

dt-bindings: connector: Add fsl,aud-io-slot binding

This commit adds the Device Tree binding schema for the NXP AUD-IO slot
connector found on i.MX95 19x19 EVK and i.MX952 EVK boards, defining
nexus mappings for GPIOs, clocks, and interrupts.

> diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.=
yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> new file mode 100644
> index 0000000000000..6e1e3f1b6a330
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
> +$schema: http://devicetree.org/meta-schemas/base.yaml#
> +
> +title: NXP AUD-IO Slot

[ ... ]

> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-map:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-map-mask:
> +    items:
> +      - const: 0xffffffff
> +      - const: 0x0

[Severity: Medium]
Does masking out the second interrupt cell with 0x0 in interrupt-map-mask
work as intended when #interrupt-cells is set to 2?

For GPIOs, of_parse_phandle_with_args_map() in drivers/of/base.c supports
gpio-map-pass-thru =3D <0x0 0xffffffff> to forward the consumer's second
cell (flags) to the parent GPIO controller while masking it during lookup.

However, interrupt-map is parsed via of_irq_parse_one() ->
of_irq_parse_raw() -> of_irq_parse_imap_parent() in drivers/of/irq.c,
which does not support an interrupt-map-pass-thru mechanism and replaces
out_irq->args entirely with the parent interrupt specifier from
interrupt-map. With #interrupt-cells =3D <2> and interrupt-map-mask =3D
<0xffffffff 0x0> (as in the example's interrupt-map =3D <0 0 &gpio2 27
IRQ_TYPE_LEVEL_LOW>), the consumer's second cell is required in the DT
but silently masked out and ignored during interrupt resolution.

Should #interrupt-cells be 1 with a 1-cell interrupt-map-mask for an
index-only interrupt nexus (similar to microchip,mpfs-irqmux.yaml and
renesas,rzn1-gpioirqmux.yaml), or should interrupt-map-mask avoid masking
out the second cell?

> +
> +required:
> +  - compatible
> +  - '#gpio-cells'
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru

[Severity: Low]
Since the clock nexus properties (#clock-cells and clock-map) and
interrupt nexus properties (#address-cells, #interrupt-cells,
interrupt-map, and interrupt-map-mask) are optional in required:, can
omitting dependentRequired allow incomplete nexus nodes to pass schema
validation?

If a board defines interrupt-map without #address-cells =3D <0> or
#interrupt-cells, of_irq_parse_raw() in drivers/of/irq.c walks up to the
parent node and inherits the parent's #address-cells, breaking the
interrupt-map lookup. Likewise, #clock-cells and clock-map both need to
be present together for of_parse_phandle_with_args_map() to translate
clocks.

Also, should $schema at the top of fsl,aud-io-slot.yaml reference
http://devicetree.org/meta-schemas/core.yaml# instead of base.yaml#, and
should gpio-map, clock-map, and interrupt-map document which physical
connector signals correspond to each index so add-on board overlays and
base boards agree on the index ABI?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105064117.2774=
95-1-chancel.liu@oss.nxp.com?part=3D1
