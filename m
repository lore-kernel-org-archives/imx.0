Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A083DB306
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399978; cv=none; b=QZNAPIpkXP/r9/6XzM5d1RP30oQtfXI5VIlgVbIWky+2g25gh+Xdt08jqKM69tsLfX/2ec/3JYm6UoI1G8iXtW1s29Uviq3xT1vUzFSRuF1REkDGqoGCFIs5pvomuSoWJ2d8LbkI+SmPNxWgqoiO2r4lxIVjr1dnDbY001bNKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399978; c=relaxed/simple;
	bh=NnIXvXR9VBMgolF3J7CpRStvdIT2J0ZnceKeOYD94VQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cv+/LeSbaTQg2YvrdswDZOw2zGVHBHOPN6aXB1H9/eKEk9W52lx24g5zDyDjBWhIQgzhU47vNmq56iUe3DG5cEUe0UiDJ2vrKcFkZaLnVgC2mUzCp1BU8S38NkK4X3AYJrgxVGCfCHWafwvziYSc51uXTy7e3AyM07quyFtjAXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iet05ffJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iet05ffJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4761B1F00898;
	Tue,  2 Jun 2026 11:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399972;
	bh=CrE+wSAx52+UyoCe2mnmeA7u6Zo24vAoqEIzz/zR0JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iet05ffJmfNxrNm4Wj23D3ix64vBMc8tAGJFFXEWbznHTV4Y+Ehh7ptZq1SkQaB55
	 rCgPYYiHDE7LeX8v4pZ/bLj1hrEU5UJXTALvkOqSk5H6aoS2X4h93MmuB+DBT09sHl
	 nqG9IcoHK6/31AylX/wPsyOLVtoMM5ROnstMTylRgzIgVsBIBiTmkDizbtZ/7V2KnA
	 lXqHY8vprjmmVNOTWDLqwcu/Nj6UNxra2M9nAwtn/SxGq5wkLYo4y/0SaUrl8KyN2m
	 RoXVjMm8dVii/9cnn0VDejsxQW++3gPGE8o6UoSIuWusdWpXlpTLEvzKKT4gYM867I
	 1Vlud4csZIxUg==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v24 1/7] dt-bindings: net: Add MTIP L2 switch
 description
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukasz.majewski@mailbox.org>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260601112437.2216043-2-lukasz.majewski@mailbox.org>
References: <20260601112437.2216043-2-lukasz.majewski@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 11:32:51 +0000
Message-Id: <20260602113252.4761B1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Schema Validation Bypass due to `additionalProperties: true`
--

commit 5d51965bfdbb5587449b5ea451099860ef23a8f0
Author: Lukasz Majewski <lukasz.majewski@mailbox.org>

dt-bindings: net: Add MTIP L2 switch description

This commit introduces the device tree binding for the MTIP L2 switch
found in some NXP SoCs like the imx287. It defines properties for ports,
MDIO, clocks, interrupts, and provides an example configuration.

> diff --git a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.=
yaml b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml

[ ... ]

> +  pinctrl-names: true
> +
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: true

[Severity: Low]
Does setting additionalProperties to true here disable strict schema
validation for the container node?

Allowing additional properties means that undocumented properties and
arbitrary child nodes will pass without error. Should this be set to
unevaluatedProperties: false (or additionalProperties: false) to ensure
that only documented properties are permitted?

> +
> +    patternProperties:
> +      '^ethernet-port@[12]$':
> +        type: object
> +        additionalProperties: true

[Severity: Low]
Can this bypass strict property validation for the individual port nodes?

If validation is disabled here, typos like 'phy-mod' instead of 'phy-mode'
will silently pass the dt_binding_check validation.

> +        properties:
> +          reg:
> +            items:
> +              - enum: [1, 2]
> +            description: MTIP L2 switch port number

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601112437.2216=
043-1-lukasz.majewski@mailbox.org?part=3D1
