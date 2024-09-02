Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CE18488
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725239246; cv=none; b=GfBbpLTh35ff+YlBBThkVW+h4NEiWhKQya04EAe42uRbSCohPlOaJtmNyuW9S6BuI1jjg/iRI8Ashnd/QYLHL0NBWkG5ypfyeN1VdJkVQXrxB3+KMcM0QsGERecioxe6OCwve2WS/XtaloGnORrjhaVrZovKXk+2z1Kl3L11R6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725239246; c=relaxed/simple;
	bh=kOotgihrnZeqXqRkRJuL8ZGJhtbBZ8VWrNJi+gmPlvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrZqGRFStSRoWl5CM6mNnU2ot3yuLaLQfV6cXbt4ciTj475btBKQpQB0hyx8Dm7aEauyYl6bYBTjsxCwi+lhG+h8o77SpSGP/F6wyEkzyQ4a3gx0parOGRtuSs6E8UKxxmtVt6n/ijCwczqU+hZtPKHsh1twcls+Cb/iFyBy1dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jC3U6Q1a; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jC3U6Q1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=srlNPACzNVzMyl07S/rSRXoOHARf0VvkVj+17SGlvig=;
	b=jC3U6Q1aOM3AiPOkXaPrhJ7y0u3FogSsI3Xk62U33GV0b31roYrRk2+qmy/iSX
	Ff7PHCHhtnPy9ntGxAU9QtS00yeNXd6Zb2p1ztLbXAZWGHNHsji04GGYmYxFUtjg
	j3I5J08mGH9pGYaTmV5GqFSGIFvaZXOhGklcWjmEFwIn0=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3D1mwD9VmbWZLAA--.42302S3;
	Mon, 02 Sep 2024 09:06:58 +0800 (CST)
Date: Mon, 2 Sep 2024 09:06:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] arm64: dts: colibri-imx8x: Various improvements
 and additions
Message-ID: <ZtUPsNHZxO7B+QnR@dragon>
References: <20240901155721.7912-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240901155721.7912-1-francesco@dolcini.it>
X-CM-TRANSID:Mc8vCgD3D1mwD9VmbWZLAA--.42302S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWUGrW3GryxXFWrAryrWFg_yoWxZFc_ur
	WFgr1Fyw4vqw4ruryYk3W0qrWjvF1jk348JFWxW3Z3Jrn2qF15urnrXws3Ww1UKFnFvrnr
	ua15Wr4093y3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8E38UUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBA9OZWbU4VZdMgAAsK

On Sun, Sep 01, 2024 at 05:57:11PM +0200, Francesco Dolcini wrote:
> Emanuele Ghidoli (1):
>   arm64: dts: colibri-imx8x: Add usb support
> 
> Francesco Dolcini (3):
>   arm64: dts: colibri-imx8x: Add fxl6408 gpio expander
>   arm64: dts: colibri-imx8x: Add PMIC thermal zone
>   arm64: dts: colibri-imx8x: Add USB3803 HUB
> 
> João Paulo Gonçalves (5):
>   arm64: dts: colibri-imx8x: Add analog inputs
>   arm64: dts: colibri-imx8x: Add sound card
>   arm64: dts: colibri-imx8x: Add vpu support
>   arm64: dts: colibri-imx8x: Add adma_pwm
>   arm64: dts: colibri-imx8x: Cleanup comments
> 
> Philippe Schenker (1):
>   arm64: dts: colibri-imx8x: Add 50mhz clock for eth

Applied all, thanks!

