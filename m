Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D626B961
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403082; cv=none; b=b+v/Xgbg3aHzU4KmMZ0hYAnf8DSjhqfMj40eeIwITPs/jIeF8mTSkEgnC/leEfkvy4cx0Wk9Iohs7YBoEvLFMLqCsvTGAjNsyAhe9Ibwy7RQcJBxg/h4tkggsAajQ8apvDbCArTPy+mO0VZb+x48MVKVHS9zAI1+yBYshURniBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403082; c=relaxed/simple;
	bh=b0Y5tJW1ARr3F4YWKHFkC6Fk3ydx1M0d376iWWVuTyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClyXmQTdvQ1fXAZK24lfVHt5pCeAvSQ9bHLpVSoMHTh+b5Zwxj11W6lTwhaJaLsRx85ixqITeorEKJKYj2aBQ2t2aruSfIAq8IzC/TC/d/XB29B6KK/Hkv4qds1sbxatciBbzJv33/dpX1vmlOWviqG9Kt1tKHHdNnww+JNCcG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VmjmFA6C; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VmjmFA6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8xPfywdOkuj394mc3umyqwbKkDiIsCkuQlStktpti4E=;
	b=VmjmFA6Ce7I6PrfdruXOITMs/muo7+n0WI4zSAYU3OqKEvrLA0WkRFto+Ox/vg
	ygoNn+w2v9CiuRaQirdV3GPe17+zCNSfKgeu1JGQUlsWefqXrxftynpc2jx3U+J+
	mC/Ub2rvLu+nmuespAa7Juu4yXzpnurHuqHAfruvtH4tA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXWdmivAhojG7BAw--.25526S3;
	Wed, 23 Apr 2025 18:10:44 +0800 (CST)
Date: Wed, 23 Apr 2025 18:10:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Add
 EEPROM compatible fallback
Message-ID: <aAi8ooTCm/BSB3Qf@dragon>
References: <20250408202939.6887-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408202939.6887-1-francesco@dolcini.it>
X-CM-TRANSID:Mc8vCgCXWdmivAhojG7BAw--.25526S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI38nUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQR02WgIvKSpjAAA3B

On Tue, Apr 08, 2025 at 10:29:37PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> According to the AT24 EEPROM bindings the compatible string should
> contain first the actual manufacturer, and second the corresponding
> atmel model.
> 
> Add the atmel compatible fallback accordingly.
> 
> Francesco Dolcini (2):
>   arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallback
>   arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallback

Applied both, thanks!

