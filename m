Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDFB1DC1AB
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763286507; cv=none; b=Yr90tmRPj0W3HT74gxXo/cWRTFRE47qUV72/TrYgb5TINysIFmT9Ld0z1bnIGax6SOdVrCG0yuSLwRUp+crlSkAiS1yJnBMmPMJCz3ocQOGvFn02J21wEkgZr645FxhK9uSYXPPcsjle3K4/EVucG7/zlGwR7vvMoQuhL2v0hio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763286507; c=relaxed/simple;
	bh=Hp2atl9t5xIVwy7sgsh1e8BrpkafWNjy8CjrtdyPOhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp6CVjPpDN/ppmbRhjNeVYHe45+fIpB4Ov9LcJdKHKaucfyn0VNRHew4eIN96kF3t15bJenqcpWXFQNVSNTz1CaD2FFnkrfssz6G/8htqqdzwe1HrmAK4xmdRmRTxTVvMBzuTSR6ZtnGT+r/7vGnwJf6+/dUaZTnxyhnG2Dkt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=N9/Q6SI7; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="N9/Q6SI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0cY+G5UJjnLAD9/H2WXsd8B/NgDerlBepu3HbT7K5Ak=;
	b=N9/Q6SI7lq1zQ8sgGDzn0Xo/e9jlUnGFwI0ZkiFPshrDabfuEya3AaCiZzruK4
	hH5dUCpeCgSUUpUCG05+Nsgc+9DwTDm96Q/R/npjwfFLeQSz5mWHdxCwegKBwMD4
	RpeJ1p0q8ktGlggLd/toyq1WqJGMoqluLG8Zjh6IbowuM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnzQbXnRlpa9c5AQ--.7981S3;
	Sun, 16 Nov 2025 17:48:09 +0800 (CST)
Date: Sun, 16 Nov 2025 17:48:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH 0/8] arm64: dts: imx8qm: collect some missed qm patches
Message-ID: <aRmd1_B5nnUr9Bu0@dragon>
References: <20251028-b4_qm_dts-v1-0-51ba94389c1f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-b4_qm_dts-v1-0-51ba94389c1f@nxp.com>
X-CM-TRANSID:Mc8vCgAnzQbXnRlpa9c5AQ--.7981S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5tw1DWr15Xw4xJw18tw13urg_yoWxXwb_u3
	9YkF1kCw43Gw4fA345A3ZF9rWjgry5Cr9Ig3s8Xw17Jw4xZF1ayFy0va4rWrykWF1fZFsr
	A3WUXw12gr45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1a9aDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBk+o2kZndlRiAAA3d

On Tue, Oct 28, 2025 at 04:30:41PM -0400, Frank Li wrote:
> Frank Li (7):
>       arm64: dts: imx8qm-mek: add state_100mhz and state_200mhz for usdhc
>       arm64: dts: imx8qm-mek: assign double SD bus frequency for usdhc1
>       arm64: dts: imx8qm-mek: add lpuart1 and bluetooth node
>       arm64: dts: imx8qm: add label thermal_zones
>       arm64: dts: imx8qm-mek: add pmic thermal-zones
>       arm64: dts: imx8qm-mek: add usbotg1 and related nodes
>       arm64: dts: imx8qm-mek: replace space with tab

Applied these.

> 
> Richard Zhu (1):
>       arm64: dts: imx8qm-mek: add supports-clkreq property to PCIe M.2 port

This had been applied as part of another series.

Shawn

