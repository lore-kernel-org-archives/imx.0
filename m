Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445409;
	b=QI/xeLk3P+mHge3BeIWESNivxLynsh8EiWqA9wbh7qnpEb0FfPbTgSFw/7sSKAtqEMy9
	 wIZku+ZLK6IzURGaXMmES/pv+i67zboNRXTHrw3+j2ZMqnZjrGXQCsqYmY2k8NLCh4K5e
	 0Oon6yoohXtwJ/SFgxWl77KtIjt+3E0PrzClCpKLPuwMsBYEcsW4PvU1jKBx1U94RrZ1y
	 NFoImDbCjB4Sv0PkEafulFk9PG41DOehYLUevjoV6dCMISAk7a3lIDYyIjPODae1SsyQv
	 bqPyH5KVDcyNzKsxZ+GX5JStpfHjOZ0BQxQuqchENt7WAG9/xNUgG41D9iW6el4dbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445409;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9IdzEOZACnAbud2LlA/5bkJPHSI6p7WBNERtOSq1ZwA=;
	b=qXVVTP28HXcPyNsDdR20XFKKz42YJpRVrqGg43ybwzy6hPyVHYpxOA0k3aPhBPhexBvs
	 93ih2jcA52zJUSiDdY+Gi0oPGO32cYytuQ98Uw0ounloGBfv1Y3YCgVH5PlFh5C73Rx/N
	 njlq1EgX4aSOXbQ5q0ScSBPsVAjbXzWmY4SPx2+g3WqfK9eg9IZsPum61c0YU1cmu9pt4
	 WuiLq3Q8h+GkcTqxLGr46b0ScXOkvTtcSeMKDLDm9AxXLUDHnWqOAwbLtR+CdprwovilN
	 ifjzCR9clSvLYZjEBiMXsd01GdXmd2WhSvk+6LT+/NNS4tLOWbP71VC++bsCOa79xoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIO6Uj5a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59349606A330;
	Thu, 12 Nov 2026 01:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIO6Uj5a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83A71F00A05;
	Thu, 12 Nov 2026 01:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445409;
	bh=9IdzEOZACnAbud2LlA/5bkJPHSI6p7WBNERtOSq1ZwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIO6Uj5aGQn9+wmuYSyxklxpKnR9Z9Q6FSg8D4pZwWasg3+zWEGqVNAF9auNiCigc
	 t5eiwFv2tca0dfpQrZ9KyOVNw+Yn3I29IPKCh5Ge1wVqzEd2bRgG1qXEFC1NxNO5It
	 JXI/f6KnOlh9ii4Xb2iJbqlNpXgyCCaXvtmR1yUQv7yFEqcN08fGgnpZ7vY8/eXhK7
	 rgbzWbBCRCf9P+rfeH0qd7G6+axJJzJwyV76r4osA6maS/0R7SmjujAF4wUOODsKER
	 NKzE1AE46qMWaHLqlBnoCUY0IpGzdZ9mkyiH0XDDWKB6ewvcofXxfgLYJup5DY7ySs
	 7HqQITGtUIaPg==
Message-ID: <sashiko-outbox-210030@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add Samsung S5K3L6
 image sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261112004636.739749-2-vincent.cloutier@icloud.com>
References: <20261112004636.739749-1-vincent.cloutier@icloud.com>
 <20261112004636.739749-2-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:03:28 +0000
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
- [Medium] dt-bindings: media: s5k3l6: board and driver constraints
  hardcoded in schema
--

commit 2a414a254e5114acefaa73e7d87e80c013d1fa39
Author: Vincent Cloutier <vincent@cloutier.co>

dt-bindings: media: i2c: Add Samsung S5K3L6 image sensor

This commit adds a Device Tree binding schema for the Samsung S5K3L6 13MP
MIPI CSI-2 image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.y=
aml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> new file mode 100644
> index 0000000000000..097593d747804
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml

[ ... ]

> +  reset-gpios:
> +    description: Active-low reset GPIO, also used to recover from I2C er=
rors.
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: Analog power supply.
> +
> +  vddd-supply:
> +    description: Digital core power supply.
> +
> +  vddio-supply:
> +    description: Digital I/O power supply.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +          link-frequencies:
> +            items:
> +              - const: 537500000
> +              - const: 600000000
> +              - const: 625000000
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - reset-gpios

[Severity: Medium]
Does defining link-frequencies as a 3-element items list require every
board to specify all three frequencies <537500000 600000000 625000000> in
that exact order?  A 3-entry items list implicitly sets minItems: 3 and
maxItems: 3, so any board DT that uses a single frequency, a subset of
these frequencies, or a different PLL frequency derived from another input
clock rate will fail dtbs_check.

Similarly, constraining data-lanes to two lanes blocks 4-lane designs even
though the S5K3L6 hardware has a 4-lane MIPI CSI-2 interface.  Also,
reset-gpios documents Linux driver I2C recovery behavior and is marked
required for driver standby error handling rather than hardware
requirements.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112004636.7397=
49-1-vincent.cloutier@icloud.com?part=3D1
