Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071532C6BD
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725175834; cv=none; b=eiqGryb9ulxAKvLAxk/vpET/tCE0OVXIpyIDiNBCXk8udv0oX7GoCopHl4kSaqMM42f2NUp5AcL99+Ve9tTSJAPP+ETQY0AbEQkKBm/ikRSS60dXUGTYWtfLbiaFLpR2OlK+jlyorbc1GhxCc9C7BOAiya6RnslwAxh7ahfTCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725175834; c=relaxed/simple;
	bh=dfGeXFMOq6f00IZpOQZm8N5Bvm7vAxBrOwA5Vq8b3xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR7GLPFztqPgSn6C0BihlyzDzeAZPsnR3jv0ryN6QxsvwXeK2iDCSceqgti8EKaJNnqHpmPKC5gJ6UTaL6atgcZPt0LWll//hOnj5ygQpdiJrNtkTTa8mfZ5y6HS4LoHgrLUN9Gdl/yplpjERZ35q/a+/z7jjWk632x3Y5g3Acg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gnvR+cAG; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gnvR+cAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pMInww7cugqnnQuFre6/o9W0dpqCLo2tn4lGGIQUctU=;
	b=gnvR+cAGDxeHajIsy6dlFtqNBj4IbIo78MXAltpJMcHmI1z72OVOh5kTjrqCcI
	/yXS+282eUEifveONnd5G2nPlGCE+btKdUfdDzzUiR7VgVpgHM4sFAy4ZB85XjXF
	JUL/SYHjuy3JTErHP2K5lmGDilF31iTSumQDkeqSVq++Y=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3P10DGNRmrAJDAA--.30458S3;
	Sun, 01 Sep 2024 15:30:13 +0800 (CST)
Date: Sun, 1 Sep 2024 15:30:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yashwanth Varakala <y.varakala@phytec.de>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 3/3] arm64: dts: Add phyBOARD-Pollux dtso for rpmsg
Message-ID: <ZtQYA1GA9CH3noBw@dragon>
References: <20240820171848.177926-1-y.varakala@phytec.de>
 <20240820171848.177926-4-y.varakala@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820171848.177926-4-y.varakala@phytec.de>
X-CM-TRANSID:Mc8vCgD3P10DGNRmrAJDAA--.30458S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1kZF1DAFyUAw4xKF4kJFb_yoWfKwb_GF
	4Iqr17JFZ5Aa17Wa45Ww4fWrZFka4UKryfXry7t395CF97Za4SkF4DJw4fJr13CF1rKrs0
	ka90vasIkw1YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0zc_DUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAtNZWbUC2IbOAAAsf

On Tue, Aug 20, 2024 at 07:18:48PM +0200, Yashwanth Varakala wrote:
> Adds a devicetree containing reserved memory regions used for intercore
> communication between A53 and M7 cores.
> 
> Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>

I'm getting these warnings.

arch/arm64/boot/dts/freescale/imx8mp-phycore-rpmsg.dtso:25.3-10: Warning (ranges_format): /fragment@0/__overlay__/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /fragment@0/__overlay__ (1)
arch/arm64/boot/dts/freescale/imx8mp-phycore-rpmsg.dtso:24.18-54.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #address-cells value
arch/arm64/boot/dts/freescale/imx8mp-phycore-rpmsg.dtso:24.18-54.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/reserved-memory: Relying on default #size-cells value

Shawn

