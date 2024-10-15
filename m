Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186141C8767
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979757; cv=none; b=KDq96gkMxCvr1RC4YJm1yXGnRZTzKiywDWt/5ggd54HbJ1SOP8t4LtB7R0q0Tyul5FB8K9TFhWvRZFRb96SQsP+lpDKrwPCafAm7ooQ1gLv02iTuWVfrvE74MYORW7oBLEwxopst6JUwQIPRQa5OMiuWNP8XXZtj8cRob9ovoBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979757; c=relaxed/simple;
	bh=t3sEdcPl4t0kzq0n8YkPIMG3A22CLK1lCGNiS88mZY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+jrX7CB4Fab8XQR9s9vg3xKJTKK6dsBMr40UbWx5XwT8H5nCflheGabyKfFnVWa0ibELJ+oAkdpcqWck7yIx6Ke4GM1jVtKQH0cyQ6RDaNDAMQgHj1hLRQnBuqAyXPScp9mdMTBt2xl/TQs3XYSxb2i/8aY9yRvZCqvjxVAYXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jgY0lHK5; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jgY0lHK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=AcpoIiyTTEPEyHLpa+DZ5Ssn9s/ruKNgo/dm3QnpIhE=;
	b=jgY0lHK5ggXbgF9usPiF6NDaNsPwCYVy9elJeOHI8E7CTPDpZsarEH97I1nV1C
	VNu6rIzPDyERMrdERq4Rko+RvDJ6dC36Ut/Rp6eWHCfj7tV2DOO7zWuMnmoy/d4H
	jJeG184WBAO/CWWpCt9rz44zlEPhw+TZDFAh7LbxBP5ls=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHTxj_Ig5ncaIDAA--.6203S3;
	Tue, 15 Oct 2024 16:08:33 +0800 (CST)
Date: Tue, 15 Oct 2024 16:08:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: imx8-apalis: Various improvements and
 additions
Message-ID: <Zw4i/670z7QLBcM1@dragon>
References: <20240903091231.20035-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903091231.20035-1-francesco@dolcini.it>
X-CM-TRANSID:Ms8vCgDHTxj_Ig5ncaIDAA--.6203S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1DXF47Ar1xWr4fJF4rAFb_yoWfurb_ur
	yFgF18uw48KFWfJws0qFnI9rW7Ww15CryFqryIgwn3X3s7ZFy5AF4ku34fZa1xKFWFkr4D
	A3Z0g392qwn8WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0tl1DUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhF5ZWcOEpU4vgAAsn

On Tue, Sep 03, 2024 at 11:12:26AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series improves Toradex Apalis iMX8Q support adding:
>  - correct thermal zones
>  - analogue audio
>  - USB Host (Apalis USBH4 interface)
> 
> In addition to these it also removes the adma_pwm from the i.MX8QM SoC dtsi, as
> this IP is not available on this specific SoC.
> 
> v2:
>  - Keep I2C nodes sorted by address
> 
> v1: https://lore.kernel.org/all/20240826221541.15669-1-francesco@dolcini.it/
> 
> Andrejs Cainikovs (2):
>   arm: dts: imx8qm: Remove adma pwm

arm64: dts: ...

Fixed it up and applied the series.

Shawn

>   arm64: dts: imx8-apalis: Set thermal thresholds
> 
> Hiago De Franco (1):
>   arm64: dts: imx8-apalis: Add nau8822 audio-codec to apalis eval v1.2
> 
> João Paulo Gonçalves (2):
>   arm64: dts: imx8-apalis: Add audio support
>   arm64: dts: imx8-apalis: Add usb4 host support

