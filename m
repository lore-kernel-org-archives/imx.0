Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85C8487A5
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 04:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051693; cv=none; b=s4HbSPRzH++oJhjDaO8U+6I8hlt6ZvZxy/PxtZQSNbV79oq2Q0SvBwPAX5W+2jKyMtxPschfhVsUs9FfngIDjXwbySUcQWwq8MStQtmiNg92ec3jay01YX/DQQq6grrtX/GYlzBrK2NxVMEEJB/ptg057K0A3M9ht5qnVr3BFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051693; c=relaxed/simple;
	bh=3N+STJ//28s3Z0iB/sdCIxxPiYXRl3RUngKkc7dK2Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wd2fMr8bN8UI6duWkJqgJoDcvYD62ghSfdA1dbTItY0+w8abxylwrnDRbrPrVIAlyCmrxI8k/5XWH3MLXBLBapnWh7dkwOGyQf5Uu1gP+ulu4juisUk8r9bK4HZFs1KxG33U5UuZOSmnA8aYx+q39gHNsIWhTsbs+uC8x5VNK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=X3LpqizF; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="X3LpqizF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mbr909u6y0eDYh6LGTbSBvd7E+j4AUKVKbgkrG8a6FM=;
	b=X3LpqizFAhILrpKiHW+6mx8A0/RuJHlC887uNkGZX1RhEjIXgIm/AOm95kyYp5
	nJwLPcS08IpnPSmPAzJyyRV/G05Ss9/yW1vF+Zn72bz3//oy/vuxRGw6bgTj1IyS
	sneSwedPxPOv8N1h/bvNFVrPgQV1tKXiMUEWZe7IUZrZo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXll35Ow9noaQVAA--.253S3;
	Wed, 16 Oct 2024 12:07:23 +0800 (CST)
Date: Wed, 16 Oct 2024 12:07:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: minor whitespace cleanup
Message-ID: <Zw87+QnHZogtv6CP@dragon>
References: <20240905154410.423991-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905154410.423991-1-krzysztof.kozlowski@linaro.org>
X-CM-TRANSID:M88vCgAXll35Ow9noaQVAA--.253S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4IJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhV6ZWcPEZ+ZGAAAs-

On Thu, Sep 05, 2024 at 05:44:10PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before '{'
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

