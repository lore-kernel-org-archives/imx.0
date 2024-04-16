Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01E06E619
	for <imx@lists.linux.dev>; Tue, 16 Apr 2024 06:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713250238; cv=none; b=oJdiNyGOXP2iBDSncKU8/kAEK8VHrxNUbeXaCKi5fLoJQYZlcpOTh+IYR8fQ/nLj/hhWJFl4gpEOATkLvTCa5X88pRo3bX0llq+AeIwl3sMY5wIFknMGYwTBtt7eOj6UHmJZ7qIpwMm5PFRN+wmJXlvCVP4Xpu2BEReiXK/aLOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713250238; c=relaxed/simple;
	bh=YUGZwHqiq1W3MzxtYTRa8+HF8RgNF2wEckhkYevrEUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyaLREmVyaIHVMXb5J4FW1k0Um6xLr9vB2TZPS43oyzm9qDhAdMeXG11IsoTeVOaGyiQvJlKWuN7uks7S6O2G8ppOFLAE3nxzAD97ibYXlotcrhyA3wJTBxA1cYrXaI2dBn0l4KkcHtg7PkM+eWGQyLyEmrgmv1feozgUPg3Sp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Xh9iSzh1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Xh9iSzh1"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0265D1FA40;
	Tue, 16 Apr 2024 08:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1713250231;
	bh=2JDMaBzmcBBzqO9RDDM7vP4GiAz+o6rv+8K49cAJSZk=; h=From:To:Subject;
	b=Xh9iSzh1Rh5ETY1mAwYy8F81MscjfJqphqCgVnOOjsMFHqU4/kunbKFer8UpjFhlY
	 YRYk1P+y7aH/STYbKP5Tk2ompVqP/0S1sT1TnM2Zqti2uIp6wvOpP7rwpB8+yfQHiu
	 pyGAJ1UmKDdqSI9vY1zEeO5HOBlKrYn1a8UYvR5cZY2IBl5V5GiM/i1hXfd+5YO2ce
	 q5yQTkJU7+dM6c/V78rzdnLE8qMqIwfL5JmD8ZnuULZj1gEWH7e+cfgGZjMH66/XDv
	 36nObQHSYoimyrMimLKxeQ7aUGqA+p+2xyoXp5q6uoF+ws/0UHjwcl1CWV6h9cot6z
	 ac13Anb+JEHPw==
Date: Tue, 16 Apr 2024 08:50:26 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] arm64: dts: imx8qm-ss-audio: add audio nodes
Message-ID: <20240416065026.GA4165@francesco-nb>
References: <20240415-dts_8qm_audio-v1-0-2976c35a0c52@nxp.com>
 <20240415-dts_8qm_audio-v1-2-2976c35a0c52@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-dts_8qm_audio-v1-2-2976c35a0c52@nxp.com>

Hello Frank,

On Mon, Apr 15, 2024 at 03:46:38PM -0400, Frank Li wrote:
> Add i.MX8QM audio related nodes and update eDMA[0,1]'s information.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 473 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  86 ++++
>  2 files changed, 559 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
> new file mode 100644
> index 0000000000000..ed5a1b4af1d76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0+

OR MIT?

Normally for device tree files having both is preferred.

> +/*
> + * Copyright 2024 NXP
> + *	Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +/delete-node/ &acm;
> +/delete-node/ &sai4;
> +/delete-node/ &sai5;
> +/delete-node/ &sai4_lpcg;
> +/delete-node/ &sai5_lpcg;

Can you explain these delete-node ? This is something that I would
expect when a dtsi is previously included, not in this case.

Francesco

