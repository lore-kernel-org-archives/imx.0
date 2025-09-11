Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326F18DB0D
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555477; cv=none; b=h0cudqy/g8y3eLkfKNBsW4EMCr7LILHozwfwl6S/gYsDaBz+QKTW0FAgWrGVZpA3o5zK+Q9jMvbcgcbT3UAAvXIk1u2COOndog+/e8MAmxg402kIABzDEJhrXnpwW/EYLBTTazOz/f0myhqd3z1qvsxIGSyeLqpXxr2hnbooFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555477; c=relaxed/simple;
	bh=JY//uoibDxk3JFUWdVtNj/CDTfn1GzOHLvWCQpSngMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMi0Fu9naHa17uCbQo34SaZJ+I3omSXBv8JlijRb3uaNCQGLiebFDc7Crmuc9TG6qjlmEoZskmpnkZCAsmTQG2Pa6w7/Lb7c6aXLDzE6Ug2TMv8lst9CZjctVev7gM4njDcloz6zmsq4pEmzoH9C82fg3lBBFdGe3KAPhCC5zsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BSVDzRFH; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BSVDzRFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FIebiWHIdHOR8V4xRaj6i5CqlzafrAmw1NlFomf5KyI=;
	b=BSVDzRFH0Umy7SvEDJO7JZWBTtZLSY2uMEWDjTtgp6PH0qq0wUnD6LVfz79zk8
	rHr11E9uiwQeo15rt56V0iP6MOQahZUfSM0aTB/ZcSsWJGOmfPf2NLnuh06la43W
	DdJrSf3/BNFp3xMVQAGC5E3AX54ECHIBoYNMZUg+T56oI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Fx4DK8Jo74lfBA--.16446S3;
	Thu, 11 Sep 2025 09:51:01 +0800 (CST)
Date: Thu, 11 Sep 2025 09:50:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: add description for solidrun imx8mp
 som and cubox-m
Message-ID: <aMIrA7UMhJXXuWzM@dragon>
References: <20250823-imx8mp-sr-som-v3-0-a18a21fbebf0@solid-run.com>
 <20250823-imx8mp-sr-som-v3-2-a18a21fbebf0@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-imx8mp-sr-som-v3-2-a18a21fbebf0@solid-run.com>
X-CM-TRANSID:Ms8vCgD3Fx4DK8Jo74lfBA--.16446S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrWw4rJrW8Cr43tr4UZF1kZrb_yoWxGrX_XF
	98KF43Xw4xJF9aya1kKr45KFyI9a1kKr95ur4ftrWfX34fC3Z2yFZ7Jayrur4jvrs3tFn2
	gwnxGF18Ar1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1sNVDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhLFZWjB-SpoYQAAsX

On Sat, Aug 23, 2025 at 05:28:22PM +0300, Josua Mayer wrote:
> Add description for the SolidRun i.MX8M Plus based System on Module, and
> the CuBox-M.
> 
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2/3/8GB DDR
> - MIPI-CSI Camera Connector (not described without specific camera)
> 
> The CuBox-M is a complete product with enclosure featuring:
> - 1x 1Gbps RJ45 Ethernet Port
> - 2x USB-3.0 Type A
> - HDMI connector
> - microSD connector
> - microUSB connector for console (using fdtdi chip)
> - IR receiver
> - RTC with backup battery
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thanks!

