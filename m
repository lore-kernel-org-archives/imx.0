Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54A6125CC
	for <imx@lists.linux.dev>; Wed,  3 Apr 2024 01:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712109063; cv=none; b=GyezsfsezFg3XSj9ucCeFg9VtckkkGqhncnPdl8mvmfC3WwejUE0lWMia9gt6a2CEBmk38iYcVTLmsvGtpbmB5R0x5NHxtW1on53EWyg9ENUWRdUSeWQSAruKXgB9N4gQ4GOCVddxp1vZE6FKjVD9KbX2MPPvPaEGH3raSHnaSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712109063; c=relaxed/simple;
	bh=AUn408o5zF2Evj1dSYZFE/QDZDOFRaaeO0o7pv48Alk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUOnjReLjzlpzd7lTxymFD7UYmAsDgVymnuIvx6xTAqpUg3mfmqeUQnu/z0PjXu+jJgWnfgs80qU/t+tp5J1Nlctk582RVn544wZflKNn9cZzBtdFJPEXPHKb6u7Gt98GPH0nryXSWsUGD4h7ye7RCu63ZNMwfHLEHdW08b+b9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BeMuzgLd; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BeMuzgLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0ZpIemGJwBDqYoWurg9vfIC28+h0FY31ig8VDbMFrmw=;
	b=BeMuzgLdnvGuLOCMkTbmQAwjVJMeBmhogr59a3iI4UXujVHaf95L2PLet1RIbZ
	ogkpYCJ7IJmhCsk+qtJOcIkf47pYutC5fVYftaBOuBvZwlBvk81/aYm+2WWQpspD
	uaY7iXNZyFPeI53q51eCPf0vQng2jYROjsjc6A9KbCp6U=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADX32X3tQxmi8CtAQ--.14739S3;
	Wed, 03 Apr 2024 09:50:48 +0800 (CST)
Date: Wed, 3 Apr 2024 09:50:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: arm: mxc: phyCARD-i.MX27: Add USB support
Message-ID: <Zgy191gmlZ9No5pi@dragon>
References: <20240328-pca100-v1-1-58df67c2c950@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-pca100-v1-1-58df67c2c950@pengutronix.de>
X-CM-TRANSID:ClUQrADX32X3tQxmi8CtAQ--.14739S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI5fHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFRi1ZV6NnBtGbQAAsi

On Tue, Apr 02, 2024 at 09:35:33AM +0200, Michael Grzeschik wrote:
> This patch adds the pinmux and nodes for usbotg and usbh2.
> 
> In v6 revision of the pca100 the usb phys were changed to usb3320 which
> are connected by their reset pins. We add the phy configuration to the
> description.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

"ARM: dts: ..." for subject prefix.

Shawn

