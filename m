Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D8B2AD00
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 03:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730516755; cv=none; b=uXqaIFPDH98B6HzrX9SGqCsMZXcxx9KdZ9rhncyB67WaJ2n3cw5jjD+PJyqNUIs4cGczHyp11eAQXkvcu1DdiXrZvbFyyhdPxaObDG12KMLppK/E4J1fODJ5k2NdfQe4jehCezTdrCcetqhWvKrd6J4P4R7KjjYntdqC7ACg+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730516755; c=relaxed/simple;
	bh=CrBW7gcFJPzHjeH5/TI3/rKBzVxK4Zjcgf6BIWAcJns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOjE7Mk3zeg4/izXy3lEbUMy5/kJxcxx6sTQazCTHpBS45WU1Fg3Kd1j5t0CLmpDZD4bd+efinSXuBjuWKVxzLUrFmiml6TGjRosPebM1J95sj1OwDKHokVyF/DE6aPlIEa3pgroHqK0OafC2hRRtiWeZPsnsTfsXAUpqb+K4QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Bg8QAQuu; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Bg8QAQuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=p8eD/9xKOfuW1a5aPO+P+oTlB82ZVFjGxpbnAcOwcBM=;
	b=Bg8QAQuulN5NSlNJTqdEjQzv8SKn88C1nZQLOFMQBu/oE238yGdnjssZJraoIR
	IgogDHuOJH0H3s41FKACyXiJ7AiZRa6JByrSKq3cbzIdLSJsbVBFzAELVNEP4CuX
	Rb97m8219Hzl3lsanR20qFgw9YZ70vnQmqVO/PZT5grDA=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXfyz7liVnl_l6AQ--.14941S3;
	Sat, 02 Nov 2024 11:05:33 +0800 (CST)
Date: Sat, 2 Nov 2024 11:05:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@nxp.com, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6sll: Fix the last SPDIF clock name
Message-ID: <ZyWW+3NsvR3poTTY@dragon>
References: <20241024181409.1461997-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024181409.1461997-1-festevam@gmail.com>
X-CM-TRANSID:Ms8vCgDXfyz7liVnl_l6AQ--.14941S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg6LZWclifsbEgAAsL

On Thu, Oct 24, 2024 at 03:14:09PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The last SPDIF clock is IMX6SLL_CLK_SPBA, so change the last
> clock-name entry to 'spba' as expected by fsl,spdif.yaml.
> 
> This fixes the following dt-schema warning:
> 
> spdif@2004000: clock-names:9: 'spba' was expected
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

