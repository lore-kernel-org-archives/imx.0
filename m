Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D2ADDBB
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110628; cv=none; b=psXlRUxT9fcrh6dQiSpOOejXNITXnmC+NmqIth0EcZCoXKPAdHHjSj+VFHmegIh+QWj00w2A2tJEozmWjpBPOuQ6YO5YsHCcDg55F8K6qAi2SEj6QEJXV4lmYw4TYsrjGlkoyIJaifcRUrr+Ed2s5Saa4HdeBluHj+ZC3VmxDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110628; c=relaxed/simple;
	bh=YrlKkmeXnl9yn9by35cmlHWOsibdj1GiUV2S7E+D34A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBkuIBRV4Y/dFJC5hsebAejrkxHHVcmbN8DUgsyNPV8QBkHCUQO7tjpkvJCg2FWJPMYUcvqrQ7+pD8YDJhLl+hHVX7Y8OOGAf2ikVY2Q3FXNUs7mLQQ2tgB4DhXYuBwMjty5afsBc8NRt2mKy5WQhGJJtg3Qm7OyFwiE0g5QlH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gH/fZMfA; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gH/fZMfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=AKh6GeJUGJqgVmvjczY15ttYojz0WLz6kYGq1JRrolI=;
	b=gH/fZMfA2IIkiSos0uwF6FUiWxZqQsHZH2yO4+82PXwuOF6EavAdJs/VAh6a/r
	V1VRwrr3JD3ojvM6p7Kh7u5il2nZTJcXCTR7cJn/vJpnsPLWdS0Sk/6C/4F0eAEQ
	uiFnHCm06WxkC86kJvV1kgcORtUm1ibb7UlaWWzL2IrwI=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXPjNLGdNmEq06AA--.15266S3;
	Sat, 31 Aug 2024 21:23:25 +0800 (CST)
Date: Sat, 31 Aug 2024 21:23:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 0/3] arm64: dts: add aux-voltage-chargeable to Phytec
 imx8m boards
Message-ID: <ZtMZSxj5jqCiNeIZ@dragon>
References: <20240814-b4-phytec_imx8m_rtc_updates-v1-0-10f1afc1b3ad@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-phytec_imx8m_rtc_updates-v1-0-10f1afc1b3ad@phytec.de>
X-CM-TRANSID:Mc8vCgBXPjNLGdNmEq06AA--.15266S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4AR6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgVMZWbS-GY3CgABss

On Wed, Aug 14, 2024 at 11:26:35AM +0200, Yannic Moog wrote:
> All Phytec imx8m boards have a chargeable capacitor that the populated
> rtc is able to charge. Add rtc property to all (phytec imx8m) boards
> setting the aux-voltage-chargeable property appropriately. The patches
> cause no functional change.
> 
> ---
> Yannic Moog (3):
>       arm64: dts: imx8mp-phyboard-pollux: add rtc aux-voltage-chargeable
>       arm64: dts: imx8mm-phyboard-polis: add rtc aux-voltage-chargeable
>       arm64: dts: imx8mm-phygate-tauri-l: add rtc aux-voltage-chargeable

Applied, thanks!

