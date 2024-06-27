Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E4313DB98
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719484669; cv=none; b=WdP8u+ms6xgfV6Ud3uWfW+/W2ICb2xH5efzSbfFbTefJQ5tGgtBdR90dSxQg70ChRKO+jPwbbZbNOz7MqQJtrFZfRMUx3Ru+Zt82hTLEUnIhdHANGTqtynkDowEnOxgtF8f6+cJ3iSBqAu0wNDK5YjNPgsvtN0zFQsWfje9pj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719484669; c=relaxed/simple;
	bh=J7HqGzCFxvM7WV0C+sFHgXvFU5LTNWgPqlRmG8ld9Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zgg3xB4za1Tv1N8jD2bOf05iptFbUn0EAg8U0WkHoAigj28T5qTTnZEH9cV9PvvoTKPE5F+alkACqxgeidT6A81g3NO/mByMyo9Bd6Aqx1Mf6DK0xZPfEKQp77+HSzedm7KNNlbIBLvA9CSzg788ESozhAkMx3XmmLXDYDuGDmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=T8f3RMfO; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="T8f3RMfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9sxCIQg8fVr2efTR8sroAQlij2XuJ03C7PxfEvrRihE=;
	b=T8f3RMfOBpTFk3XO4029KZALIhUqtMbPTWZnXxtrB8H7YZbSeIAh7fwXr/kosi
	T+Bq4oC2xcx5bQRO9ER+K+ieawG1cpnf40Hp9M6FA+QMV+qzlc/F78BJdFgAjXsa
	T+Kcl7+oOMyWp7GIJXrLyVRoG6YHVeTlzcUoCNZscCEQA=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v2riQH1mnIwaAA--.25525S3;
	Thu, 27 Jun 2024 18:37:24 +0800 (CST)
Date: Thu, 27 Jun 2024 18:37:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v2 00/13] arm64: dts: layerscaple: clean up some simple
 CHECK_WARNING
Message-ID: <Zn1A4gcDpOArsSof@dragon>
References: <20240626202533.2182846-2-Frank.Li@nxp.com>
 <20240626202809.2187404-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626202809.2187404-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgD3v2riQH1mnIwaAA--.25525S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AryfuryDAFWfCrWxZw1xGrg_yoW8Gr4UpF
	Z7ZrWUKryIyr9Yg3WkZ3ZrJ34fG3y7tF45Jr1agr1qkr1Y9rnrWF9Y9F98WrWkGan2vay5
	tF17XF4ktw1vvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVZXrUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCw0LZWZv-czt0AABss

On Wed, Jun 26, 2024 at 04:28:09PM -0400, Frank Li wrote:
> Change from v1 to v2
> - Combine some similar warning to one patch for difference ls chipes.
> - Remove arm64: dts: layerscape: add '#power-control-cells' for rcpm
> rcpm actually not power-controller, it is wakeup controller, need
> better method to fix warning
> - Add aux-bus fix
> - Add pcie irq order fix
> - Add rename to rtc fix
> - Add thermal-node name fix
> - Add q(b)man-portals node name fix
> 
> Frank Li (13):
>   arm64: dts: layerscape: rename node 'timer' as 'rtc'
>   arm64: dts: layerscape: add platform special compatible string for
>     gpio
>   arm64: dts: fsl-lx2160a: fix #address-cells for pinctrl-single
>   arm64: dts: fsl-ls1012a: remove property 'snps,host-vbus-glitches'
>   arm64: dts: layerscape: replace node name 'nor' with 'flash'
>   arm64: dts: layerscape: remove compatible string 'fsl,fman-xmdio' for
>     fman3
>   arm64: dts: layerscaple: add #dma-cells for qdma
>   arm64: dts: layerscape: rename node name "wdt" to "watchdog"
>   arm64: dts: layerscape: change pcie interrupt order
>   arm64: dts: layerscape: rename aux_bus to aux-bus
>   arm64: dts: fsl-ls1043a: remove unused clk-name at watchdog node
>   arm64: dts: fsl-ls1046a: rename thermal node name
>   arm64: dts: layerscape: rename b(q)man-portals to b(q)man-portals-bus

Applied all, thanks!

