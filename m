Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434896FD0
	for <imx@lists.linux.dev>; Sat, 15 Jun 2024 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718437567; cv=none; b=gTp9+Qy8+5oLPfjWWg4/oQGhq0cE6e9kTw6gkWNRdPtBsP213uaLmxAnVW9Ao9zYP0H6ewhkhst7ek8mhI6QfWnigGFxEVFBwxwbJI/qk//jGylbxW0ciocGeNup2zyBvMtlFbUEiQ2SHb7JPCzzUBOdhTRg7V8clH7rO+kzRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718437567; c=relaxed/simple;
	bh=bjAnfxAKraU6w0krIFxQG5nUe9bH28xeF7hl20BTRVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWOkqXclhpmRz0fNS1afbmOzZFK22Tkz6V6sd+gTr6VCEzibM3q7/ht8+0RxoI5nOUGzaNeYRGmYnSh1yY5pY1bcSYE1zMKjfBe3NLDeH7+e1RY1Xi09vbI1SuxrBHaDdtIhC5MVUk7S62BytkApwUpDtumEJBeB8LoDONNLmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kyosWaoH; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kyosWaoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vAMzuaqK+J9poADICBuElUkeKnUjf36cUnhsxL765ds=;
	b=kyosWaoHuFkBOF1dUn086EvuBAQfawLL5V/111L32c7VvMT+KVsG0GG6F0Plk3
	oP1xvUIR4kTgSGOC24DAxSZP2s1gYmK4RH4iZLOvTWuZlhM+95+VDJobAVllw9h7
	LujSs9Hw8xD9yTyZtzJF3p4297Jc7j5zg/qe9IgQx6xoU=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrABHr_uORm1m9cLxBw--.33886S3;
	Sat, 15 Jun 2024 15:45:19 +0800 (CST)
Date: Sat, 15 Jun 2024 15:45:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: imx: align panel timings node name with
 dtschema
Message-ID: <Zm1GjqbtPfU6DhMr@dragon>
References: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:ClUQrABHr_uORm1m9cLxBw--.33886S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUswIDUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDw-+ZVnxc0gsowAAsH

On Thu, May 09, 2024 at 12:48:34PM +0200, Krzysztof Kozlowski wrote:
> DT schema expects panel timings node to follow certain pattern,
> dtbs_check warnings:
> 
>   imx6dl-gw54xx.dtb: display-timings: 'hsd100pxn1' does not match any of the regexes: '^timing', 'pinctrl-[0-9]+'
> 
> Linux drivers do not care about node name, so this should not have
> effect on Linux.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied all, thanks!

