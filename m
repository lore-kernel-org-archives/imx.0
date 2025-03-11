Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D43A79CD
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741663073; cv=none; b=aQnm1juOa0YU/RmwyRKzsZdiw02FDw63AJ4GBpxvc6qf9LciC6hZwBik5g0r0BraCMjWpa51r0qWkicdT118N71MpAss8DPGD5t8ooHgqwHfirVLHjFTjr0lzKtgLhFBLk0Q9VlF6xUy1pwgWM8F9w89qwQJpjFJD1Iz5Kk77s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741663073; c=relaxed/simple;
	bh=ZCiXBTN1s3AS+r3AOui8T9WHCHy18ApE6M8Au11Pvi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAy1vL2HnK/2FJr04Y9vFwahj0VHZiBltHcbbMww2hAGIabuPSNUks85mLVeLaOjL5Hx+N4bCt/sd+DHmwAIhBq59IIaS/aNIahojXYx3lfLyhdwJzJGdm0twoYLy9aIbLHhSdlA9cE6xGljk8tT2QnYb+h2tsgMedbWfSmbWMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GG5GFchA; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GG5GFchA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Aq8SV11ktNKPubNSIy42XayO8ZwBJ4qz7bkyi8r6F2Q=;
	b=GG5GFchAxpAGPo82H5nUiF2ZbMql+rPtCfMG14RT6PpDA08JFfZvZ8YXfbX91T
	SQcOsDkTcV0GT3KaFF0tBLdC1GEruSaWpfA8NtYG2yGJ9mn00zIenoqdX7j7OQjG
	EMN1ggwZjC7VM/1o7BCBTqN+1Kv0Elzg7mDeoOJrrfNz0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXU9o_q89nCfS0AA--.943S3;
	Tue, 11 Mar 2025 11:17:20 +0800 (CST)
Date: Tue, 11 Mar 2025 11:17:18 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] arm: fsl: drop usage of Toradex SOMs compatible
 alone
Message-ID: <Z8+rPvG177Csh2m1@dragon>
References: <20250228151352.91768-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228151352.91768-1-francesco@dolcini.it>
X-CM-TRANSID:Ms8vCgDXU9o_q89nCfS0AA--.943S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcxpeUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxANZWfPo9QqJgAAsg

On Fri, Feb 28, 2025 at 04:13:48PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The Toradex SOMs cannot be used alone without a carrier board, so drop
> the usage of its compatible alone.
> 
> Francesco Dolcini (4):
>   dt-bindings: arm: fsl: drop usage of Toradex SOMs compatible alone
>   ARM: dts: imx6qdl-apalis/colibri: Remove compatible from SoM dtsi
>   arm64: dts: imx8qm-apalis: Remove compatible from SoM dtsi
>   ARM: dts: vf610-colibri: Remove compatible from SoM dtsi

Applied all, thanks!

