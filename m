Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331D2F5E
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553343; cv=none; b=GojvqjxAegeEFlNSQI/s9sn8BH3ZEXe7rhw0Zy2LqL+fu4Mql5mbmF+DZ/w5vVnUZpJeM6ifWdcFPDE5DhJai28NKYVQIxo9OrnUy9v8PrfwOE3E4W683HhZROrREJUqI/IHbHJn0Y3LCtLNWnQlmHxYP0Y6uWP2EtllZZGn1Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553343; c=relaxed/simple;
	bh=MGo3/nKeJK4F+5hQG4kpGerEf9e647qmvvEK5Oem/oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cobTKI1YUDT+JCNHsdJaRR6zSb9jkEIAHNDPECGOz64ibGDN0doz+4v+EN/CzESLWxhzUOwDQuXxMvWrWMZGDlLQ7v+dQlyS62WeY0lZfZQGq59en0aFCKPNxyBlkSSCBtDEgxx3IADViid1AFuNlS8J9UC3Fr0PP6PNWE5sEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S4N2q8bt; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S4N2q8bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4k5/JPOBUxwbc4K+iaUVIBbHlgzzxXGM8UQoWVaZokQ=;
	b=S4N2q8btx7USS4KJ2EKqMceSqcD7brZbf/0+Sws0iffcUe0hYFZaJkmmAJ/nGd
	p/V5wMfX0PKxixZHY11vNbQrvsvz4SlHab12bkoK3G6eqyrvJh4z6UXKOJ6ZoJ+f
	/NfGRgJxRCTM6GQhGcMNALXg6oHt9vTPNS61WX+bdupCw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHX52YIsJo9NhFBA--.59011S3;
	Thu, 11 Sep 2025 09:15:06 +0800 (CST)
Date: Thu, 11 Sep 2025 09:15:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB
 driver
Message-ID: <aMIimFUa6p4Zqfg7@dragon>
References: <20250826141356.2572830-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826141356.2572830-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgDHX52YIsJo9NhFBA--.59011S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4xtrykuF1UZFy5JrW8WFg_yoWftFc_tF
	48X3s7Zw4UXFW2kw15XFsa9rySk3y5WFy5Gry5tFyfW3W0gFZ0vasxtrZ8Ja4q9wsYk3s8
	J34DZr1Ykw13XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjD5r5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhjFZWjB-SpQ1gAAsS

On Tue, Aug 26, 2025 at 04:13:56PM +0200, Alexander Stein wrote:
> MBa91xxCA (imx93-tqma9352-mba91xxca.dts) features a soldered,
> non-pluggable USB attached WiFi module. lsusb says:
>  ID 1286:204e Marvell Semiconductor, Inc. Bluetooth and Wireless LAN Composite Device
> Enable the corresponding driver.
> 
> To: Shawn Guo <shawnguo@kernel.org>
> To: Fabio Estevam <festevam@gmail.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: imx@lists.linux.dev
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>

For future posting, I suggest you put these below ---

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

... here

> Changes in v3:
> * Explicitly mention the onn-pluggable USB WiFi module
> * Added Krzysztof's R-b
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

Shawn

