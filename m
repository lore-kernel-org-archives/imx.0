Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACC513B2B2
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723538328; cv=none; b=TG8vTnUimqjdH5wcqcma8TyeAyKSp/bEmI+aXp9D7gOd3AxJ3R5rd0Z5+VyIXy5ddV5JcIh4hvGittYcG/L6RpMBQ7hPF8dSjl6IeFf9UFxZN1xW4CRHFcQTQK1RF7WfUDupZZEnLf579Z66mkGQE120m9p/Q0+5Sr9vvARbD6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723538328; c=relaxed/simple;
	bh=KNC1FlKtaFTC7uEe/OzVoy8EeVo9yNK8fvRodY33ENs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at9tSEGUgoXzw+TarSrTbIOTWpf+aid9PeX4rZ5jNe4MClR5z9HHz/l9a2C++a+mVLLseKQh5P8cszDcbGvpXu/2A0F3YtK77Wb9pM1EIE++/jGGTEn9+donBfY6miPXXlg7alMluAGmbflKJSGwR6wdLfO1uvQ4UjUSLeRTiVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S3A2JamD; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S3A2JamD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=g1PQSpwNOrLhtPCyYwrJXqmAm+KykyaUlnObNwe/CE4=;
	b=S3A2JamDLEQZiU4cRVs4goD+wOl2/JtIScb/EKbKxi9omyQ0oq65QmtIQudXgf
	L/yf6BBgm0C9XkWtl2GyO4qnW2V/3dnCjwC1voPd/uMAam8tBP6hdfvA+xBWuAHk
	RwhqMIn/duxdFIoko7hMoIUUS2l6rgN4N1/3WyUF+rQ3M=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnr5mBG7tmLoJiAg--.6804S3;
	Tue, 13 Aug 2024 16:38:27 +0800 (CST)
Date: Tue, 13 Aug 2024 16:38:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Teresa Remmet <t.remmet@phytec.de>
Subject: Re: [PATCH v2 0/6] arm64: dts: freescale: 2nrd clean up dtb warning
 under freescale
Message-ID: <ZrsbgQj/XVe6Eqm7@dragon>
References: <20240807-fsl_dts_warning-v2-0-89e08c38831a@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-fsl_dts_warning-v2-0-89e08c38831a@nxp.com>
X-CM-TRANSID:Ms8vCgDnr5mBG7tmLoJiAg--.6804S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyDtry8JF43AFWrKw4kWFg_yoWfGrc_u3
	WrW3WkW34UCw4xG34qy3Wq93sFgw4UZr9YgF1Sqws3XwnxZFy3Zr1kJrWfWw4kCFs3urWD
	AFyUXw1qqw1F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn_gA5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ86ZWa7DgUtHAAAsm

On Wed, Aug 07, 2024 at 10:52:03AM -0400, Frank Li wrote:
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - added fixed tag for arm64: dts: imx8mm-phygate: fix typo pinctrcl-0 .
> - remove compatible string for dto file
> - drop patches, which already in mainstream
> - Link to v1: https://lore.kernel.org/r/20240805-fsl_dts_warning-v1-0-055653dd5c96@nxp.com
> 
> ---
> Frank Li (6):
>       arm64: dts: fsl-ls1028a: remove undocumented 'little-endian' for dspi node
>       arm64: dts: fsl-ls208xa: move reboot node under syscon
>       arm64: dts: imx8mm-venice-gw7901: add #address(size)-cells for gsc@20
>       arm64: dts: imx8mp-data-modul-edm-sbc: remove #clock-cells for sai3
>       arm64: dts: imx8mp-venice-gw74xx-imx219: remove compatible in overlay file
>       arm64: dts: imx8mm-phygate: fix typo pinctrcl-0

Applied all, thanks!

