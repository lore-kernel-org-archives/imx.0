Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605462063FB
	for <imx@lists.linux.dev>; Sat, 22 Feb 2025 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740214798; cv=none; b=YbPPeYvQZ2GUpPdZ+7hCi25nqYX1gXdfrjXiqpg+dg4yrLahpnMlIr8tBg3eCT6fQIbL4TYYfPRiCP/pHx9JPSHns6CT9HcbDoH/5Qo+h3AJPI7M5OiTutk8QctTjDuN3eP5+wnecyu8ycZDdstyTReHXCuiwFW+jqu1MPguhEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740214798; c=relaxed/simple;
	bh=1RsyIBrd/lKJdHWdJV0umjIe4T8GMvgP+vJ45Pl8ico=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASKjcMcfa1kLH4n5ItFq2xMURg5BcJgOiuRwcMSGJ4wp794swcwba8tUmP/GncIoDLqEzrvreWCqCZb63rSKRekwXKiZVGLUwt0+CAGUDBe2OjTifECmboS8yuGG9kIxpWsZ8hXlsgJon9YX+i2D17glO4nOCkuE5gvBZUJNn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EB/CgnJh; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EB/CgnJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Q6FAWBhfs60pu6OhdgDHuN8n9DU58L3ZOK6V1wpeXKQ=;
	b=EB/CgnJhBXtcC8VlgGWwqzGqGa8DAFbvLirRbGq24hVt5WpMLml7rdum8r6uY6
	iggN4S6DH6TtqioKjznyXtv6Lctwkz7xLkjFmhYjg9uDTMfrL7G8GCKpiW/UcIGM
	Cnp9cn/vcPpfqy89gC5Uj+ibqO7gPVcF/0OTVTdHIlDiM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHKVLlkblnMNy2CQ--.23671S3;
	Sat, 22 Feb 2025 16:59:19 +0800 (CST)
Date: Sat, 22 Feb 2025 16:59:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	shengjiu.wang@gmail.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: add clock configuration for
 44.1 kHz hdmi audio
Message-ID: <Z7mR5cXC3p0IA67x@dragon>
References: <20250120094632.13894-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120094632.13894-1-eichest@gmail.com>
X-CM-TRANSID:Ms8vCgDHKVLlkblnMNy2CQ--.23671S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc8nYDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQL7ZWe5dcBkgwAAsZ

On Mon, Jan 20, 2025 at 10:45:22AM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Currently, HDMI audio cannot play sound at a 44.1 kHz sample rate due to
> a clock frequency mismatch. This update resolves the issue by allowing
> the sai driver to change the clock parent to AUDIO_PLL_1 when the sample
> rate is 44.1 kHz. It also ensures that AUDIO_PLL_1 operates at the
> correct frequency for this configuration.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Applied, thanks!

