Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A639934D;
	Fri, 19 Jun 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884543; cv=none; b=VbSaG0zn5xvmVyn+BLc6u7e274MWTLZyQoB6ylD/pbWwhXx0KtGFaXKieHKYvlR0rBQ169mnWd5PqbGOqwb+LPO+H3lySyU4s2eMWrJPcnu8XceeSQawsy1GzvX2hR91GkPIMi2vV2mzzWEDr74GgQQfPQD/BKDCJrrIf5vNvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884543; c=relaxed/simple;
	bh=09XM//ko9qQ68FvkFCIO8wFb0cfDiuDZqvWapQH/FtM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o+WZNVffjoKNWSwskbbC26LO1tqygQXTXO0tnMCSw3+KjJuCfOt0kvVmqUUXgeIxBjE0s3YmCSUwZOYHMZ7BuT97cYjg+o2eAF3DapmNn16y8sJsSiY/IKdjWwle0Y3jIR0zP6ZvfkYiNM1aJCmapfKGcxGSJu9uvph3yK9XyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhEk4g+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhEk4g+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F1C1F000E9;
	Fri, 19 Jun 2026 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884534;
	bh=tL3OYg4ciX8Aad37XNIL/yV8/LwaHktx7C07vrZfFzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PhEk4g+7DuFlKoHOYbyAyTMoQukl9wQ/5/7hCL/Ep3FqLibYBYaCEgnaGikA5iYwX
	 zCn1rIoqwR5aU/0EgSx9r9OqL8BEQrTxYj0K15YrOXtBa9ifW0uLZ/TzoM1HfLZ2TN
	 hbe7cHD3YKpZ3wt7i31JFuI8Q54cwPsQA+dRgWN/bkP/wOuX3VtYiv+1D0aZTCWqAB
	 YM6BxDlhM7E8Gz6EHsoq1DMkJP3QBFxd5OqKz4Brh8TxL04aLkFU8DmCt49cfdJqz9
	 Vzw+EZ56V1B4MDt/NwimMwN3O7OoOgnHbQN5StZbI26JIXnC8HQr6/Je8ErIJvUphB
	 OOT07Cz9iyp2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] ARM: imxrt_defconfig: Remove NOMMU platform
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-6-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-6-0101795a2662@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:55:33 +0000
Message-Id: <20260619155534.34F1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Leftover references, platform-specific structures, compatible st=
rings, and early console declarations for the removed i.MXRT and VF610M4 pl=
atforms remain in multiple drivers and DT bindings.
- [Low] Deleted clock dt-binding header is still included in the `imxrt1050=
-clock.yaml` dt-binding YAML example, breaking `dt_binding_check`.
--

commit 3968f192513e74f4358aed03401b5e2ab20e266b
Author: Frank Li <Frank.Li@nxp.com>

ARM: imxrt_defconfig: Remove NOMMU platform support

Commercial users and hardware vendors migrated to Zephyr or other RTOS
solutions years ago, leaving the NOMMU platform support effectively
unused and unmaintained.

> Remove the obsolete support to reduce maintenance burden and simplify the
> i.MX platform code.

[Severity: Medium]
Since this series removes the NOMMU platform support for i.MXRT and VF610M4,
should the remaining platform-specific structures and references also be
cleaned up?

There are leftover configurations such as usdhc_imxrt1050_data in
drivers/mmc/host/sdhci-esdhc-imx.c:

    static struct esdhc_soc_data usdhc_imxrt1050_data =3D {

imxrt1050_data in drivers/tty/serial/fsl_lpuart.c:

    static const struct lpuart_soc_data imxrt1050_data =3D {

early console declarations in drivers/tty/serial/fsl_lpuart.c:

    OF_EARLYCON_DECLARE(lpuart32, "fsl,imxrt1050-lpuart", lpuart32_imx_earl=
y_console_setup);

and the fsl,vf610m4 compatibility string in arch/arm/mach-imx/mach-vf610.c:

    "fsl,vf610m4",

Because the core architecture files and Kconfigs are removed, these remnants
become unreachable orphaned dead code.


[Severity: Low]
Does this series also need to update the dt-binding examples?

The deleted include/dt-bindings/clock/imxrt1050-clock.h header is still
included in the Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
example block:

    #include <dt-bindings/clock/imxrt1050-clock.h>

When the dt_binding_check target attempts to preprocess this YAML example,
the C preprocessor fails with a "No such file or directory" error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-dts_cleanu=
p_arm_mcore-v1-0-0101795a2662@nxp.com?part=3D6
