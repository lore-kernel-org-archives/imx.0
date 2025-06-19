Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7623A98E
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 03:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305302; cv=none; b=bYKY5JupdgjAuYE+5ekIbASFDTcxuTtXHJB7LHW4zBa1SsPw3y7kslPOksWwOZYbF29x2+1LxrPn3bG22/AZ8Eo/aPXSTuOlhV9L2Du628BtuIL5o948Q6wDLpTCZOuvw9kl2iyeyPqBPW7+KWd5Q1vNPUxajolIkcyIr2Egw+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305302; c=relaxed/simple;
	bh=AAYnKV+Ib6IADL7L7vo20VmbTbhdkeLrlyQxqalj2Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TABO3BB2A+h0Xb042jO7w/X5apvW27zuyM18y7lJ5fN56C/WLplTM/MKjYVHH2LOXET27laRYEjhdwSBlQr2yg/GlCfQDKUJj1F9TaVctJon8y9E2FYB6yDNWqyeolBLSJGDi5nt4iKmRVP/H2sCc4FyzwQHDECf8o7qRq6qM9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=c8r1P5P4; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="c8r1P5P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LU7QhYjxOqOH4zbvw6oM0dtf5fFvFxSixl3GW1jJGTw=;
	b=c8r1P5P4xE0Kb3/i+H2dW91s0RkOZn33p8n76h5J7WpdAfONeFvuQYZ1B7936F
	EK/EPsIEAzrXOu1pQ6ERZKymZQV3Z8VQhybSR9Z/6MCo4yb3obETCifpFGzJoF0B
	TC/HLpaHvgH+aE3WKx1JA/OCruq+eSOsSYCQsB7CtBsUQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHZsPUiVNoFnv8AA--.41662S3;
	Thu, 19 Jun 2025 11:53:58 +0800 (CST)
Date: Thu, 19 Jun 2025 11:53:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	peng.fan@nxp.com, wahrenst@gmx.net, conor@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 3/3] ARM64: dts: add ngpios for vf610 compatible gpio
 controllers
Message-ID: <aFOJ1OXvpEP8gaxL@dragon>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-3-04771c6cf325@nxp.com>
X-CM-TRANSID:Ms8vCgDHZsPUiVNoFnv8AA--.41662S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW5Kr4fXw4UWr1kKFWfZrb_yoWfArc_CF
	W0qw4UZws5uFWxKw47Kr4Ivr18Ca4fZw13Wry7Gr93Ja4YqrnrtFs3JrW3JayUWFs8KasI
	kry5tr48Aw4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbUKsUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIReG62hTideU6wAA3B

On Tue, May 20, 2025 at 11:46:14AM +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"),
> the vf610 GPIO driver no longer uses the static number 32 for
> gc->ngpio. This allows users to configure the number of GPIOs
> per port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Historically we use "ARM: dts: ..." prefix for arch/arm/boot/dts changes,
but use "arm64: dts: ..." for arch/arm64/boot/dts ones.

Fixed the prefix up and applied, thanks!

Shawn

