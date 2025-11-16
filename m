Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F57EEC3
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763287337; cv=none; b=hH1tKV/0CrsvJcAaCPuC2uJ+PBWpNq/QC2+OezcQ/TJpGPvjxsK8IzWLyA3CWjdH77w8GgrVTh93N7YMOsoAdq4/m8q64KFkJmvnAVmPYqCyXrqZ8pPUM7gshfUSKPMs94eZlzYtq0EHIdwbCF+DIuAOKErNTMpSxpoKhobzfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763287337; c=relaxed/simple;
	bh=uAW3blsz55enleivTpN9Xw1JgjjXuVWxHWLz0MZc6+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ86wvgR+ewb/q5b1RemEcLYRuikpQu6HcxKUU0lDDNkh2C6ijz3xjxj6MpXni3i8sr00aG1CxzlY3qf0/5CEtcp4yHKt0MZAJZy/oGX7dKTeVrVgIpIo5vscvz9vQFaTHnUOPyj5NMnfJSo4LAtt+BCsHuybdCn6PGs8T1GV0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NgY/oeuO; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NgY/oeuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8mkFSpSXqhy3JNKuZq7z1gqffCcwGeVX1rPlpkQrCOA=;
	b=NgY/oeuOAaDhu16In1tbHjJuD7+j7BXkEayRvDJNiO2iR/SSxD/KF8YW1DTozy
	SDpWwwOoL/JthFdULy0EV0vCctO2xy8yHXNzAYAsbeEfZEdVBGh7SHR4l1SVGvkL
	3G2vGkJiJLw2/K1Qhu/hS8zKySliB+JgnscPZbyyX4fy4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnPs4PoRlpOsYjAg--.8123S3;
	Sun, 16 Nov 2025 18:01:52 +0800 (CST)
Date: Sun, 16 Nov 2025 18:01:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] arm64: dts: freescale: imx93-var-som: Align DTS
 with hardware revision
Message-ID: <aRmhDvdkEvD5cir2@dragon>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
X-CM-TRANSID:Ms8vCgBnPs4PoRlpOsYjAg--.8123S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRANcmkZoRCEFwAA3I

On Thu, Oct 30, 2025 at 01:01:20PM +0100, Stefano Radaelli wrote:
> Stefano Radaelli (4):
>   arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
>   arm64: dts: freescale: imx93-var-som: Add PMIC support
>   arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio
>     codec
>   arm64: dts: freescale: imx93-var-som: Add support for ADS7846
>     touchscreen

Applied, thanks!

