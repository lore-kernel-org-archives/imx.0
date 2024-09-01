Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9451CD29
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725183002; cv=none; b=KwOt3TH675jnc48Gk8sSZfiNDuV2t3I8S7IFVnpMtibxs6bkF1nFE/D71wRyRjgbpVJbbYwFpNETP51LESHFYU2GmmG/LXyqFs/gfTfGuBWg2pBbOTC5aktKDAe53wZkRX6ZbHjfrE8l7ftWISnHM/U9LXOZnwV4CB3J9Omdmxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725183002; c=relaxed/simple;
	bh=W6VQ7T3yMdL9F61C4C8tbpZRVPBJ5ooOtnNRTH4ds1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7gBh0DCHpPXj6GGiYWTro14teMkni6knRE+k8CPeDkX1EI/B2eziQUfHVP0NLD70KlJkezsbE+CdPbmcNd2+WXKKw/1VwfDnI8b7fS/AbF9mzPxAksfp2i+1jJjy3erU67xWsg0D/T/GHbldKx4b8eINb7dz2m82WJeSojH8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=clSpKI0k; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="clSpKI0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pOyL+MZI8eix4bUM1DUjnC6FHJaWbquQqRYATDoE3To=;
	b=clSpKI0k3/TlpM36NH0b4Izns2Yk5fHRWL3OpalagWgVNzOc1Mg3qev+potxRP
	oQpbqvq89E3YZqlYwSQX/+LpXFeEkH1QjRCyWOdOJUOSIaJVpYHX+VqU/FHGrLIw
	037LEfnbJVxQwMusqftfe9uEDpzeaux6KSFvpmULWDg7Q=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAn99H+M9RmwIlDAA--.7991S3;
	Sun, 01 Sep 2024 17:29:36 +0800 (CST)
Date: Sun, 1 Sep 2024 17:29:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dts: nxp: mxs: Fix partitions definitions and remove
 saif (imx28-lwe.dtsi)
Message-ID: <ZtQz/tKY3Mj2BDdu@dragon>
References: <20240827151042.2254651-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827151042.2254651-1-lukma@denx.de>
X-CM-TRANSID:M88vCgAn99H+M9RmwIlDAA--.7991S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kr4fKr4UCr1UWFWxWFy5CFg_yoWxGrX_u3
	yvgrs7Cws0grn7ta9IqFZag393Cw1DGFsxWr95Jas7trsxX39I9Fs3ur13Kr1UAFWayFsF
	kFnIqa9Fyw1fujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0HEEUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERZNZWbUDlVTJwAAsy

On Tue, Aug 27, 2024 at 05:10:42PM +0200, Lukasz Majewski wrote:
> The SPI-NOR memory layout has evolved during time lifetime of the
> device - for example special partitions to keep track of booted devices
> for A/B booting scheme were added.
> 
> Additionally the saifX nodes are specific to other group of the imx287
> based devices, so needs to be moved to different devices description.

It seems the patch should be split into two.

> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

We idiomatically use subject prefix "ARM: dts: " for IMX/MXS DTS
changes, so I would suggest "ARM: dts: imx28-lwe: ..." here.

Shawn

