Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C514D599
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474618; cv=none; b=MvyFRdEZrZbCQr469J2b9wZ8LZcwMGPOMU+a1PDHUjm/H0DuaD48z5m6ogUUYYmc7X8vkr65uPDQSkzaRz9kzE9XMQp4TqvjeUjc0fVcnp4wDdyY01ta/yh7NT0vfOhuSHyXY9S+ElrXfTdIDvSwTG8egdyjymaOGaOIubg0nlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474618; c=relaxed/simple;
	bh=A4DFNsk/8Evh+atHfIaiD0BiPEy11TZQ1hjUsej3uRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bi1kNWN0yqqvFdWnTD5L6HwQt647cJCmArQR//2BCKK0ZCkAgwyDriTLCWqrHqXJTqCH/OTAuKg1QsbiI0+UwGcMFI/02MDfIKLjaOUgziIoxcar0PTxcZ8LAeFpUQpaee11juC6uLexW4Gh1rob+O5SZ46Y4XjqFdArwDXjA+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AyhiXQnE; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AyhiXQnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mYGJ7SK1xTJp98WxWi32bZY4FNhdtb0AUofhUK5utco=;
	b=AyhiXQnE9ElhSddRXolIkjwtRxMoMreq9R205MguMSidwEbsJtsh1zd1teL7Li
	Xz03tt9ebqmyGxH1DQ7xdKL1cbDocHW6CesitYvszAhBk3xMcjys20AD0hbqMndF
	dZXVSDCX2A2imLrv6vDloXZ9+3h/9nnLeh1haB92tJwDw=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3X445GX1m3dkZAA--.52692S3;
	Thu, 27 Jun 2024 15:48:11 +0800 (CST)
Date: Thu, 27 Jun 2024 15:48:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx8m*-venice-*: fix gw,gsc
 dt-schema warnings
Message-ID: <Zn0ZObkf7W21thGk@dragon>
References: <20240618172150.1693704-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618172150.1693704-1-tharvey@gateworks.com>
X-CM-TRANSID:Mc8vCgD3X445GX1m3dkZAA--.52692S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIqXdUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERsLZWZv-cxUVwAAsf

On Tue, Jun 18, 2024 at 10:21:51AM -0700, Tim Harvey wrote:
> Fix the dt-schema warnings due to #address-cells/#size-cells being
> unnecessary when there are no children with reg cells.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

