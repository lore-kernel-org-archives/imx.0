Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414573E4C90;
	Tue, 19 May 2026 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179140; cv=none; b=oG9SmbjS3KAx16NEJDYBf9QSQ7e0Wg9r827GsgBU5sK6Lvn/84v/5oC/Gm8Q6ssPAEGeoYJXQofM018pgw0Y9ftCsEGzVuTmNMB5TgDeHF4qCKH8w4lO/JFcE4uP1Lz7GRdVuWxTS85y4TQIXmn98hNdhD6SMf93dWSZGP6UR48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179140; c=relaxed/simple;
	bh=FjISq6mxfC6g8v9fe7aBT18p0Iw8bBN4R+W6jte9KCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b/oTNWBcw+NWN00036GG44os9Fbh3IA9jVcSAUr844UfgUInRXLy79bRr3+rc4A+/uoDEY20ROQ3OP7o2OYCPi7HGle2WGD54+bA4836lNhhSuuuq1HKGh7/sM1f3WGyKJX06Rk+YvazrkuNlVdMTpNJfjvO6ISsLxSJMcWeU50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jT6R/wvX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jT6R/wvX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3040C2BCB3;
	Tue, 19 May 2026 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179140;
	bh=FjISq6mxfC6g8v9fe7aBT18p0Iw8bBN4R+W6jte9KCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jT6R/wvXLlbC2DhySwz7+1OeApTOoMKRM2B+cJjhzIdKOhuQ0Y7ZXIFsvqMjO6QP6
	 ywlJiBDjJ6z2O8wkt5++ziHLW6dk2O+yINXtjxyWm8/6fQRKXyrp92oPrqmyzhSaH5
	 jA4HK/COhkz+xd+Zw+pB8XOU/sC14wCe5KSibVARyI0LDGzdfLGEtvgYkOwpT85FmS
	 xlOrQAcSCZLpePeq8V8CYMoIws9ArnZ3jyrgiMvtkdL/2q4H+lq+4TD0luBy+MG48Z
	 ebxs9/hC1qm5pjSszilkQ699nxdUKt5DwHofteGKR74D9vP5yee3MEGX+kBlzn6cel
	 Dsb8WOVIEWu4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 14/15] net: dsa: netc: add support for the
 standardized counters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518082506.1318236-15-wei.fang@nxp.com>
References: <20260518082506.1318236-15-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:39 +0000
Message-Id: <20260519082539.B3040C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Torn reads of 64-bit hardware statistics counters on 32-bit arch=
itectures
--

commit 9be701cf095ad465b1f7a0429d694425cf05049f
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add support for the standardized counters

This commit adds support for reading RMON, MAC, pause, and control
statistics for the eMAC and pMAC on NXP NETC switch ports. The 64-bit
hardware counters are exposed through standard ethtool APIs.

> diff --git a/include/linux/fsl/netc_global.h b/include/linux/fsl/netc_glo=
bal.h
> index fdecca8c90f0c..5b8ff528d3699 100644
> --- a/include/linux/fsl/netc_global.h
> +++ b/include/linux/fsl/netc_global.h
> @@ -5,6 +5,7 @@
>  #define __NETC_GLOBAL_H
> =20
>  #include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>

[ ... ]

> +static inline u64 netc_read64(void __iomem *reg)
> +{
> +	return ioread64(reg);
> +}

Can this cause torn reads on 32-bit architectures?

Since linux/io-64-nonatomic-lo-hi.h is included, ioread64() will fall back
to ioread64_lo_hi() on 32-bit systems, which performs two independent 32-bit
reads (lower half, then upper half).

Because the MAC statistics are free-running hardware counters, if the lower
32 bits overflow between the two reads, the upper read will see the newly
incremented value. This could result in a spurious 4GB spike in the
aggregated value.

Should this implement a software retry loop to guarantee atomic reads of the
64-bit counters, similar to the pattern used in the ENETC driver?

do {
    high =3D ...;
    low =3D ...;
    tmp =3D ...;
} while (high !=3D tmp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D14
