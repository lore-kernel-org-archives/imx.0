Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7B4477994
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548153; cv=none; b=dzlSUko6giEju2gB0kg970gf9+T2b/3lj5NpndKsFktt2ikIOixwlLOWtABBNlEQveSyVUrqw8TIGdkY8tOFEtt8Dt5uO9W1LkRmgnsSSQc7aVTS8fdynlumiqzaOVRWJ7zHt/oSYDp5UGeJakMkVaCA/dWjLIbvMeuRAgYM2Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548153; c=relaxed/simple;
	bh=1tqdQQ/v7gDOFj91ORdBN+Bzs5PrNZvdwFQjj2olYNI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ao+t/hv/FbU1MLbPGilIBTocxI+F2Qsz9oJ7rvXSqlx9cjtL+uaWCYXf+QwktitfgszaXE3YRzcRzycbBzVqPB3ni7LTrDRrl6T6CAkHOTc9RUHXhYJtz3F2TxZW41leqpAkRvAUlEaSklEM4TX5vbT6GBor4/Qb/o9YjvrlSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0gRJMAIf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0gRJMAIf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A3C1AC5CD67;
	Wed, 16 Sep 2026 08:43:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39AF60337;
	Wed, 16 Sep 2026 08:42:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C28611C7B017;
	Wed, 16 Sep 2026 10:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789548147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uCt+S52i9jhWLqP9Ai43Jys+VpUMZGBQ6OzhaRvb6Io=;
	b=0gRJMAIfWz6BUbxtkOAo8e6cSqhth/n/K1YBrrTpLgEVFbS2QnVoq/U8AKVLciIeHSaxT5
	FzWDbx7Thb7Ers94EYnPTVOk41nLLyZIIooATPJQuNfsDyra7GKkz8wxo3JgN5FCsD0kF7
	S1dF6e3LTlw1mgMup3nDG3hdrFxqcFIEZGEaXZbkQEjsdqC3X0/ErSZllYp7+mfCRlbvd/
	hLXc8nXyRnrocos4BsnqafeBfYMlTdhskVIsFNmi/lyneHeKuwkI/bdRwSt5Gy9yN/I3OX
	r/RRLkuIedIxrpCuuy7e6mdn170mFrR6KuAW2m4yzaFB3x3R1MvN+wv1s6wx7g==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260813092836.38367-4-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-4-francesco@dolcini.it>
Date: Wed, 16 Sep 2026 10:42:13 +0200
Message-Id: <178954813309.214898.9623998050171113140.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Francesco,

> The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
> the bus-width property accordingly.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> index ec3c1e7301f4..1eb1cf2d7395 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> @@ -229,6 +229,7 @@ &lcdif {
>
>  	port {
>  		lcdif_out: endpoint {
> +			bus-width = <18>;

I don't know the hardware in detail, but the datasheet [0] mentions 16, 18
and 24 bits, and says "Up to 24-bit color (18-bit recommended)". More
details in ection 5.6.1.

This patch would force 18 bits, but "recommended" suggests 24 bits makes
sense in some cases, no?

Can you elaborate on this?

Same for patch 4.

[0] https://docs.toradex.com/104446-colibri-arm-som-imx6ull-datasheet.pdf

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

