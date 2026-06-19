Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EDC3B7B91;
	Fri, 19 Jun 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884407; cv=none; b=A9/NC41/CJH3AZdNgWiUfX+Abdjgw458izG25+Dv06nwae3BckU4lqGzUIGtM0kS7Ajsx7oBeLEDtL5zaft5DpG0EGDzvnqbkej3UGME30CQ4+qLIKZvv65dM4tdayM/yWskaOVr7hMJ0rhpcka/+M+tFHhHoEEQyFR6KS2YamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884407; c=relaxed/simple;
	bh=Zj0RmC3oEHi+GRckBhaKlSuyW7YMCOd7Na9XTmipi6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEDXYSVcLvGENatSqUNNWhA9hfEc/gl2bl+0b4kTi/Yx0LH+PQrRR0NKdZV55Po0Q1nqGq5SxOQbpbReKc7VOVSZMs9ZSLF6TdJMaBXWFuZ0xtsQmQc3nsPPemCsBzIKCH5Yk2P/typq+M7HlUPMh+MwtMNWjpwIdAAZWOQF5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4mL0eRA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4mL0eRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406721F000E9;
	Fri, 19 Jun 2026 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884402;
	bh=Zj0RmC3oEHi+GRckBhaKlSuyW7YMCOd7Na9XTmipi6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F4mL0eRAEZVA+K/ksTQdqCpcWVeM0etV1B+nBqTV0+vyeN+/39yDUGICigBHzMbiB
	 nEW4wYMRzVbO+uLCkHn15WpsSw2mt2j/c9exX1Q88QVpmxYzBnQSjMSb1waiNHFq90
	 DUIkoKTq+6UltjRvePYFFFGqJ01vODgME/t8k585ryrL9jSwyWNyNfC5UlYN8APKGY
	 kJJMaRq67W07QAROfMINOhfELz7saBoOaQB6L9OT8xMYbZQQ6E35cqzRjayvtyCNUq
	 eaGVJm4owzCMsXAKHVXf5Ap/GvX5I94ahHnUiECf7P/puRPkr/3pgreWBwamqD2hZ1
	 elITjzhb40T/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] ARM: configs: lpc*: Remove NOMMU platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-9-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-9-0101795a2662@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:53:21 +0000
Message-Id: <20260619155322.406721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit message incorrectly categorizes LPC32xx as a NOMMU plat=
form, using this false premise to justify deleting its defconfig and suppor=
t.
--

commit dd95b6d6b05d88a43de62ac58a8d3da5f10168ac
Author: Frank Li <Frank.Li@nxp.com>

ARM: configs: lpc*: Remove NOMMU platform support

This commit removes the lpc18xx and lpc32xx default configurations,
justifying the removal by stating that commercial users of these NOMMU
platforms have migrated to RTOS solutions.

> Commercial users and hardware vendors migrated to Zephyr or other RTOS
> solutions years ago, leaving the NOMMU platform support effectively
> unused and unmaintained.

[ ... ]

> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32x=
x_defconfig
> deleted file mode 100644
> index b9e2e603cd95e..0000000000000
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ /dev/null
> @@ -1,192 +0,0 @@
> -CONFIG_SYSVIPC=3Dy
[ ... ]
> -CONFIG_EXPERT=3Dy
> -# CONFIG_ARCH_MULTI_V7 is not set
> -CONFIG_ARCH_LPC32XX=3Dy

[Severity: High]
Is the commit message description accurate for LPC32xx?

While LPC18xx is a NOMMU platform, LPC32xx is based on the ARM926EJ-S
processor which features a Memory Management Unit (MMU) and runs standard
Linux rather than an RTOS.

Unlike lpc18xx_defconfig which explicitly unsets CONFIG_MMU, this
configuration leaves CONFIG_MMU enabled by default and relies on standard
Linux features like CONFIG_SYSVIPC.

Could removing an MMU-capable platform under the assumption that it is a
deprecated NOMMU target bypass the proper evaluation process for standard
Linux platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-dts_cleanu=
p_arm_mcore-v1-0-0101795a2662@nxp.com?part=3D9
