Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032AE480955;
	Thu, 13 Aug 2026 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630438; cv=none; b=rGT9I4WJwEA8qfpKLbXW7ySMoapPzofMZJw4T/ZIs9c1MoZl1E4O2SJqmKi7EuiCPbu84FN6mEBWdoA+ojhQpuV5dn2fJhuKk/OtAEX0S3y/gM5Hos0sJoU0wV53ioC4WzkgLzW2WRAYN2oSndOgMIhxYyzveBLiQNu1+hCBp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630438; c=relaxed/simple;
	bh=Eu/Wc8Z8YklXfcOwVUMafJhK6o32zLtJq1abNAJMx54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lUc0PGDLHEevGRMGP2P+afj78nHaPG+OFHWgwRrmIx+k0m1R4222qX8qsYsHEC/ZT8zRUrhJClT42SYAiDmOOFLyGOf1rv9KnZh6KPGh771X6MbGBf6GNf7mp7oTECj+8zKGZgYthcAlr/WLtVgf4V++bo8phb8nZwqXi+zIlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAb+ysex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAb+ysex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1221D1F000E9;
	Thu, 13 Aug 2026 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630436;
	bh=NZNoADXhFw+9O9IxP2fTYV1zJAmNyfefsNizDKMPUwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bAb+ysex1v5Z4WfrH19je176j+ZIKKuMc07D8HKpoWJoYQy+o69jutfPwW/ZuhsTO
	 iIJiSOKCI89sEGV++ort5DlfDhsYt8CZQLDYl/lCvIr9SI09tPzzzlR2RcEbTIq3nZ
	 AvP0tlEGbX8Qz87+1+JEzPILDs/3viqOvVDcx2R82n8/ERGo3OcIeFe6U8KobdWWlG
	 NBZIHFKT0IlZFhoqJor0KaaaELCW84voUM9+cztSXRD1lXRZThiVerLhTJ7oDCxweo
	 d0avBtgnHY36KIS64nfe2W+kFEdXQChr5kzhc0MAYK5XUrMGrEt68bpuP1Rrb6wE5e
	 ztLAU28ej23ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and
 VF61 on Iris
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260813140600.1824949-4-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
 <20260813140600.1824949-4-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:13:55 +0000
Message-Id: <20260813141356.1221D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inconsistent compatible string naming due to mismatched hyphen.
--

--- Patch [3]: [PATCH v3 3/4] dt-bindings: arm: fsl: add the Colibri VF50 a=
nd VF61 on Iris ---
commit 04c8812c4587059c616ac3a5abaa28f6f14d974a
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris

This commit extends the evaluation board entries to include compatible
strings for the Toradex Colibri VF50 and VF61 modules on the Iris carrier
board.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 86876311ec59a..6f95c17b363c0 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1705,9 +1705,11 @@ properties:
>                - fsl,vf610
>                - fsl,vf610m4
> =20
> -      - description: Toradex Colibri VF50 Module on Colibri Evaluation B=
oard
> +      - description: Toradex Colibri VF50 Module on a carrier board
>          items:
> -          - const: toradex,vf500-colibri_vf50-on-eval
> +          - enum:
> +              - toradex,vf500-colibri_vf50-on-eval
> +              - toradex,vf500-colibri-vf50-on-iris

[Severity: Low]
This isn't a bug, but should this compatible string use an underscore for
colibri_vf50 to match the base module name?

The new string uses a hyphen, whereas the existing eval board compatible
uses toradex,vf500-colibri_vf50-on-eval. Could this inconsistency cause
confusion when parsing or authoring device trees?

>            - const: toradex,vf500-colibri_vf50
>            - const: fsl,vf500

[ ... ]

> -      - description: Toradex Colibri VF61 Module on Colibri Evaluation B=
oard
> +      - description: Toradex Colibri VF61 Module on a carrier board
>          items:
> -          - const: toradex,vf610-colibri_vf61-on-eval
> +          - enum:
> +              - toradex,vf610-colibri_vf61-on-eval
> +              - toradex,vf610-colibri-vf61-on-iris

[Severity: Low]
Does this compatible string also have a mismatched hyphen instead of an
underscore for the colibri_vf61 base module?

Like the VF50 entry above, maintaining the exact base module string as a
prefix would stay consistent with toradex,vf610-colibri_vf61-on-eval.

>            - const: toradex,vf610-colibri_vf61
>            - const: fsl,vf610

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813140600.1824=
949-1-mehmet.fide@gmail.com?part=3D3
