Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0485588B
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730844; cv=none; b=ibOXAgPhjcmEMdAwZSowXw9ZlGZoneB8vL4j00azIJU0o8bBd4jg1AgX3iKq7HkJaxxKxYmbpYo4dhzIMu0opKLO0q9X79wAEH5lpbmXwCXchTtf10HM1G98kpUGDP8UZXF8cb1J+o9QzGmWU+vAm699iYKOKr4TKcUxN8eZCj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730844; c=relaxed/simple;
	bh=IetJKfhC1Wng649lB28KvwBLb5pogvRQt/kSK5Cf0D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa0Fsh2BRj2V4czZxBfd9KBYjN1rYMRKeXAGela9lIrZFwrHOcRalBs91xCv3lOnwD3hckLWuppL8A62+5JPHzRtv6IlgeIJ6I8YQFkM7fN9GceXUoDiEs5uMAYseU0ZLEO2e00dLMfGeYrtaErjUCLzYOqWSnuIjZvv2dovnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jdt+PlMB; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jdt+PlMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wDcyAUm7weadxplw3iWC3WRLmtSv74le9OVm0hGb1gc=;
	b=jdt+PlMB9IkuE4x45jZUUVpzKIJ3Pu3iuarObGCypbL86BoY6PG7ysV7rWsNkQ
	ghvmrclznVS1oWeqINSA6aCKfaR1o5e3fFgST/KHSUgOSj4EshUORS7x5PINitX/
	qD8wqG2wNw5ipwMvq8DAlhuXoQYMesXNUAUq2u9d3uRy0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHiNsGolZnqoeMBA--.47519S3;
	Mon, 09 Dec 2024 15:53:44 +0800 (CST)
Date: Mon, 9 Dec 2024 15:53:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8-ss-audio: add fallback compatible
 string fsl,imx6ull-esai for esai
Message-ID: <Z1aiBrlz5qjw7LVY@dragon>
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
 <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-esai_fix-v1-2-3c1432a5613c@nxp.com>
X-CM-TRANSID:Ms8vCgDHiNsGolZnqoeMBA--.47519S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWrDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxqwZWdWeOyxRQAAsV

On Mon, Oct 28, 2024 at 03:49:32PM -0400, Frank Li wrote:
> The ESAI of i.MX8QM is the same as i.MX6ULL. So add fsl,imx6ull-esai for
> esai.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied for 6.13, thanks!

