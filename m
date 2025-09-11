Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5A4A04
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553127; cv=none; b=GPKC5QwA9N1OSTYJtJQcC7MvGFNaowf04xka5jKQXOEqIgwGSNh4xNku4SiLbwJ5r2Sp3TBPHjOoE/EXjXhLRQ281rcIkFFJblZxSoUU8VXUX3vxEVs7gZ3FGiZeOWeg2XE36PWH3qjUuSfF+7ufQJbQY9ObRKqORiN1j/ivfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553127; c=relaxed/simple;
	bh=fyZXHoK854tjEwOpIuaemZBSCudAI3GS1VuOve8MKzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH8sJONypPxAV3bkjxftD/zNMM4eN8DJfjjsH7krR8PSg6JJiIQrxApY+WfN0y5HGUYzUhMIFqenz0/NLZkEWxOioAv3BSvim47EqFmtm+JusUWlPg2Dnwi6jTYYSEG56tSnyiniFD9sqoGB07/n1EYyw9rVGkE7J9u4vtPM+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZbOCPlcr; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZbOCPlcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=WyeQ6QBy2eGOwkZy/NqCFgqeNu/xjPsmyRPEkeSKXF8=;
	b=ZbOCPlcrNDLFDc99xib7U/kQUKxH1R61OILTx+WpSi/uPxA5Xlc1Z31kdoYLYw
	6GJhsHwq+4hI1BFRwXkrzJJSQk4rSmX4Ar3yzh4bXpb6E1jL4IY8adqqmzqitcOY
	aXtgr93NPDVJmBZ7X5gPgE19X9yObNm/pjyVp27qZLfHQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3P9_IIcJoC+dNBA--.47602S3;
	Thu, 11 Sep 2025 09:11:38 +0800 (CST)
Date: Thu, 11 Sep 2025 09:11:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 00/10] arm64: dts: freescale/nxp/imx: Minor GIC
 interrupt-map cleanups
Message-ID: <aMIhyCimN1Jkho25@dragon>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
X-CM-TRANSID:Mc8vCgD3P9_IIcJoC+dNBA--.47602S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFy7XF4xWFW5ZFy3JFW8JFb_yoWxZrb_Ww
	1j93WxWa15GrsFk3yYy3Z7uryYyw1jyryUJw40grs7Zr4SqFy3Cr9aqry8Cr1UZF4YkFnr
	Cw17J3Z8J3sY9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU6wZ7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQbFZWjCG7IOxAAAsm

On Fri, Aug 22, 2025 at 03:31:09PM +0200, Krzysztof Kozlowski wrote:
> Krzysztof Kozlowski (10):
>       arm64: dts: fsl-ls1012a: Add default GIC address cells
>       arm64: dts: fsl-ls1043a: Add default GIC address cells
>       arm64: dts: fsl-ls1046a: Add default GIC address cells
>       arm64: dts: imx8dxl: Add default GIC address cells
>       arm64: dts: imx8mm: Add default GIC address cells
>       arm64: dts: imx8mp: Add default GIC address cells
>       arm64: dts: imx8mq: Add default GIC address cells
>       arm64: dts: imx8qm: Add default GIC address cells
>       arm64: dts: imx8qxp: Add default GIC address cells
>       arm64: dts: imx8: Use GIC_SPI for interrupt-map for readability

Applied all, thanks!

