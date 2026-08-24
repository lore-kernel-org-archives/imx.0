Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3E349CC1
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556004; cv=none; b=aB90s+9gfKSxCzg/NyVyuat6sNWlzxA2yPcJN+eiUHRDYsjS40mIPAKMTa9W9hKnWvLI9HyhId0sBTo9zoCLHIT717lMtmTgVPQcHo8KBoBd3NZw5WxME6NUC3LaGkGTwNjo4oS87RjM3+9FyHb91cpnXLPnyB5GUSnj4TxuTa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556004; c=relaxed/simple;
	bh=aXL4UHrf+0humdIEef+4JRKRa9+MfpcNujWBdBmDGOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5vXVunHQhd5nHYCnpYT0kArA0ZUpCUNvYl/O8BNjmQsfR8lTeGTQtE7nXdy2oNSLf+kvwZHLZQoEFnga267cn9IHnFKyW84c+wGKlXfzBsMqSTwzoAL1sYj+nLDRCF006nz9L1xHymfzCo4fqjhhy0TXOXsX5DxmQ3TmJBlXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgNNOVlo; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgNNOVlo"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso468699066b.3
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787556001; x=1788160801; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=kgNNOVloNdmtMELG6ldC4rNpnqL4Ady8YBFWe6/KfNm/mZq7GefNaI/XOc2iNvHC1a
         gfPJoB/WYJ8tu/pZ93w/5ZaXRfdY/SapkD9BC7YpLA7yAGklbRmIjnZjWkwQYXNpiUHY
         g4z/cNglJ55djRU0bIa1YFHXWZ5A8B0hQpPhfsT5L6GVm2hUPWnUQIQt2NYWaHKZu88W
         9F8S3kyYYxhZQNjgeO8aup+y2Hh2ABy1WayQ4sHdPZ+Ip/a/xRIjeqj8/ulIwzmdC1cr
         ouA9yhYsgEVfBAfTNB5MC5GuFm41cCb9dnCGZ1Hk35zdPrRzbrSxpnaMZVNuqFM4UkpP
         bXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556001; x=1788160801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRReprdkoXJr2ffVSHCZYH7aGcmAMsjru8xnumcQsE=;
        b=HU24w92UmXiqOXWQ2PMe9Xoe6FwYsVwTl9lhAjINKhiMVIJOzlJMgmboiCSLq9MZMH
         7W6wwW9iZVLI90yqGrf9BkaJ0Ls7X7bcn0Zmczb3ysQRz41cXNL4nOoj8HVNxOLgYyQo
         inlzVdqiXas7Tix6L9ifQzglcUY4Y7iRO8lteZHsPr83hktVDjczmR0vjeDx13hR0sQ8
         tg1ZGJY5texlfBg3X2PDH5npwdvN2okMLDCrZEDRXEdmmwuTSkC2ouKdJgA2w+zYMY2S
         BsEhIU4H9u+9uMeyprR59iowwaikYxjCY9R0n0jCcatEC/1LgF/VUck9qyTHeWJ2dZEI
         u8tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGg4n3WZT0e0UdjgUhbHpVlqM9g9l1NDO3FggGlCDqN461Rg9W7tVssX+bY4aymNpMO8Y=@lists.linux.dev
X-Gm-Message-State: AFuF++kl+nqextjn4xxfoestNPRR+UJatSDUUKQpH1incI9J0OMNAtm6
	Ms3Drcyyw+5vdkzoj0KL7zPnLRMK71ydpTB+p5P03Z6Yn7u5W3xNFc0f
X-Gm-Gg: AR+sD12QrXMztPByVNOI2qUREA3A7/DgBpdR5BinwmXZWSJ004EU9Awyi9HOmhPHwNG
	PjgkjTJ9AJO5jtg8NCiDtq7V+a0JbPgOdfcnY31pkG2vk5PSugccI1S6ng0SY42gmNJS3ub5/x2
	7qiIRq6fVHUtnlp/tC/31nudQR+DR0gTABVkyAHmLz9EbxZx8UxfaOxUHUuz4IN6zCYFwVCm61o
	LF7n/b+OXeqCVJXmeRLG4ZHiDZD36h3dCUb5HL2cQVHBYiFpKJ8u8mOewms7Ckmianm3CbDyJbd
	q8SVZnCGIvAlGzK36gyfhuavBf5oFUH3Mj03yi4X5f8k7PTf1Yx812+ZLRaaz/7KrQX6lImpfng
	jKy6B0uJ4Fxa78N4n4PrAT7LtETZBbdFQKUZnXk9c1eaZZOal4u4imKdgSl8uoTpwYyu/Lvn3rF
	gbrDZT/Livo2jpcVlZP6fKZbebSYqYqBDKzbOwzdNtVsOtB/a1VNmZ6JXyzZOVd2DNfzxxx/iqJ
	FHkDz7LIZeqLaVoWgQibWIzr6pUdmpzaXAhTwY3kHjxChKcEwzrby1DG4IyTwuZvpmrYNVQb0Y2
	GlzH9xwNRdW74QKr9Zm9XGEBmhbvFEEwHRQ=
X-Received: by 2002:a17:907:7b93:b0:c20:5213:56f1 with SMTP id a640c23a62f3a-c246a60348emr2628478966b.13.1787556000424;
        Mon, 24 Aug 2026 00:20:00 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1137673466b.49.2026.08.24.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:19:59 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:19:58 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related
 nodes
Message-ID: <qyrzrmrvymwhoziwf3we4fxwb4nfyhb3s7hiuqauzoco52auns@7rihmyhkti2v>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
 <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
 <aohtVk57YIWkj05I@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aohtVk57YIWkj05I@SMW015318>

On Fri, Aug 21, 2026 at 10:23:02AM -0500, Frank Li wrote:
> On Fri, Aug 21, 2026 at 04:58:57PM +0200, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > Add the required nodes to support the iMX8QM/QP USB HSIC host controller.
> >
> > Keep the HSIC host node in the QM/QP specific dtsi to not conflict with
> > the address used by usbotg2 on the iMX8DXL variant.
> >
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> 
> I already post similar patch at
> 
> https://lore.kernel.org/imx/20260720212401.C2BD31F000E9@smtp.kernel.org/
> 
> Frank

Hi Frank,

I somehow missed that imx/dt64-intend branch.
Do you want a V2 with only the changes for Apalis?
Or will you just drop this imx8qm-ss-conn patch from the series?

Franz
