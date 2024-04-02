Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2F95FB9A
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053121; cv=none; b=QAJPP6N/fOdAOd+drg+Q91ii43tYLcpUuMQiqHuzPelsXhl9rtxUvLIkBZmoIRd8NjyjE4raHMpKqzzKzIbZP9yKz7at3YmaHZ7SEzjSRpkEJCZ4XEf81dfJ+juDQFVugfFRu8/w7lMJewx9WmR8iR91USoVrC5ZorToFeEOatQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053121; c=relaxed/simple;
	bh=oCCd1NEMOfap/SBGTjeaM0mUdXqfZaCiEI9hX3jv8U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq3LVTCD9p+m7LY+NVwMtvIoZxWiIFEe3AykQW0OAaJjxh9HIE6O4gTXoTY1bLH2hrSHaaQU8dgcSZ0d8NyArLVX4pPZIHMm8DGv2KQBpHHJVe8Pd92v9R/YxIix+quNnZdnoRSUYOBFv9MNZurfIcCnmUL1apO4TlOwKBkfcB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jjco8P1w; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jjco8P1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TudOynzXL5p6NHhnCOdBHK1d6O7sgae9r5YMMS/KyE8=;
	b=jjco8P1wQsoEcdEjc+TctwBhboJC7E/3c9s0Tmmkp4CInyiRuUq0p/eAyI0te4
	o0VkV8Q8/Zv2DW0tcVDlbSekCrK5heiWkuvtrP3GbmcqKrcO7S7Zc/uBGiqB54jq
	UXFyR8QHpC1J/oktE7A2KVUyr0cSiul5GQWkUdNTSFNZw=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrAAHbxhP2wtmefuoAg--.42789S3;
	Tue, 02 Apr 2024 18:17:52 +0800 (CST)
Date: Tue, 2 Apr 2024 18:17:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: verdin-imx8mp: enable Verdin
 I2C_3_HDMI interface
Message-ID: <ZgvbT6AtxRY+DFsN@dragon>
References: <20240322124620.40250-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322124620.40250-1-ivitro@gmail.com>
X-CM-TRANSID:C1UQrAAHbxhP2wtmefuoAg--.42789S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVpVbDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBC0ZV6NnqhwdQAAs5

On Fri, Mar 22, 2024 at 12:46:20PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Enable Verdin I2C_3_HDMI interface on iMX8MP Toradex Verdin boards.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Applied, thanks!

