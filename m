Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AEC1925A6
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531989; cv=none; b=QlX6oWdPuQty19JuHIgOkFADHtAXKCduL8yHTGXDPoaMCgyOZr6rl9y6W6YHVEknk/zXEf/FMXhVqG4oTRDMX7srw3olcrVMXVkcEdslzENn4HDQ3AICN9t0oA8+c4CiuUjZz58vGqwZE9N+9B8itxAVTcVGTUZqAmGjysl5IcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531989; c=relaxed/simple;
	bh=3jcBf0eL6Gi2Rg6poX5bDC7FF84+Wlh4gqM+ewFsiIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLYvuTzJgorfdLaOQXEhMp2DafN6PAV2+6QPYeJMKrnUuOql6qcs6efOa+BT11Lfaw+ocvOJndkWhChHMF/M5ssTTog31f3cY0REkQmmANfsXWaGQjzjK9ADmqv0oyac78C2rANaEUpHfWuM8e2V0GIsPNmBqk9ujWVoTt7vU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ZYfrj838; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ZYfrj838"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1E756262A7;
	Mon, 25 Nov 2024 11:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1732531978;
	bh=hmQWA+nwpDDcGMMWDzj5b5llGkioHK+B9GAwscWHsf8=;
	h=Received:From:To:Subject;
	b=ZYfrj838yqQBq+MD5xjL1RdFq/zTs84dqXtTqrLEVI0BvgjI7PabTQ+4t8f3ceZx1
	 +bgbcTJZG7kJm4sOAnseL56ApNbSwEcXv/OEmNp6qXqdzdEkw1FK5JlaHxMKxaFuzT
	 Mvi8WDOvCkgBqs6ZuhRkXzc0NC56CBxP7xMrpBfZ4ltng4O+6hYdQvaxyo0xd/x+aK
	 a7I2mVi6aU8U9duQei/4IcijBLyfFagIRTjS5R4R4qCxTPaulnhlTbOLpex4GQvrdX
	 d86c5tDbtN75uV2MqQ/fauaRApXM9BOtbWOQmhUhhqHd8TNHTBcouEc1vNdB8K8C75
	 8VrGTNu6GvA9g==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id ADFCE7F996; Mon, 25 Nov 2024 11:52:57 +0100 (CET)
Date: Mon, 25 Nov 2024 11:52:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, glx@linutronix.de,
	vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com,
	agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com,
	dmitry.baryshkov@linaro.org
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Message-ID: <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-17-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-17-victor.liu@nxp.com>

On Mon, Nov 25, 2024 at 05:33:13PM +0800, Liu Ying wrote:
> Add display controller subsystem in i.MX8qxp SoC.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

...

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 05138326f0a5..35cc82cbbcd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -20,6 +20,27 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		dc0 = &dc0;
> +		dc0-constframe0 = &dc0_constframe0;
> +		dc0-constframe1 = &dc0_constframe1;
> +		dc0-constframe4 = &dc0_constframe4;
> +		dc0-constframe5 = &dc0_constframe5;
> +		dc0-display-engine0 = &dc0_display_engine0;
> +		dc0-display-engine1 = &dc0_display_engine1;
> +		dc0-extdst0 = &dc0_extdst0;
> +		dc0-extdst1 = &dc0_extdst1;
> +		dc0-extdst4 = &dc0_extdst4;
> +		dc0-extdst5 = &dc0_extdst5;
> +		dc0-fetchlayer0 = &dc0_fetchlayer0;
> +		dc0-fetchwarp2 = &dc0_fetchwarp2;
> +		dc0-framegen0 = &dc0_framegen0;
> +		dc0-framegen1 = &dc0_framegen1;
> +		dc0-layerblend0 = &dc0_layerblend0;
> +		dc0-layerblend1 = &dc0_layerblend1;
> +		dc0-layerblend2 = &dc0_layerblend2;
> +		dc0-layerblend3 = &dc0_layerblend3;
> +		dc0-tcon0 = &dc0_tcon0;
> +		dc0-tcon1 = &dc0_tcon1;

what would you use those aliases for?

Francesco

