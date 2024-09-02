Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82E0EBE
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 00:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725237772; cv=none; b=SodL8cCwaI3h2OIbJTQCTxA7bmBLMtmwu0jxd9t/qqlMNy4wyipQ6zThtGdv3oFAqV+S1CvpDkAV1fXk0QiXn53epZS/tph5/Me7iMZi4uG08tJowAbZiK41X5SgKz+e3Q3ynzfdOq1jE+U+cFJxMk0R4DnrUKoFydKmaRWzjL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725237772; c=relaxed/simple;
	bh=vvNPiZo1AtkzG/LKz9r3gQJ3XL0OQWgrPV33KDxb7K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlQUJWS/m6Dtxyx3mnhNH75Wkzz3sRnfdQi+yJ0E8jU21aa4dUDbiV4unB8PQgQp8TnZdzhycUrGOasdiJfoiyo2GUDNH+MjMzcp2id00mVRiiz89XVuXvRq2cYGamZEmjH+4rE7K/Q8HdVQYXlHgIhjD2AFWsSL+F+Y4b/XTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AdAYLEI4; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AdAYLEI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=q7AK4GJixpk3ql+lFQfoveiVyOrmiKMl+khnfRUsfBA=;
	b=AdAYLEI4yBLw2VAmOMAxs3P8lLM8+QRT+B7P+OvvY+GfF3RUb3LKVvudxjs1Ly
	zwdMlPb9jMggifA5QCi/J8PUAo0eC+B7aohdpwGqDDNB4nQc7Xzhnc7Fh+vVKOKc
	D3sqaf04DXe3lyXNLAN353+OeniB1ZJpOsCjapsXHQrLA=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnTyD2CdVmG3pMAA--.9591S3;
	Mon, 02 Sep 2024 08:42:31 +0800 (CST)
Date: Mon, 2 Sep 2024 08:42:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 0/8] arm64: dts: imx8qm: add subsystem lvds and mipi
Message-ID: <ZtUJ9WAc6rO6d70j@dragon>
References: <20240701-imx8qm-dts-usb-v4-0-03cdbc8c44b6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-imx8qm-dts-usb-v4-0-03cdbc8c44b6@nxp.com>
X-CM-TRANSID:Ms8vCgAnTyD2CdVmG3pMAA--.9591S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVLZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwtOZWbU5HtJJQAAsq

On Mon, Jul 01, 2024 at 11:03:26AM -0400, Frank Li wrote:
> Frank Li (8):
>       arm64: dts: imx8: add basic lvds0 and lvds1 subsystem
>       arm64: dts: imx8qm: add lvds subsystem
>       arm64: dts: imx8: add basic mipi subsystem
>       arm64: dts: imx8qm: add mipi subsystem
>       arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region
>       arm64: dts: imx8qm-mek: add pwm and i2c in lvds subsystem
>       arm64: dts: imx8qm-mek: add i2c in mipi[0,1] subsystem
>       arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes

Applied all, thanks!

