Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7BD10F1
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725236338; cv=none; b=agZdJ784DrjGpfLKMMJZB1uU2NBe/ZyXzyc6ovM1PosPG9O6YjYM/6SCE8Oo0QbgFio2SRyAzSz2ibintRUFXSWBFlDKsvvYX274m0dFBWPLqzhQ0lxjmqaybFOfDEvyA4bi1GRjaFy+ggxVxu+vPb3hDeSZRHkXTaTeKwmcptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725236338; c=relaxed/simple;
	bh=bFgpBxr1ExJykb6/n4hB331i4X0O/IM7z8IVLW1zbYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMewoRk88LaQAjGWYnYoeZwrOJ8X2OZyoXTCYvMeO/q84PXYp5Aqc+IihtdKG7kSDlmt4nWQ7FcQL1ZWBcFv5bex4KxIBlf/xWKux75LTne44JBpX1S/BWN3kyak3e5CfpVHTkTvGjlI5FQG14vdnc5+I5gguWGQYwdWaflrclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=R5tbjC/D; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="R5tbjC/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=XjAje4pitOXQaB8BQX8fWema7W0MNFErHvfxJctjepI=;
	b=R5tbjC/D4Fviq8IsJdQLkVwZ8FIQiqWXwpJo4Y2bTvZh4VZB46D5/KGjatbmEi
	RMjL/CJUBYIkC0H5XBYp/B8shqrGEOe105p5ZK1jTRKZsyYVmt5YrbgX6TzSOs6e
	nFAMxrnz2GMTpqXfv9HUVBjs+MDf7bEiwZRC6tvibR5cA=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3P11EBNVmN+lKAA--.41028S3;
	Mon, 02 Sep 2024 08:18:14 +0800 (CST)
Date: Mon, 2 Sep 2024 08:18:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] TQMa6x / MBa6x DT improvements
Message-ID: <ZtUERBLeWx2j0BR7@dragon>
References: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgD3P11EBNVmN+lKAA--.41028S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrAFyxJFyrJF48Zr4fuFW8Crg_yoWxGFc_uw
	s8Wa9rAa15GFs7ua13JFn0gFyDKw1Utw43K3s8GF4aqayfXw1Yga93Kry3Wa43CFWSkF1q
	kr15Z342gFWxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5r3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERROZWbU5TQ3HwAAsl

On Wed, Aug 28, 2024 at 02:19:55PM +0200, Markus Niebel wrote:
> Hello,
> 
> this is the 2nd version of the series
> 
> Changes in v2:
> * use uppercase for ARM in subject lines
> * drop "ARM: dts: imx6qdl: Rename USB hub node name" due to
>   open discussions
> * no changes in remaining patch content
> 
> Best regards,
> Markus
> 
> Markus Niebel (4):
>   ARM: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
>   ARM: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
>   ARM: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
>   ARM: dts: imx6qdl-mba6b: remove doubled entry for I2C1 pinmux

Applied all, thanks!

