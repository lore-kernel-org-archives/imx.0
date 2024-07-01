Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDAF15ECE2
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719841956; cv=none; b=UfCL4qAJfDe2JcyYgMgnA5/oPWxkBO0xN/zBOGTqx7lC3v750SKsWpQG6oyfla29Unf55sk9EkzBByXb+xzyOcjWM+f2WM8AhysZdbr4lJOBbAXbL+WstCXCdM4NzoMG8EUo9X34SsQ/MbaLGCv+MuvakmZ7R2rlQELePf5sGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719841956; c=relaxed/simple;
	bh=1VxrunHFnePekVsAFdYOTKByhl7MciIsr2MDBNNJ4mM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpMC4wk6Q0mbM6KGDrGJ1BdTMMTZzzxC0XPc0Hz9Vuu264LTVsTRcM9GaXLTEBE4Tps0Lw9AFmMiuisS10XYEGCqAC5nmynWtYJkbf5DhhignNql1K2gbYIx/sirBFexP3oAPMpBduADkB/TIz8RRKv36KCO3GaMjnSuiqRQ82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=f4nBRQoa; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="f4nBRQoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=x5c6nQHpbtpUoQ1m3fxRmlqTaW9KXF9YbGJxyq9YH0w=;
	b=f4nBRQoa318CsJCjMRqGR6B9EZm/9BfMbX+wGg5M61QTspWGwiqDoVdD63RnAT
	MRQr6PdIzOBU5jEp2t81r/yrYLNsuSEIRtCPCT1mcwjLijFjhyJtMw8ovH/v5f8y
	tchiWZ0KG9fU0JwzBUXn81dd7U6xQUkdDxN5Jh+VSyNgQ=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXD8qNtIJmxWQ6AA--.345S3;
	Mon, 01 Jul 2024 21:52:15 +0800 (CST)
Date: Mon, 1 Jul 2024 21:52:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mm-verdin: add TPM device
Message-ID: <ZoK0jX27DHCHawWv@dragon>
References: <20240628090751.797818-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628090751.797818-1-ivitro@gmail.com>
X-CM-TRANSID:Ms8vCgDXD8qNtIJmxWQ6AA--.345S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4GQ6DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAg8PZWZv-duX5gAAs5

On Fri, Jun 28, 2024 at 10:07:51AM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Add TPM device found on Verdin iMX8M Mini PID4 0090 variant.
> 
> While adding the node, rename `pinctrl_pmic_tpm_ena` to
> `pinctrl_tpm_spi_cs`.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Applied, thanks!

