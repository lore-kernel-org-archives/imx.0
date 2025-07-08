Received: from proxy41131.mail.163.com (proxy25211.mail.163.com [103.129.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1DC381BA
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956321; cv=none; b=TKdAo1AviUjTE2vDARDvNC7TzVzlPiFiz7Pf8Ra+6rwISmJKWQNGTaq9HFXbOh0MrbGqqWb2PuFx8PtkN+F2cYbVndx2qs1ZrW4ZY81yOYXFzwrEyktFrxvCqYoHO9BpOZHvbS8se3ZLOyKS6Zg2ux+pZI/217w9TVVZkPnrvRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956321; c=relaxed/simple;
	bh=8DiGm7JdxqhqiJYsU7wV565PsIViSY8uZBpcx5obpAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5WxFkEBNW03VQH8NrNNGorFPavHlXHncwU4G+ORYHpCHW2Th2btH8KZZRlYm1+uGYgnLbaqF0DnwkTkzry3sxQwac769SgXI3CXMAaLOOJ56eZ3xgAPsTdrRZpchXtJGia4m3J0juLsYfKeR5bjOtog/K8ySjXlDZyuBHibv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S+KJ5AK2; arc=none smtp.client-ip=103.129.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S+KJ5AK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=nE8AnDzlAdTdSngj6L3+BpOpqe9eo0q+LJAko/lAh1k=;
	b=S+KJ5AK23OGLNHolHJf9c6oSpMk54xLgwdvcsRI63T+0DPKe5PFiqg602yto46
	oRgIAsQxhx5Qb0zep12adXbZ114PoRqwXZjTE2kQNvnWdCi7Sq6kWPHUkNCooQTP
	2uegxccet03BMcbpdiu/Fv4218o1vRQxoSsB5oQ08/pWI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXt+wWu2xoWjCJAA--.42179S3;
	Tue, 08 Jul 2025 14:30:48 +0800 (CST)
Date: Tue, 8 Jul 2025 14:30:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/8] TQMLS10xxA DT fixes
Message-ID: <aGy7FstpQtetMZ8v@dragon>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgAXt+wWu2xoWjCJAA--.42179S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrGw15Kr4DCr4xAr15KF48Zwb_yoWxXFXE9r
	yfWrn29r18Jw4Sk345Za17tayIgr15ZryUAFWag3Z3Jr1IqFy3Z3s2qryfWFyUXrs09r1D
	Zw15J3Z5XrWYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjzwZ5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBGEZWhsmnlz4wAAsD

On Tue, Jul 01, 2025 at 08:24:48AM +0200, Alexander Stein wrote:
> Alexander Stein (8):
>   arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
>   arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
>   arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
>   arm64: dts: tqmls10xxa: Move SFP cage definition to common place
>   arm64: dts: tqmls1043a: Enable SFP interface
>   arm64: dts: tqmls1046a: Enable SFP interfaces
>   arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
>   arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash

Applied all, thanks!

