Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B55A1EF01
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659780; cv=none; b=JOyTa/yF7e1MsG/KAkZksouMHw4GSxBp3IOQp1grIAS1RmLqJ8pxOE6/ov1JP+WUCD/j6HA6piGsnJY852KR5nndX6zvgHBg3f6YN9cuo4gBzDRpQbWPOxa0gV9KcFOv2KU1zqsJj9a2cY1ihjBY9yP9PKTNfyLh21qULxVGEfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659780; c=relaxed/simple;
	bh=FwDXJPajxYapMkrEHeU4zgpIrMKAAFr1prC0HvmXJa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsCR4rG9bbGQ5oAGpsfhcz7L3MU5Nlu/r+aI0pQS3uLNsS9leOu+NParY/dzwGn6U/Awxus57CccIv9YqsIoB6YfpgbAcHaTVZFDNMT7urvjlfUYEaN8Xv7sj8WagECYO3hfSO53jX64dtZSiRkeWHBr1R3KoVhS7jgFJaF7U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ip1G6nMb; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ip1G6nMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SH7i3hEBunXl56kGHk5HmVNJ3ShdY5ZTb+FytLjyRoY=;
	b=ip1G6nMbetQfy4n7AFrG5+zjHYqZOIHmTr3npDbaScpW1iyI9Rne44mmrPIlld
	DHRemHeIcXi/ub2gwMyzlN1zfjIc2AAQ6EObqg08WoVAWD6C6890Mm2R5YFMng2C
	xTrmstW6UnVyxH4LaGLe/xYwkKclUflqVQDUlzrAqdYNA=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHMiJwns9n3Eq0AA--.48756S3;
	Tue, 11 Mar 2025 10:22:41 +0800 (CST)
Date: Tue, 11 Mar 2025 10:22:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: add imx95_15x15_evk boards support
Message-ID: <Z8+eb5HNX/FQPg5P@dragon>
References: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-imx95_15x15-v4-0-385ee8e03dfd@nxp.com>
X-CM-TRANSID:Ms8vCgDHMiJwns9n3Eq0AA--.48756S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVpVbDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQQNZWfPU+rdgwAAsy

On Fri, Feb 21, 2025 at 04:15:56PM -0500, Frank Li wrote:
> Frank Li (4):
>       dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
>       arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
>       arm64: dts: imx95: Add i3c1 and i3c2
>       arm64: dts: imx95: Add imx95-15x15-evk support

Applied all, thanks!

