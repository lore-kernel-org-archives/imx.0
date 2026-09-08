Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969358122C;
	Tue,  8 Sep 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882907; cv=none; b=pKmzZScncu78tWc6eYtVFFvvsKgA1nNUqzyciNVROcwrSixqe5FqMp2wJPpqk+xXo3No+KfoRu8+ZRvbKuX95dzbZm79tnCgOnDK//oy6WNEYboQ9aQqewWFcLG809kg1cXIxcv2gNBzgtJckzuxhYdbmScMrK7fLq8daUUJlSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882907; c=relaxed/simple;
	bh=SgnCuNwc+3GCof8/NsDV6WJB1NwToaiQ1FMvFg4IKK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XD8BWefJ+ECqaJbVVKi24qtCeLA6sKZs4CjW+OlPBglYiUvKWLFDlM1Zn9PcH/62lScGCVVCLPUjvKX7NvLmK+9n+9SvhgjOb0NN1gPvT5hQqQeGWn1TT7lVsXgUfB9gBve41rEWQ5ImATgZQdLSciq474SCjPCltINJ+VxU0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PamJfJNv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PamJfJNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966341F00A3D;
	Tue,  8 Sep 2026 15:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882905;
	bh=2s131jBymw0wPeIWZySb38FrYNgx82DJAJxH+RDhYQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PamJfJNv+N9v254qbNF8e4vwgpv/L1KtEcN1GG4vVRNCOnHZSwIj+R+uPIU592jm3
	 bSlCh2+e70wq/prhszk1WWF/e6twS+0kU4vZYL2jp/IO1wgn0gpsDemtTi5cHsc8lh
	 rVeH1MhflQUTX38TMKXVU1uG9YX9jHp6bBbcJOYl8hvax9AjziCCf3nsrN0NRftdIF
	 DkMj9clsFPav9hwKiagUPQVPioVgkxDuhQVk152dS/xgtt0HzadFdJcjUnFW/2yrOF
	 5VWmrXGWxyuZMMqyEnOyUyI2vit0MyKdjKkaUqaTHs7SAlSzzFkQDlQoPN7HFt2sKd
	 m+DV+OKk+MS2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/13] ARM: axxia: remove entire platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260908152808.3928630-14-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-14-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:55:04 +0000
Message-Id: <20260908155504.966341F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit removes the `ARCH_AXXIA` configuration but fails to r=
emove the associated peripheral drivers, device tree bindings, and Kconfig =
dependencies. This leaves orphaned code and violates Kconfig rules by refer=
encing a non-existent symbol.
--

commit 5209c3e860d6603a7c70267ff59ac71d1c1c4f84
Author: Arnd Bergmann <arnd@arndb.de>

ARM: axxia: remove entire platform

The initial Axxia port was contributed by LSI in 2014, but never completed
after the sale of the business unit to Intel. This commit removes the
Axxia platform now that the 7.3LTS release is out.

[ ... ]

> diff --git a/arch/arm/mach-axxia/Kconfig b/arch/arm/mach-axxia/Kconfig
> deleted file mode 100644
> index f773a66c14028..0000000000000
> --- a/arch/arm/mach-axxia/Kconfig
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -config ARCH_AXXIA

[Severity: Medium]
Does removing ARCH_AXXIA here leave orphaned dependencies and dead code
elsewhere in the tree?

According to the Kconfig subsystem guidelines, referencing a non-existent
config symbol causes silent configuration failures.

For example, POWER_RESET_AXXIA in drivers/power/reset/Kconfig (line 51)
still has 'depends on ARCH_AXXIA', turning the axxia-reset driver in
drivers/power/reset/axxia-reset.c into dead code.

Similarly, I2C_AXXIA in drivers/i2c/busses/Kconfig (line 461) has
'depends on ARCH_AXXIA || COMPILE_TEST' and 'default ARCH_AXXIA', leaving
drivers/i2c/busses/i2c-axxia.c as a leftover platform driver.

Furthermore, drivers/clk/Makefile (line 61) still contains the impossible
build rule 'obj-$(CONFIG_ARCH_AXXIA) +=3D clk-axm5516.o', making
clk-axm5516.c dead code.

There are also orphaned dt-bindings, such as
Documentation/devicetree/bindings/i2c/lsi,api2c.yaml and
include/dt-bindings/clock/lsi,axm5516-clks.h, left behind since all Axxia
device trees were deleted.

Should these associated peripheral drivers, bindings, and Kconfig entries
be removed in this patch or a series alongside the architecture removal?

> -	bool "LSI Axxia platforms (DEPRECATED)"

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D13
