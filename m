Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93C1EF387
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752221313; cv=none; b=PnHa05a+gUk3NxS9HB6J8cw50/5+wCsxTHHkbCSDojCEGklrbB2+VvnHEI348TU+hvWL32L0ZVyeMEpend3QfdrO6N4nISISE7cSlbhNGl3ksqHUDcGMM3uutVpo4hd81nOk46EHTHfMobWMewzkzsp/4caea2lwmpA7OOTLETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752221313; c=relaxed/simple;
	bh=pw73eaU/TFMG6+ea/33wB0mcLIxy9ytS/0tF1Cl+kfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfSf+nVQs/f5lrZU+jfxPTiFXBPeFRLFv1kkLJs0T+wfwwD0dc+SlxDOuDCsuLO63+KnXZA5VQRWz0gRCv5ZYrz5A4un9/0u8bbDrfq4g+sZxoTcTAzwmlgZPYSdRntZ8LZfy8CevxlxPbJ1XVZgUb0/e3QX4/sWS0L+5NzQfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OP59Ynsk; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OP59Ynsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h/f7eY3kVgl7N2EL4ncuhVE5xQDYNoDV9DtJxE6RGIo=;
	b=OP59YnskeNiseYFWrR10zN+uDMLip8mSXEPH9bQT08orJav4xNfcy6HaOdkHWA
	WruYMdaTtT1CbD4+BSDXjAlo+H4DE2b6l7S1TowuNFgsV6jRzCovejLM7xbAuOVl
	Zv56zQ532hcDA/JpsNsMoIy9K8geAWbcLUVLvVf8AEYQg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3X7pnxnBoJd9RAA--.10335S3;
	Fri, 11 Jul 2025 16:08:09 +0800 (CST)
Date: Fri, 11 Jul 2025 16:08:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8mp-toradex-smarc:
 remove gpio-hog on lvds_dsi_sel
Message-ID: <aHDGZz6C50CbeTz5@dragon>
References: <20250708135300.2855155-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708135300.2855155-1-max.oss.09@gmail.com>
X-CM-TRANSID:M88vCgD3X7pnxnBoJd9RAA--.10335S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy5tFyrWw1ftw47Jr1DWrg_yoWxuFX_uF
	47WrWUX3yxJF17t3W5Kr4rZry7Kayjvr1Sqa93Wws3Ar9IyFW5CF1kGr95G3sY9398GF9x
	uF15X34vg3ya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjs2-5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAkCZ2hwxmlPzgAA3u

On Tue, Jul 08, 2025 at 03:51:40PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The LVDS_DSI_SEL does not leave the SoM, so do its pinmuxing on the SoM dtsi and don't
> leave that to a carrier board dts file.
> 
> Using a pull down on the LVDS_DSI_SEL signal is enough to have the signal not floating
> and have the SoM in a defined state.
> Thus remove the gpio-hog used on the line and leave this to carrier board dts files or
> overlays to use the signal as needed.
> 
> 
> Max Krummenacher (2):
>   arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
>   arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog

Applied both, thanks!

