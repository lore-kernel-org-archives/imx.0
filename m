Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F86A59
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 03:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254293; cv=none; b=D6MmQE3tvcZK94khKv8my4HZF7sIe9p6sjKaGmaFpCRuIGx8wHz6J0Ofo6vgiqmssscFjm9CxKShX2e5xwCvdKAyzodRYRAwLqPMK2fjcPveqQ+d7dW2v3jMdrArl9Y4/1u30sVeZpCjVE3ZfH2En2DRBlACQaqpAvyIR80NT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254293; c=relaxed/simple;
	bh=9HXwaKOCU9N32PhkYUdCh2niibtPEZxJwu0R7t6hyBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvODwM8Ehw21g5/XszkRXDXIAiJ4ZL88hQA7ae1gvx2zRYh7iwWPL+8lGZFAwwgt9BS/o3/yy3w7ugUbXbRXXRTU8b3TPhxP5N+3vhsNKGRGWvwkEyc2YR9LgTSGrePOYGe9JRmiv7xVFUCrhWWjeIbxC0xXmUjm2X+TclCsLXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JjPxa0dT; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JjPxa0dT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eMBvYrfcJhEzV4RAOAmAuxyy61g3GX1XMHx4/6zqp6E=;
	b=JjPxa0dTW5h72qIOXR/CH0HfNVHEGE/jvjLlQD3CWmgu9Z54+8maopt2F9+Kyw
	uqE5Bh6yP0YOeo/f5nj49/vi/AnrQF0tHHW4FuVOUvjmd98Z1s5k4Cx3GHrfKwWe
	vxIq65+m8wtQWHNwJsF53hRfuCCruDKXgmTfD0hNljZNg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnLxXzBGJoSvnNAQ--.18360S3;
	Mon, 30 Jun 2025 11:31:01 +0800 (CST)
Date: Mon, 30 Jun 2025 11:30:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH v2 0/6] arm64: dts: imx943: Add sound card support
Message-ID: <aGIE86uLisSjCK+h@dragon>
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528015837.488376-1-shengjiu.wang@nxp.com>
X-CM-TRANSID:M88vCgBnLxXzBGJoSvnNAQ--.18360S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYZ2-UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ98ZWhh4l2X2QAAsn

On Wed, May 28, 2025 at 09:58:31AM +0800, Shengjiu Wang wrote:
> Add sound card and related i2c device support
> - micfil
> - bt-sco
> - wm8962
> 
> changes in v2:
> - use (FSL_EDMA_MULTI_FIFO | FSL_EDMA_RX)
> 
> Carlos Song (2):
>   arm64: dts: imx943-evk: add lpi2c support
>   arm64: dts: imx943-evk: add i2c io expander support
> 
> Shengjiu Wang (4):
>   arm64: dts: imx94: Add micfil and mqs device nodes
>   arm64: dts: imx943-evk: add sound-wm8962 support
>   arm64: dts: imx943-evk: add bt-sco sound card support
>   arm64: dts: imx943-evk: Add PDM microphone sound card support

Applied all, thanks!

