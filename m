Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754FF23B632
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547426; cv=none; b=hizHgon5kD7UYsZ1wwGSVzYilU6kvdXwnxBYccvNVEMibdx1cr8Oc66ipGYH/4+k7l1HpDNC62XepvqxPI+pGIAH1XBlAY//V7m05vwyKhsw6jFbjjVF/c0Ngfck70n0ojiDeu/z+PhGK9EwAF5SnplttbNpsaaJAg8HYH2vvWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547426; c=relaxed/simple;
	bh=8Ts8bnoJYVaGd8hjxKsPXct/uWQ+Rb7O8dFUbxzpBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjxPs6V4mcdLERMzh2YvTS0g/G3bV293Szm0rQbZ8Fh0bo1IQuXND+blE04WXlmfEMYnPqCZEFXVuYFjU3ch+ttD58HKe8Yl4o84ND/UmCgszp8lPLft8by/9/tjioHuMSk59Jtk5cAkUH4rXRvMZTmHl56MFDvL3h1qeWepkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=J8HYMHYK; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="J8HYMHYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=N0Po5eBoI+p6ziuP9nX8EocpWpS0/rxUwsi2jvun0Ws=;
	b=J8HYMHYKnxAF8/KS1yT8gIJlapMKsJQzlzIlACEEd7stvhhdjyCSnsddwto0eR
	nHV2qPY8YVH9F9WvmCd7I2/dWkWWZXwsr1vsIuih3hqXyekwfEnb8sQ/HoNd0k7P
	pATGgKZvPnBREkQnOk0P08WC26vJpzT+R7/w0afLX2Nd0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3n1aKFP9oQve+AA--.28929S3;
	Mon, 27 Oct 2025 14:43:24 +0800 (CST)
Date: Mon, 27 Oct 2025 14:43:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] ARM: dts: imx6: trivial change to clean up some
 DTB warnings.
Message-ID: <aP8UiqYFJVm81bGf@dragon>
References: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
X-CM-TRANSID:Ms8vCgD3n1aKFP9oQve+AA--.28929S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryDWw4kXw1xCry8Xw4UXFb_yoW3GFg_W3
	W3C3W7Aw47Cw42kw4aqrnF9FyDKF1Utr4UXrWrWr4Yq3W3AFnxWa4rta4DWFy7Cr4fXw1q
	gr1Uuw17XryxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb3l1DUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQ1Cp2j-FI19oAAA3a

On Thu, Oct 16, 2025 at 12:00:04PM -0400, Frank Li wrote:
> Frank Li (11):
>       ARM: dts: imx6: rename stmpgpio to gpio
>       ARM: dts: imx6: rename touch-thermal0 to touch-0-thermal
>       ARM: dts: imx6: rename m95m02 to eeprom
>       ARM: dts: imx6qdl-ts4900: rename ngpio to ngpios
>       ARM: dts: imx6: remove gpio suffix for regulator
>       ARM: dts: imx6: change voltage-divider's io-channel-cells to 1
>       ARM: dts: imx6: remove pinctrl-name if pinctrl-0 doesn't exist
>       ARM: dts: imx6-tbs2910: rename ir_recv to ir-receiver
>       ARM: dts: imx6q-utilite-pro: add missing required property for pci
>       ARM: dts: imx6ull-phytec-tauri: remove extra space before jedec,spi-nor
>       ARM: dts: imx6qdl-nitrogen6_max: rename i2c<n>mux to i2c

Applied all, thanks!

