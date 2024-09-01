Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7701859
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725153444; cv=none; b=Kr7b/y4QWt5TAa1/pWpwLXK7oB55nZMbI0/C1ZZJs6xB+FpkZxvPuxqE2g+3f8z7Ce9gag/EnSZS6jUJEYP4gDItEfxJGv6ebEaCMB3XfKunci2gKZ5yvygyPssTh3nkFjT/ceekQhmp4+UGuddmDwVfv6rZVa8L8gelUfy971E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725153444; c=relaxed/simple;
	bh=7/pXSxW79joSiseYS8HmEM3FxeRV8+V7Nez80v4KWYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrALuFJlGxxtmNMULrghAzpnR2m0cNx2arfKSjmPKncV0sQu5m2unLq6LyNSGX3sk7d1H1lPafY7rzIXo+8K2KsjShjXcPpTrOa5lL0YuGbRJMOgLz/4qchSx80iDbKvCclLmB0jbVfEbyMV7eLPPM5rKhawLwrUQ5PoJGZZ+Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nVqYlVrc; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nVqYlVrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Lzfe1+irGYJwXkhyIj4LhNfAhozYETplmmOeOoVgFxE=;
	b=nVqYlVrcgfW1Vyjm0RUub9Am6eCshi/K4kyNaTeUIBMttlL4ag85ujqZIXykR4
	ZjZ7MCU7NEcHKypFckWEtPyNJRHYZMqp/R4RCG0vejh/nABJ7BJKJXZ17wfH9KI9
	P4V08ZvQ3Wde2xUvGamoeJe8V4589iNqu6vDbZXGHaTh8=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXPzxzwNNmSFFBAA--.17452S3;
	Sun, 01 Sep 2024 09:16:37 +0800 (CST)
Date: Sun, 1 Sep 2024 09:16:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v7 0/2] ASoC: fsl-asoc-card: add S/PDIF controller support
Message-ID: <ZtPAc1iyGOKJtnNw@dragon>
References: <20240820112827.126380-1-elinor.montmasson@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820112827.126380-1-elinor.montmasson@savoirfairelinux.com>
X-CM-TRANSID:Ms8vCgDXPzxzwNNmSFFBAA--.17452S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVTKZDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAg9NZWbTjjJY3QAAsp

On Tue, Aug 20, 2024 at 01:28:25PM +0200, Elinor Montmasson wrote:
> Elinor Montmasson (2):
>   arm64: dts: imx8m: update spdif sound card node properties
>   ARM: dts: imx6: update spdif sound card node properties

Applied both, thanks!

