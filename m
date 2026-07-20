Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098033D333D;
	Mon, 20 Jul 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542616; cv=none; b=EX3zHjasPSAc9w3gTezSuaScslVwb93PwNY7lwANgtaIAKyBWwIQBWBjPEhLivhRBTWZ0V9Ov/u0+cK24NAsFC5T5gEif9r9GMukaFImnbbxdx8HOVQp0z0yUveAJlFDpVOCxjYDYktFbNk/zTkU+sgW1YSA3h9gNpOj3HBV94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542616; c=relaxed/simple;
	bh=gWTijb0RecfMlB/ZHA9hvNBNgdJ+6IUSbKp7GKGc6Z8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PIKHGM0dBu+MtxaxfJmR/uTIkgN6Ar9YhmkMzNW4X8IviG9xx0RP3u6FW7eqvOmAWh/si7DlBpXye7wXxvQbxueNTs0zDtX6zJ++vhwS64WQ5fKzv5uH5OEFWoOY8SwL5x9+2Pgt6UBL9lKzQlH4hkLh9W0bl+QaJ4G3SvbnC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAl7K+rE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAl7K+rE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A46A1F000E9;
	Mon, 20 Jul 2026 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542614;
	bh=Sp+tlnbmDrwaYMDLUUQ373DtpEEqscLBZSsPx9h9BpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GAl7K+rE/djdUV1imPnc7Q+VRydTG9t6yE2LivJumvaqTJ1CISU6lj1HW1Wm+mwb0
	 cznWX6d1QSEeeqgvZCpe4crN4WhoaF4oeKJduwkSlIytHseCRqu+JDqLjpEloz/mNu
	 HstLryTjU95TgYEH+JReh+Awl7ADdbq9z+i1sIb8wlJYa246+eoAje7wq22sC+kYTa
	 v+b4O2NgLkAfT4Bwt5jfhIGTk5zC6ON0WjFAOC30qhU7TdS3M/XODWqeEh7JSKL72q
	 6Mn+DckyomdKcyZ7cRhDFGe0NVcFeyWSbB7QpZSp2wZXk1ttyU8NF+5tJ5909n1lZy
	 bqqjgqv0qhBtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: sound: fsl,easrc: add ports binding
 for multiple contexts
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260720095450.1618747-3-shengjiu.wang@oss.nxp.com>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-3-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:16:52 +0000
Message-Id: <20260720101654.3A46A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema fails to restrict the `ports` container to the 4 support=
ed contexts (ports 0-3), allowing invalid extraneous ports to silently pass=
 validation.
--

--- Patch [2]: [PATCH 2/4] dt-bindings: sound: fsl,easrc: add ports binding=
 for multiple contexts ---
commit 0461b121d300fd40233634f4b977c32906d647ce
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

dt-bindings: sound: fsl,easrc: add ports binding for multiple contexts

The i.MX EASRC hardware supports up to four conversion contexts
(A, B, C, D). Add a ports container property to the binding to allow
each context to be represented as an individual audio-graph port.

> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,easrc.yaml
> index d5727f8bfb0b5..0f579870110d9 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -55,6 +55,29 @@ properties:
>        - const: imx/easrc/easrc-imx8mn.bin
>      description: The coefficient table for the filters
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +        description: port for context A

[Severity: Low]
Is this ports container missing a constraint to reject unsupported unit
addresses?

Since the inherited graph.yaml schema permits any port@.*, a device tree
defining port@4 or higher will currently pass dt-validate without an error,
even though the hardware only supports 4 contexts.=20

Would adding patternProperties: "^port@[0-3]$" or unevaluatedProperties: fa=
lse
to the ports block help catch invalid device tree configurations?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720095450.1618=
747-1-shengjiu.wang@oss.nxp.com?part=3D2
