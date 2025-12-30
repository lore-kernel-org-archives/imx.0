Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C63191C2
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767111877; cv=none; b=oR653lM2BB3Veqot06WhwlmxJ891VAiwRRHbYixL6tQ8nQEaR91lkrGUiIVTOIk0JS98kLPgD/kwkglRnf62mmotj2kVMX2+KoYE2FNsEPhhhTRMYCAE7xVa8c/7RQqaOLB1n24oKX2LNmVUjud4AZJn5rapHZ0NX5pXpeUgLVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767111877; c=relaxed/simple;
	bh=kcJx4Chw8iTa6crvHDEcBSzGwBKEtsF0UrxWd1VgPTc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6z8F6lke18sFQub0Xq0ZOfQsfIg0eQaqCl6A7m6/W97qLBVxaq94ZBGEkUBZrb6M+fwcWmnpO2vmjiTj8KkgOM1S4MXHVFwI7zM2V9sGTtyIfCnUjx4utQk0QHDqkeQuxhotKVNYAtvedQA4gP2irVDH4jWiGkkdbZZc3auve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X3KfMSP8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X3KfMSP8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A8BCC1D73A;
	Tue, 30 Dec 2025 16:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDEA56072C;
	Tue, 30 Dec 2025 16:24:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C8CA113B029B;
	Tue, 30 Dec 2025 17:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767111871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PjLaYjrR1MKuGXNVMXC/3x7JElHhhnNjgoytiQMaSJ4=;
	b=X3KfMSP85DHhW63H9aYJGfgf7piH+p8p/oKHaqM0A3q1yoh9B4WigDduzbQlJBtk0/Rxgd
	7rINi6glPvbrkkisffEiOZG/p1DfWz9D/yjmf6mqsWZ6jN2fy5E0m5xu6hBgrE+ZpGZecn
	y8Oz0YFHt60/2ev1XLSNVOIAQLlGaB2dSvGpfHk8naCwZrtV2KA3Ta4h5jQ8QPqtkXLfGH
	pxEdp2m8rfoH6lmvzsRvooC8VGnEDLl7WlvSXx39MM/On/ujHwxaNWsrWrzSlcNJ/Jvvxk
	hgfaThTIhPdc+hTgy2UIqnLxwlrnefR1RtuWH6Y2l8OWGNtzoxF2KnF9UGPnZw==
Date: Tue, 30 Dec 2025 17:24:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Haidong Zheng
 <haidong.zheng@nxp.com>, Danwei Luo <danwei.luo@nxp.com>, Lei Xu
 <lei.xu@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add support for NXP
 i.MX93 FRDM
Message-ID: <20251230172427.4f22ac7c@windsurf>
In-Reply-To: <20251230171548.67289601@windsurf>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
	<20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
	<20251230171548.67289601@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello (again),

On Tue, 30 Dec 2025 17:15:48 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I see the PMIC interrupt and the RTC interrupts are routed to the I2C
> GPIO expander at 1-0022, so I imagine either the PMIC or the RTC are
> triggering an interrupt (left enabled by U-Boot), and the kernel isn't
> compiled with the driver for either the PMIC or the RTC, and therefore
> there's no IRQ handler?
> 
> (I confess I didn't investigate more than that at this point.)

Upon closer inspection, I in fact get thousands over IRQ #100 per
seconds right after boot, until the point where it reaches 100000 IRQ
events, and the splat appears, with the IRQ being subsequently
disabled. So it's not just one interrupt, but a storm of it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
