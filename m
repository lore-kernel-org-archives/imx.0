Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833333AE199
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863773; cv=none; b=kJMGm1jD1Kth2SYCsLMqm/gDKQ8OyzsDmZObESN8Mtn9dFqJzr8DLRYrxpGk/xLDAT5VqiJVtsB0Kcv2ZQ1NYEkkyT9hTEift/Aou8kWeHNkDPVdIC+exdJfql06nJ2U2O7gBBaF3trqijWsXsLBT7NNrVY/nHE/jnDwlPJU8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863773; c=relaxed/simple;
	bh=cHTQTfjY38ajqDpKlQPzx1a/SbLW31wNcQubVmbgm/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JQ+R6adsnMB1Ccxltik6Dq0oS+LEjmi7VINgo/7c+z7zcCjeFTl8hIK8805GEJKMTCR2YRn1Ha0kXCU4SrpSPaMcgE74K5CWR+ho/A+TwJsoAX/GhiDOEjdpSyBk2q55czVYuPrAE/GPlaI0zeK+dubkrWe9rl9VrB9Ysup2uWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4KU8Wi8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4KU8Wi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B0E1F000E9;
	Thu, 27 Aug 2026 20:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787863772;
	bh=GQHDf7Leci/wziR+1R6GR+v1dX3hZsMv0/iI0ZR7KbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4KU8Wi8Ce2TNdg9ftPorvipGtChKNpJPP7UPEqyZ3pnjGg9tBz5gxV5t6kwk0RmZ
	 1EUSj+6Q5H4nMYXZci7VDu6sdN1tCc35RnrYSdoRcWP/6zyVgi83xN6cQXcHI7Km56
	 igGJcTcQ8gGMB3JOsQSBA/P97Ol3Qlets3Ca80G2c7LjGS1UlSFUvIY2VcCptoaG5s
	 sxO5cnlridwwRSerNjnhPtyhIqdPHEtnE5kqFwhfqniCJKqGqX6I71Ymtfkc7kVJM/
	 WTnyL4MmrQj1IiEnrKNDjKEGz4TyXjuW5ez+9eCQJ1RotO45Lj9+OVsu1cNeDyqZ1Y
	 3PyIEomm4ykkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spinand: add support for ISSI SPI NAND flash
Reply-To: sashiko-reviews@lists.linux.dev
To: han.xu@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Michael
 Walle" <mwalle@kernel.org>
In-Reply-To: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
References: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 20:49:31 +0000
Message-Id: <20260827204931.79B0E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The model name string for the IS37/38SML04G8B chip is missing th=
e 'B' suffix.
--

commit 867e3767a2e52431d703ca0fa7e8144775792a0a
Author: Bill Lee <blee@issi.com>

mtd: spinand: add support for ISSI SPI NAND flash

This commit adds a new manufacturer driver for ISSI SPI NAND devices. It
provides support for four 1Gb-4Gb chip models with different voltages and
stacking configurations.

Link: https://patch.msgid.link/20260825-spinand_issi-v1-1-d81bdd7c212d@nxp.=
com

> diff --git a/drivers/mtd/nand/spi/issi.c b/drivers/mtd/nand/spi/issi.c
> new file mode 100644
> index 0000000000000..122b3a6e2f62e
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/issi.c

[ ... ]

> +static const struct spinand_info issi_spinand_table[] =3D {

[ ... ]

> +	/* IS37/38SML04G8B 4Gb 3.3V */
> +	SPINAND_INFO("IS37/38SML04G8",

[Severity: Medium]
Is the model name missing the 'B' suffix here?

The inline comment right above this line and the commit message indicate the
model is IS37/38SML04G8B, and other chips in this table correctly include
the suffix.

Could this mismatch between the code and the intended hardware name break
userspace tools or udev rules that rely on exact MTD model string matching?

> +		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x34),
> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 2),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-spinand_is=
si-v2-1-88e04b19f4fa@nxp.com?part=3D1
