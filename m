Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603865025E
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718521760; cv=none; b=sGUPhkljBGh0tmJuSkZ3sMHH/4tWx63zK1HijjX9ydm/lkZj9m5CGuyMEXM3w1fT097+PaLH3f0mVmqwGbnOYfHdg8ZdVzL3v4bqRAHhTFB0w4cguX/Sp4avc9gpdLmleJOCgA6UHhcybjZrQ1Qo/3riS4Un2Tkpmtx3MZJtwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718521760; c=relaxed/simple;
	bh=vZ0BN+iwJKmD0J8p1QINCDjKP75eZtW2SC1O6NI3ukE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptvLWIPjxb0YVeaSdcARaXCn3FTvwqRKuYQ/pqRm6Dy6JJDa6u2fiRfymUx0FYgJhIfyBhAGyyz1GscPvEDdkQd0KWVECZdoePOEuwHD08ng1V/spqylrsYh9QlnJK2No16q0WRdA4x43QkD368bw1L/zyr8AM0b7Wal6/S8cKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fSQoL1S7; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fSQoL1S7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hoopR7IVlqAk31RamLP5caSJX2yo8Er/Hi00JioDoi0=;
	b=fSQoL1S7o2B0aEjMy7ProFCXlOtQDDoRKFNDrGrnp6aNmbr1v2fCCSKqBLtB/f
	bhhEFXVxHD3qBb7ychvk/gfDkNo24Raxv7d3OZ3mHrLYy+mHSdT2OkcS4JYK+h7P
	PfxQ+L/ArlQW9k5QF6NQXVIBjFpMmkk/1zh6WhpsFHSn0=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrAB33vqHj25mmz__Bw--.39420S3;
	Sun, 16 Jun 2024 15:08:56 +0800 (CST)
Date: Sun, 16 Jun 2024 15:08:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v2] ARM: imx_v6_v7_defconfig: enable DRM_SII902X and
 DRM_DISPLAY_CONNECTOR
Message-ID: <Zm6Ph1FGsPYJCcbe@dragon>
References: <20240603-imx-sii902x-defconfig-v2-1-a39e442011ae@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603-imx-sii902x-defconfig-v2-1-a39e442011ae@linaro.org>
X-CM-TRANSID:ClUQrAB33vqHj25mmz__Bw--.39420S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4GQ6DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBsAZV6Nn4yK5AABsJ

On Mon, Jun 03, 2024 at 12:09:39AM +0300, Dmitry Baryshkov wrote:
> Enable the LVDS-to-HDMI bridge and the HDMI display connector drivers
> used on the iMX53 QSB and QSRB boards with the HDMI mezzanine.
> 
> Cc: Chris Healy <cphealy@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, thanks!

