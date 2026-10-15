Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96A35B657;
	Thu, 15 Oct 2026 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075777; cv=none; b=m9RUu/dbU900ZyV3ZXHjCq/ZZ5FPwsPd8he9hEC15tCfbwnDpBmBcuLtIz5XQw9uWDbsN9bK/X2PISHkhXiMa240NelBZVAPn1lIcgUO5NzV/MDAayqfPrB1Iq1dWIekx4jfLsLBidUy4EcXTwktNmJGn9XTW2m5Ef86uxe9mZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075777; c=relaxed/simple;
	bh=4spVMkFgVYjmLJANVFncw2j/6pf3ftTyNatFPPzON80=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ooGonYYHn04zvRYJCpHHSmuZe/JxxKfBtLgcn6svz0qlwjXtcpJ+daWSJCE0l4JrObatTvQYqjGZFfEOhGN9Ws6Fip+/Y3xLUenUm940v9cm43MAO2HzKpm4bWbRlUSS63BCZ1X+dqvZLAFLgI+cuhAmSk0L8dv+YravtEeODkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjyYYRcP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjyYYRcP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809F91F000C4;
	Thu, 15 Oct 2026 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075775;
	bh=lEge8ljtpcuR7TuB3i+gROEvBcKUdmwuZAuN6R6a45g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZjyYYRcP2CpscCtdUlAOwOvNn1E7M4Hty9v3eSvFpzNHEXZwhcrFgSTrYMd8nF8sU
	 iPLX5IIn6yxsKgw0F6GMLFi1KyeFEWddwUSKV6i1veU48+69AlpvKI9bvgm2dVhHE+
	 2OldiHzPkW8vjI4cNjnipFpP+4RJm+E/oqKcPUCxSMjLLDj01aWTRzrjyby4mG0MDG
	 B7TbG9okqkC20PzWqXEs5v9ymMqbmQ4ayWcyMMqRDV8oMsoznzhoizaND/8aZpM/WV
	 7g15kTpnBRndrfazDSPK68uDC69vioGIFjGwK1H9uzgCzm2XWLIzGlXhYpGqp3eoQm
	 /aHq/WFWQGA2Q==
Message-ID: <sashiko-outbox-172996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-1-abc358b39a96@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:49:34 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: imx-rproc: strict regex rejects valid memory-region-na=
mes
--

commit 6408464abda5d8740cc2d4f521608bce19b964e6
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid h=
idden ABI
   =20
Document the optional memory-region-names property explicitly to identify t=
he=20
expected memory regions. This avoids relying on memory node names as a hidd=
en=20
DT ABI, which previously allowed incorrect names to silently pass validatio=
n.
   =20
Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabl=
adev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3=
adc24d9db6d30c973f37b580f6f1f9 [2]

> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b648890..f87036299a7b6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,15 @@ properties:
>      minItems: 1
>      maxItems: 32
> =20
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      anyOf:
> +        - const: rsc-table
> +        - pattern: "^vdev[0-9]+(buffer|vring[0-9]+)$"
> +        - pattern: "^m(4|7|33)-reserved(-[a-z0-9-]+)+$"

[Severity: Low]
Does this regular expression structurally exclude the valid base names
themselves?

Because of the + quantifier at the end of the pattern, it requires at least
one suffix. If a device tree author attempts to add memory-region-names =3D
"m7-reserved" to match an existing node label like m7_reserved (e.g., in
imx95-19x19-evk.dts), dtbs_check will throw a validation error.

Should the + be changed to * to allow "m4-reserved", "m7-reserved", and
"m33-reserved" without requiring a suffix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-memory-reg=
ion-name-v5-0-abc358b39a96@nxp.com?part=3D1
