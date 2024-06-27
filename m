Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D6033987
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474157; cv=none; b=XUNl60Qadeof2hR2nBxGdOpK4rOrDx+RSebzq48YLrYHsFf4V3bCYzZvTQQsp7C/154E3PJ4V5necB+XFMwYtTiMD+eI6qRm+BjN3TMI5RueyFy3Y71KsRomg3rxDfBeW4B6H/+/mC3KPOCyUhAvIVZrrL0aCMCqiKztR8cGYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474157; c=relaxed/simple;
	bh=niWifPxthY5pGSj0MPq+gFtzhUAaPd89u2s14QYBBds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAVQxsTTf6NU0KmXXzJa4aW0b/l4SRYlPmzjjt5dwFYQWDVaDp/Uhf0EqgGcLRjayj/HH1JSFQX6hw4kRFpQHVgSSxPXc8lsskckNAS2qTiMiXSxgKD9ZjUDPmvccaKrlHcUjcejDdEpwBnEh/H3xIVx3VQBx0wykAIJNFnSRl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=o1Dmlyfc; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="o1Dmlyfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=K/1iSBKlF5A20UDlARtUeGLpv4GEubEh9JBHFml2Ows=;
	b=o1DmlyfcjqqUdXfNYnY3nFYhnI/mw80C/oiJGotW+iWgIDKQZwwSjl1avS2h55
	ModLw6PrC/dH9m2+j1h0MKFTzjO7Jgv9BXO3vne3hFt5sisZE92ohsIIIPv8WmkM
	KBWECYLMNSLiGeS+UkMiaKcyWqTcazvbvmVM0UTsrZpBg=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXD8rZF31mmaMaAA--.52532S3;
	Thu, 27 Jun 2024 15:42:19 +0800 (CST)
Date: Thu, 27 Jun 2024 15:42:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8dxl-evk: add imx8dxl_cm4, lsio
 mu5, related memory region
Message-ID: <Zn0X2dMZaQ93vwHC@dragon>
References: <20240617184707.1058995-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617184707.1058995-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgDXD8rZF31mmaMaAA--.52532S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3oGQUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRsLZWZv-cxqVAAAs6

On Mon, Jun 17, 2024 at 02:47:07PM -0400, Frank Li wrote:
> Add imx8dxl_cm4, lsio mu5 and related memory region.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

