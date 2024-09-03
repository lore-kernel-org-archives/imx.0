Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA941D54D2
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346433; cv=none; b=X2oy/WaqDPsJBzDKz0swndH1+zCKeLxGNZVEwJXjWfzGCCoVc5nveJdhyZUT/F9xMvIwRI9YhujlQYX9XzL4WVohfvEX5Hxxtm6YXCPRVro8cxo/Bf8VyYtt9WX1lsEpx+2o3ubw0ywdy/5Whvkp/AjCP8p4Uc0JBLuTsCUeagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346433; c=relaxed/simple;
	bh=vzZGRJnHnnJ4nF6fvhg0LVh342nnaIM+KnZaREPRBKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTCd8gkzT/oZwB22z4W0DexnSr1D6fMgAh6cOOl8/cGj0qnRz3FLjHdtokaxE+s0kSDv1Wa76f3oq8BIp+FW04FKKt+R3sCpbnRnwawIDHISA5IhRcNFL2L/44L1Yv8R1EZ9voiMgxpkgY6pL3R1SD1JfwPqS3Zsj+7LNjtJXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jB8aALZ4; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jB8aALZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=icX4wz1ptS03WIHyVcJpL+Se5k/G0BoefYPCKikMY9E=;
	b=jB8aALZ4eizjTYEq0uTnUB3l3EnAnv0uCx9vw1/3pJcP9SClioWaoZQJMl7iOB
	kEmcefrDZk7r/h/Hl2r2TVes+hPQREciprF3MwHmfKqC7HuoRPeh09up9i/5NLrX
	1zu67BtbVcPoBwFA4yeDtaVlyg9f+3RuBz0dMU8Hfp3rU=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3_z9lstZmu1xcAA--.50689S3;
	Tue, 03 Sep 2024 14:53:27 +0800 (CST)
Date: Tue, 3 Sep 2024 14:53:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-var-som: drop unused top-level
 compatible
Message-ID: <ZtayZbxeZXbRcufU@dragon>
References: <20240902075220.27971-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902075220.27971-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:Ms8vCgD3_z9lstZmu1xcAA--.50689S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Xo2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgVPZWbWfMaooQAAsu

On Mon, Sep 02, 2024 at 09:52:19AM +0200, Krzysztof Kozlowski wrote:
> The Variscite VAR-SOM-MX8MM System-on-Module cannot be used alone
> without motherboard, so drop the top-level compatible field to avoid any
> false impression that such usage is possible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!

