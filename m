Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30A3019D6;
	Thu, 23 Jul 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773780; cv=none; b=C/kp/IQ3poSkEtezYXsRLTh8Nboe85oXAxtFZrJND9DmG9XwmUyOJgXTv4EJ4UgUGGOsxqnL7byQj2IyaE9yMVRoT/QWApKhVH1kqnySof/RGfrWPR75zmPmqGFqkjdBSbj0X1AEvlptxDorUIMUtXMEQyHDrkiMjjPQ2a42IN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773780; c=relaxed/simple;
	bh=CB/jQmhPaVJjnjW2uwRJ+OtuyOsiXEBuj6gOMhX+1bo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uVgkHSfZLVJ9W4wnE32OXyJGoi2qc4s4AJaE/b7qmjKEXY597YELeHdzcQsAj1C1Do452Bwhi0IK97VZv7PNlp6IY4MEaITLkpT40iPtfi6092NTapEhanD8XU8Do0xKN6VJ7/DeMcDLINlbMLFVCw7qEoljZ3OaD38Sfj8DumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZ3bp4Z7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZ3bp4Z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27A01F000E9;
	Thu, 23 Jul 2026 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784773779;
	bh=G/5ZItvkjO+dIPVlY8Dy1CTHWys3a6r2Rz+UbKxLnos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZ3bp4Z75zhf3hyzxKjeyUwigBobMaIHRLOJoDaUhz+5xvnfYPlzeEsaKwKaV05Il
	 XRW7bPpaQ9x8vrZ1behuVRD8sg6EOwr37p/J5PXgPRe2ITFakOvL/qHKckBog9dDFk
	 6MsBucC0o13bh9zBKlekg+7XdugjaFK71/tQpSyQWi0Hfog9P1WvlWgs2ZODwxd5hH
	 t9l8iOAOXdbSyDMgk4SjTD26GewexKSlFU7pnsuqNFsdAjwmorgO980fenaJR4niQ/
	 deQqj2WEv/WUGYomiNN9+hQ4i5TyOLeukvEc2TeenGVKEDkWjV+4n1IfRgCXXgoBED
	 UwPwrMj1divtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260723022313.1905051-2-shengjiu.wang@oss.nxp.com>
References: <20260723022313.1905051-1-shengjiu.wang@oss.nxp.com>
 <20260723022313.1905051-2-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:29:38 +0000
Message-Id: <20260723022938.F27A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Validation fails on example code: dtc merges both asrc@2034000 node=
s, triggering the mutual exclusion constraint.
--

--- Patch [1]: [PATCH v2 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port =
binding to support multiple paths ---
commit e164bae1625f2a8ec5fb2503565d3f37194aee90
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: dt-bindings: fsl,imx-asrc: update port binding to support multiple pa=
ths

The commit adds a `ports` container to support multiple independent convers=
ion
paths for the i.MX ASRC hardware. It enforces that both the deprecated `por=
t`
and new `ports` cannot be used at the same time, and adds a second example
demonstrating the new configuration.

> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/=
Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
[ ... ]
> @@ -125,6 +135,10 @@ required:
>    - fsl,asrc-width
> =20
>  allOf:
> +  - not:
> +      required:
> +        - port
> +        - ports
>    - $ref: dai-common.yaml#
>    - if:
>        properties:

[ ... ]

> @@ -188,3 +202,59 @@ examples:
>              };
>         };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    asrc1: asrc@2034000 {

[Severity: Low]
Does this node name cause a build failure during dt_binding_check?

Because dt_binding_check concatenates all entries in the `examples` array i=
nto a
single DTS context for validation, using the same node name and unit address
(asrc@2034000) as the first example causes dtc to merge the two example nod=
es.

This results in a single merged node containing both the `port` property fr=
om
the first example and the `ports` property from this new example, which then
triggers the new mutual exclusion constraint (`not: required: [port, ports]=
`).

Would it be better to change the unit address for this second example (e.g.,
asrc@2038000) to prevent dtc from merging them?

> +        compatible =3D "fsl,imx53-asrc";
> +        reg =3D <0x02034000 0x4000>;
> +        interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clks IMX6QDL_CLK_ASRC_IPG>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723022313.1905=
051-1-shengjiu.wang@oss.nxp.com?part=3D1
