Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DED18C31
	for <imx@lists.linux.dev>; Sat,  5 Jul 2025 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751697647; cv=none; b=gp4QCRp5QD7g7tOswIkKBAa8iM9aAxP4X4fDZ1At3IERcmnrcQY52w+KMBb/y8o3iLrIg0yAPW4UXkcP7KgEjTXmy+AQcfmuGWMVMfp8l5LXGzECg18bIXcUAaPvB4wt0EhhD7a5JmXQ4L8+dbwGnFRHDPFGeCc8FLn6h1JHdxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751697647; c=relaxed/simple;
	bh=bU6RYwkwmYEew8hzTN8Du0XBRw5MGvl84KmxrqA1T+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozcAYNavZubURI7+hoD02K5Ll93brL2WK3lRTcE1jtD9IHOldI2hJY7JSu/gU5AwDAtumIghsd/6UhOl0vNFXY72OVK3G6a/tNnJoG5ZgDpxDbn1vR2rIuFlEVfRIS55uDfx/Jc5SmFkb8HQpb1oSH5mbvWHeiA9/RAuv/3ayvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pU1pk8pB; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pU1pk8pB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=uqWFS4wWx0xOZ6RvV/aWV7u1huZXU21cmNlTtOrWHP0=;
	b=pU1pk8pBi41IM8nCvJQpqVrJcFY4UPdUmgU+ORQURGYm6ZYMMjuguI+jFXYBa5
	U1tEDw/0fZ2Zf61Jprl/+4dJMWDJmAU4r72PUmiYPgc+wuazoUts6kut3y82SC2I
	krwGtU+8TjVWBR7uoN8siP4FHq7npkwy2vMXEs2fa70+w=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHH3vFyGhokBEaAA--.30185S3;
	Sat, 05 Jul 2025 14:40:07 +0800 (CST)
Date: Sat, 5 Jul 2025 14:40:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx8qm(qxp)-mek: support the wm8962 codec
Message-ID: <aGjIxUmnVUpKoNas@dragon>
References: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:M88vCgDHH3vFyGhokBEaAA--.30185S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOmhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR6BZWhot24mNgAAs6

On Tue, Jun 17, 2025 at 10:52:18AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> This series adds DT support for the WM8962 codec found on the i.MX8QM MEK
> RevD and i.MX8QXP WCPU MEK boards. The WM8962 codec comes as a replacement
> for the WM8960 codec found on the i.MX8QM MEK and i.MX8QXP MEK boards.
> 
> Laurentiu Mihalcea (2):
>   arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
>   arm64: dts: imx8qm-mek: support revd board's wm8962 codec

Applied both, thanks!

