Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE58182B3
	for <imx@lists.linux.dev>; Sat, 15 Jun 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718439166; cv=none; b=S9IazL+MqxGUy3WFga5LLq1Td1wm4uyIfYyr8sCB0gCplPhgn0BqGrW0IKWoYKctYKQQNRDfKTy0o0G+s/uIIxESjsoKmgyjKFTatOqSxcxVcrWMBTK57bzqR/qPjs3CigTkIByOeWpR5kCpBMsT7AwzADLpkA6JQ6VrNO3Y65s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718439166; c=relaxed/simple;
	bh=x2pxlxEiUhAarspns6CWBqh3UBaSsxStNYgipW6PNok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLMWdKZAeUrLOO6WHy6Ejo+Qge9YOvJ52mRrp/eAdNrAVDGHYQ4lOJ+ozXJxa8QtDFwnSajJ/9lEtGtn/olmK/GHrM+BIfTCeHjxqDBBWsCrdEomqcESw8aoXgKaopUSFtDkLz1HGwpYKlNYYWGul12bt/itjjPRQBvmmeSA7Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hS2AiECz; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hS2AiECz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wz/HDpQ1Wcm2r9gVMmqQ23mmKsaL2wCwcHzLe2aqIRI=;
	b=hS2AiECzTKSuAk50RcYDOKyg6ZCSTcCIl5ikYG3LRjPYleEeyFaPPobioQjpib
	VtxouwX1y8hiQk0NXyhq9XCZObGl24euzyi2kTTiXhJqw31j6XXjx/3qvjCgYkmQ
	5ib1gU8mQvDbkZ3IFFyOVNLdd5L6pyxiOEMgPlUdJOfRk=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrAD334xrSm1mgdS0CA--.18715S3;
	Sat, 15 Jun 2024 16:01:48 +0800 (CST)
Date: Sat, 15 Jun 2024 16:01:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix TC9595 input clock on DH i.MX8M
 Plus DHCOM SoM
Message-ID: <Zm1KambxKo9QquZW@dragon>
References: <20240513020454.127584-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513020454.127584-1-marex@denx.de>
X-CM-TRANSID:C1UQrAD334xrSm1mgdS0CA--.18715S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAr1UXr48Aw4UWr4rXr43Jrb_yoWxWwb_Xa
	n3AF12kr95Gw18KwnIyF4Yqr4kC3sxCry5J397trs3Gan7KF98Z34Fqr1Svr1jq3y3Kr1D
	WFn7Wa18JrZxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8P73PUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDw-+ZVnxc0gsowABsG

On Mon, May 13, 2024 at 04:04:39AM +0200, Marek Vasut wrote:
> The IMX8MP_CLK_CLKOUT2 supplies the TC9595 bridge with 13 MHz reference
> clock. The IMX8MP_CLK_CLKOUT2 is supplied from IMX8MP_AUDIO_PLL2_OUT.
> The IMX8MP_CLK_CLKOUT2 operates only as a power-of-two divider, and the
> current 156 MHz is not power-of-two divisible to achieve 13 MHz.
> 
> To achieve 13 MHz output from IMX8MP_CLK_CLKOUT2, set IMX8MP_AUDIO_PLL2_OUT
> to 208 MHz, because 208 MHz / 16 = 13 MHz.
> 
> Fixes: 20d0b83e712b ("arm64: dts: imx8mp: Add TC9595 bridge on DH electronics i.MX8M Plus DHCOM")
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

