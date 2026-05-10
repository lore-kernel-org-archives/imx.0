Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B436F417;
	Sun, 10 May 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410120; cv=none; b=qq8R1cYTc5RlELN/LcChisiRDFiYrEETEDSPdmjv0ur/Mhn+LmvRQmtZpMEqqX/vlEiMWRJQtH+CyW4Z6Jz+Dyp5pmQV/Ju530kxHHNPTea8VolVGgTvdee35sNSE423711UxZ0smr0bFeT4BN8oEpvG/gwES+RoU8UeTTK4bnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410120; c=relaxed/simple;
	bh=31TQoaGVbmdQ/QCLkA2O96b7rJCZciY3L5IIb+sHI6c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hKkgkZQnm96mdS4F5OQ5dL0L1SH4JhQQeajk5WVb0xUiPuUGhXYIclFLkeks56sjBQISHOVIEB+qSoRqG4NoktR8Ea1cKgHKOrN7uo9OMID+9jYxzrxWiIOhd9usCR6CR7aZCly1wmvZ+GeZU8aYBmc4VIPjp5JG8DyZwI08Z9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+wrBbE2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+wrBbE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437A8C2BCC9;
	Sun, 10 May 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410120;
	bh=31TQoaGVbmdQ/QCLkA2O96b7rJCZciY3L5IIb+sHI6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W+wrBbE24P2D0CYM4woWqoOJw3COVDTzWP3vVcDDK9iN38gqP4kSoMmLz480Ypl9H
	 CgE9BtKZN3QHDPuaf/tpRyd/URd86wffBgWmvgpsFhCkBGXUfjxjZg4hzu0Mm1nlC9
	 beUXUQGn+6aB4YQ/Fz60hZqjmYaHd1SkgWDKE4P57Ug9OI5ugHOSq5quHpFLIvOlWs
	 bQzXs2/AXVVh4tqhQgNGtmNmGCOW70bfhLqgnaTRZCwX6jndz2/NnJZH2cuNbA3use
	 VWn3g+FygJtc97m3RQh9G0tR3m0wr1xixwH72CbygByrXC1roI6snFHhx+j7okBmdP
	 vzzwr+mU7fGzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 14/15] net: dsa: netc: add support for the
 standardized counters
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, krzk+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260509102954.4116624-15-wei.fang@nxp.com>
References: <20260509102954.4116624-15-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:39 +0000
Message-Id: <20260510104840.437A8C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reading 64-bit hardware statistics registers via `ioread64()` ca=
n result in torn reads on 32-bit platforms.
--

commit cc14b24b819aeb13f3bfcafbea26c9b2150e232c
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add support for the standardized counters

This commit adds support for 802.3 basic and mandatory managed objects
statistic counters, along with MIB and RMON counters for the NETC switch.
These are 64-bit registers read via a newly added ethtool implementation.

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

Since ioread64() is backed by ioread64_lo_hi() on 32-bit platforms via
<linux/io-64-nonatomic-lo-hi.h>, can this sequence result in torn reads
when accessing the live 64-bit hardware counters?

If a hardware counter increments from 0x00000000_FFFFFFFF to
0x00000001_00000000 between the lower and upper 32-bit reads, would the
result be incorrectly returned as 0x00000001_FFFFFFFF?

Unless the NETC hardware provides an atomic shadow latch mechanism for these
counters upon the first read, might this require a read-retry loop to ensure
consistency on 32-bit architectures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D14
