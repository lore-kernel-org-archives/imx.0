Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80D35CBA5
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763287120; cv=none; b=pi7bVlCXZd2ijoqwKLsUbbHcQeM3TW+19jIFbl0eswGvHlYG6W9zJ5i0dUM7s6Caj8WarRw5E0SB1F9gMPxiWB5DCNZecKdP9I+qO9cAF9hJAGEmpwhuEUQeF11lh+4nDkElzUwQ5+AEyon/vle3qdgQXRB2D82LeT1FQXAFFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763287120; c=relaxed/simple;
	bh=/IodfAgsUrjjhcTtKe3TjnTr29d7GbzX8k72lEB8M4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhBiMztPTRSwKraMHpaAnL6RWv5E3EzGe0ixcguuCvLhysQVEPUcPvVGnCTBCEtFjw7qtwPvfxu43W1vCFEFRseITeMJ5Lin1mtcDVi56mvDl/0kCK44yMzwgXjIV2KjXHKBm/Po0yhoWnN9mmMaY0IE3AeWAzLbEq5gMdrEmak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NVfGM1+N; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NVfGM1+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=L/q/AVGR8/RLFNl3U55Jp3zAzhPBmJRaurGlvbnRsa8=;
	b=NVfGM1+NNXoSfCZuZfMyzw0avrtRsSfVKBEgKWreGrlavlglFXw2+vNM9twf4b
	qQNlyF1RTwP+7PIhVnrgwXhUQbkpY4Mf0qKpXoFuHR2vSiRUKHWe/+71fQsyJ2/c
	3c1rV0BZmZwKis3LrD3pvelAh1zAdoWPFk0Vv5lK7ElDc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXn886oBlp3LsjAg--.8159S3;
	Sun, 16 Nov 2025 17:58:20 +0800 (CST)
Date: Sun, 16 Nov 2025 17:58:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>,
	Richard Zhu <hongxing.zhu@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH 00/12] arm64: dts: imx8qxp: collect some imx8qxp-mek dts
 patches
Message-ID: <aRmgOiqUXLk8BIDe@dragon>
References: <20251029-8qxp_dts-v1-0-cf61b7e5fc78@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-8qxp_dts-v1-0-cf61b7e5fc78@nxp.com>
X-CM-TRANSID:Ms8vCgAXn886oBlp3LsjAg--.8159S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryfKw13tr1fAF1kCw45Wrg_yoWDJrg_uw
	4FkFn5C3yYyr4fA345A3Z29rW0gryFyrykWry2gwn3X3WxWFyayFy0v34fWw18GF4fWF1D
	Aw18Xw1UXr45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjOeOJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhzXPWkZoDzehwAA3h

On Wed, Oct 29, 2025 at 03:54:36PM -0400, Frank Li wrote:
> collect some imx8qxp-mek dts patches.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (9):
>       arm64: dts: imx8qxp: add MAC address in ocotp
>       arm64: dts: imx8qxp: add readonly for ocotp

Skip this one

>       arm64: dts: imx8qxp: add wakeup source for power-key
>       arm64: dts: imx8qxp-mek: add state_100mhz and state_200mhz for usdhc
>       arm64: dts: imx8qxp-mek: update usdhc1 clock to 400Mhz
>       arm64: dts: imx8qxp-mek: add flexspi and flash
>       arm64: dts: imx8qxp-mek: add phandle ocotp mac-address for fec
>       arm64: dts: imx8qxp-mek: add fec2 support
>       arm64: dts: imx8qxp-mek: change space with tab
> 
> Joy Zou (1):
>       arm64: dts: imx8: add edma error interrupt support
> 
> Richard Zhu (1):
>       arm64: dts: imx8qxp-mek: Add supports-clkreq property to PCIe M.2 port

Skip this one

> 
> Sherry Sun (1):
>       arm64: dts: imx8qxp-mek: Add lpuart1 to support the M.2 PCIE9098 bluetooth

Applied the rest, thanks!

