Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90917B654
	for <imx@lists.linux.dev>; Fri, 23 Feb 2024 02:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708654077; cv=none; b=hzPMgqlIBFuEHLIMYdvKJryxzZs4FDxH7v4SEuli2gKlOK6mRIQWhSuhjqeFh4kCEUanSPAkhG3+PZJbWZK04L24vGYWNKZZRyieqVOTatgTZqJCwGc41MsTvB4apy+iQ3LzzRx8GsqtvDvQvFWdheKj+eJxxVOsX7IUYBKxRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708654077; c=relaxed/simple;
	bh=hBwffJ7jMGCDiB0p9hTJUjaOe5jLhvAZ7aMnm5aKVcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oseqk8lI3CBX/2uqbBGxS5O7y9/c9XAVdTSM87Bx+48vpJA6DKNyz+cpqLNc1lG9QD+QTC4jxG7tUCBEe7wIHkPMfG4EYrI5U6FGzinG8rjd39OoqD2wsOQ+2N6q0PXeLYgVbi6vVorevWYsl3Xdy0m+x8nT486IXT+w5FYvVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NSgdTAdO; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NSgdTAdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OEooxaF4zLYDzWIoYAZzSri3rr+zOurKcrfcxANxOgs=;
	b=NSgdTAdObK6rsdQ9cpn9K8k7BdomrLytMMepCfPf1trWsDaiY51gWvcBMM8jeX
	Kv25caY8pgMO4NPt34ndy5wDMzXPaIdbLjYZD2ACkryVfRZJ6ViLRI+EilXbDI+Z
	19sp3qMNKzxFcr12ryqXSkwADCQEmKfk5viwrGRjSlyj4=
Received: from dragon (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrAAnjxNf+9dljfIrBA--.50594S3;
	Fri, 23 Feb 2024 09:56:50 +0800 (CST)
Date: Fri, 23 Feb 2024 09:56:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] arm64: dts: imx8dxl: add fsl-dma.h dt-binding header
 file
Message-ID: <Zdf7X5T/Gf8Bmigk@dragon>
References: <20240129201633.234255-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129201633.234255-1-Frank.Li@nxp.com>
X-CM-TRANSID:ClUQrAAnjxNf+9dljfIrBA--.50594S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQKNZVsVCTz3jQAAsu

On Mon, Jan 29, 2024 at 03:16:31PM -0500, Frank Li wrote:
> Add fsl-dma.h dt-binding header file in imx8dxl chip dtsi file.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both, thanks!

