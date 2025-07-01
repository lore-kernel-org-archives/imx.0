Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65760DF49
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379057; cv=none; b=ojXBI/3X25pk9TMuhU2V+ImgVTr5zYdj244nLFDoAyHozx57qPaf8pVT7yu0lSt3a4euFzdFMP7SBl6jg+DVB/Ro4pAN2OctkBl3rQz6bpy94lfYrsBaPI+thi+6uTVj0agGZS81U/mwtCOQxSIAvLSKUNVG2Fmfct8GciGcvpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379057; c=relaxed/simple;
	bh=MpFkfDpxyBVKJbOwXO+XWHCbVs8tQSV5Qs2LgR1ZovI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zkb0ApmsU1m0K/xDjtsnSr6p0rLpDFZe5vh5y4/pL3dE5jlM3+uatuG/0i1ddJEBIqp/hy/5zOLQIoE60jJ6P2ST+YYNgFUJ0+OkIPFUFXhbwqy9TvWHSO3fzLcLbrokCZUid0tneDJDrWqiw2W2r57K1GbcgAu8sIa7Ockm3fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FfptibPU; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FfptibPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ccwTO1+murNAroUo7i8VjIf/zQTbfNXH6TQUxv/Gevc=;
	b=FfptibPUzI2MDrxoHVXSUm10uI51Bze4AISF9oavkrSCrh3Y738BNsWXSLIRAj
	olZ8EgnkwEdyfM/Jr3zGS4l1NW6pAtn5lZO52sHDpDyEkw2fQpR7MoNvqENrSvoD
	gzLXv0SJ+8SFY0RC7HuWpLxvimLoymi5Oy1y2Eatw6YO4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v6Nc7GNo2bQBAA--.3640S3;
	Tue, 01 Jul 2025 22:10:37 +0800 (CST)
Date: Tue, 1 Jul 2025 22:10:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the DMA interrupter number
 of pcie0_ep
Message-ID: <aGPsW7iUj/0K84rw@dragon>
References: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
X-CM-TRANSID:Mc8vCgD3v6Nc7GNo2bQBAA--.3640S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcv38UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR5Fqmhj7F4r6gAA3o

On Mon, Jun 09, 2025 at 05:11:27PM +0800, Richard Zhu wrote:
> Correct the DMA interrupter number of pcie0_ep from 317 to 311.
> 
> Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!

