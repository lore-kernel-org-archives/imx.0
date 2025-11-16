Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90408214813
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763287609; cv=none; b=t3IvoUNPACvwQup5Lo2pLZvy3BSEpj4cSMifC0zE6Mj5CwrXmC5VP9u5G5+pHnwPrwmNTvPD0f+tT34MJu1G9jO6dWyKrpniMcXMr+RsCJqbzcot7sHDBcwaIjvzx/kQgil1WzHHJ/W7d887TjfbxCEarnnYz+5vHhnO1kMnl7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763287609; c=relaxed/simple;
	bh=rUvFU4iw0o4uUI/vlsXxBCiGP7mAmX+YFRFk8QyShYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGhLmCbIah5vbA0ClXzoNAsoZrz0L9LxT5rVJshRFh0RztjY8xw5Ok3hZJPuRQ65qEFxMHDoyeXxAVEuI6m+ovfxkZ9vlGhHp6Dy0Spr+tFZEYeQjBaB15szqQ5UBxbPqFVXkQ1jl8J6mzA8eyNKm+Qz7Yy8IAHcpnJwgev1g98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WIqzmsVZ; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WIqzmsVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oSXMUQZ+cQGwThCwg/X7IsHfqb9HKFGadesoe/E5owM=;
	b=WIqzmsVZIXzL8XMF6+jO0JEfLj3Y3Wrkk8wPgIcZaaRntdsT3bZODjcbFJ6aj0
	FCcjE6cvnzPQ3YHeMzaU5wyDml4RlwvuPta7/6aMYSVvOacoclk7ygOfNoWCM1Q3
	sxav9Ixie2dWVbQYMvCEpNxGdDHY7gGKX2wMwDwsyrLlY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3d7AaohlplIkWAg--.7944S3;
	Sun, 16 Nov 2025 18:06:20 +0800 (CST)
Date: Sun, 16 Nov 2025 18:06:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/19] TQMa95xxSA DT fixes and cleanup
Message-ID: <aRmiGnQYWHF2ja2g@dragon>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgD3d7AaohlplIkWAg--.7944S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18WrWUZFyrtw1xXr47urg_yoW8Gr4UpF
	WUXrs7tr18Gr4ruF95ZaykK3yfJ34xG3Z8JrWYqrZFvryvyrW3XFZ8GFy3WrZrtrW0va4Y
	ya1UJryDCryxXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcqXdUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBxQtWkZohxfMwAA3v

On Thu, Oct 30, 2025 at 01:49:07PM +0100, Alexander Stein wrote:
> Alexander Stein (14):
>   arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to
>     66MHz
>   arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
>   arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
>   arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
>   arm64: dts: imx95-tqma9596sa: move sai config to SOM
>   arm64: dts: imx95-tqma9596sa: move pcie config to SOM
>   arm64: dts: imx95-tqma9596sa: update pcie config
>   arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
>   arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
>   arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
>   arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
>   arm64: dts: imx95-tqma9596sa: whitespace fixes
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved
> 
> Markus Niebel (5):
>   arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
>   arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
>   arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
>   arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI

Applied all, thanks!

