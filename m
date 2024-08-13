Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEC813B797
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539021; cv=none; b=iHhhLe3C1T9NLZJqOgnvz/zSAb3zwIwLGX2QXM8Of3wZXQq+rFAJNwYA9QwXTpL88RzzS5M4LBtY0sCa6+tonk+dKsPgP22YhQ9CMZluOR6bQRmWvyKlp3TC2oVMFv4L8FL8gZBLFQ1ntVZlHF/WKRw1tmUAJuvV2Sn18EysvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539021; c=relaxed/simple;
	bh=V5f2/mX2TjYFDKHk6f2LngDd0CghKPZbUuFv6a+lFLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak1aqvib+4cORKlw6KZ/BWuI6EmHYUzw2j3wgamE4jxW9hSkAHjxcfIwzGo0i4s7sDtWWkfwZfhlr/hR4kJ8y8Kzf9OegUw63aGmOXWMqhKpxofVqyjV3RSwto7uLApJLNXRucNS6bw3pGIsJjItOonkAibysGGnPr1Et0cyed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dhILZjdZ; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dhILZjdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wHFCBUPgrhC5PGF9916rmNvU+re2mY1CKErE9Zc2vKg=;
	b=dhILZjdZb16nHX8i/kZc9nWwniKg2nXw7aFgtueg5cN8n6bXLNYd/fSzh6iTSW
	ZKDFTlPkLi8sI5f94D/HQCkPWiyap7T/aTCcqWikD9aMdgRLPIp+jb3QUsV4BJtp
	5PipmbzyQYUexN8uyfEKrvNI5OtVUMTcwyxwx7uoF+AMA=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXXY80Hrtmz6BiAg--.40026S3;
	Tue, 13 Aug 2024 16:49:58 +0800 (CST)
Date: Tue, 13 Aug 2024 16:49:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Teresa Remmet <t.remmet@phytec.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx8mp-phyboard-pollux: Add
 and enable TPM
Message-ID: <ZrseNLMfIO7jxxkT@dragon>
References: <20240809-imx8mp-tpm-v3-1-c1cd80deff16@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-imx8mp-tpm-v3-1-c1cd80deff16@phytec.de>
X-CM-TRANSID:Ms8vCgCXXY80Hrtmz6BiAg--.40026S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVco2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERg6ZWa7DgU1MQAAsE

On Fri, Aug 09, 2024 at 11:02:31AM +0200, Benjamin Hahn wrote:
> Add support for TPM for phyBOARD Pollux.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>

Applied, thanks!

