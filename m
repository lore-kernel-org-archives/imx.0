Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF01DDA9
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873003; cv=none; b=V0WDWsEp2D3zXx5OFwgMijbidNcGuHy6n/P/7d1wTRpYYkPrSrdwMMlJl8+G3VcJM+ZqOQwvc6yj4p7aKmGgJIZIr/2v7CJsLczOfv0O0Elo5LuXRUQ/oLPDPEtPFe6V2M8W55mk2vLOE+O7O4s7vkEqRCz+im7dgpBsfVVWat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873003; c=relaxed/simple;
	bh=vVY6bNBoR2kMJrILPjPUebf8haHIjqKvbb3MU8rQylM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uo6sx8RyyjFZlohAJDl4pxHQFk5L82E9me/vxxenBoGZcCYDd7MecFvBFNqp3M3b/E0EU/DoZvI3mispbukKcpexTyC1z9C1wYjef0rpk6h8pCx0JH+Zf3klF7MBeTMxL5xuIr3Fh0TYw6xDihLQmbzdvurRRjjIKARNGLxy/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TmdpZtYx; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TmdpZtYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4ng1wQtLHFug7kmO6H2Kb5UP1OF3WN7eVo9JKF8DKI8=;
	b=TmdpZtYxUI6+Dyd4c3TPrIw9Msyab+CBv2ECUfNf+/fvFrtmKMa9ubBnIKgUnH
	yMFRTHNAebhBcv2NFPfImyxFteMXGdJGQu2e1ODRiReKoNSQYM4CDQBBd90/OGte
	WU5zL6m5Ou6hECCCIP0XoaMB7D1ZdwkK//oUwVIylUnV0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3t5TDdWtov8w7AA--.42463S3;
	Mon, 07 Jul 2025 15:22:45 +0800 (CST)
Date: Mon, 7 Jul 2025 15:22:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock
 speed
Message-ID: <aGt1wwcRD1gF53g_@dragon>
References: <20250620213447.56392-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
X-CM-TRANSID:M88vCgD3t5TDdWtov8w7AA--.42463S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0b18UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwWDZWhrVSl45gAAsJ

On Fri, Jun 20, 2025 at 04:34:45PM -0500, Adam Ford wrote:
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
> 
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied both, thanks!

