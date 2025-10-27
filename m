Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7A5125A0
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761548455; cv=none; b=D0cA5S3NreutNiRehjCZgEgICnCJaeTJUFpSVSqC+vLqslrEl4oQDLDyuKzy7dLSqMjPfSzusicMPc6Vv0iBUcSET0rAdqGzpDI3vObDPpakgzcCkzwjfUeb0yTEAvYCH3Wi+nQ3r2M5kZrj9bY8/3fcVdU+DRQ8XHAfW2Iz1NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761548455; c=relaxed/simple;
	bh=OK/OUyZXMSROdAPC5ynR6gn+p0C2kq/Y8b28Jur6MTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRQHrzF6cO7ksPCG32f99DpTy2C8lBPIISTWkxs/qdS2+Xv4Y4Tp//JcTLN5gq3nAkgLBqqggemYi2ViuvqyG53HQX6p+IA4HTJXihN185DoefEvbOrZU6PwDfuNeW693KQzldEaffSKCUP2tsY8m0y+q3Q5NBdbmFR2WY2QNC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Bo0hZqsC; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Bo0hZqsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5tZIQZIIeKrKNFriv/H4pggndEajGwOKWlQTygtfGwg=;
	b=Bo0hZqsCtcvx/tAbBboZVSQAtpf5EMIGUbTCfJZbYL6hOBE25YYs4xdcT7qSCJ
	7k3rPqtv8OdTEM/7JBxRoejk0CMJeLz26XxdhKln7U0SMEhYVOuy6DjUja1ejMhE
	9mcswDBNY96eglR7J7By+oWK/byiZ9yq3bYy0EpbCxEJE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBX5g97GP9o2cG6AA--.5331S3;
	Mon, 27 Oct 2025 15:00:12 +0800 (CST)
Date: Mon, 27 Oct 2025 15:00:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@dh-electronics.com
Subject: Re: [PATCH v2 0/9] ARM: dtb: imx6 DTB WARNING cleanup 2
Message-ID: <aP8YerA8CtXE-P_u@dragon>
References: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
X-CM-TRANSID:M88vCgBX5g97GP9o2cG6AA--.5331S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5l1vUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxPzZWj-BIhL-gAAsg

On Mon, Oct 20, 2025 at 05:06:34PM -0400, Frank Li wrote:
> Frank Li (9):
>       ARM: dts: imx: add power-supply for lcd panel
>       ARM: dts: imx6ull-dhcom-pdk2: rename power-supply to vcc-supply for touchscreen
>       ARM: dts: imx: remove redundant linux,phandle
>       ARM: dts: imx6qdl-skov-cpu fix typo interrupt
>       ARM: dts: imx6q-cm-fx6.dts: add supplies for wm8731
>       ARM: dts: Add bus type for parallel ov5640
>       ARM: dts: add device_type for memory node
>       ARM: dts: remove undocumented clock-names for ov5642
>       ARM: dts: imx7ulp: remove bias-pull-up

Applied, thanks!

