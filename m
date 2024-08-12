Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC2813A3E8
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 03:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723434137; cv=none; b=JGcv0NTY6ovJr26nHTtCIrnwru6oZDPgM+8nErsG/NmLWSCCDipqPpfkUr4Mfb3n2SGfNwoahg+uG4AjvExhnc1+Zz5u63WnEcKg38SexvrV1GW4xQBuGGkCWkDlOq8sldM830yapd/bic8CgdTPP1/IeRVsVoepr9/QGDmZ3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723434137; c=relaxed/simple;
	bh=i+TgQmxGXtVH1FiZ1c2NwCGmsBqq2zwZ2PtqE7XxSVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mmw2ajs3I71fGvly4kMdfQtjuz4pm1Sx7S8Y2zkJts5uixGJ7JcMmcMMNIHupAJgY/5cvq0JgTIYkNFqC4r26kUTQnqDGP3VcoEH021PVPZzRxKJVEjltpczUk6ayxp7sOPi79A0yfdgyhzqflmK0YnriePOhZDFtgvCcfoRUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=K4ff77va; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="K4ff77va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LVjh+jnTWelYLC8I8rARnZucRHr83XhHl26jyAfxVzg=;
	b=K4ff77va0PMfyyFMaM3rE+h0XyPtrl8yKq4z44XdbR8BeffMfcS/LZrkkueGPG
	TZqns2qFHymKdwpxbSTX+h1apGWe1JsolTD+niCPu2nXUrKq7zMJJ+qvNRNZIgJg
	AnixC+NaxAJn0lrhX/EuS1ze7Q2+6ZLhswvmq0EVFKxeo=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnLy19hLlmtzRGAg--.42936S3;
	Mon, 12 Aug 2024 11:41:50 +0800 (CST)
Date: Mon, 12 Aug 2024 11:41:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v3] arm64: dts: imx93: update default value for
 snps,clk-csr
Message-ID: <ZrmEfXKXLoLjYjXN@dragon>
References: <20240715131722.161135-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715131722.161135-1-shenwei.wang@nxp.com>
X-CM-TRANSID:Mc8vCgDnLy19hLlmtzRGAg--.42936S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruF1xuF48XFW3ZF4fKFW8Xrb_yoWfGrg_JF
	1UJwn7CasrGF13KFnrWFyDJw1jvry8Cr15GrnrKF4Iy3sIy34Y9Fn7Zr95Wry7ZF42qw12
	g3Wvqr4xJw43CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8pHq7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAo5ZWa5f7US5AAAsx

On Mon, Jul 15, 2024 at 08:17:22AM -0500, Shenwei Wang wrote:
> For the i.MX93 SoC, the default clock rate for the IP of STMMAC EQOS is
> 312.5 MHz. According to the following mapping table from the i.MX93
> reference manual, this clock rate corresponds to a CSR value of 6.
> 
>  0000: CSR clock = 60-100 MHz; MDC clock = CSR clock/42
>  0001: CSR clock = 100-150 MHz; MDC clock = CSR clock/62
>  0010: CSR clock = 20-35 MHz; MDC clock = CSR clock/16
>  0011: CSR clock = 35-60 MHz; MDC clock = CSR clock/26
>  0100: CSR clock = 150-250 MHz; MDC clock = CSR clock/102
>  0101: CSR clock = 250-300 MHz; MDC clock = CSR clock/124
>  0110: CSR clock = 300-500 MHz; MDC clock = CSR clock/204
>  0111: CSR clock = 500-800 MHz; MDC clock = CSR clock/324
> 
> Fixes: f2d03ba997cb ("arm64: dts: imx93: reorder device nodes")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Applied, thanks!

