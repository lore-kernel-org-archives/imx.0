Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6F41F4C8E
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 05:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607632; cv=none; b=Z2BomBdv9JWExIKkmUv7ug41obQHdlxSvmxyE+3huay+bJBbxcirELIq7AXS/dO886W/vkCosD5T0qmzQy1wkKJSDFwAvSpf2g9dD2U0EO52omRAAm+7JEKST/a5pGDn2GhwqjIsHu17uQVPIbUJiBdJj9SMvf67t4S0B7TWWR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607632; c=relaxed/simple;
	bh=qbtQlW7BbK/du6tBndcVg6FtocuvDFKfNSqM2W685Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAE8K+kguCFi5hn6ou6G7DOAumqo/0p0uTEM66A0niCZE1jO2fyxHeG52InL5bsM/hpuHApExm2rgvkBsSXc+F5Dcyuw/6GCE34X+l9mTxnESfQHdB0Wvl6mFEjAoV7oQa4iRfoO7V9wprM6E5dst9jMnGTEfgo0+WfMThe2zPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jzxXinBt; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jzxXinBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hpZwSMsikkY5e1IDRF7CovSvRYahYoXectdVPFTib54=;
	b=jzxXinBt44+BQ1jBtQTOSzsNVzdNfH7+Wh7Ibe1IBG1KpMpck/x+K5pTgSWmrF
	Q+x+dvGN1ZOVr3a4vQjexja4jFkhXciEmxPPGx3loNuwvUcjwORVXvcQt8pw3YOB
	M3xekiMNOtoNc9LucooJg4K8NO6XMHCLc0DovTDBkdnOc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3f_QvaWdonnQKAA--.22224S3;
	Fri, 04 Jul 2025 13:40:01 +0800 (CST)
Date: Fri, 4 Jul 2025 13:39:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH] arm64: dts: imx8mp-evk: Use fsl-asoc-card to replace
 simple card
Message-ID: <aGdpL5MUn58Se99Q@dragon>
References: <20250617072646.3226865-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617072646.3226865-1-shengjiu.wang@nxp.com>
X-CM-TRANSID:Mc8vCgD3f_QvaWdonnQKAA--.22224S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzgAwUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRFav2hnaTEUAQAA3D

On Tue, Jun 17, 2025 at 03:26:46PM +0800, Shengjiu Wang wrote:
> In order to support Asynchronous Sample Rate Converter (ASRC), switch to
> fsl-asoc-card driver for the wm8960 sound card.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Applied, thanks!

