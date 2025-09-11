Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE82AD22
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553001; cv=none; b=BLyrMzYp9rTt03bQjFterzo2VCxj5SrTKi5yx1Pz2CPqVYX1us3EFUldHQOj68n2KOskJDdEGLACfsGD9+iLq2ixlhQlzNqmbnABKFQb6uv98HKejlBM/4m5pKiccX83veCqgj4t6cWFp7oRBkF+gFTJ8yhatomEENYnKllg8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553001; c=relaxed/simple;
	bh=Sz+NVcU26w6m2cAYOsVGsNSAgePHTrMwLinIIgk3sEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5pyW1uKajDvwUrucXVDQTYJQTbyb9ejd2xpp1SN6R/fxZ/Ui3mPgqzI1lLL6cTKFGr2+Gc6M154fNFbTdY/IS4I+OoYY9JbMuCVBm11sH9Qdg0KygjI4z9byNmwvhr7vxNXvU/CUkRAlC2SDrU+9XEFkt9QEwNMlUy8hvBGim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jCAOO/Rp; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jCAOO/Rp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=p8fZSVL95erMaMyHPCedn250s/J96Co6GTJBPpiNgNA=;
	b=jCAOO/RprN1yTPtfvT+mOmogybY+U+bASpvpUWB9ahkfir0D7ld6jJFgp3H4TO
	It9wIhIjBhRyJ8JyVrW1Qs8H01gZoFBw1EnTylHJy/7IYHnvgtrZsqOA+vi7R5Vn
	QP5O/CqHP8r6VrqV9kFURG+l4ctRXgrxXTY8hV/Rg2S04=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXv_hTIcJooAxfBA--.43095S3;
	Thu, 11 Sep 2025 09:09:40 +0800 (CST)
Date: Thu, 11 Sep 2025 09:09:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,imx-iomuxc-gpr: Document i.MX53
Message-ID: <aMIhUhBgpIo6cPW7@dragon>
References: <20250822120241.26419-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822120241.26419-1-festevam@gmail.com>
X-CM-TRANSID:Ms8vCgDXv_hTIcJooAxfBA--.43095S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjBT5UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAfFZWjCB7k19wABs0

On Fri, Aug 22, 2025 at 09:02:41AM -0300, Fabio Estevam wrote:
> imx53.dtsi has the following compatible entry:
> 
> compatible = "fsl,imx53-iomuxc-gpr", "syscon";
> 
> Document the "fsl,imx53-iomuxc-gpr" entry to fix the following
> dt-schema warning:
> 
> failed to match any schema with compatible: ['fsl,imx53-iomuxc-gpr', 'syscon']
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!

