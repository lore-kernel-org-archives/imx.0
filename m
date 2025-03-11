Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD461E0E0C
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 01:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741657963; cv=none; b=jdMKMNwp0FX42oURyxXyKEC5263+WuW+CoA27mp8hWbig8JSrs2aZTNQdiwVuOVnkZrhVFSyywEAQ+jQh7c+ZYLAOmEqGnfTiyAscayBzcatGRmPVXOQS8apVNcb+32/okFUz4eMq7pquyL2JzOsBMpccwpW261n1786om7H7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741657963; c=relaxed/simple;
	bh=BePCeOBZ4CRUJOn6ITYHMdMXC7Jdn4+7xT6rUAg2NZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCvHFcBbxB9ajCR17ouNmspJDtWOvxK4V74O5XB4WLF2ml7fR3rAjLzHtHZ3DbvptwyEl4v8SStU22ogBS40ejCPaJVJVIZUoFBfBRW93B+/HUw90RXcqPTxrHA2w7o72oOekn2qD6kh+8qCC2/nacxww0aUDr2MHkLPsNeRVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bb/WEbWa; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bb/WEbWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Y2j5IpfsHdKFIq/wwefRt4BQxdOS5Lzz8+3jguMQeEI=;
	b=bb/WEbWaAcQBK5+/SWIhhJjQGY7QSw5WAcBBHbKVmjct4jdi2d60S4OI1j8Neg
	i4e7C7VVShbb16g7RpTN8y86Mfc5t0NkrYHEYeh/47CUvXLQgkax895lamkfoh7h
	kNQ7Ab3+rLlUtu3JY+H6kxNnS0Rnu5rdchdZBJPlZ6IO4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnJdRFl89nbBawAA--.715S3;
	Tue, 11 Mar 2025 09:52:07 +0800 (CST)
Date: Tue, 11 Mar 2025 09:52:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] ARM: dts: TQMa6/6UL/7: DT cleanup
Message-ID: <Z8+XRalDiwot8Xsl@dragon>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgAnJdRFl89nbBawAA--.715S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcb18DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERsNZWfPU+q+ZQAAso

On Wed, Feb 19, 2025 at 09:17:35AM +0100, Alexander Stein wrote:
> Alexander Stein (4):
>   ARM: dts: imx6qdl-tqma6: Order DT properties
>   ARM: dts: imx6ul-tqma6ul: Order DT properties
>   ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
>   ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor
> 
> Markus Niebel (5):
>   ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
>   ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
>   ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
>   ARM: dts: tqma6ul: Add partitions subnode to spi-nor
>   ARM: dts: tqma7: Add partitions subnode to spi-nor

Applied all, thanks!

