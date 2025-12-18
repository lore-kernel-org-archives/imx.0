Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC62D94BF
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093402; cv=pass; b=A4L8tX1xHSJx/jwbfCaFXR9e1yASvhTPb3ZF/x237s7WXvAws8zzIJfChQkMqGpI/+RXnPtCLZx5wBY87b+/1wv4FCbMtBi0T8R/GynRgNWDAWGNXKugSn9wCPT7jBHUyTgxihCDNBruWUsE1oyOpkiV6pTZblrrqMk5Z+0kzAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093402; c=relaxed/simple;
	bh=ZzvEed4sEkcv3SWvfOHQgv/2cRbBc1HpGi2Alr+EpL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwzbQE83Ud9aet1YhjY+2WHk5QnGXVwuBSFTDKPSf3AAq9Alvk5zF4WpyICPZxn8LzQftoP8tW/f/GS/SPvGCM4sAb96yB+MOkEk04QiuY3DB7Ne7LnewZ5R29fhdohITgsx9bsVl+cNVj5iVxYoowrisH+AeM6aPkdNH+S58V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=XMLEyWio; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=NbLdgIkC; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="XMLEyWio";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="NbLdgIkC"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-pn62.prod.antispam.mailspamprotection.com; s=arckey; t=1766093400;
	 b=QZMZJ6x0BM5L0XodXGdNMdo8RBnpl+MWRdUBFxO3eHs1/GTv/WAnAbqcvFnywsKs0fUrOK4C9M
	  AzqaEecstZbdorW7DWIPXYm1UIHQg5kj5uY56xXYqwSmKKXYPcsfTbMdVAkru2fsmTEDi21tGv
	  9r83rn2QXoaZ50vXEA0ArpsWgCfTSROFSZpXW3qttjG9N82imWNK/jM5+e1mklI7q/RQgLQlaa
	  wIoRaId3z7eQjgHg3xWLTxeyxuGE/1WQ5YZwNIgR5S2Bt2xMg0ZTSIT5dau8uYvcyLjmYfdTKN
	  XXpvx/CuSZBOTCe3rzmrPyHIznj56z/45VhgScJPPdm+Ew==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-pn62.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-pn62.prod.antispam.mailspamprotection.com; s=arckey; t=1766093400;
	bh=ZzvEed4sEkcv3SWvfOHQgv/2cRbBc1HpGi2Alr+EpL0=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=mDBQifK0QU01mdkA6AYr6nMjQIJQ4v9iZTaA6W6OyXga8+sfhd6e9ZTyFwE5MkRyGKaNYmFefK
	  asjhdA3Y2Pie9nslPL8k3Kt2WqSVVpdFj9yhW6JG9u8vhpW+R6tr5I8IsmnDVSvnq7WSGzUiZA
	  fu6ojdfZUKyhZxZFWqDYYnB/EekgIkH4JRs5DzQCDp4MmSv6naqqi6yY85Sj3RWCuFYyZBQj20
	  3qF1lKLTdP4RAbNrh90XgLSjCCEeRN6e9WXFprXs/H32x7ttE9ntSZ7O8eERdeYW7PAavn9tj0
	  voTk+jH5MbhxD+wZybtVF/58siVk03eQ1gHUdbMFv/+qHg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=tpKlTYeTCs6R8eO95vUUpCyeGtT/lX8I/YjZJmafD90=; b=XMLEyWioAyrbYKO92C8a2RpCqd
	qwdRF/3AVj04TWLMUn1WOnrGT7aM9TgggtZ1Y1uljKqJbAz+jWLy99rKmq4HVk1OPJZvUgoNgMsGU
	KljjpLj3MsUj0JPoWC9vUVb5LmdxgcaRw+LYNha0r82IbRoRsWMyM2floaqQVp8cCVq8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-pn62.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vWLZL-00000006zx0-280f
	for imx@lists.linux.dev;
	Thu, 18 Dec 2025 21:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=tpKlTYeTCs6R8eO95vUUpCyeGtT/lX8I/YjZJmafD90=; b=NbLdgIkCc+yH/GfSisI0WY9P43
	XnSIPYXmJf7kWE7vt8ZvjTnyLV9VgjFCywQfzLqCDigWle5tQll4SFHXwFfZQopdyB2NvDhZYZaHg
	tBE0VeTFYoAD9uVxdZrSOqaRYhNmohIIjo7/Ywb+isipUJz5OngCp3HQXRRi7VRl8zUw=;
Received: from [95.248.141.113] (port=61650 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vWLZ5-00000000FX5-3itd;
	Thu, 18 Dec 2025 21:29:39 +0000
Date: Thu, 18 Dec 2025 22:29:38 +0100
From: Francesco Valla <francesco@valla.it>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Haidong Zheng <haidong.zheng@nxp.com>,
	Danwei Luo <danwei.luo@nxp.com>, Lei Xu <lei.xu@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <aURyQsjf7AY09n41@bywater>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
 <20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3abbab9518d833a1fc6e9fae8bc3b8c8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vWLZL-00000006zx0-280f-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-pn62.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Thu, Dec 18, 2025 at 12:39:22PM +0100, Fabian Pflug wrote:
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
> 
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
> 
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
> 
> Signed-off-by: Haidong Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Danwei Luo <danwei.luo@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 +++++++++++++++++++++
>  2 files changed, 621 insertions(+)
>

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>


Thank you!

Regards,
Francesco

