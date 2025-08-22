Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEF26656D
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850859; cv=none; b=RmSNsQNlyyhQmPMuX+S2xk+smEJrR+WzRaT/goJh0lwueU9XyphJDxvDDECQVuoRXC4K8lGSVcdBflfqxIaFKnMA9yD7/8wFRQxr0H39ZnoaHHeNv+aaF5SxB0yqY7WjA3fudLMexpw4wcg3Sx9y85ogNTF6lDXQcIOG6gIFIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850859; c=relaxed/simple;
	bh=gT+uCyvORUgow/r/s/qtIu/DxkpCLyQYLLAUjfkwvjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFdiAz7k8VOjQp8vDqnEP/9z9mE6++c5ruIrbndZACxYProEetu0WdisU/imlZA1I5hDVgf95bXrB8QDYYP92Rx8IIrG/lV0kHZpPPhVBXqKn3fHCZOQCvc7fzMz7vFJLJ6ikYoOhJeMC4z3u4n0z3AhtSCbtNXRSpsGuobT0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WOPPS5hR; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WOPPS5hR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=X7lCgG8GrQswBuJIJakKfaDBSGGImpfURwXpxB+YW5w=;
	b=WOPPS5hR2h8KH9M7CWhDIeOhj3zQBWrhoYPH6BQwq3SINLnZunFKigpbdDon7S
	C2hi5bh9tj6USHS7BJvZu8nuFBaI8jKEWfxHA+LUVEeX/UNUnvgc4Du83Hx4PpoA
	Y9lwLd96YWBQ6CIPhMfRyKE/dua4BrpQY6afnIYr8WFSg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDX3bE9KKhoWrobAw--.25268S3;
	Fri, 22 Aug 2025 16:20:15 +0800 (CST)
Date: Fri, 22 Aug 2025 16:20:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-tqma8mpql: fix LDO5 power off
Message-ID: <aKgoPGO_CXVrH57j@dragon>
References: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDX3bE9KKhoWrobAw--.25268S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWftFWxAFy5try5uFyDZFb_yoWfKFg_XF
	WxXwnrAws8Ww4Ska1FqFs8KFyS9rW8ZFnxJw18Kr4fGryIvay3WFs8K3s8Aw129a1vka4D
	GFy3ta1jyrZ8JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB9dwmioKD-XjgAA36

On Thu, Jul 31, 2025 at 11:16:52AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Fix SD card removal caused by automatic LDO5 power off after boot:
> 
> LDO5: disabling
> mmc1: card 59b4 removed
> EXT4-fs (mmcblk1p2): shut down requested (2)
> Aborting journal on device mmcblk1p2-8.
> JBD2: I/O error when updating journal superblock for mmcblk1p2-8.
> 
> To prevent this, add vqmmc regulator for USDHC, using a GPIO-controlled
> regulator that is supplied by LDO5. Since this is implemented on SoM but
> used on baseboards with SD-card interface, implement the functionality
> on SoM part and optionally enable it on baseboards if needed.
> 
> Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

