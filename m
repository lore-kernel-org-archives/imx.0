Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7044919DF4F
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 02:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287976; cv=none; b=StRuLXUyw0usMM6Cll5YjgzneTiX2hZAZ11zt1BG7VT0MLiMgSVuXe+1/09X6Q9JYjvJKdvVacjFXQ76PopXl6OIu9H53tEQo1W0lWeFZUjc28estmIe3G6DN4OjU1B1p5Gva91XrV+RGJ39T/2Iq/I2xhUN+WCBhPLp1x/vaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287976; c=relaxed/simple;
	bh=ZpRIpH/Xb8Bb2a4xbOALqDTv6V3r2LMrpwZauHQAsHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ/NQTwbcJ1XsV8rI55wR6uNBEaVMlYPANN3kUgUQA20XkX8lGmGCu/aLB3u6MHnoyNXONZ1yAkgDs2URqeID4mV7s+QHerL3hpxvmkiw2rERoudc1vfm0OrmQF2JihppKGaFG6rHtCkUELN5n8+xCrAdHkagpi20KTvn/VbMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=j3c2wA8t; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="j3c2wA8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=s2WKQWHFaOBBiVhKURZdk+x4emLXSSQ2B7MB5TSOXFg=;
	b=j3c2wA8tiUnKXr/gWCGn17+9XdyDs9/XezbctZh6IUY1WMWRw6YRIOqXdWz4AA
	cdYQ3/JR+e09qDaGZwZNWc6EyJYWnWbbGYH3iSMPV40qJW20oAKpUWig3ue1BwQa
	sp6sfl82ySFFPS5L/XB9DKkwtQbZqf1wbzk+uk3hNm2OM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3Mz4L+wZozti7Aw--.12946S3;
	Tue, 22 Apr 2025 10:12:28 +0800 (CST)
Date: Tue, 22 Apr 2025 10:12:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx: add imx95 dts for sof
Message-ID: <aAb7CkrxVmTtsTHg@dragon>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
 <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Ms8vCgB3Mz4L+wZozti7Aw--.12946S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI75rUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA2dA2gG+w3pyAAA3e

On Tue, Mar 11, 2025 at 12:32:55PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add imx95 DTS for SOF usage.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Applied, thanks!

