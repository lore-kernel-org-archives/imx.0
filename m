Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0D61D130D
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725112375; cv=none; b=pyE4bjSzL8VhsQ+0rtd3LjKqMydjb6ZoCQV22mjCd5oy1L592usgJaVdO8YPjsPoEktbC4dWE8wBegBrmLwCnE+yZwpGhK3f3b7KjG/nH2i6BWESAeZFUT5I9ZFz4y1wsV4sN37L9eh//tcqgDkAdHC71pskgAewD7mQpg5UlK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725112375; c=relaxed/simple;
	bh=M+KJ3JlEHvAcWIsmeepxfWEbWTdsn+cPRS/UmPsbP5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjbqCOPnM01iUD4E78Nl7BBwVzAJpHZAhfW1Fk+zyC4XBPMEsoDyF2ymwbw8P478nuTBgh73iZoVMWmS1dsGjkH3rRAQRI3SmtENY67u46bi6XHBbD0O4sBdHT4ezEHVap+cWPYddfevxs8l95mOLZAxwmyLda1p7liy1ZzvDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YxdBjcpi; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YxdBjcpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aeCtCaEClwDYj7w0cuSTEOmRrvqwWnpIhJF287IHHao=;
	b=YxdBjcpiTgiiSfBNkz7A0mmJN7x7VRVqW1eIb56njG8zNhqeSx6YSt+4umSksc
	0iONZv+Sc7Nih8qJL7ScaGgIGsyupTJK+/dRBqRndHpDiDzp0MjNQcE1EDrSqHvo
	XDKvKpuMMeLA/xPwC5U6Q8K3wlSaUNdYw/3lhMYm49r/c=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v14eINNmiOk6AA--.19785S3;
	Sat, 31 Aug 2024 21:52:32 +0800 (CST)
Date: Sat, 31 Aug 2024 21:52:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/14] TQMa93xx improvements
Message-ID: <ZtMgHrZPnG1sKmsR@dragon>
References: <20240819120328.229622-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819120328.229622-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgD3v14eINNmiOk6AA--.19785S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr47Xw1fGw1UZr1ktw13urg_yoW8Jr4fpF
	yUJr4kGa45trW8ArsrXrn3X395G3yfGF45uFs8XrWxK345AryaqFyFyr48WrWagw4IvrWU
	tF4rJF1jva4rXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2rWrUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQtMZWbS-GE9EQACs0

On Mon, Aug 19, 2024 at 02:03:14PM +0200, Alexander Stein wrote:
> Alexander Stein (7):
>   arm64: dts: freescale: imx93-tqma9352: Add PMIC node
>   arm64: dts: freescale: imx93-tqma9352: add eMMC regulators
>   arm64: dts: freescale: imx93-tqma9352-mba93xxla: enable LPSPI6
>     interface
>   arm64: dts: freescale: imx93-tqma9352-mba93xxla: add missing pad
>     configurations
>   arm64: dts: freescale: imx93-tqma9352-mba93xxla: Add ethernet aliases
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: add missing pad
>     configurations
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: Add ethernet aliases
> 
> Markus Niebel (7):
>   arm64: dts: freescale: imx93-tqma9352-mba93xxla: improve pad
>     configuration
>   arm64: dts: freescale: imx93-tqma9352-mba93xxla: add irq for temp
>     sensor
>   arm64: dts: freescale: imx93-tqma9352-mba93xxla: add GPIO line names
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: add RTC / temp sensor
>     IRQ
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: improve pad
>     configuration
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: add GPIO line names
>   arm64: dts: freescale: imx93-tqma9352: set SION for cmd and data pad
>     of USDHC

Applied all, thanks!

