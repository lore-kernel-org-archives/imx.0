Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222F11C3E
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 03:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723434682; cv=none; b=Ej0qaw9AsRzErm8kFRaRPt08zXHCF+puxb4gsFGub28EtYLwCG1UKHIb2/OxDFI3FsrEab2Y5/17EMKo/5u27UhkBnjPS92vnSkLGek+A2c0QsXgpzv0V0W+wHt6v+YXNQ69FamOuGwaALGRs8XrECzF+alO0aECWYcQB1otBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723434682; c=relaxed/simple;
	bh=B8xHurgG8lr18MHXEAp1NYITE8Ke078kl2y9WJg9NCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5hXdAUp4KKnlbmmGRo/a6aHG+iL3OvpQ52gxyEtE9PfN9jBRBmAoJrB/3Wvur7FH0NP10UIXCgDOYEyxjW809cO7tmXYnFfUeHBs7tLqFPzyuU1Sn3dxulcXPoUgIIK72Q4a8viNB16pwMURIyntEqvEZa9+cem61WhbkG9oRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RKIAy6gu; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RKIAy6gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ynZeNF1e7pZTQPu+92637zxNee3+2bYLiUpW0TeRq+c=;
	b=RKIAy6guwk40oiUHPTdRcwtlBWKew7asgB8Q0q0L01VydWZkK+jHa5CZMoWOAv
	JOuEaYVCk81zaT2ikppHLA14QPBZwScZ1tzwjzvHaf668qbZsZyBYMmK3LTVghRI
	nYGeMXMpqVLFqWniX1jbMlBadLPYIeUsIaA656ek55V4M=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3HyQWhLlmlDBGAg--.37597S3;
	Mon, 12 Aug 2024 11:40:08 +0800 (CST)
Date: Mon, 12 Aug 2024 11:40:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, linux@ew.tq-group.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: tqma9352: Fix watchdog reset
Message-ID: <ZrmEFspwf/VApD34@dragon>
References: <20240715093231.1786257-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715093231.1786257-1-s.hauer@pengutronix.de>
X-CM-TRANSID:Mc8vCgB3HyQWhLlmlDBGAg--.37597S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERs5ZWa5gW0KrgAAsB

On Mon, Jul 15, 2024 at 11:32:31AM +0200, Sascha Hauer wrote:
> On the tqma9352 the board is reset through an external PMIC, so
> set the fsl,ext-reset-output property to enable triggering the
> output pin on a watchdog trigger.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

