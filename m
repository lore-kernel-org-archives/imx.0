Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691138;
	b=lFNYowxX67Rbz6XYhaXlcKBNyaZWT36HRSSnSVfNI4gXXAKh35g1azQpNncQQ1j91l2D
	 j5B6SRwWhR9jD5E4FWEwzwjvF/uPViPjOQHqQEuVTKY5Vu0qivqTDGAw+WWLhRy/ACVAS
	 Djs9eJk9WBhMzVklBXFPh2GDMiJSWefcg82kqGnH8PCDooACvJ2fJ7Yn4UdIg0e95EeWJ
	 P++RtnMj6zir5g0vVYfRjyqbsN1t48hRxLwb2UCuk6GNAOQgQG8zwxh+uRF/AZFrj5GW9
	 uLlZ4Uj8qzW3k3RWSCm0gYbgdNp+naUNzYHB60LWq8RNjG1epkTe0seUnUJddurY+jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691138;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=esQ8k0v7tsfBVuC6wqFu1NmPFDJAHXXyD7IUsbcD7yg=;
	b=Sj1Cu2ccNtMvi3TjGR9+CUspawLWNXXJzyjfZAYhSSUkgYPB8+9W23giecnHRZK7EyCZ
	 gVpdgLrLZobIGDiVKmbeqUXd94DFGwvHyNTqADvE4rC8EQkHkRTzZzqx72jX2u7xaLQdZ
	 Hl2v36vDBxcJ85y9ePlnHfwA4WbZAnB7rgBl3WPmwptlpcAoqm8iGKKj/4iyhCAG6VAIY
	 SXSRyE85V+mSM8z70F6VS1DMird13CD2Ndw+b3tIum8mXwQs3V2X8541Lh1FjB1CbaSkE
	 +OmPN+gXb4R2Ohn0y/PAUlCrOM/pqJ3i+mqpnhtmMQaDlw+xV2JYRw5ksUlA4NsY8Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmF8HHmF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013F5606A331;
	Tue,  3 Nov 2026 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmF8HHmF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501211F000C1;
	Tue,  3 Nov 2026 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691137;
	bh=esQ8k0v7tsfBVuC6wqFu1NmPFDJAHXXyD7IUsbcD7yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmF8HHmFe23WCjDFO6jjaLHUgMgbSjRxX/tj8EE/RcrcBgcUC+PL5EsMOIJeDBRBb
	 3+8MKcwoGk+9hnmlo+2Hgj1XQmu/SOJ1lMalCYgKSRJ9YqJyD0t0ivSQXM3GZ2JzoI
	 7Cl+lRWMhtXNyCLAYs44O2klqnQ5nO2HS5bVXnuvh2aJvBsJSXrMv02RT6fluE+yWH
	 IPfD+fx/Yw2UgfuzotRWiJk0bLrOy63KMOD3gjnXMKMfroDsj2aDBGrWRA9SvCAuYU
	 hCKM1D24L/W6DvJMcR/Rwm/83N7/v7YcD/lBMv7mkwo5OTyvLhB+TGBnwl4ltt4vQk
	 7j7igIBdPRZsQ==
Message-ID: <sashiko-outbox-194715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
 <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:32:16 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: connector: controller properties on passive nexus n=
ode
- [Low] dt-bindings: connector: reference to non-existent gpio-nexus-node.y=
aml
- [Low] dt-bindings: connector: 2-space indent and raw GPIO flag in example
--

commit e914717ab225094e8907a50041ee664ef2ac92f2
Author: Chancel Liu <chancel.liu@nxp.com>

dt-bindings: connector: Add fsl,aud-io-slot binding

This patch adds a Device Tree binding schema for the NXP AUD-IO slot
connector found on the i.MX95 19x19 EVK and i.MX952 EVK base boards. The
connector acts as a nexus node that remaps GPIOs, clocks, and interrupts
to base board providers for the IMX-AUD-IO expansion card.

> diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.=
yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> new file mode 100644
> index 0000000000000..fc3896d0fafab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> @@ -0,0 +1,106 @@

[ ... ]

> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-map:
> +    minItems: 1
> +    maxItems: 3
> +
> +  gpio-map-mask:
> +    items:
> +      - const: 0xf
> +      - const: 0x0
> +
> +  gpio-map-pass-thru:
> +    items:
> +      - const: 0x0
> +      - const: 0x1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-map:
> +    minItems: 1
> +    maxItems: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupt-map:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-map-mask:
> +    items:
> +      - const: 0xf
> +      - const: 0x0
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
> +  - $ref: /schemas/clock/clock-nexus-node.yaml#

[Severity: Low]
Will this cause dt_binding_check to fail when resolving the allOf reference=
s?

There is no Documentation/devicetree/bindings/gpio/gpio-nexus-node.yaml in
the kernel tree or in dtschema (where gpio-map, gpio-map-mask, and
gpio-map-pass-thru are defined in schemas/gpio/gpio.yaml).

Also, Documentation/devicetree/bindings/clock/clock-nexus-node.yaml defines
select: true so it is applied globally by dtschema rather than being
referenced via allOf in individual bindings. Should the allOf block be
dropped here?

> +
> +required:
> +  - compatible
> +  - gpio-controller

[Severity: Medium]
Should a passive connector nexus node declare or require gpio-controller and
interrupt-controller?

The binding description notes that all actual hardware providers reside on
the base board and the connector node only defines index-based mappings via
gpio-map, clock-map, and interrupt-map. Per the Devicetree Specification, a
nexus node that remaps specifiers is not itself a controller.

In the kernel, gpio_shared_of_traverse() in drivers/gpio/gpiolib-shared.c
calls of_parse_phandle_with_args() (which does not traverse gpio-map) and
checks for gpio-controller to identify the backing hardware controller:

drivers/gpio/gpiolib-shared.c:gpio_shared_of_traverse() {
    ...
    ret =3D of_parse_phandle_with_args(curr, prop->name,
                                     "#gpio-cells", i,
                                     &args);
    if (ret)
        continue;

    np =3D args.np;

    if (!of_property_present(np, "gpio-controller"))
        continue;
    ...
}

When gpio-controller is present on the connector node, gpiolib-shared
records the passive connector node as the GPIO controller device instead of
the actual GPIO controller on the base board.

Similarly, in of_irq_parse_raw() in drivers/of/irq.c:

drivers/of/irq.c:of_irq_parse_raw() {
    ...
    bool intc =3D of_property_read_bool(ipar, "interrupt-controller");

    imap =3D of_get_property(ipar, "interrupt-map", &imaplen);
    if (intc &&
        (!imap || of_device_compatible_match(ipar, of_irq_imap_abusers))) {
        pr_debug(" -> got it !\n");
        return 0;
    }
    ...
}

If a node sets interrupt-controller without interrupt-map (which is optional
in this schema), interrupt resolution stops at the passive connector node
where no irq_domain exists.

Could gpio-controller and interrupt-controller be removed from properties,
required, and the example?

> +  - '#gpio-cells'
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    connector {
> +      compatible =3D "fsl,imx95-19x19-evk-aud-io";
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +      gpio-map =3D <0 0 &gpio1 8 1>;
> +      gpio-map-mask =3D <0xf 0x0>;
> +      gpio-map-pass-thru =3D <0x0 0x1>;
> +      #clock-cells =3D <1>;
> +      clock-map =3D <0 &clk 1>;
> +      #address-cells =3D <0>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +      interrupt-map-mask =3D <0xf 0x0>;
> +      interrupt-map =3D <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
> +    };

[Severity: Low]
This isn't a bug, but the properties inside the connector node in the
example use 2-space indentation instead of 4-space indentation, which
triggers a warning in scripts/dtc/dt-check-style --mode=3Dstrict. Also,
could gpio-map include dt-bindings/gpio/gpio.h and use a symbolic GPIO flag
macro instead of the raw integer 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103070433.2307=
145-1-chancel.liu@oss.nxp.com?part=3D1
