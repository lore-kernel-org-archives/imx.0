Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7957F184E
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855417; cv=none; b=k0cpGFgneJVWk+ijAeg0up1p28o16Ww4wShigxEi+YcY/7x1cK1x64YcApuLLXE1AFaq824skhNBceYnOpAydzP3ABm4bURjBbEKRKjj9vnMqqTJNJbNQiN120UP35Dy4ogO+tTy5EfYpqI6/GDS/7yOwoPdcNyu3oqdgZtjoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855417; c=relaxed/simple;
	bh=nrS8XtxZZMRt1EatFOzFAbiJT2r7mks4tK/1EanKGFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shXJb+YUojrBxiCCb3f5MQxMbteCQYB2mxGn12o0SU8oGPKoHIxv2vgUPDwRNasDWv7vBlgIGi0zFSjkkzGMZTY8A/tDfPr7NexJQgT4+48BNK/CPnIGgcIa+f+1OfDORWYKUuTiavP3os+ckXsBIOGGZ8/JEvtc5zfpHZVQXVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZzSGU+PG; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZzSGU+PG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=O3XuAyG0R3H+3LQFQk1AODhxNQ122XGCYmRDMRRxkhg=;
	b=ZzSGU+PG9JJSOq53wQhRwkhBjD2u7LpmqXpm0i3B9J25GMdb7YdvJwTdnimVqi
	1TdXunU1QRcHQYHMdbycJz844Uq7g2bgzQV2P+TdiUKAl7EXhhniZrL4MFO+CZsW
	8krXjNzUSBB0W2EzNxFiIy83409FqZiItke5wMoXiKaf0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHxW6PvsZoh8JvBA--.65403S3;
	Sun, 14 Sep 2025 21:09:37 +0800 (CST)
Date: Sun, 14 Sep 2025 21:09:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Message-ID: <aMa-jgcY3KMyQeYO@dragon>
References: <20250911-imx8mp-sr-som-v4-0-1b1fae6135e0@solid-run.com>
 <20250911-imx8mp-sr-som-v4-2-1b1fae6135e0@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-imx8mp-sr-som-v4-2-1b1fae6135e0@solid-run.com>
X-CM-TRANSID:M88vCgAHxW6PvsZoh8JvBA--.65403S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFWfury8Cry5Zw4UXw13Jwb_yoWfCrg_Z3
	Z5WF1DX3yxtryfJw4rAw4Y9a4I9w1qgr18Gr1rtrW8X3yS9wnIvrZ2q3sa9F45Z3y7JFn2
	gw13KFy0kryxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbhvtJUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRGfBWjGvpECXAAA3h

On Thu, Sep 11, 2025 at 12:20:04PM +0300, Josua Mayer wrote:
> Add descriptions for the SolidRun i.MX8M Plus System on Module based
> HummingBoard product-line. They share a common designed based on the
> "Pulse" version, defined by various assembly options.
> 
> The HummingBoard Pulse features:
> - 2x RJ45 Ethernet
> - 2x USB-3.0 Type A
> - HDMI connector
> - mini-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0/3.0 interfaces
> - M.2 connector with SIM slot supporting USB-2.0/3.0 interfaces
> - MIPI-CSI Camera Connector (not described without specific camera)
> - 3.5mm Analog Stereo Out / Microphone In Headphone Jack
> - RTC with backup battery
> 
> The variants Mate and Ripple are reduced versions of Pulse.
> 
> The HummingBoard Pro extends Pulse with PCI-E on M.2 connector.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thanks!

