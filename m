Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E48B2628D;
	Sat,  9 May 2026 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778296735; cv=none; b=FK+2Q90OHc5CKnUOR4q4qnqETwtUFzDZCUsqXon1HT7qawLRS9lqL9A6NKAy0G64O2gPgA6MJJ7E9IMwoNX2ZDi85LzATHQ8sIOvSMogl5BGbh64K5ExmBzuxUq/dTpaB897sqeYptzG/STWY6QsPsBEJazanQjHe3YuIowWnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778296735; c=relaxed/simple;
	bh=s6IPB8yheXhYc2bKGzXmtZpqftn4lGIIb65F9X/qrHo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z8yNOVWodLYIAlRAAtcIVmt22nu3ez+AXGjRm1Pnx61fH4eMDpMp/D0R8T6aImXsGYnkPhgEIqupbhq7qz9h/AlOnylTd1YT8lIajmCTT5P0w4QZiYUYoMpg5NEN/0OWgw10UYC9CT4YYOpkMOYxoa7GptqO5wcm4AwCtZ4yps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoQKDAqO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoQKDAqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1973DC2BCB0;
	Sat,  9 May 2026 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778296735;
	bh=s6IPB8yheXhYc2bKGzXmtZpqftn4lGIIb65F9X/qrHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZoQKDAqOp3HtM+ZP6ZFfx4h1EE/hRgv7o1sqE9ivkHxTvLlYAKHq21L44SW+84x3i
	 PNgNDA0pZ1OWdgkOtroFBAdVDVHWx/tmDGJ32N3XGcvuJ7W1GN+H6QlT8dzTEO4RDE
	 efxIvQ8a/Ijfkogqp1dqxECwNkkx3JFP1V9vO/tpTPS3wC39TKMZIiQ4Q1iH5mJ8r8
	 1lEDO61JiUpz3S9L2Tl3P2oM8IOxEfkZoP7vuQHUmRQfuL5h4HKq2oP+9QpxEUP7LU
	 zZynizI3ggqhZXrVWqP32R5yTrUtzGNFd9zhWDBfQQ1PhwHyJP80C/n9lLb2mjLqHs
	 yz7wicurR3MPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector
 binding
Reply-To: sashiko@lists.linux.dev
To: "Chancel Liu" <chancel.liu@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260509024846.2094049-3-chancel.liu@nxp.com>
References: <20260509024846.2094049-3-chancel.liu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 03:18:54 +0000
Message-Id: <20260509031855.1973DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `#pwm-cells` property definition causes valid PWM nexus =
configurations to fail schema validation.
- [Medium] Subsystem guide violation: Provider capabilities are missing fro=
m the `required` list.
--

commit b88adcce540a59e2da49df7e20b99d2c52021962
Author: Chancel Liu <chancel.liu@nxp.com>

dt-bindings: connector: Add fsl,io-connector binding

The commit adds a device tree binding for the NXP I/O connector. It acts
as a nexus node for routing GPIOs, clocks, PWMs, and interrupts through
index-based mappings.

> diff --git a/Documentation/devicetree/bindings/connector/fsl,io-connector=
.yaml b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
> new file mode 100644
> index 0000000000000..8b5038a2332e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml

[ ... ]

>   pwm-map:
>     $ref: /schemas/types.yaml#/definitions/uint32-matrix
>=20
>   pwm-map-mask:
>     $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
>   pwm-map-pass-thru:
>     $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
>   '#address-cells':
>     const: 0

Will this fail schema validation for valid PWM nexus nodes? Since
additionalProperties is false, omitting #pwm-cells from the properties list
means device trees including #pwm-cells will fail validation. The #pwm-cells
property is required by the nexus mapping logic to parse PWM specifiers.
Should #pwm-cells be added to the properties block?

[ ... ]

>   interrupt-map: true
>=20
>   interrupt-map-mask: true
>=20
> required:
>   - compatible

Are there missing required provider capabilities here? According to the
dt-bindings subsystem guidelines, when hardware gains provider capabilities
like a GPIO controller, interrupt controller, or clock provider, the
corresponding standard properties like gpio-controller, #gpio-cells,
#clock-cells, interrupt-controller, #interrupt-cells, and #pwm-cells must be
included in the required list. Could these be added to ensure incomplete
nodes do not accidentally pass validation?

>=20
> additionalProperties: false
>=20
> examples:
>   - |
>     #include <dt-bindings/interrupt-controller/irq.h>
>=20
>     connector {
>         compatible =3D "fsl,io-connector";
>         gpio-controller;
>         #gpio-cells =3D <2>;
>         gpio-map =3D <0 0 &gpio1 8 1>;
>         gpio-map-mask =3D <0xff 0x0>;
>         gpio-map-pass-thru =3D <0x0 0x1>;
>         #clock-cells =3D <1>;
>         clock-map =3D <0 &clk 1>;
>         #address-cells =3D <0>;
>         interrupt-controller;
>         #interrupt-cells =3D <2>;
>         interrupt-map-mask =3D <0xff 0x0>;
>         interrupt-map =3D <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
>     };

Should this example section include the PWM properties as well? The
subsystem guidelines require the example to include all required properties
to pass dt_binding_check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509024846.2094=
049-1-chancel.liu@nxp.com?part=3D2
