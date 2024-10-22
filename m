Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83B817993
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729561543; cv=none; b=VthpPn3MnOaDSCYuc/CQ3Z3zgHFIxkfq9zGzBCR37LzMfyQZxhIs+DSDhWdFkim96iKQycXYcLnEemm9MlQn/a9og1Qrqg2HM0RgeMn7/TkXzuA0hah8lf/XRfyf25/EU6v8Lh+4vO91r1bsSTsHfAbcXr29XDR1wO0cxgUqG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729561543; c=relaxed/simple;
	bh=19d9wyyfFEi+vlZvX45ifIbEhz8xb5w3+K55BckUqVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6cJONIsHZ0QHgSQ8XtQZ6euvZkJc+BNE+nx+FqjCBhcxOo4ZJZSOWAmcikk0gdWJBXhgY0r7jIpqNrjFybig6MgfW2ErPsKJ20Q35hS33nY1Ixj/bQfTUmdd8kRGswySHmub8SMRltP4NYRYH/KfVcqEuSQQ+0j+MFnmb7j+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DZwrlfRA; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DZwrlfRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=geKvtQ/lVyTfA8l7s5hPIPLWNiuFJ3MhIRwflfPBTps=;
	b=DZwrlfRAEqfhEUyiaM3D8V16Vc4CUPfiEYGpTYzuV4dBpdvX4QOfHwQKoLz2Ws
	Oc5+B9IjeZJdrxT2peIgfBYhCxgYSRamoSstKS1aedGpdGxNLb217hK9VJsbDQN0
	LsJZIf94ljJ/8CNBywuwldDhivrB2FCyCuL7Tq/utFrKY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHLuyjAxdnalyVAA--.5310S3;
	Tue, 22 Oct 2024 09:45:09 +0800 (CST)
Date: Tue, 22 Oct 2024 09:45:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] ARM: dts: imx6qdl-dhcom-pdk2: Drop incorrect size-cells
 in GPIO keys
Message-ID: <ZxcDo7P5q46kciwh@dragon>
References: <20241015224505.94359-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015224505.94359-1-marex@denx.de>
X-CM-TRANSID:Ms8vCgAHLuyjAxdnalyVAA--.5310S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsrWFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhCAZWcXAR4IGgAAsa

On Wed, Oct 16, 2024 at 12:44:52AM +0200, Marek Vasut wrote:
> Bindings do not allow address/size-cells in GPIO keys and the GPIO keys
> is not a bus, see dtbs_check warning:
> 
> "
> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: gpio-keys: '#address-cells', '#size-cells' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

