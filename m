Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE750257D
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 00:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725237877; cv=none; b=eERgq8uC8L7cRSm2W/1S459f/oJ/GQn9zvL5Xw1HnOrjemWvNGeOkHxbg/Og+JgLQuP8aZHByA5mpojgNJVlwNCd7H9WeejCvo0Cvk6xPIk6cxeEIohhU4tN0YdyGCG6Q0w4WQ7lfaDavuzuQ+a3O2ebbHxE7H8sQrmtDxGwu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725237877; c=relaxed/simple;
	bh=/x705rAfgF75MUo9iF/CKwEW1aloVRl/vdZnmjt8W3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcCyjlDWObZXMmwylG6ENZSTIR5X0uZAvoi04H2a13qJuAP7rh3/C+4nlxzKK03doNogOS7G1nUhJT4oTWIX4a8trCQc1R93CHHLBmx7K0tTI2nzwBYy5D0gTB87CdCet9X6TeXviufbKf8e76Y/BvfHOL5KZT671/+KMlAVgPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VOfr7+Ge; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VOfr7+Ge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=EY/h5LzwGRTv5EzCS/bIRFPXd5nGllWSOGp5Qy6FBLM=;
	b=VOfr7+GeYMicO13dJOYP3NK6J4OgGhPTDFgaXgIexUgofZda7zn/TWGIWryDc2
	/7CsIzY0ykr/UYP/f+ZvPA/C9J5tZ82495AjsmjalrteB+r51f/4mEayvKZzTFIN
	2VU43g1wpy1d5muv3V56Fd9TulTuSKswy+Y/Opoa5IDJs=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDn_1hhCtVmQStLAA--.41797S3;
	Mon, 02 Sep 2024 08:44:19 +0800 (CST)
Date: Mon, 2 Sep 2024 08:44:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/8] arm64: dts: imx8qm: add lvds subsystem
Message-ID: <ZtUKYSe6Psx8hbZ9@dragon>
References: <20240701-imx8qm-dts-usb-v4-0-03cdbc8c44b6@nxp.com>
 <20240701-imx8qm-dts-usb-v4-2-03cdbc8c44b6@nxp.com>
 <ZoN90rHfpK7niqEr@dragon>
 <ZoOAjSUp29DBhY+/@lizhi-Precision-Tower-5810>
 <ZoObnDqMd2EL4W6F@dragon>
 <CAOMZO5BigqCqfou7NAzeVZ0Fp+AJQV20BYexROnaCJwU+etF2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BigqCqfou7NAzeVZ0Fp+AJQV20BYexROnaCJwU+etF2A@mail.gmail.com>
X-CM-TRANSID:Mc8vCgDn_1hhCtVmQStLAA--.41797S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa73kDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhlOZWbU5NNHqQAAsb

On Tue, Jul 02, 2024 at 07:56:03AM -0300, Fabio Estevam wrote:
> Hi Shawn,
> 
> On Tue, Jul 2, 2024 at 3:18 AM Shawn Guo <shawnguo2@yeah.net> wrote:
> 
> > I do not see "fsl,imx8qm-irqsteer" in the patch.
> 
> I sent a patch for it yesterday:
> 
> https://lore.kernel.org/linux-devicetree/1c1e3224-1b3d-438c-bce4-56143292462c@kernel.org/

I applied the series.  Please help push the bindings update to get
landed.

Shawn

