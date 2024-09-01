Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C16A41C73
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725181931; cv=none; b=TBy5eOEM66RZYzeFPAgC33J3XNRCS2/k8iZF9ZiBzbw/qehA1a64Yhi488v/w82+D/o2RyuR/U9ooYweCKQnTBzYjy828qaLowTsrScx93kCRQC8ebHPd9Jns0ieqo5/RCS56fzarO1npv3sXyqRlXn2ELt8zgowyKC81FEDVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725181931; c=relaxed/simple;
	bh=cmYNT5S0qfMVfLTDfqNsumB8zTDkIjF4Bt9pmtpz9zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRnBMJhQ2r8UNZso6YM4DuTwGJAgb5AVp11cXjJkHnUlwDe21I0rfrsQBTyEZkYCrJshpjf/CfMzFDcy2No7qaw4uZBGqYN2c9yNmfoMK9KD1OSGWIVf1t/au5lQir4N/d5XaY+RsBfW4+qK4HJ7IlaMkITTnpvYs0HDN+wMsLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UAiP9Yli; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UAiP9Yli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cgFI24ocR6b/eVGC3R3NeznnmdVG4p1OYniHdh2gE1s=;
	b=UAiP9Yli0cg83XIe9C1XH0t5DB+cNvSMQ8rRboSqZ6BM3ibaGMMpiop0273VII
	Mb3EdP+Ewn/rw9/JbrRD3EnlxOC8O01OYbirYY72YFJIyC+/yrpHlZtnlAcDms87
	jCIMiZ6giY5agikxi3pp3qw/Vj7i2S4oZLYtQWQexz83I=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3X0nEL9Rm3QhFAA--.21923S3;
	Sun, 01 Sep 2024 17:11:34 +0800 (CST)
Date: Sun, 1 Sep 2024 17:11:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
	quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	arnd@arndb.de, nfraprado@collabora.com
Subject: Re: [PATCH 0/2] arm64: dts: imx93-11x11-evk: Add PWM backlight for
 "LVDS" connector
Message-ID: <ZtQvxJi7lRBGRjvL@dragon>
References: <20240827064717.2383292-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827064717.2383292-1-victor.liu@nxp.com>
X-CM-TRANSID:Ms8vCgD3X0nEL9Rm3QhFAA--.21923S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUarb1UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgtNZWbUDStNBAAAs8

On Tue, Aug 27, 2024 at 02:47:15PM +0800, Liu Ying wrote:
> Hi,
> 
> This patch set adds PWM backlight support for "LVDS" connector on i.MX93
> 11x11 EVK.
> 
> This patch set is based on next-20240826 and targets for v6.12.
> 
> Patch 1 adds device tree support for the PWM backlight.
> Patch 2 updates defconfig for ARM64 to build ADP5585 MFD/GPIO/PWM drivers
> as modules.
> 
> Liu Ying (2):
>   arm64: dts: imx93-11x11-evk: Add PWM backlight for "LVDS" connector
>   arm64: defconfig: Enable ADP5585 GPIO and PWM drivers

Applied both, thanks!

