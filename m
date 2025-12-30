Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AE41519B4;
	Tue, 30 Dec 2025 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767081864; cv=none; b=CvvSjcC0RdNPNlkVf0U4E+ofojLQ/oejbl4Izo++Nm35Gb5NP23HuRUagdAv6ZB1TL3IvZ662X+Q8lEm5Ybqsg+ix9QqAHefpCKFz9UhCzdTIAmiaXdgkZhj1ehxDtoa3jLE2NWbeeHhyCkDPrzQC5Lrui4Hky8cdglEEZo7Fv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767081864; c=relaxed/simple;
	bh=Q08bVrOXBn0J8Dkl4GIa1FzTrlpHKFrCvg7LbSXNWB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiFDE3SsscVeCpnxjy35mWCxQmakPYkoLuH9+fZbndewPu7PmhlKdcLKD5vBYOaWCHqIJx7QohJtypdUmZj07WSlXproi5J4xywuje6mo4IGtVOLMNGaVetc+Lpt4zUwqv/NZfibUo5JoPld3vkyNIfa06Ryx/feGQr38EGHClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA6+ouMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IA6+ouMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAF0C4CEFB;
	Tue, 30 Dec 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767081863;
	bh=Q08bVrOXBn0J8Dkl4GIa1FzTrlpHKFrCvg7LbSXNWB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IA6+ouMdlCbClyjjI9hRDhtNX5RA6DZdPx+UMv8bTpVSDKg1lg8rFXKXlP7QMedLM
	 iMv2/XaobuDY8mWNKwt49Ny8GArAK5UsijNrZHdTH4umz8dQ4k95pCbXIwdYMeRKti
	 B41RzLiu+gPDRX5YmCRcPv1M80tfGS/e1ajQfoQ7sXZO48aFCTcH4es4QaayByBRn1
	 7U33kXt8Rkkl8CCgBhhxzgsKzICZJvzpTQjJJG5U6jSdDxvLazTzMYmxkoDeFqPeu1
	 wNTiqSdDkh2b9qBlj24xi09J6bS7vRa3cSIWB0NCGbx3TxXJ1+UQXV3eTWi7Oy7KLT
	 2w/5WIeBtHWCw==
Date: Tue, 30 Dec 2025 16:04:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/6] arm64: dts: imx8mp-var-som: align DTS with
 hardware revision
Message-ID: <aVOHgR1XEo5zqOIz@dragon>
References: <20251214215256.5812-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>

On Sun, Dec 14, 2025 at 10:52:47PM +0100, Stefano Radaelli wrote:
> Stefano Radaelli (6):
>   arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
>   arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
>     carrier
>   arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
>   arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
>   arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
>   arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen

Applied all, thanks!
