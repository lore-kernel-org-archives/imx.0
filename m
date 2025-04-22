Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811CD22C331
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 02:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288366; cv=none; b=LtjQbI/lMgGlqJ3fKM+K2J9wgSX5H88HnetDyCRrz4VfDCxuZYlbygJKIVm63dA71AwxAvF5WJCVQ04jfwPeXvN+caoFLd8GsPUGMk3k/6v1YInKJXf9sGq2FpyB5J0bmCQ0k0YKIUvhRhC4IBbTBExPcyXBU2kHxaZGXIVKyRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288366; c=relaxed/simple;
	bh=iDOuuu4f0xgOSSnJHort7rH7kMsvAPBEkCfnsvXhdyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuV2yGPNueC/a1cu3YS0YSBptRCbRMB+3DFKUmTnsSTVhfsz8qU5nm7XRzbo1Z0Yd5pWTH1LojNkt5mdwGkjaV3SZj7DmZujyJm4UVgVUib3KM4uUcw9K72SRiU+72jEQgiciAwyhU8iYUuE6Lmc4UxKnFkmiYpBAHlXpQ2fXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hW/jlNO6; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hW/jlNO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0lQKvbPMiWALaCoaAk+3P6t7pLtJ6dozAsI8r7sGWjA=;
	b=hW/jlNO6wHxTEEgecGmNw5P9lLV307K4he+I5ZGHFKHBmp6tQk4GuqIjGF+OSK
	9tVyVLzUWHxfpDwBwbttcj9I+4jOe66ci0GeNvk9vZ+tE8CxtHep9ENX+pf6rpEW
	hi6Yz/qrJABdtTEejn170UUlX+/458HPBrTkEUDlEKYUw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXlduS_AZoEu+7Aw--.31707S3;
	Tue, 22 Apr 2025 10:18:59 +0800 (CST)
Date: Tue, 22 Apr 2025 10:18:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks in
 nominal DTSI
Message-ID: <aAb8kaw+hmEMnbi0@dragon>
References: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
X-CM-TRANSID:Ms8vCgAXlduS_AZoEu+7Aw--.31707S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW3try7ArWUAr1xCFy5twb_yoWfGFc_uF
	13W3WUCw43KrsrCwnrXws5ZFZFgw4DCF4kAF9Iqr4fKrySqFW8u34kKr9YgFy8GanIqwnI
	934DXw48XryfujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8BBT5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQk3ZWgG3QyIpQABsJ

On Tue, Mar 11, 2025 at 08:41:12PM +0100, Ahmad Fatoum wrote:
> Commit 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive
> mode DTSI") added imx8mp-nominal.dtsi, which overrides all overdrive
> clock rates in imx8mp.dtsi to the nominal rates.
> 
> At the same time, commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
> GPU and NPU clocks to overdrive rate") went in, which changed some
> clock rates away from the nominal values.
> 
> Resolve the discrepancy by effectively reverting the changes in the
> latter commit inside imx8mp-nominal.dtsi. This is required for proper
> operation of the imx8mp-skov boards, which are currently
> imx8mp-nominal.dtsi's only users and lets all other boards that don't
> include it benefit from the new higher frequencies.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!

