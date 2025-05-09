Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64A5464E
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801816; cv=none; b=ClGX/bwYfZIg8SCt9aO//S5LDUCFFN5j9ZNZdPPLoX1tgZdaO7TMElGbMqL5rBwVKBs3No4Omai7zTkl9RlDampMCaFDpdxPdxDsrtlfVujRMEO0m7F4OtSeMjM5sh0RevsvhzZ8n4iPQnIvcIedNqY7B3Jd0R0ZVFmRH8qZKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801816; c=relaxed/simple;
	bh=mNPApPuwIaDUrhXbWA5v+Y3Fcvc95RJv/Ek/jZVjQTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTl3GQTrGByGSm8CspBF9Dg1roItqkoGAzG9aa8yXyKbcdae5OzBUYJNhhEnY55eW81Bd917SMVJxDe0aB+6ZUxmRT2Q0scc4WmPhOtvSlRrWTMi+v/N8fC0LvWJC0sKVmOfI9zbddlYOMxX2EOANhSiz1zJSsJogotk672+6q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=V0d6960n; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="V0d6960n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6EkHZ6uoB2xHmNiBXZ1kh3u+YSfhV8TuHSXfN/u3xAQ=;
	b=V0d6960n3JUBSgaFAneLnUf6NWJU+XxTBr84bDIiZfFivT+rAU4oWpEwuW6ABd
	MGNCgLJS+TDcLEbCtiC3D8lpUKfRtDvKD3e6aCfn3keTrBrosq57oyHKyCbYrcBb
	8UOTwWx4hh9yfzmfHQSiaDbUsgiVEm9JU4LX3Ul16Q5ME=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXnytmFB5oWHWqAA--.62630S3;
	Fri, 09 May 2025 22:42:48 +0800 (CST)
Date: Fri, 9 May 2025 22:42:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: freescale: imx8mp-toradex-smarc: add
 fan, ec, gpio
Message-ID: <aB4UZZgSSsLIg3qv@dragon>
References: <20250430094151.98079-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
X-CM-TRANSID:Mc8vCgDXnytmFB5oWHWqAA--.62630S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOzuWUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQVIZWgd+-h1qQAAsD

On Wed, Apr 30, 2025 at 11:41:46AM +0200, Francesco Dolcini wrote:
> Emanuele Ghidoli (2):
>   arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
>   arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
> 
> Francesco Dolcini (3):
>   arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
>   arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node
>     name
>   arm64: defconfig: Add Toradex Embedded Controller config

Applied all, thanks!

