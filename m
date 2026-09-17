Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE2D54706C;
	Thu, 17 Sep 2026 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669698; cv=none; b=MTRwGS1uFpGx9YN8HNHjP8vrw+MF6TplAyp64nK3UK/sHyyoxWHId6sYm5cEQHjpbYXvtasSCy/iopuwXjByEF9FhAbuXyqNH0KYkdiDCft7bqURXucoXAnFFMiARJ7M5n/D/gcESnyBwl2LegGhodRwQxhIlHTxKv0BPDbKTTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669698; c=relaxed/simple;
	bh=vD/6obX4z8T11JfWnL4Ez3TMEKuYjgi7crLualh9NO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FbbjSNoyeqUMbS1yGjIYFltTrO39wZewqEspWHjF0uecabYd+VqLEfqOfNeSjwtw32Rlxzkximci67Gh7kFfpsKjhhjHHExX+6UBVubHTbP7eIt8g/75pna7qU27QFdi07TXDLAUzJEmBjr7Wqeu1QpmVRvPKf7JqleRtdes5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ds4XMj1b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ds4XMj1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5C91F00893;
	Thu, 17 Sep 2026 18:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789669697;
	bh=er8IzFh4qYngJOikftaCey83vRaiXpjWUL2rZuG9EO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ds4XMj1bv/2YM2gO4TTWMdxHCMlNx9jOxzIPMc5WrFFQTxAKcuxhcQv4nCctbA9r+
	 3LKJcgMY+7NcfVsBF4rkWeGhjPMl5nOfiKaHEmEi4RbJGUKk7CR05NADynkRMZhPWb
	 1ywahBepfx5KPApsEw4dnoWvpU0ei7Rzhi6VKEONN/iDML5I9XU5jy6B9sFnSrsLyq
	 30PyhA2hy/taLG3ZnCxQJXLymvAUN2gGYT7e5GPB9qazaYlxtd17gXlKxUIOpjkYKh
	 V/Sj+aXOzdr+vP4Ma2TLyayndisQavVBkeobfGmatJc4MnZ8OoCPzORF7QIgmnaSh9
	 qjuwK+G26Rw5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-memory-region-name-v4-1-260755920ebf@nxp.com>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
 <20260917-memory-region-name-v4-1-260755920ebf@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 18:28:16 +0000
Message-Id: <20260917182816.CB5C91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: erroneous regex pattern allows invalid region names
--

commit 3fcb4e5cb8e128ab899161b1bbe809e6627ba8ca
Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid h=
idden ABI

This commit documents the optional memory-region-names property for the i.MX
remoteproc driver. It explicitly identifies expected memory regions to avoid
relying on memory node names as a hidden ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabl=
adev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3=
adc24d9db6d30c973f37b580f6f1f9 [2]

> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b648890..5d98d21035f8c 100644
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
> +        - pattern: "^vdev[0-9]+(buffer|vring[0-9])+$"

[Severity: Low]
Does this regex pattern correctly validate the memory region names?

By applying the + quantifier to the capture group (buffer|vring[0-9]) rather
than the digit class [0-9], this allows repeated suffixes like
vdev0bufferbuffer or vdev0vring0vring1 to pass schema validation.

It also restricts the vring index to a single digit, so vdev0vring10 would =
fail.

Should the + be moved to the digit class, such as
"^vdev[0-9]+(buffer|vring[0-9]+)$"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-memory-reg=
ion-name-v4-0-260755920ebf@nxp.com?part=3D1
