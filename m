Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851FF196
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745290104; cv=none; b=BIrOydIGfXmUJvsYvSE71FJ0x2rnInsi36ZK/mCgsZIphZMeBZJJKSJZtZtJK476fG18H8KxrmiuRlhK8g9SGDfFSdJWxATj1fT3FQaTVAexcifsxfoLPHXmVf84a6E+x5+X6UAnmPWEQLo7JwwmYkEGywCcjUC1wsnWJ7zTis8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745290104; c=relaxed/simple;
	bh=8Oi/7h1l6BwvkLMdRM7TN5xBdft1n/bpQEmit7jQzwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyCkXKcSyresnZ3vyAmdgd5+vsgRRZwPBCi/EAk2nAIM3eqvweMnVA+7bc8O+omv40wPJSWMCqQ/HNDiQ1Y8UTLPH/sPCk29ya7WXOmUprO8jXOGwJkh2ew3rhk1dpvTtiYBcgCtoPGYzVVg1/zWhq/puJyoLs5f8EzWuGGd1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TkTpbH+K; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TkTpbH+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=iYJPrUWUZYghHqO5DdKs7mZT6xUZJXtvop8ZZkPf7T8=;
	b=TkTpbH+K5yOkEdzap3zS5GUTC/2ZYBl/NYQEJ6K4dMYepqC1ud8Erl9OXNw+DR
	anO2rS0YhEHhi6RkRHuDPJym1TES3HguTXpnX0Rk68Hua/N9tFvIKAgIWaDHWXCq
	dMLzlbL9o03513N8Ua+jJ3mWAVVi7c7yWhK9i/yFGx/no=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3Z0tYAwdoG4yjAw--.32361S3;
	Tue, 22 Apr 2025 10:47:54 +0800 (CST)
Date: Tue, 22 Apr 2025 10:47:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: Align NAND controller node name with
 bindings
Message-ID: <aAcDWI/ehg2v8kgd@dragon>
References: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:M88vCgC3Z0tYAwdoG4yjAw--.32361S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa0tCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB83ZWgG2pu5jgAAsR

On Mon, Mar 17, 2025 at 12:18:53PM +0100, Krzysztof Kozlowski wrote:
> Bindings expect NAND controller device nodes to be named
> "nand-controller".
> 
> Cc: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

