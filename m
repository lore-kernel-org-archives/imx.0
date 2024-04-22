Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153254C65
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713756349; cv=none; b=oX21ji9g808KtG2fSjdmLHmYIupRGmo3ZEhV5TE6oqnklrOHJMrML5JHWUM3M6SKOv/ezuTDn3N0lAJCk5YFsggZRQXTWu78thbGbTGXhErFmaiUNb14ej80nnYbQX8oJIRyngIHSJhRTHN4pbrO7UcHD5t4qeq3xc/VzFRYusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713756349; c=relaxed/simple;
	bh=Jo/907Tz+KrXlk7i/V8O/ousZUUkLKQWOor9Si88iro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9TPMdkTXRQKc5mESp473ZIv40EHWgL0ihoQ2uzTXr/Vpiz7M0ItND1q9GZOCguOV2G2miW87BlUe9oXCxUeD/hzSlgopcUIxANzm/welg7Opz3LeypT8bh1THoVKzfT7pQKXld43d8XI/VxJlXbGDrIgLrR4eavM2fRBINGukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nhKOL9P2; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nhKOL9P2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Sx06mjddR7zFEtdIz8pMTSg4vPpM/8R8plT2pGon44w=;
	b=nhKOL9P26k+uCbh+73sGqqQcsCRk+0iCfT1jmuK5Ea7oqa1v2U3U0sdSGGVwot
	mKitEbrw0hnAqtloUlsTXJMWhm6JVi0goeJHRkk32cdnJaog583eATFZBPDFiCPY
	jJfYRqXJPNK1dX8tI20/3o7mTorI8PNwTHTcAiLQYG3RU=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAD3n1aJ2CVm7DMrAw--.50234S3;
	Mon, 22 Apr 2024 11:24:59 +0800 (CST)
Date: Mon, 22 Apr 2024 11:24:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] arm64: dts: freescale: Add Toradex Colibri iMX8DX
Message-ID: <ZiXYiVnEwBUIWLCj@dragon>
References: <20240402193512.240417-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402193512.240417-1-hiagofranco@gmail.com>
X-CM-TRANSID:ClUQrAD3n1aJ2CVm7DMrAw--.50234S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4UZr1rKrWDuF1UuF1rZwb_yoW3Grg_ur
	W0yF1DA3y8XrZrtw1Yg3W3G39rGa45Cw1Yqa4DJr1SyrW7Arn8ZFZIv3s3GFy5CFZ7GFyx
	tr15J39Yvr4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8DDG5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQvIZV6NnFLpQwAAsE

On Tue, Apr 02, 2024 at 04:35:08PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This patch series introduces support for Colibri iMX8DX SoM and its
> carrier boards, where the board can be mated with: Aster, Evaluation Board
> v3, Iris v2, and Iris v1. This SoM is a variant of the already supported
> Colibri iMX8QXP, utilizing an NXP i.MX8DX SoC instead of i.MX8QXP.
> Therefore, this patch series also adds support for the i.MX8DX processor.
> 
> Hiago De Franco (4):
>   arm64: dts: freescale: Add i.MX8DX dtsi
>   dt-bindings: arm: fsl: remove reduntant toradex,colibri-imx8x
>   dt-bindings: arm: fsl: Add Colibri iMX8DX
>   arm64: dts: freescale: Add Toradex Colibri iMX8DX

Applied all, thanks!

