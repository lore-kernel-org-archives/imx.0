Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA70A2AD04
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845330; cv=none; b=SrdlvPnbEMmQeMiv+s1RFVyNgHEH5lWRXmfPqYTBQv+fKSMiHqM/WWdXLPdfuasNGcB+8AzQ8qRn+nKErBWcNmdriyjt/r3OZL6C6PrwCsukuIkYZXrN+SwZM80NO1aHFlV53SqfHWtlD6/hctgAML1YjjlHmRrMxGrJCN+om1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845330; c=relaxed/simple;
	bh=KE/Au4YFNV4bz1phxnnuJ5q43HE2mGsEXaLzPA/x8Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpdCZ8Wm0EvJJo4AGGdkss6xGFS0Ikvrfw4zzBYK5DcoZ7k/u5fNX3kZpj0j8HcfsP4afhy11AHUsga0QEUEz2vuhI78zq9QUjprDnOw4K7CHIJ8jttUQ3ZtTNmuxE1OE7b29qJ/RsVVcIuW/EBXFevq2me1WBOf0I4LH5bOLK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YpsABBu6; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YpsABBu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zbXZUL041JHyI1fWwrbPiM7cj8TSvBZYJLch7Yc7dlk=;
	b=YpsABBu6Zsjp7rqgHOz5uk5LeICWFp4JgwvqpaKJIfPpSK2z91r+Oqa1xibIrq
	qkNV5v56RUu7vF9epPbfeXzIWGLGDtwmhE1HxeakflDuZ1VzWQ+UwN7v+XBZSPX/
	T91IF/R7WzYolBmJmnLOiM+MwozNdVqCPhslFpN6Cba0w=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBX379riLBmkIORAQ--.48430S3;
	Mon, 05 Aug 2024 16:08:13 +0800 (CST)
Date: Mon, 5 Aug 2024 16:08:11 +0800
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
Subject: Re: [PATCH v2 1/7] arm64: dts: imx95: add edma[1..3] nodes
Message-ID: <ZrCIa/91C6mYpB3E@dragon>
References: <20240701200728.1887467-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701200728.1887467-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgBX379riLBmkIORAQ--.48430S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAkyZWawgQMbcwAAsm

On Mon, Jul 01, 2024 at 04:07:22PM -0400, Frank Li wrote:
> Add eDMA1, eDMA2 and eDMA3 support for iMX95.
> Add dmas and dma-names for each peripheral, which use eDMA.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

