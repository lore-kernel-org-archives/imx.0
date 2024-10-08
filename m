Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03481DE89A
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392129; cv=none; b=i1fVVZBXoPYKgAA/RF8Ucmy1zsa6eQD4fsQSernIGBnowJcz804fyUpDzfsEtKXKfJ+BNBVihbe/OzE1bkJrgkw9c9dzhQemmfqolYRDgXanazyR9hsdu5K9bbSY7UmTYrbyyFZkLuSeBxDoou/7kKnp3NJkEURl6KeaJclBzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392129; c=relaxed/simple;
	bh=/5xfWdgh2ER9sUkHCPGC/gPqejv7wgXxQHfq4+0kyq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC3XNGFtdPUYxg7p8PPqxBJimzx4ipSuSt6L3FmzRYIgILUmq6yE0kS2JpcumXGVKFexLE4gmlbJxijQj3QRV0Y9ewMkrJMOyTmbPWZBkaIYyG+vACj/5QCVgqxcLGltSEN8EXNhVLraH43099dvZwwsTXVBsnCf2yQthFWoJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Dvdd+DbJ; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Dvdd+DbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sBxE/BZZv+MRIC0aIc47q5oUjnJ0WxSpN0dr4sEd480=;
	b=Dvdd+DbJJSbPGq34LPp2yWzQrIZPGurxQPWToSFncsELaB4TVqImY9lPFGsDDr
	FsdzsvgfkhDyhsvQCe6K2IMGV1LYPOHrcGMMZz/vJ9zQqchKqdPwJ9nc4l4mQf6L
	JsAvjAsLNv4eD3IYhQkd217osr2j8q2E1haCjjWx7yHzY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnntWpKwVnm+HXAQ--.19970S3;
	Tue, 08 Oct 2024 20:55:07 +0800 (CST)
Date: Tue, 8 Oct 2024 20:55:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: freescale: imx95: add various nodes
Message-ID: <ZwUrqVjbYbZk1Ld/@dragon>
References: <20240903-imx95-dts-new-v2-0-8ed795d61358@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903-imx95-dts-new-v2-0-8ed795d61358@nxp.com>
X-CM-TRANSID:Mc8vCgAnntWpKwVnm+HXAQ--.19970S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1rAw1rAw1Dtr4UGrWfZrb_yoWkJrb_ur
	4ru3WUtr48tw4xGrZ8Jw4jva9FgFW5Cry5G3WYqF1xJ3sxXFn8JrZrCr4rArs5KFsI9F9r
	Aw18Ja9IqFWagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnvApUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgVyZWcE2BT3FgAAse

On Tue, Sep 03, 2024 at 03:17:45PM +0800, Peng Fan (OSS) wrote:
> Per scmi binding doc update and i.MX extenstion supported, add the nodes
> in imx95.dtsi.
> Enable cpuidle for A55
> Add anamix temperature thermal zone
> Add lpi2c[5,6] i2c nodes and sub-nodes
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - Use generic node name "gpio" for gpio controller in patch 7
> - Link to v1: https://lore.kernel.org/r/20240902-imx95-dts-new-v1-0-a1f798f4f746@nxp.com
> 
> ---
> Peng Fan (7):
>       arm64: dts: freescale: imx95: set max-rx-timeout-ms
>       arm64: dts: freescale: imx95: add bbm/misc/syspower scmi nodes
>       arm64: dts: freescale: imx95: update a55 thermal trip points
>       arm64: dts: freescale: imx95: add anamix temperature thermal zone and cooling node
>       arm64: dts: freescale: imx95: enable A55 cpuidle
>       arm64: dts: freescale: imx95-19x19-evk: add nxp,ctrl-ids property
>       arm64: dts: freescale: imx95-19x19-evk: add lpi2c[5,6] and sub-nodes

May I ask you to drop "freescale: " from the prefix?  "imx95: " is good
enough to tell the scope.

Shawn

