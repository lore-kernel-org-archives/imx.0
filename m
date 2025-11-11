Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C6D34253A
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869013; cv=none; b=LSU+tFTCut56p9GzI496Nv9AvanjIXhrCUKNk3U/dGNSR8eTZFA2voO0B4KMr+maNT4YFxpkp8zOEQgF9Bd2xRShnadQ9yGbCTxVaAJ3WSYiu2RGS4aEEM7lzrOR7+QFeL+H69xHTVz4Z9I8/nLr66fO8chWZEwh8OSrvtoPrgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869013; c=relaxed/simple;
	bh=EplIHvrvZL420qH1C2gc31qKDeP35H2HjVrJb3PNEHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEwfs//qDjmozrz0FMyNKIcyc6fgzzEriearjEvbanIGwL4SwEtE1iE6aoeMvOpgvgx/nn8Y3U7EmgQE8qlLy1WGwdsjFis1GbEzthFUFvuGlmJ39HmYWNIN4FckH7ckPzBo1rZUcZKJ8xYD0wbLCBKd884BAXm25r4ljsDpB2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eWREf8iX; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eWREf8iX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2vkKMxf17e38diTrd8d7LZ5FzwArRfBMVD8++NmkNFY=;
	b=eWREf8iXLuLd9plb6jnp4QaIo7pbi+FuTcQL/YI0+h1TazDRMOCjwfyHburar7
	wOvk+GmqVGKEFqr90TwEpAJVOX3NixI1qYQUhMrKV8Gv96nlvA7A+xCJmPuZxMx0
	zGk4qSFKoX0B2fl6Jhrj/tVYrkMl9lf7TYciVLi2qQTqE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAHhmfpPhNpH63GAQ--.5223S3;
	Tue, 11 Nov 2025 21:49:31 +0800 (CST)
Date: Tue, 11 Nov 2025 21:49:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY
 address
Message-ID: <aRM-6aREP-hrnio0@dragon>
References: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026121730.13197-1-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:M88vCgAHhmfpPhNpH63GAQ--.5223S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUza9aUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAvoTmkTPutIKAAA3W

On Sun, Oct 26, 2025 at 02:17:29PM +0200, Laurent Pinchart wrote:
> The RTL8211E ethernet PHY on the Debix Model A board it located at
> address 1. Replace the broadcast address with the correct unicast
> address.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!

