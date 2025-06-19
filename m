Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6F821B9CD
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 04:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305909; cv=none; b=r8YKgUkMNYFbxF4FmZVsV9gAFt6jqg1nZ1YxoscoxVStu8oL7J5zOINghnt3km3JcthEnl6GPkLlKYiXra5aD9oGhktrX20HXB/W1Ca12m471sF2klgO2pSqqYtbTr1k/s1Sej1+fCekRT67ONU7cUR2UsDiIp5b5wihb59RuxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305909; c=relaxed/simple;
	bh=DIG5albF6lOxDimZvvSfwW/v6tUAmJv6CFsTPIwACj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGihT9ebTuQzS7jAEcu6SZgFV2HC3I2dOjGJLdtSBrgOzu2pPPL27ReXBaYrIM5/6RK3CeRr4IEiM4q22AZi8nFtPyLoz+NFSApYCjqEd0WeUgpEKFuEgraRtbTAQqszaje8Qs1Mk2muqC6tV7PahGx5AlmI+O1ArseYXMPelF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DD9uyEy9; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DD9uyEy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SzXacRK9YyFVZryxioMdSBKnpxohJunnJcdvONlrj6s=;
	b=DD9uyEy90xjxZI9nMIRPXAkeq9hWWuDmp7fJSn8SaodTOeG9gRBe6H8p4pR/2u
	Ht/s+uJ4KBVe25WCd4+Oste0xNIeqKsJqnGztSCOHrfUMouYfuviEWP9l6PK8/w+
	lCBDJpkm182xoD/NARtXY5o3QgdM8l60x1iECvsQSKxK4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3rw5SjFNo5nn2AA--.35256S3;
	Thu, 19 Jun 2025 12:04:36 +0800 (CST)
Date: Thu, 19 Jun 2025 12:04:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 8/8] arm64: dts: freescale: Add the BOE av123z7m-n17
 variant of the Moduline Display
Message-ID: <aFOMUq5JcovQEW5V@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-8-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:M88vCgA3rw5SjFNo5nn2AA--.35256S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqXDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR1xZWhTVBnN5wAAsU

On Tue, May 20, 2025 at 08:34:57AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add the BOE av123z7m-n17 variant of the Moduline Display, this variant
> comes with a 12.3" 1920x720 display.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

