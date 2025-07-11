Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19D1F8722
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752221194; cv=none; b=hV83ShfW0vLWauCTCBxq6HmtYTohPCAVxjWRj24FxQ9x4UUxT/YMcUnKt3CkyZfg6q1C1xcaOFTn5IzoyUGaY2CH6207/FTyJybQF7Ep4dnnVJ4Fxt063HjRWCzKyBME5pD38fTmUJT5eM4/65Uv4+MqHdSgOnMwYM2d5knyK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752221194; c=relaxed/simple;
	bh=ZwY8hUAjzJDwY+ccRv673BoBqFV3812/3VWzODBWC90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkRvySq8BS5nrLD88pkdMIyWYNgYfdBMqSXpg6jNaeq/WOPzyU92oI2aFiyepM4FN7nZvxacmLTvX4wd4CW7LiJpy+YsI7m+yYS0DVGEp8zZxx+CzpvspUj3RJMolOtNm+xkJAOgKyHPolwMtr4LeFwWXppA76ayfHrw1uLZBHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YGRijOPN; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YGRijOPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=f//MRChZFcP5XIL4mb8oxZ7K1cGhRbiRX/pH6Xavkpc=;
	b=YGRijOPNm8XEsZj90dG3t/VTs87/yllFVhcTeBganDd6/72iDbj50NEATPTt4C
	55PejR7yfL8NSSoImyX892vzk5o/qklxbAMXyYs44qRQdsnZ5haQWhjfgOxPY2qV
	hpRunqyPjjIxC6hT2C5o8xPIKpCUVHM0/l5uvtPyNdFgQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXv_jZxXBoUV9TAA--.19772S3;
	Fri, 11 Jul 2025 16:05:47 +0800 (CST)
Date: Fri, 11 Jul 2025 16:05:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Annette Kobou <annette.kobou@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for
 RS485 interface
Message-ID: <aHDF2VPGraI5ceXZ@dragon>
References: <20250708122442.53829-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708122442.53829-1-frieder@fris.de>
X-CM-TRANSID:Ms8vCgDXv_jZxXBoUV9TAA--.19772S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0g4SUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwGHZWhwilDNbwAAsI

On Tue, Jul 08, 2025 at 02:24:41PM +0200, Frieder Schrempf wrote:
> From: Annette Kobou <annette.kobou@kontron.de>
> 
> The polarity of the DE signal of the transceiver is active-high for
> sending. Therefore rs485-rts-active-low is wrong and needs to be
> removed to make RS485 transmissions work.
> 
> Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Fixes: 1ea4b76cdfde ("ARM: dts: imx6ul-kontron-n6310: Add Kontron i.MX6UL N6310 SoM and boards")

Applied, thanks!

