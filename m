Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75162383318;
	Mon, 11 May 2026 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539270; cv=none; b=e2usZYidrk5LDZ8T6xTvPsaqP9Wt1W1QqUIHYc+6yBP6I6o0h1/r03fY+RKm7nuJCpG6VJTZbLQ8+KnQMr7mzltca/3u5fB4eUMnSZkqtEioATyCd/F3bjNpDcg24eY9zlxnfqyHG9iD2ApW1AK8JGq4N5jUq+TPRjmluPmzup4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539270; c=relaxed/simple;
	bh=orNu0czIHXboKdHltckoUe/vBUjBVVRTkChhpnWd8BE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tZCVY8f7co/FzOWiY1FzIHAZe7Rb6GnO0dDQX+AsZpoMQB8CiQZjFbeDwX8wu69XCTOve+3EVksupbu3Xs4jrkca/G0Q0hmLgqQ5NwSuX9lgsA5GXIHCfRzgQhrZErisrFGbe6lnSg6mXKxoczAGXd3iZQLWgjhmsq8S2GQjEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0nWZ/Dv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0nWZ/Dv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0138FC2BCB0;
	Mon, 11 May 2026 22:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778539270;
	bh=orNu0czIHXboKdHltckoUe/vBUjBVVRTkChhpnWd8BE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=f0nWZ/DvSqXwiC+l5YXPfRXwXD70PzwztrwJ+nRaWtfNHWmk7AgXcVDhWmD+EvDu5
	 4D8MECCLGs3vAnyY517iDcl8NjPRCLLai6h9tAOUvwIvGBgsCmErVCGEYI2/erVHNH
	 TyrKwCbj8fKyh/VWTFuu4EDitrfogNUoAuvPPOcSDvi+bJzquChmn/5wys05+SvMoA
	 v1fNbbctebJWqPdLPoRBkyZNEH7LQ9naHhdFn05BA2TVnIsRc5E8m7NyWvgNojNYJh
	 qo0PrfwO7ymTdXKCAbCn9Dq7OeoZeMMw/TpuILAKzq7EGA81jKdjElyLUVKs+9/C1W
	 AJpHeTAERt2zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Reply-To: sashiko@lists.linux.dev
To: "Jiafei Pan" <Jiafei.Pan@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, krzk+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:41:09 +0000
Message-Id: <20260511224110.0138FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using an integer bitmask (`fsl,cpus-mask`) to reference CPU cores =
is a devicetree anti-pattern that breaks PSCI MPIDR resolution.
- [Low] The device tree example uses a non-generic node name `remoteproc-ca=
55-1`.
--

commit 8d7c3b674f34ab921c2ce0607326cdb7b149d310
Author: Jiafei Pan <Jiafei.Pan@nxp.com>

dt-bindings: remoteproc: add imx-rproc-psci

This commit introduces a new devicetree binding "fsl,imx-rproc-psci" for
managing Cortex-A cores as remote processors on i.MX platforms. It uses
PSCI for CPU power management, enabling the cores to run RTOS or bare-metal
applications.

> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-p=
sci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.=
yaml
> new file mode 100644
> index 0000000000000..28d00dbf8bc7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: fsl,imx-rproc-psci
> +
> +  fsl,cpus-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask indicating which CPU cores are assigned to this remote
> +      processor instance. Each bit represents a CPU core, where bit N
> +      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
> +      while 0x6 (0b110) assigns CPU cores 1 and 2.

Should this use a phandle array instead of a logical bitmask? In Devicetree,
relationships between hardware blocks are typically modeled using phandles.

Using a bitmask implies OS-specific logical CPU indexing that may not refle=
ct
hardware topology reliably. If a CPU is intended to run an RTOS, it is
frequently excluded from Linux via status =3D "disabled" or isolated at boo=
t.
This means Linux might not assign it a stable logical ID.

Could this break PSCI MPIDR resolution if the driver attempts to map the
logical ID to a physical MPIDR, but the CPU was isolated and unmapped?

A standard cpus array of phandles (e.g., cpus =3D <&cpu1>;) would allow the
driver to parse the CPU node's reg property directly for the correct MPIDR.

[ ... ]
> +examples:
> +  - |
> +        remoteproc-ca55-1 {

This isn't a bug, but should the node name be generic?

The Devicetree specification recommends node names reflect the primary
function of the device rather than the specific architecture. A standard
generic name like remoteproc (or remoteproc-1 if multiple siblings lack reg
properties) might be more appropriate than remoteproc-ca55-1.

> +            compatible =3D "fsl,imx-rproc-psci";
> +            /* bitmask: 0b10, assign A55 Core 1 */
> +            fsl,cpus-mask =3D <0x2>;
> +            memory-region =3D <&rtos_ca55_reserved>;
> +        };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511023928.3964=
0-1-Jiafei.Pan@nxp.com?part=3D1
