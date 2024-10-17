Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525851D95A3
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 09:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157416; cv=none; b=Ob0hlq6g/GEupX5/XOcdl7OfML8FiMTOVvfUd+j38LiP4b6K80fXS8rwjZPIM2eU1Idhfz5O9suOVFebu3gOqMs37bu5sIu3ef8jayIF7i/+IbkBUU9eEYw6PmnKu5AaRmcA3wvinIoBArby2VbR3S3IrtUBfGwGb7xogFbKZik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157416; c=relaxed/simple;
	bh=tpjG1VzlcbKlqImlMTci/wT9sMew797mn03v3At5H4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIHMaavZsyqNitQo0f2Idq+rCLI36CySfs9faVnwoF/ul11hcsnk9WTbcQJ/k6ut/BPtsBb7SgyH+So5ZJs5iolEqibMP3RHFwn+IT/Ruth27Vs4SRhWdkqpkViVg8Of4kWpqIXfaWzFIREw3AwtCFEHDSkV1+EWM6s29ucghMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bYhcebF9; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bYhcebF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5RNGgtfTwAvQY9/y046REOp1czW+WTASXN0YNwPj/G8=;
	b=bYhcebF9oG89CR6a3vDpBFiUROxHgE6xJfKDyEniiSIwKTsuhEvXIwLWUt7uu3
	qGQBEhYO3+2KvXfOdLu/TFNtp0JbcF2Ag0zkbXdnEYxGF++j1Vm1gExV6qAbFQA8
	ULjA3Hu84i8L9o1YvIAjfyo1zHxzUeoXt96JNEbSRAc4w=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXW7D92BBndAAxAA--.1315S3;
	Thu, 17 Oct 2024 17:29:35 +0800 (CST)
Date: Thu, 17 Oct 2024 17:29:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/3] arm64: dts: freescale: imx8mp-verdin: Add Ivy
 carrier
Message-ID: <ZxDY/SiDSaz0HcsJ@dragon>
References: <20240924114053.127737-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924114053.127737-1-francesco@dolcini.it>
X-CM-TRANSID:Ms8vCgDXW7D92BBndAAxAA--.1315S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWftFykCr4DKw4ktFW5Jrb_yoW3ArgE9F
	WFgr10gr4DKrnxtws8KF47Xw1vkw4Fyr10q3sFgr1fXF97Za98Ja9rKryrXFnIgan8tF93
	J3WSgrZ3trWYkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0t8nUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQl7ZWcQs3R00QAAsT

On Tue, Sep 24, 2024 at 01:40:50PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add support for the Toradex Verdin iMX8MP Ivy carrier board. Ivy is a carrier
> board designed for industrial environments, supporting industrial
> I/O interfaces such as CAN, RS485, RS232, Gigabit Ethernet, 0-25mA analog
> inputs, relays, PCIe and more. The board also includes a TPM for security
> applications.
> 
> https://www.toradex.com/products/carrier-board/ivy-carrier-board
> 
> João Paulo Gonçalves (3):
>   dt-bindings: arm: freescale: Add verdin imx8mp ivy board
>   arm64: dts: freescale: imx8mp-verdin: add labels to som nodes
>   arm64: dts: freescale: imx8mp-verdin: Add Ivy carrier board

Applied all, thanks!

