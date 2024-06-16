Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0456A16FF41
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718540462; cv=none; b=RbNCF2SwnNlxfjyQuVzClK+dZsWs5+JOiJpsREd9WLZQSxWq3Lbq5WsjKCOT/BGaJs8/IWblAd+YPH6K4wwgVsy2aYPjJSNbxXI4pZDgxe6sG6MFFi/LAaK2RSizKaGQTdpGEfmjqeNm0jnhwe/zvelNDjWpHsOrqkaL1HlqXVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718540462; c=relaxed/simple;
	bh=SCQXPdgSipHDPN4YthpZu0919XATC8K3N/zDDamI43Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddjCsEBt1iRggnPTwigBKPPyVJeVp3pI7ZKKoWB4/SdLvIUVEsddNSHZT4WBQ5QQrazFO7szse/ixSi8QRq6Gm5oM05jZeuBVdeDBWETgxF86D+TCQMwqNs36lSH5vbvrP4EVdeGYfhhZhEXZ93rFRC0AA8q6p8/FMFQ3PDrrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IuJizTRy; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IuJizTRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=irFNwU641pAaOKt3xuRSaqFXQYVHXJpdtESTK70JdsY=;
	b=IuJizTRyTxeAS6FfixGqE5mUBGKioReVf7OYZur68PFtDyJXzUeNxuOf978IXO
	pzBPV526CsqCmntb+LXNJU3Qtx8+xfbqhnASKN/Gt6gbxEY0qxtIbCl2srwg4aN2
	PYBEaPmPUUDTJRKYv8w5SUlmgNH4tyo9+MBUuw/1ia+EQ=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrACX_vqK2G5myI8CCA--.40222S3;
	Sun, 16 Jun 2024 20:20:29 +0800 (CST)
Date: Sun, 16 Jun 2024 20:20:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: enable
 hysteresis on slow input pin
Message-ID: <Zm7YiipkuWRpSG7H@dragon>
References: <20240603140103.3845905-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603140103.3845905-1-max.oss.09@gmail.com>
X-CM-TRANSID:ClUQrACX_vqK2G5myI8CCA--.40222S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa8nYUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDw0AZVnxc0sL2wAAsn

On Mon, Jun 03, 2024 at 04:00:45PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> SODIMM 17 can be used as an edge triggered interrupt supplied from an
> off board source.
> 
> Enable hysteresis on the pinmuxing to increase immunity against noise
> on the signal.
> 
> Fixes: 60f01b5b5c7d ("arm64: dts: imx8mm-verdin: update iomux configuration")
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!

