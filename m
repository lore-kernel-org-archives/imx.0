Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B227835836B;
	Mon,  6 Jul 2026 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375465; cv=none; b=DiQLav2va6J333ea32LCa7frqS1KPlILWBcu1oWg3gRVYbK6SdY75Lb8akT+wCGJ6mNtr9fc5dirchpi31nTMXVGg2C1RQ4A3fC2i4rzkXaDNTV/jxZqAR1krIHr9fmKXbei4Qq5RLTNjDjai1sy70IBpe1VkH8NmVx8eKsGXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375465; c=relaxed/simple;
	bh=4onJwKnE5CQaUEj+tNQUulsZgCAkphLTDv5KajhsFD4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mjc1zKpGGiUhsWu+w/eJDE+jkpoOVneD/WVUieTtXARVe+FlhTEwbmryu9ETJd3PKKsdHKrE388WLcgGhukyOQ+eNiMZdVrzdbn+k6ewNrkL8ZpoE2s7l1UZYfGJRfU/RefPrh3aaaWFcTVK06JVvDu7DS2w4tUz2Pou6l1BC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7KVjv2G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7KVjv2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CEE1F000E9;
	Mon,  6 Jul 2026 22:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783375464;
	bh=c4MB6edk3cDxXGN87p2A+S2ms5ifyZNAH3jki7fsAe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G7KVjv2G7XHvQCboXX0AbuAWag0MCU0tdGg7q7NLtHuWGcJUgmJqsQW9aUmtH90d+
	 V4ld2DCKPOVYuYFwxSxMbLq7iSr79OgsFbIJXmb3K4Y6SSMLx1oug8m1Iy9UzYiewZ
	 NBXSD+SJF8opkzxAXj0JW0h+vK6BMVX0JrdPXNbJmPd3BMCJVKHi9aKDwekNTS/qn7
	 YPEhwdHNLIvEi3NQnBBLoJk+/w+qdi/8uOZfXFj6WG6AWtBuA4TDvd/Ig+ixOqL9sJ
	 NOHzNzB1QWZAsZ1sEBeOZLbxu59akxW+kg5b37gyDnJi+uscRar+GwHRI0k/STqIhf
	 sUab9co4V3EUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: imx8qm-ss-lsio: add lsio mu6,8,8b
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706-qm_dts-v1-3-14117a48fbdb@nxp.com>
References: <20260706-qm_dts-v1-0-14117a48fbdb@nxp.com>
 <20260706-qm_dts-v1-3-14117a48fbdb@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 22:04:23 +0000
Message-Id: <20260706220423.D0CEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant re-declaration of the `lsio_mu6` node and label.
--

--- Patch [3]: [PATCH 3/4] arm64: dts: imx8qm-ss-lsio: add lsio mu6,8,8b ---
commit e95e394180e13045095ad2b094d537158b113f5c
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8qm-ss-lsio: add lsio mu6,8,8b

This commit adds mu6, 8, and 8b mailbox nodes to the imx8qm-ss-lsio
device tree.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
> index b483134f84d18..fb503c93447d1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi
> @@ -3,6 +3,35 @@
>   * Copyright 2019-2020 NXP
>   *	Dong Aisheng <aisheng.dong@nxp.com>
>   */
> +&lsio_subsys {
> +	lsio_mu6: mailbox@5d210000 {
> +		compatible =3D "fsl,imx8qm-mu", "fsl,imx6sx-mu";
> +		reg =3D <0x5d210000 0x10000>;
> +		interrupts =3D <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +		#mbox-cells =3D <2>;
> +		power-domains =3D <&pd IMX_SC_R_MU_6A>;
> +	};

[Severity: Low]
Is this full node definition for lsio_mu6 redundant?

The properties defined here, such as reg, interrupts, #mbox-cells, and
power-domains, appear to already be inherited from the base imx8-ss-lsio.dt=
si
file. Furthermore, the QM-specific compatibles are already applied via a
reference at the bottom of this file.

Could this block be safely omitted to avoid duplication? As it currently
stands, it also does not override the status =3D "disabled" property from t=
he
base file, which might mean the mailbox is still left disabled.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-qm_dts-v1-=
0-14117a48fbdb@nxp.com?part=3D3
