Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD665672
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026168; cv=none; b=vA9nVIOAygmoLJM4L1PbK8sAhfdb7Ns+tDsfIwXawh/psTPkwt0+8CU16kL168o96fRh63u+fTQzaL8M0S+LR/VBZ7Rz4qa2ZyizJ/n3aHTojbqlTpdNrKXkP0Pmg0UGt/9xTvu8XRoInWetaUDxa1/LaPDCrE0L6QFJm6NgnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026168; c=relaxed/simple;
	bh=Ue4DWi0QD52B1nKNAzf4PVh+IQ4I0X4KROOINeGW2bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7dGHPou5lopmV1p+0JMM5tA20i1ODsvg+1qfk/x5G6aN895oviDteyECox4g8ChAwIkz0D13zuqR39jSN3boP6CpWAflk0oUpa6OeNp2q2P8ggITkMd+TYlz2dz5dw/zYr0nMBG7wIVlPegCc8EZQtgmhwN6s2rqaIflHPXKlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=J0Qlka3k; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="J0Qlka3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SDHGiDEJmLvzRYT3TaLtU3T7lep9rxFUwhCFeg6kHtw=;
	b=J0Qlka3kTVlTFb8uiCxic55R3RBtEYwhMf4GMtVm4zZF1hdPRGR+4HEwLjxjxo
	V4XFkDSIWL2PFu/p7c5BTQ7GLodguJWLFkto8QvqB1zH8aQkfe/DI7RZ/yuvGTLD
	QqxjSR38R02fhrWM8AM8zCrYTxfpPunQ4R7GA5VYc2xXM=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrADXPhiB9ilmE2pzBA--.45333S3;
	Thu, 25 Apr 2024 14:21:55 +0800 (CST)
Date: Thu, 25 Apr 2024 14:21:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: dts: imx6ull-tarragon: Minor changes
Message-ID: <Zin2get3gcS8+AQe@dragon>
References: <20240416190659.15430-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416190659.15430-1-wahrenst@gmx.net>
X-CM-TRANSID:C1UQrADXPhiB9ilmE2pzBA--.45333S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDwPLZVnxcqq3tAAAsR

On Tue, Apr 16, 2024 at 09:06:57PM +0200, Stefan Wahren wrote:
> This small series contains 2 changes for the chargebyte Tarragon
> boards.
> 
> Michael Heimpold (1):
>   ARM: dts: imx6ull-tarragon: fix USB over-current polarity
> 
> Stefan Wahren (1):
>   ARM: dts: imx6ull-tarragon: Reduce SPI clock for QCA7000

Applied both, thanks!

