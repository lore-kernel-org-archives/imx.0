Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A4064A
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 03:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724815617; cv=none; b=G+0Jty/AEpBMFpkz467sIahAZdMyfdyiOBXk2+s9WAwaoVYN/AoPKT83Cjd0dQiVLyO/L+VJY0RCeHMYxX+SherAoHkucetw0wc653n01wro+eMta52h2hWjNiBeku1l0+AE8ykCPprbjSYKaEI2vOXg4i5z7pULNiGK11HA4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724815617; c=relaxed/simple;
	bh=Q39l5fDbckzRksH8EAZrkXrhZJa8vD8qWLMhV8saxUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQdaJuMVB5TeKaQKMiO0oCho6/hpV5wkaw3tCcsKSzBjq5tvFOytatyVxaerY1I1jbOKprs7Kgs2rUVXPS8IzZbW4i4BMBByD92L1vI0X8pZRQ1/L6JhDZUm39xt+Tjaelf4XdIuJDU8OQgqkQNeVFdKk4HJdzHVvRzs6G84d6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JfSXU9+e; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JfSXU9+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h3JjGv/N8L2zcJNzHvUr/aEYJjgel2MGlSMr+f/ZFVs=;
	b=JfSXU9+e3yHLS+lZrdekQWxA0EPvUQtPhP2j+VqctrnXBm0g1yAnXyzNRCHh/D
	4mrePmIwxrAnZHkxzmjSVWOkIPHswWpQJlDvFVZ0lxcGLQ97mRGCEVRgSGHZ72eQ
	djoJnulukVryd7kxSIx89IDfNg+4AgFH0IlPEDR+MS5Ts=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3vz7pmM5mSMoOAA--.22932S3;
	Wed, 28 Aug 2024 11:26:35 +0800 (CST)
Date: Wed, 28 Aug 2024 11:26:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 0/5] TQMa6x / MBa6x DT improvements
Message-ID: <Zs6Y6XoqU4DBLvbL@dragon>
References: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgD3vz7pmM5mSMoOAA--.22932S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw4DGw17WF4DJFy8GF1xZrb_yoWxtwc_Zr
	n8Wr4DAan8GF43W3y3Jrn0gr9rKw1UKay5Cw4rWw1UJa1rX3Z8Wa92k343X3yxArWFya4q
	kr1DZ34j9FWkGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8E38UUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR5JZWbOhc5TWgAAsR

On Mon, Aug 12, 2024 at 04:34:26PM +0200, Markus Niebel wrote:
> This series brings following improvements:
> * use a more specific compatible for the LM75 temperature sensors
>   on SoM and mainboard
> * move I2C pinmux entries to variants that use them and prevent
>   doubled declaration
> * rename node name for onboard USB hub
> 
> Alexander Stein (1):
>   ARM: dts: imx6qdl: Rename USB hub node name
> 
> Markus Niebel (4):
>   arm: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
>   arm: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
>   arm: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
>   arm: dts: imx6qdl-mba6b: remove doubled entry for I2C1 pinmux

"ARM: dts: ..." please.

Shawn

