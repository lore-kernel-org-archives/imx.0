Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD394D8C3
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482580; cv=none; b=Dkh7fYPtYRgRzOV/XeUMI8ohNknuOdJBYgaUQ0KRJoHUmu1aD6ib8AoPA3J19A8/mRsVWseiptIbiuSEei1scqTKQaO36JPLLm6T46pTQnnjviFzYdJ8qCyuof2E4TLDHEkp1Iwb3uLnCuqt/+P9euxyd8HlztpQgL5KyLfByCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482580; c=relaxed/simple;
	bh=sd/Bmg+cTQfe4mxJdiKI08z/ZTvjG8ksqd41kgQzsqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNOP022CSnkOlPBURrGxllyHZVNMP2Hi1j3DdyB5dYWvXvd26Ba1TFRa0JPl5cF8dB4Wz/kVWXHk1TP91b3EPNbc41tpQ1PUvK+2ZCYsHpKrqMTsKsNfSI/MFaJvEuEBpLX+WYld2hwecKxlqsmQLIzAL2haJKrz1nh26Eb6KRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LYzeAr9y; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LYzeAr9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=hhsRFv2EXZuOOhQ6fkf9E6H06LwU61sWInvDM5ISGq4=;
	b=LYzeAr9yuaR75d71phnr/Hd8NxQSJXVokySJobyKIyykoyN5ZO0EqJ1NIb9q3b
	S9A+FnEP9FgDxUAIy8jlJgzn0DpvyMz9/a3kmwVUKKuzUOFu4lp0Qh0WstMrIyg9
	CCiWKRJGyGSh4ONv+MFw9J6uhECAD3gcVijVnUQZPKB5g=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXX_GwOH1mCz4aAA--.26752S3;
	Thu, 27 Jun 2024 18:02:26 +0800 (CST)
Date: Thu, 27 Jun 2024 18:02:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx95: add '#address-cells' and
 '#size-cells' for all i2c
Message-ID: <Zn04sE+HzkmSJr2C@dragon>
References: <20240620161622.3986692-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620161622.3986692-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgDXX_GwOH1mCz4aAA--.26752S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV8u4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhILZWZv-c1HrgAAsu

On Thu, Jun 20, 2024 at 12:16:19PM -0400, Frank Li wrote:
> Add '#address-cells' and '#size-cells' for all I2C to avoid duplicate these
> at every board files.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

