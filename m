Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575510785;
	Tue,  7 Jul 2026 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459410; cv=none; b=XnBEIJ00MQ/v1KJMEMi96x3YB61pqGruB/L8S9Cgc7vGVa6hEGUD7nApjC0qUuZrl83rGLoYLU9awUdV1DFpsc73s3fTFFnsFDdqupjFipXI89lQB3mVvmo+AvDzX/01LJpmNDYXtwqHf3tZ2KyZHZrmHH3ROkXAK+LgPNw/KHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459410; c=relaxed/simple;
	bh=a60nyy7OcdhDk+yCD/1xpNCrxv7vLGToZcu4lIgipe0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nyk7ooiFeHL5QC4T59n99tI+jTsOwTd9ZwR2slyw/Kd8IG4AcHEGu6eOH4UJ3Ch/EUVfy84cXIJZcKVpqmTDxitsrQOvgkcs9PLOwGaVIYXehxtNCPUcHUjhsvmHn5OaoIw4OHHplQdPCEhdbAAMG3ye+9HWlMJ3zZZEOrwKZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxpU97Dc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxpU97Dc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179281F00ADB;
	Tue,  7 Jul 2026 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459409;
	bh=uaxpBgLFNTEZNxmTdCEah2eRnczt2Pt+VguMTHq//fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HxpU97DcodCAc8vMGRtD11CII4VrgmZKVk7VWNGv9p2jBEhL80fP9Qk7r5h03ayxd
	 kFO07ezzNW1DcssYSjj/B/pFQXLOyHywiEzdX0x4c9hmr4BekoGyDD7vW0bv07CRex
	 3OESQEZpKdUNnV37bXqATXO0doTIUIzO5hCW1GX1M+jQtE9DoLqs/uyBhvX8yOqERO
	 9dyLfa89YWmHK7mAjdtBq3N0HvtCj1bBSYOclZzE3AggbJEeoN5AlL1sxf1T0o9EuS
	 QYOkkED96ko63CiQAZMl3BEwV+MhIuT1+/7q6whxPD181Eb8kQ4oJI0zwGIwU1fNPE
	 ICjyVtgjNB8Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] regulator: dt-bindings: Convert ltc3589.txt to yaml
 format
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260707211612.2757349-1-Frank.Li@oss.nxp.com>
References: <20260707211612.2757349-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:23:28 +0000
Message-Id: <20260707212329.179281F00ADB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema uses `additionalProperties: false` at the root but fa=
ils to document the `interrupts` property, causing valid device trees that =
use the PMIC interrupt to fail validation.
- [Low] The `lltc,fb-voltage-divider` property is missing from the `require=
d` list for the `sw1`, `sw2`, `sw3`, `bb-out`, `ldo1`, and `ldo2` regulator=
 nodes in the YAML schema.
--

--- Patch [1]: [PATCH 1/1] regulator: dt-bindings: Convert ltc3589.txt to y=
aml format ---
commit d75bd969ae4548dedbfaa0e3da2470b322b67662
Author: Frank Li <Frank.Li@nxp.com>

regulator: dt-bindings: Convert ltc3589.txt to yaml format
   =20
Convert ltc3589.txt to yaml format.

> diff --git a/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yam=
l b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
> new file mode 100644
> index 0000000000000..3bf44fbe321bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc3589
> +      - lltc,ltc3589-1
> +      - lltc,ltc3589-2
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object

[Severity: Medium]
Should interrupts be defined in this properties block?

The schema uses additionalProperties: false at the root level, but the driv=
er
supports interrupts for thermal and undervoltage warnings. Will valid device
trees that specify the interrupts property fail validation without it being
explicitly allowed here?

> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^(sw1|sw2|sw3|bb-out|ldo1|ldo2)$":
> +        type: object
> +        unevaluatedProperties: false
> +        $ref: regulator.yaml#
> +
> +        properties:
> +          lltc,fb-voltage-divider:

[Severity: Low]
Does lltc,fb-voltage-divider need to be added to a required list for these
regulators?

The old text binding specified this as a required property for sw1, sw2, sw=
3,
bb-out, ldo1, and ldo2. Without a required list in this patternProperties
block, won't device trees that omit lltc,fb-voltage-divider incorrectly pass
schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707211612.2757=
349-1-Frank.Li@oss.nxp.com?part=3D1
