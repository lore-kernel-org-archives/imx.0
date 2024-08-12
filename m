Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E667175D2D
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723461739; cv=none; b=ivQ0yNuJj4p3RJrkQT8jL+k7oO0HtoWzZ07oNlNg7qMn9R2MFnjmGpgdNGssAJDnbmiU1LRo9trrPsqJoeD1rzBa3vRZvFuODPkq/ctiGHydMTX+FJLJ8++ljgBlNmVyShMwjN0SgaS4hRWVap1mBScxZtSodpdt4xbLujSpMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723461739; c=relaxed/simple;
	bh=4jaakDxvIcnXFdfZmyP2wnGK9yJak9z4Mq7GMeP72ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj6lIBKJuVzjDZmabrY2Dm83Ugm96IpCAP6HItudQ+rmZ+OSQ0AXK6qzkb2jSEEY/u0O7P+WMn8T7YL8uuNDLykEFq8XUTtWzjhqgiWLVXmorFyOPWgD/05/aAA7oRqHMuNmcd8dpAuS8u03pbkO7L5QJIZOvDSDx34Qgrz3bTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CtMSXft8; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CtMSXft8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7GykEmBrAEkBeuYpBhyNWSRhlT7wFBCLIkHl5OolLTE=;
	b=CtMSXft8EokDC1cgHrt7nCWEMiT1Y6OSbt5/EYD3pTsPF1WtBhiuxHaOM6jWeZ
	aWf8UINqVpf3rYvukrq+rZEOoxmVIoSFFq4OeApNfeQ4Jstk9lCREZC6Dvb7Vmth
	eXeGlBnGky/UbrxglL24bgsSonby+ghsr1YdEfeXjeh+Q=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHTrhJ8LlmglcQAg--.62044S3;
	Mon, 12 Aug 2024 19:21:46 +0800 (CST)
Date: Mon, 12 Aug 2024 19:21:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8-ss-dma: add #address-cells and
 #size-cells to LPI2C nodes
Message-ID: <ZrnwSG3CSQYey1jS@dragon>
References: <20240717135027.4116101-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717135027.4116101-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgBHTrhJ8LlmglcQAg--.62044S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVLZ2DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER45ZWa5790BIQAAse

On Wed, Jul 17, 2024 at 03:50:25PM +0200, Alexander Stein wrote:
> These properties are required by i2c-controller.yaml bindings.
> Add them on SoC level, rather than on board level.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

