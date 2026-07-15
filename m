Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C648A2B3;
	Wed, 15 Jul 2026 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136456; cv=none; b=c5koGzuE6t2IThCsBUYTuSCzsdiCxh33unJkMynDR3/ZBH6AKwNNSXUwXcUigFjRemFhPlcKptz7FuxJvZmxFOER0VKjk4ssjtKlwetc9Cri3A6LB0AgN0if5ZnEiE8zzaDGgYcb6C2W9++uqC7VG4pz5IqDEquAiGNIDtWRXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136456; c=relaxed/simple;
	bh=Z70I8hgnzbuwgnsOHjNNaJ14DHZuBtifF4kg9rbS5e0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bYxxXHDf90v7ShwMQPkaKaIfYdigjpHpzVCiidJ3sqbEoUGW6qqs0/nvjy6R2AFVUXH0+pMMFc03Ay+ESgRmhVVNEedYPJHq768KYb2WluhO7FXaDJZHjUeZnWW8+6FfFPSkyOhkCt1LMO4XJhx3u8CPdviPIf2IH4+BEivOP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njV/Psvh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njV/Psvh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501CE1F000E9;
	Wed, 15 Jul 2026 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784136447;
	bh=rMBo8RTeIsVnnW7czUMD0Ah8wE/m61y64ivYAb0H0BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=njV/PsvhuaZcPpHT1Ex/Q1uJz/Gw+EIj+y7fgwcKOQT/3skJ2Zl7y/r/T9r4RWvdI
	 P8eQ9W2Y9Gqps1BA1jgjfawv6Qc4PMDAqfaiC0wnwB49M/7xOyZq19JrjoD80PZ9fD
	 mAsqU+GpCmB1YFsZFjtsXR07muNRQ4xHUbYTKKkFwCwVm2+RRMK3fRaLXzW5/OTKHY
	 LMS+ZqClkQ3KXXG6WAqe+tcUrbXR7NGT/LYcy66rU5JCuermlP0OIEFOJMlIkfjEpE
	 ieMecHOdX/8+sqKs1/Mr1wzzj10ClT2A3eyzFQqskcjJYWzktADgozXIGYn23NZXO0
	 3YCrJGGfLs8IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260715-imx-se-if-v27-2-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-2-bb7c45952f06@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:27:25 +0000
Message-Id: <20260715172726.501CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string 'fsl,imx95-se-ele-hsm' is excluded from th=
e memory-region conditional constraints, which improperly forbids its use.
--

--- Patch [2]: [PATCH v27 2/7] dt-bindings: arm: fsl: add imx-se-fw binding=
 doc ---
commit a8dcc722ea68fab4850086d156b064a9fe58a7b9
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

dt-bindings: arm: fsl: add imx-se-fw binding doc

This commit adds a new device tree binding document for NXP's hardware
secure enclave IP, such as EdgeLock Enclave and V2X. It establishes the
messaging unit interface used for communication between the application core
and the enclave firmware on processors like i.MX8ULP, i.MX93, and i.MX95.

> diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b=
/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
> new file mode 100644
> index 0000000000000..fa81adbf9b80d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
[ ... ]
> +allOf:
> +  # memory-region
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-se-ele-hsm
> +              - fsl,imx93-se-ele-hsm
> +    then:
> +      required:
> +        - memory-region
> +    else:
> +      properties:
> +        memory-region: false

[Severity: Medium]
Does this conditional block improperly forbid the memory-region property for
the fsl,imx95-se-ele-hsm compatible string? Because fsl,imx95-se-ele-hsm is
omitted from the enum in the if clause, the else clause is evaluated and
forces memory-region to be false. If an i.MX95 device tree includes the
memory-region property, it will fail schema validation.

[ ... ]
> +examples:
> +  - |
> +    secure-enclave {
> +      compatible =3D "fsl,imx95-se-ele-hsm";
> +      mboxes =3D <&ele_mu0 0 0>, <&ele_mu0 1 0>;
> +      mbox-names =3D "tx", "rx";
> +    };
> +...

[Severity: Medium]
Does this example mask the omitted memory-region conditional above? The
example relies on fsl,imx95-se-ele-hsm to bypass the memory-region
requirement, which allows a potentially incomplete hardware description to
silently pass the dt_binding_check tool.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-se-if-=
v27-0-bb7c45952f06@nxp.com?part=3D2
