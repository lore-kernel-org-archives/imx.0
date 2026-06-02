Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B942E2C029D;
	Tue,  2 Jun 2026 08:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388496; cv=none; b=gz2ylEESfYU8lQv2iz88KuxysRvTJTf5YpWo/OI3nsYPs6BiAWPpzreSnKMDYdMT7GaZMwjRrsdZFvsmzbV03CQihRzlBV5Ox0/jCXwCIi7/48nBrkzevZMuWgM6o7PLXlKpIaidqzAjuIbtFrMYZK1RTZwm5OZQufGFLa2Ea3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388496; c=relaxed/simple;
	bh=c/2cZtD9sP8z3cs75tkWfygYjcrazGNL/FvaGM4hCaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TikKHi6ran8k4lBdJ9f7tJGVouSa6aJduBnX8k8kF0wlzLaYRld/sccZXeLy19IKx2dhCAcK+pgjllzRTszn1+xa8+XsYtWAyGKSlofTTbPiSzFCxvLTwk17NODXyj0l45629voW//h3Bb2Iktfzu6JcV2PMGBy1K9unJad6Da0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPg1Qixm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPg1Qixm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0709B1F00893;
	Tue,  2 Jun 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388495;
	bh=PtBNk0g8mRGl4pTTJm0gNHPYAvl9kFi7i5BTDgauKoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VPg1QixmnDHJZRhjJyfttTRk7X7FZD+Cieh/oKEmGZntBCMP/tvnDwbS6mWHe5AFE
	 ojGLreC9dTpU4LnHnErtmpTyTK/2LxE6WKBZaOCnrVRpZfgBEP+VqZ41wkFL9fD1nA
	 EvkqbrPjx35tfTNFkLENeupEQ6eFac0kkj9GTHx3V8QPSAdcDPFkHpdoWcyCAa8Dt8
	 bdEUIGj2/xyOJ/zk8dgNRWPUIbNI1QpAH9HGoJQe8BJhmun3iYEBdoVKDR+jhweaq/
	 MNMEf+2p6l7FwXuzW8/wns+7/0MPpEyrMpucgvCRtlVMTYNYD047KQp8/7YFZsQimx
	 +QZ90Uk2SEiLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] dt-bindings: pinctrl: s32g2-siul2: describe
 GPIO and EIRQ resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602080132.3256239-5-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-5-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:21:34 +0000
Message-Id: <20260602082135.0709B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The legacy fallback branch in the `oneOf` block fails to explici=
tly forbid newly added capability properties (`gpio-controller`, `interrupt=
-controller`), creating a schema validation loophole.
- [Low] The device tree example will fail `dt_binding_check` compilation du=
e to an unresolved phandle reference to the undeclared label `&pinctrl`.
--

commit 055c2d417b67cea0bcdcafe1444e526610028d07
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources

This commit extends the S32G2 SIUL2 pinctrl binding to describe GPIO data
and external interrupt resources. It adds GPIO and interrupt controller
properties and expands the reg property ranges. It also provides a oneOf
construct to support legacy and new node layouts.

> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinc=
trl.yaml
> index a24286e4def62..e4cc1a3a795c8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
[ ... ]
> @@ -86,10 +118,32 @@ required:
>    - compatible
>    - reg
> =20
> +oneOf:
> +  - description: Legacy pinctrl-only node
> +    properties:
> +      reg:
> +        minItems: 6
> +        maxItems: 6

[Severity: Medium]
Since gpio-controller and interrupt-controller are allowed at the top level,
does this legacy branch need to explicitly forbid them?

Without setting gpio-controller: false and interrupt-controller: false here,
could a node matching this legacy branch declare these capabilities without
providing the 11 reg items and gpio-ranges required to actually use them,
thereby bypassing schema validation?

> +
> +  - description: Pinctrl node with GPIO and external interrupt support
> +    required:
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +      - interrupts
> +    properties:
> +      reg:
> +        minItems: 11
> +        maxItems: 11
> +
>  additionalProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      pinctrl@4009c240 {
>          compatible =3D "nxp,s32g2-siul2-pinctrl";

[Severity: Low]
Does this node need a pinctrl: label?

The gpio-ranges property added below attempts to reference &pinctrl, which
will cause dt_binding_check to fail with a 'reference to non-existent node
or label' error.

[ ... ]
>                /* IMCR119-IMCR397 registers on siul2_1 */
>                <0x44010c1c 0x45c>,
>                /* IMCR430-IMCR495 registers on siul2_1 */
> -              <0x440110f8 0x108>;
> +              <0x440110f8 0x108>,
> +              /* PGPDO registers on siul2_0 */
> +              <0x4009d700 0x10>,
> +              /* PGPDI registers on siul2_0 */
> +              <0x4009d740 0x10>,
> +              /* PGPDO registers on siul2_1 */
> +              <0x44011700 0x18>,
> +              /* PGPDI registers on siul2_1 */
> +              <0x44011740 0x18>,
> +              /* EIRQ registers on siul2_1 */
> +              <0x44010010 0x34>;
> +
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        gpio-ranges =3D <&pinctrl 0 0 102>,
> +                      <&pinctrl 112 112 79>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602080132.3256=
239-1-khristineandreea.barbulescu@oss.nxp.com?part=3D4
