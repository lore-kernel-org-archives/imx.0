Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DEF5CB8
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156562; cv=none; b=a+5euC2qmObX6KHmljj21y88jHT4X3enz/iSPa7H7IL9Tt73SMhbLMq5s6D3OfexiXOFW19ls8Nogow1Xrv31QCYMO1UJtECIWqChs2sc9Y7ybgN34nT4lL1G24vjRpotgAXwFwGcl+SkAm8nlJEVv76tTlMvN+y/hKFdievksM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156562; c=relaxed/simple;
	bh=JWabqzFfdfHDY5VXB1QNVz3uYR9IzYBLiOTvssAvKoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK+toTzieJNutG+fKbHKQmsE4avVN8HVoDZi44G34oOlXHFtEA+QPq93t9TvVL1FfG5yhNcjF7dVLdMe6BVUg34NQ4khCIWWDTLX+166oHkli1i/xHzb3CtQyopjBgyAHBvghid/rUnJyRedF5BadO/RoqnwTCK0bdJMb+9pK00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bWPSRdcm; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bWPSRdcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8+YKKCmfji2YTt+NeUXJzgiQgBkMcY806Vacbq8VGt8=;
	b=bWPSRdcmg/lB2bXoMntFK0KLofvk1KjTyfmMCdCKKcikJhDTZbOxnvVhhTmxU2
	YujQzaWPPEtEmVR/HcUg8/1jRkhysHiL0nPI1QuI0odBubnXzNB+0R+q8mURppWP
	pHQEEP2zLz9qzj9Rx2OAag8maqKScUzbvfzW/gcmzt88A=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnu+Wm1RBnkL8wAA--.1316S3;
	Thu, 17 Oct 2024 17:15:19 +0800 (CST)
Date: Thu, 17 Oct 2024 17:15:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/3] arm64: dts: freescale: imx8mm-verdin: Add Ivy
 carrier board
Message-ID: <ZxDVpbynwzKgNQtF@dragon>
References: <20240924113048.125761-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924113048.125761-1-francesco@dolcini.it>
X-CM-TRANSID:Ms8vCgBnu+Wm1RBnkL8wAA--.1316S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW5Kw4rAr13Ar48CFyrCrg_yoW3ArX_uF
	WxKr10gr4DKrnrtws8Ka17Xw4vk3yFyr1Fq34vgrn3XF9xZa98AanrKryrXFnIg3Z0qF93
	J3WfKrZ3trWYkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0tl1DUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBA97ZWcQ0T0OSAAAsI

On Tue, Sep 24, 2024 at 01:30:45PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add support for the Toradex Verdin iMX8MM Ivy carrier board. Ivy is a carrier
> board designed for industrial environments, supporting industrial
> I/O interfaces such as CAN, RS485, RS232, Gigabit Ethernet, 0-25mA analog
> inputs, relays, PCIe and more. The board also includes a TPM for security
> applications.
> 
> https://www.toradex.com/products/carrier-board/ivy-carrier-board
> 
> João Paulo Gonçalves (3):
>   dt-bindings: arm: freescale: Add verdin imx8mm ivy board
>   arm64: dts: freescale: imx8mm-verdin: add label to som adc node
>   arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board

Applied all, thanks!

