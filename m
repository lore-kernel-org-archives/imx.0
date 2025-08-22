Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F792F1FDC
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854900; cv=none; b=BYpr9NyK6OufhiUsoAbuQZ25t1EqCzQIUA3uskaQd+b56p6jxFHDHCIuj3RxWWCu2IRnSL7HURf5J/tvf/3mBEFwgANajdJJijKPdpc0gRlocZaAfw/BbGRx6/6AHP2j+tgCy92d/MbI0REENyVT1Tu/4wFQS9w3UhoiSYmDPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854900; c=relaxed/simple;
	bh=IsNj9uInZkrMsaoaUxUhUuHNenZprupXfruqUfNmiUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ss2DSkYit4POev6DnQb7c2gIZrnx6C7RicHJ7qfwv+M+bBse3RgyUqVvJyufuySvdBllow2rqK+tQA3hPUysC0d4Z+rrIrb7DLT69fOsx/0nOu9a76auWDoxStqvK1IK5CHdIwTNAyPynZLp3g4Aj2xE1vgutYK1fsKFo+lC88I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fHpzJPtq; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fHpzJPtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aTeBCNJiDt3v1ve0MlkfHgac60e/CC7BZoKpC+WEhvA=;
	b=fHpzJPtq6stk8SPQu4lRtLezJcNXTwTYyc6+wmgIwj2wl+ImFeTuEAAS3dvY2u
	Zf8hqpa1dyh6XWVdp0wYdQoGb8ELgyYXVgrissmSztP9Ll9GC+uch8cqlneXnQ+H
	iN4INmWzs1cLuIYljhwy6nroIQp7lG/LlUCPiILd7yORc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHBW_9N6hoN_AVAw--.14855S3;
	Fri, 22 Aug 2025 17:27:27 +0800 (CST)
Date: Fri, 22 Aug 2025 17:27:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: nxp: imx6ull: Minor whitespace cleanup
Message-ID: <aKg3_XjbcZFruQiP@dragon>
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:M88vCgBHBW_9N6hoN_AVAw--.14855S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgyxZWioJsEtvwAAs-

On Tue, Aug 19, 2025 at 03:18:01PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

