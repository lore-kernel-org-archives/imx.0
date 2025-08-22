Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C58137750
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854260; cv=none; b=AMCDp6rARAIrMHRuy92rfyvWqGvvagvlDCldBHiM9IoVx4Sq+8jWSzqLEBIgT0IJ4Y4LWmGoh97p1/+WCVXi6JBSTkOUO1RhJWLG7KNB77b8A9rS0aoUG/HY/EltyupqEFvtrG49j2R0LbP7/m0obLE5ORubLyhczEpEeVSO2NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854260; c=relaxed/simple;
	bh=7tXYPx2ieDCrkMI7Q7FPajuSN1ccn3q1ErSI9tkhF3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN0PJrHs6osV1zqQyw/znWeCA27mTKVqGbtUgK0QnNlcxs47dv11GSDhfQFXnRu+i28kmLbGeJlB4GeP5hJFwpmkcvmWTvurPZo1hLhi3Wye2a25murIPjmNHgJm+51TasFlFIkKVeWj6l7Ylpme6ilWLnxpL1xsWAelSPwVCkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=M/KtJtvM; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="M/KtJtvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oBzQOvbLKOrZCDGuj3oPGBAjjn0+n8NN80uKEiiCKd0=;
	b=M/KtJtvMplcZe67IU8qz2DXQAIi8h2Hr3C2+F7wj7rv+hKf1k0kUCwvX+53YEA
	OQyQYvL7SSQvu1HyXuVnK5KPC++zpFYrQVDHwGHVyLg8JFJVl77IN0UT70J6osEe
	xBiCmgWCbUHgM89J+71Ho4NpYeG56wl2nP2PalGdCQBHU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA39W6YNahoQtcVAw--.16293S3;
	Fri, 22 Aug 2025 17:17:14 +0800 (CST)
Date: Fri, 22 Aug 2025 17:17:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joy Zou <joy.zou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Luke Wang <ziniu.wang_1@nxp.com>
Subject: Re: [PATCH v2 00/11] arm64: dts: imx95: various updates
Message-ID: <aKg1mJSZq6Qcrq_r@dragon>
References: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
X-CM-TRANSID:M88vCgA39W6YNahoQtcVAw--.16293S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DXFyftr45Wr17tFyxXwb_yoWxZwb_uF
	4rW3WUXw48tF4fA345Aan29FWjqF10yr9rWry5Wwn5Xw13AF1Yy397ZryrGr4rGrnI9r9x
	A3WUXw42qF45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj58n5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxq3HWioNZqYHgAA3u

On Mon, Aug 18, 2025 at 09:25:30AM +0800, Peng Fan wrote:
> Joy Zou (1):
>       arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid
> 
> Luke Wang (1):
>       arm64: dts: imx95-15x15-evk: Change pinctrl settings for usdhc2
> 
> Peng Fan (8):
>       arm64: dts: imx95: Add System Counter node
>       arm64: dts: imx95: Add LMM/CPU nodes
>       arm64: dts: imx95: Add more V2X MUs
>       arm64: dts: imx95: Add OCOTP node
>       arm64: dts: imx95: Add coresight nodes
>       arm64: dts: imx95-evk: Update alias
>       arm64: dts: imx95-19x19-evk: Add pca9632 node
>       arm64: dts: imx95-19x19-evk: Add pf09 and pf53 thermal zones
> 
> Richard Zhu (1):
>       arm64: dts: imx95-19x19-evk: Add Tsettle delay in m2 regulator

Applied all, thanks!

