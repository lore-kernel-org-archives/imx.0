Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC632367B1
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365064; cv=none; b=J+F+ugGHVZIbA6XUdOCj4k7E6PfZJhzqk3oRttZmwLPKJZ5sHMXwl3uMY71axNTTE4cmOWFLzifRdaC7E+qiPYlhn8a2WzXoNdNQJSSM3pOHQUzD6Gabp4l6avq6Y5TrVGziaNTlmVkw2cgHHJjs3+qb3MPO37k6ZH3VLHpBmzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365064; c=relaxed/simple;
	bh=tDMifouIIip/tg9fh46Bk6xjkcaA79k1SoUewmzsplE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtOkpi0UJaw+1fQRb/e0HxdKVRxl6uN+yX6luWPRTadkhLe4q6rxpEFD3m4vABRAidsscKcd2ZtgY4qkk/t7iUzEI4+S6/49fQm1OtuelswK6Vlqt/HymTsE3sWa8voG/t6Ept9gAwxeMLksFfhRGpQVFEHkfCFmXs8xqAxBKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OzOsME4S; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OzOsME4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FwWG8EAzKyju2ovmVpNM1zaGxigyV87GlRZT34i7jEc=;
	b=OzOsME4SUejXZXRUHNAw9BNQri32GIpRd25+TV67NIkjLVWPxv2SsomPyDSX5K
	kxpPjUpQ3gNiXJq4E3SiFu0uSZ87pSKW1hYC+4Pkqs2mXXehwACEJR+etDRdImSv
	2kRllq8jQpqTEYVNx/B1Ep8yhX7SJQe/UKsPL4qXLf82A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v1pitWNoVEw9AA--.20470S3;
	Tue, 01 Jul 2025 18:16:05 +0800 (CST)
Date: Tue, 1 Jul 2025 18:16:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Frank Li <Frank.Li@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/5] Support i.MX28 Amarula rmm board
Message-ID: <aGO1YiHpGb0EmWbv@dragon>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Mc8vCgD3v1pitWNoVEw9AA--.20470S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8uc_UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgV53mhjtWUsrgAA3Z

On Fri, Jun 20, 2025 at 10:06:16AM +0200, Dario Binacchi wrote:
> Dario Binacchi (5):
>   ARM: dts: imx28: add pwm7 muxing options
>   dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
>   ARM: dts: mxs: support i.MX28 Amarula rmm board
>   ARM: mxs_defconfig: Cleanup mxs_defconfig
>   ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

Applied all, thanks!

