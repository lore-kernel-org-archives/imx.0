Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAF27702E
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378583; cv=none; b=irNF5MUqKlMTTO+X0k/IOTF6BTz4N9WSUsRjT3wyNMRrczWpGK0CGPIhSFtlT7sDIGK5xt0/4XELYSZEvKQLwI5VpPJ1SxCFXE5yvhRmIleruYd4b2wpeElWLfoqKJCdR4PxfzXze/9/tvstfg9lXXvygrw7bSMFrIA8pWYK//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378583; c=relaxed/simple;
	bh=yd+dBNtBkUXAFtwEN3ayJRELOIDfTT3ldH9eeDwqeac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+TrNUUxugaj9anZvoo2Red9x41Y5lDSFJs7xnDQAd+EOWTW6P1QZXTYgy1n/rV+Z0aWYUgAwgi212ttsHU1Z+0DBkeZ9WUyyVhLNuRusd2oQn1sN5u8C3Jm+KrypDew2OIMt8DCTQ+T6XahONVTWRtY9VZvnt5Wo/dw7ZX7uSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LV+rGDcD; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LV+rGDcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6vBKiSD84mol3nmkRzXKHoMDlvMazbOUAfI03BMNNJM=;
	b=LV+rGDcDEFXGiAzqBs0SFmO02V5Q74fQpn2i3cDqyZPjwauIrYBj2WnuwzWV9U
	mjUM0Mbri96xRf9OmNDL7MOXMPJa0uIm3+GeAiarGIZx/dnBclprOZwj0SEHvmZm
	+iNJ9mrvlleVTBov7J6uiOC5KTjWNvtnvR6SQA5R2b3Oo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3f+x06mNoRp4BAA--.4021S3;
	Tue, 01 Jul 2025 22:02:30 +0800 (CST)
Date: Tue, 1 Jul 2025 22:02:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx95-19x19-evk: add adc0
 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3
Message-ID: <aGPqdBfNxwvxUroN@dragon>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgD3f+x06mNoRp4BAA--.4021S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUF2-eUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBbKMGhj6nbFigAA3U

On Fri, Jun 06, 2025 at 03:00:41PM -0400, Frank Li wrote:
> Add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 tpm3 netc_timer and related phys
> regulators pinmux and related child nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

