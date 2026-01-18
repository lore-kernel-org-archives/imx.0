Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411391F95C;
	Sun, 18 Jan 2026 01:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768701385; cv=none; b=TW2tLrf6Mblg6tnMhywvzqPjzNCe76irV57UVz/qy1x+rYvZQs4lFEeQJPBNIVWKJfnZTsDEq34dvg4P8+YFLg6zRkFqll9Uc7pciDSVsUGmw7SwaHXU2sCPYYH3h3xSnhWk4iT9ey9DG6m2JLJH+ddrkK1+hK6+RDloNSVi6vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768701385; c=relaxed/simple;
	bh=Ey1iQ4sQRIkaUAfNR4kv55EUH+aL6cNSU4wVIc1P1l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD40SJayLhkBnykkFY1Hzgz/NIpqqMWoCB72KtDvy3+PoL8NrONsOqcdnYj6wVpue9TQgZ7XpLd+raOcRMXJaaOxZodnhaFshkd2mPli2m0Y5KglOmWNIaptBwrSxR5kdmoG2odvkXMuxcYb39M8kXuxGC7QLdwToimWdbIUjBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeEODHHH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeEODHHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FE4C4CEF7;
	Sun, 18 Jan 2026 01:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768701384;
	bh=Ey1iQ4sQRIkaUAfNR4kv55EUH+aL6cNSU4wVIc1P1l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeEODHHHrODHCSzuqR2Rov1lUXuxspmo0SHBfQy7U81fvYldZcrUXIbjhINr1aKUj
	 mQV1tbqlp9GWe1R6NYiC9/x1xBuFYtgdLHLwRuf5E2E7rty/7rb7PaGCmhGgZZcvtD
	 +D6IhhMwhfKEHp7Aj1/pnkHp0OFZVyMtr/1YeYSSOLydIO9NobY/rqLW68xWLnV0gl
	 u/JW1ipDxdqYSj6hicOrG0lpqGqgOAAaa0ks3z0cqvR+4SBoyJC5rYyDs2WK1nqe0O
	 38qnZq29uJ/NwuMfwTEaiulY08dcNnakIUPISCxX1a9X6QiZwwlsftGgSUyTqqVe+E
	 SqmdUohOago0g==
Date: Sun, 18 Jan 2026 09:56:18 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 00/10] arm64: dts: imx952: Enable various node for
 i.MX952-EVK
Message-ID: <aWw9wvbCJO2C7bVi@dragon>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>

On Sun, Jan 11, 2026 at 08:40:06PM +0800, Peng Fan (OSS) wrote:
> Patch 1: Enable cpuidle for A55
> Patch 2: Update sdhc pinctrl
> Patch [3-10]: Enable wdog/usb/spi/uart/i2c/tpm/flexcan for i.MX952-EVK
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Sync to next-20260109
> - Update Copyright year to cover 2026.
> - Update spi7 pinctrl.
> - Add new patch to update sdhc pinctrl to DSE4, add flexcan and tpm support
> - Link to v1: https://lore.kernel.org/imx/20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com/T/#t
> 
> ---
> Haibo Chen (2):
>       arm64: dts: imx952-evk: Change the usdhc1_200mhz drive strength to DSE4
>       arm64: dts: imx952-evk: Add flexcan support
> 
> Peng Fan (8):
>       arm64: dts: imx952: Add idle-states node
>       arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
>       arm64: dts: imx952-evk: Enable UART5
>       arm64: dts: imx952-evk: Enable SPI7
>       arm64: dts: imx952-evk: Enable USB[1,2]
>       arm64: dts: imx952-evk: Enable wdog3
>       arm64: dts: imx952-evk: Enable TPM[3,6]
>       arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

Applied v2 instead, thanks!
