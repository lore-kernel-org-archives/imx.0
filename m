Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF919F111
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 03:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561644; cv=none; b=JbOIYrMD9BOFZOTSXRXACUDmLfUFRaIgRER2d/RZHyzhXQJwrLCxVczn9Zygati+CLAgqPg/5wyTBpww4WmJCkkDVBGeYBQFFJbB4eRrp4U+j/KfODutx8LdPrcXXwmWdY/JpP3eP2aO7sZxsg1AxKVUZ8YwXfK5wIVBqjGWTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561644; c=relaxed/simple;
	bh=5K+fzwbWX432QtirHOzxhrMZ6T8493VGbop9fUkROb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ny4UUiyRcecqdW2UrnoWbWxm9Zk7EuMOpB7fEtkdWLKdT9PG00F9UnngWNQ05z+9/9T0aBOqYb1kYXsvIr42d4pz76wAGQzMT68K4P22VvLU5UvINlJZ0oqncuJ8wMq00BxJmbUpC7+mxdjiHHdt/D+dBXJERbRToEHf0J1Y7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BgHRdRcg; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BgHRdRcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9lfbb59Z653T2kjJpk8QzXlXjSD55hbRo8AmzH45kE8=;
	b=BgHRdRcgS4ePFTe3iK+gqw0Bx/wuh6tIqL+9EY5lyDoskjqNv3S9ifbHaXqkJX
	ETu66++yDjNGbkm5UmOqL9YfRuo7V0DnnwdIKzrufBEN/YRWnaA6J/S09HOSpe7S
	ARMo73gN7biOrc+xBtZfiVZGcVSs/ZU3W19jzz9trzhfY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXhtsaQ8JoCKRgBA--.51790S3;
	Thu, 11 Sep 2025 11:33:48 +0800 (CST)
Date: Thu, 11 Sep 2025 11:33:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phycore-som: Remove
 "fsl,magic-packet"
Message-ID: <aMJDGigkz986YC0M@dragon>
References: <20250908111705.2956825-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908111705.2956825-1-primoz.fiser@norik.com>
X-CM-TRANSID:Ms8vCgAXhtsaQ8JoCKRgBA--.51790S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzSoGUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhyiCGjCQxzcSQAA30

On Mon, Sep 08, 2025 at 01:17:05PM +0200, Primoz Fiser wrote:
> FEC WoL (Wake-on-Lan) functionality depends on using Ethernet PHY in IRQ
> mode. However, on phyCORE-i.MX93 SoM, polling mode is used instead for
> the FEC Ethernet PHY. Consequently, WoL is non-functional. Thus disable
> it by removing "fsl,magic-packet" property. This allows us to save some
> power during device suspend as PHY is not kept awake.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!

