Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DB912D75C
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729561435; cv=none; b=qUQ4zXSsZVYNyJRokxsH8QsHhjul4efOtZGk5gTiN5wVN/TJHjoMyWvaxCX0Zr9/nXMRYWN5TJWCVz7m4560AGanEr2vD0o5J5gtH87HsHK2JUnibX17KMY4NnrwxsC0+f9I00ZOYXblL6Gyfmr5DFcrwyQwFtTE1Zi/sgOCsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729561435; c=relaxed/simple;
	bh=WC4pv3dSIjy6aP2HHVm8azLCcRMZNd04QR490tF5vMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2HvXTAaPFBBG/KnRso9qKtRyfBmwvtq47XJQ1Uo5CvN0O3PfSL2Sab2VM7HotgjeUzDKYg/tJcmGFRmDQrGTHe1l6yhsLrW1CttFyIdL0wX9zS6bSy6mWBwrYcpR4kol516cdPSTMWGC7/60WdkdAfpMO/1KK58qMGF63GHtzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Q1LI30X4; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Q1LI30X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UTDYYpNu+5uqNO4xAI5XnvKJiD3mmG/Tcf4hYx/vfnU=;
	b=Q1LI30X45+Qgr3jtFeYK6aU3xs6NwUchBAKwrXeOZMWHWLRrizRxlZ+UrGDC48
	KZE7aApuErOWcnDjONSe0DAZ8upROme7lAf4ITR+CCaDtmkXEBj7Xmnh6MJCIerK
	QFYKE75cNLCQ8zYRb4XT4boVDNWP5vTDi7R1VSZQwWZ5o=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnxucqAxdne_aRAA--.5255S3;
	Tue, 22 Oct 2024 09:43:08 +0800 (CST)
Date: Tue, 22 Oct 2024 09:43:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] ARM: dts: imx6qdl-dhcom-som: Drop bogus
 regulator-suspend-mem-microvolt
Message-ID: <ZxcDKmRJNNI855uR@dragon>
References: <20241015224436.94334-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015224436.94334-1-marex@denx.de>
X-CM-TRANSID:M88vCgAnxucqAxdne_aRAA--.5255S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBaAZWcWmiDHaQAAsS

On Wed, Oct 16, 2024 at 12:44:10AM +0200, Marek Vasut wrote:
> Drop unused regulator-suspend-mem-microvolt property from PMIC regulator nodes.
> This property is not used by either U-Boot, Linux, nor is it documented in the
> DT bindings, remove it.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

