Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642941B6D1A;
	Wed, 13 May 2026 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714567; cv=none; b=gdkxDb3uj5j7i0flVq6XOR6HhCLoCfbyeN54aZX9Yvd+/4BQVRkTWmfrZkwev+K/6tOjwBQ6HUYuAPLMtvS6q4XQiY0Ivk/pfgYnjcqLjM0Q3OTfkBuodahou6MdvNcxQHE9pamSiYNX3WpvmYpHLhZY03nf98bfiWQyG0gmG5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714567; c=relaxed/simple;
	bh=nbeqCQwL0XFlrsprc/J6YxTdFUsm4Dz6Da5SclSo9bM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ri1L4tiKqzKCyJOGsI1aKbidOeUNT+B2scJ+nJiadnzvelwoww2yksbbMBt9vvEHV7GOGB287CNGwy4mwg20HOSzWx70dO2HVbNbN/yXtiZIKujDlb4yPluAPtP/1725bDSqLrMTNkuT+BqIb/IT+2f9D3KvAGGSeNdt9DWBEws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA5zYvqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA5zYvqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98BDC19425;
	Wed, 13 May 2026 23:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714567;
	bh=nbeqCQwL0XFlrsprc/J6YxTdFUsm4Dz6Da5SclSo9bM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JA5zYvqToL1DBK1x1cTcPDqTONfq6rp+/jsh26Rab21AKX3HB1vG6Qa4I9GGIWYUG
	 jHoAUxBkGujat5l6b1DwsS4k2/91x55o85O5k6wHpYkhxgebe9FEgTBVGAxJfGIuFC
	 S0uN82/7zpaDI5jg3wIeMwqrZ9wr2y99UCo5BtuEhva+ZMfQ5H5yeiOgbxjSgoLEJc
	 JrnwgWyaiok5ypgCQLDyxl2eLyLU4hmSX/Uo89VmonmD7Ck4g24pVMi36pNkoZkmZm
	 5wXntZzJcb9yrxaA1K707OI1Vac8bOZ2bCC0u6d4YkrfDqpug6NGy6l6GpgH46YgMr
	 yWatsuOeSubdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/10] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: Frank.Li@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512-lx2160-pci-v6-10-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-10-d0ff72d3c983@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:22:46 +0000
Message-Id: <20260513232246.B98BDC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused USB port left enabled despite the board only having a single=
 port.
--

commit f3287c94b8a1489521dd5dfc2f4009ec55b9a33c
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: Add support for LX2160 Twins board in single configuration

This commit adds device tree support for the SolidRun LX2160A Twins board
in a single CPU configuration. It defines the various hardware interfaces
available on the board.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/a=
rch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
> new file mode 100644
> index 0000000000000..ee1867f5b2b6b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
> @@ -0,0 +1,826 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Device Tree file for single LX2160A CEX-7 on Twins board.
> +//
> +// Copyright 2022 SolidRun Ltd.
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +
> +#include "fsl-lx2160a-rev2.dtsi"
> +#include "fsl-lx2160a-cex7.dtsi"

The commit message states the configuration features a "USB-3.0 front-panel
header with single port", and no other USB ports are listed.

Since the included fsl-lx2160a-cex7.dtsi unconditionally sets the status to
"okay" for both usb0 and usb1, does this regression leave the non-existent
second USB port enabled?

Should this board-specific device tree explicitly disable the unused port,
perhaps by adding &usb1 { status =3D "disabled"; }; ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-lx2160-pci=
-v6-0-d0ff72d3c983@solid-run.com?part=3D10
