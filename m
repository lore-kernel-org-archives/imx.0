Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530EA30EF80
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368913; cv=none; b=IEap3RBpYVQMW2SGC5rJOlYXyW20/2xUE4Jc/WT3N2roqMd6NeRWjSRZblO4o3GkH4zDYgKvmsKH0m6q7bD//KKN8YbNRq1DDTGiibb3aizPIhqkfayGrGtz/pK3Bt2eoGeh2+uAg6s1YjP8NZpz2hQZDaAQNHvluyydQi75gA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368913; c=relaxed/simple;
	bh=BH79hJ5cVAbZfqE8pZ62Caz1u91g/ItxQYH+c23Hh2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNDr+8s9vB3HFBYl95b65qeMnBdLy1pQFI2Sff7qjs9+j2GUOxg6NEkcSDX6w9JyCjVDVwDJMtljisLxJN7Ee4ig+i/akIm/n/agxhGw9ZjNNj7/TIno5sB7tZO/hDJeEGnzSVRhjIaOz4WFusCkQgk/EMeKYnLWPllOQWjA/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=R5gUl/NY; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="R5gUl/NY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PS1qTdUOygVVm7VvPDfOm7LaoDEY6wBLJnRzN6N5OJ0=;
	b=R5gUl/NYK+xZ/RZB1DcK/YVAlx5YpvKrfPCg3/Wc4J71uBLJwBd37Ou6zTq2y1
	pdnp1z7DYWM6iFvsTk2blseLmZIkBD55eGDrRhg+CJMAMcJ6bjSEUqvsuTnRp2Yn
	PQx5nZehdsm2j6sSjwkw42vqhSXjsvr9DYwAp71wp8qU0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIiW3xpp2wsmAg--.8275S3;
	Mon, 17 Nov 2025 16:40:56 +0800 (CST)
Date: Mon, 17 Nov 2025 16:40:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: add Toradex SMARC iMX95
Message-ID: <aRrflpeTAF3VtuPT@dragon>
References: <20251111151618.70132-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111151618.70132-1-francesco@dolcini.it>
X-CM-TRANSID:M88vCgAnXIiW3xpp2wsmAg--.8275S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF13JF4UtrW7Gw4kZw1UJrb_yoWDXrX_CF
	WrW348uFs7JFWaka17K3WfZrWxGrWjyw1ft3yxXryfJa4I93s3tFWDKF1rA3Z7G3WaqF1r
	Aas3tr4Fvw4UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1pnQUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhr+ZGka35p0vwAA3L

On Tue, Nov 11, 2025 at 04:16:12PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex SMARC iMX95 SoM and the
> Toradex SMARC Development Board.
> 
> The module consists of an NXP i.MX95 family SoC, up to 16GB of LPDDR5
> RAM and up to 128GB of storage, a USB 3.0 Host Hub and 2.0 OTG, two
> Gigabit Ethernet PHYs, a 10 Gigabit Ethernet interface, an I2C EEPROM
> and Temperature Sensor, an RX8130 RTC, a Quad/Dual lane CSI interface,
> and some optional addons: TPM 2.0, DSI, LVDS, DisplayPort (through a
> DSI-DP bridge), and Wi-Fi/BT module.
> 
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
> 
> João Paulo Gonçalves (1):
>   dt-bindings: arm: fsl: add Toradex SMARC iMX95
> 
> Max Krummenacher (1):
>   arm64: dts: freescale: add Toradex SMARC iMX95

Applied both, thanks!

