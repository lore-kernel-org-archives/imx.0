Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418F1C147
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800430; cv=none; b=kyMkWifdqYAlKI939AxQfeGPPGGghlOD9Sj251KRm4leTz9ZXlhEEM4fuMqv8jVWrp4/UbH0YRWWlQWj90lMlBm2s2TVQqlOxPc+lQScCDtvLt0PJNgn8tmUriz1Kdv40Zh0XnhFoUOz4FsGnK3efIso4IsFKOGL8ceYgtbLrf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800430; c=relaxed/simple;
	bh=keLvy85TKSmAuUqSENQ0LO3/rBDYbbP+L6ogGJGqJns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdEV4LzVYLfE45KsUaooXr8ZngzkpY+uMoN1wmd4qcPkp6qsCKeXV003YoBJG/fg1jD/5yucqpZnV+09yqdkZdDbCR74sWbVOhBBcaj5fZg1TPrMNbBG3jMXLkxq+RR1HmVk37VxwWMG96LWAcpKH4VOSaAuBxM2ae3fMzQpSLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gpprD+kt; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gpprD+kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LQKbrCUubKKYGvkwavn4XFvhfzBGymQPgZlkUpH/gSA=;
	b=gpprD+kt2F2nUBE83AT1mv+LH/M8GU9+s/ZPHYvdnFF6PdCcMDPfw+DIZjDz9m
	gqy5WfTs6gi4p1vhZkoD8MJxJ40OHhxO0k7QgNGIu/uuNFsuB3ElhtT5w88Iv3J/
	UtRtPprSCPoz8v+yK/z/V9cAztHSguKBJ6KiffBOj6uLw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3h_nzDh5omTuqAA--.30905S3;
	Fri, 09 May 2025 22:19:33 +0800 (CST)
Date: Fri, 9 May 2025 22:19:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] arm64: dts: imx: Align wifi node name with bindings
Message-ID: <aB4O8ya5xpCcR6Z4@dragon>
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:Mc8vCgB3h_nzDh5omTuqAA--.30905S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU20edUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBFIZWgd-c1QIAABsM

On Thu, Apr 24, 2025 at 10:47:59AM +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   imx8mm-var-som-symphony.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

