Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7FB1E493
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729219067; cv=none; b=fx+9e238W1I/5g6U3kQX6Q6cLm4dKIYAppv0CMkNnAHeL/Af9xXyxMI53JtvpWr3CNyTZXGv2tZD2oeAv6qtlNW1E77XNWH5iZ7VknC1dIplaxFOWvJgXY3p/LGQkBPn0pw/BbPZ3TGh25KJHVwLEgs2UPNUbo/Thgi6dcfVlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729219067; c=relaxed/simple;
	bh=heaQKw11hc5qaB2d2vqyU7RbGjHobJf5uqsQOlVXllw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0TOBg/D/1to5+jhNJ1SMOtNvkhMseUD14f5geouqN6CM+TG+Y3fY6SIiPftmXSVFYjTQJlCZB0ZtQlS1IFz8TmsTSc+dNyg+iSE2AwyUIQUXJznNe3stYx9ZNYdTGXm4mdb7lF8wzdLP8GOTWpBRlEOzkQGXFg0Uxu5agCYvBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fjQ+gT1U; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fjQ+gT1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Xnef9Z8LbbSH2/K9Am5e8TSqtnTg+6+pGRuUnrHcKbk=;
	b=fjQ+gT1UUHHU+hdBfTMI94/sMuW3Dye9R0hpeaCvKPMGWH+q5CWjfiHGBSjGk/
	bYbkDjzB11mBpcjn5hkLX8ReDMxGC8qI1iJCxae9SpRsavxE95pMbaqIB3+WS2Gw
	DtXCCMUCGhlGeYKIYP9j+XxmpEfyXftKgVAVJ52Gy1TgU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHFPfAyRFnNG0_AA--.1855S3;
	Fri, 18 Oct 2024 10:36:50 +0800 (CST)
Date: Fri, 18 Oct 2024 10:36:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Document DH i.MX8MP DHCOM
 SoM on DRC02 carrier board
Message-ID: <ZxHJv4zstr0BK2m6@dragon>
References: <20240925160343.84388-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925160343.84388-1-marex@denx.de>
X-CM-TRANSID:M88vCgBHFPfAyRFnNG0_AA--.1855S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsRRRDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRx7ZWcQ0mcYuAABso

On Wed, Sep 25, 2024 at 06:03:07PM +0200, Marek Vasut wrote:
> Document support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
> This system is populated with two ethernet ports, two CANs, RS485 and RS232,
> USB, capacitive buttons and an OLED display.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied both, thanks!

