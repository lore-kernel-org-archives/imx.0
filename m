Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042637648D
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771357345; cv=none; b=IKjtkzMyuJ9xqBGagJdEKn5ud0qndjmuTqc4cqcbmvqvbdsFVckW8Y9u4NuSqq+qaDnL/GrJJWEYHeYdujlMn2DF+KVgNYUFNjJ56lM9Gkc9/m02FCCYSUpgIWbcG2N7QeoUKhWtNQRI4Ep/AOooNpGiHrtSdo2/JcFLQBhT6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771357345; c=relaxed/simple;
	bh=IOYrMdtCWt/Op0E8/4vt5NFeKKiy+7VItgEUcwnuASw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0K+DFna4KFJMunXdi5FSczhRZ8wgpYo+QiAGrUsGAkCbMqvLp7bC/tP/KuKTfWQzJpzwzyYhPbdoBeIn42FuPhPTcvtx+xVsMNXaAikLtFiIHP0qpj5ok39PlU1Er6i6/h3Pyhrr8lySCqnUnH03mlGci1bYiAHY81tj/2UaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLlpJBPv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLlpJBPv"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-481188b7760so38843705e9.0
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771357342; x=1771962142; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUeQvtbcJRcoGuHYQKHXUnAyTG1dJFRZwd94Z/kLSnc=;
        b=TLlpJBPvd6EJowdAnDeP40ZCHsUJK+Q6Hhp+uKbHXzak2jXO+nGaF+3JnDzUzC1zUk
         fT/RKc5Q4xgCsbOXk3bzFliPT4gNtAuNimlPWI6OJHzZ3v0W336w4P/j1MIrDgD8GyXr
         1Un0rZfsIu9xbdp4xg7PdyRzii6g3JN39aAMcza8DH3iJTBEBJAG/u6k2/2ttb8MdBAn
         EDmX4KvH7FMKlaOAWudWnIEGxoikoB9zulmm7+at9xcU3qw9rCWOenYbzIx5jQPpINLs
         MT1+6TAxKbF3NE/72GwVOdqRWiXibKTlptLFCdXbZf1au+Y01h26nwY6lJps2MMY+IbU
         QGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771357342; x=1771962142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUeQvtbcJRcoGuHYQKHXUnAyTG1dJFRZwd94Z/kLSnc=;
        b=UjAM5rt1+gYwvqCPCg2ezLqQEnEU827Bol+7jLZaapFO9dedPGOB4DB1TWdfnYXRJC
         /g5P0stFx9GYQM6Qz4KxnjhO3RyRnhtXEvCdHwB0s/MD8UAA7LZcojP+xJKUILuGyZwU
         kYL0X1q898dRYKUkiwnyTde2S14ZxWqPENjr2WiEZ2RQ0hfjyVIAOHp6fYIitWfezNhS
         X1oQPb0awal9GP2hv6XdSvv2BK4cARbLSoERu/7paPH0kRApmtLHXf4E8riDS6z9dgWh
         D77j7iMWAO8/7uNdtUCKHtDmQgOs+LUAJBlun+PYC/K1s26ikk5omMyKpo8CDyNCVM50
         nvwg==
X-Forwarded-Encrypted: i=1; AJvYcCW8aDvLU/Swjc8Z4yTrCyPXozRWQvJlr7gW3+pvvsdN42CdJkhgUIy0GOo0+tFUsjQdwUA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyr5Gt34BpmQRxzzPgqkf/utuXZjrbInKMZ/OqGk3BnGajxgHz
	Df5DxEikHmhiBNN7Wziu++Z1Oo88psZQABrogVc3ADiyPCNpfajOgEXe
X-Gm-Gg: AZuq6aIEdEynYFVAwpSOxrKZ/VPUDDGOUv9fOcv3YIq5OUGacrIx8jmCTjEtiFukUjF
	F978n5+mNbxmCY4cBXikvBEiPOiLHQeeNsQp/T0VEwvzb69mC1VpnO+85iI+gCYM73PxKqoBSm5
	RbAM8LXYi2JMJ+wA+bzhc3QXry3wjDaU8ngNXknnwOPyioETiRUMVY6Nvm9zRve1QC5fY/KYCLu
	rro5VB+XJjbbM9grSxRymMnPEVBMM/BNiFWOVfwvdieXfdcN95XCoLpwpjYBLxxg9Bj2RpEEuKa
	RUVckxJe+LNx9alo28ZtPs8/IVq7MOjSDpaOffOxmZiZFhNcvtvU0LtfN5MFESMT6C+i2sRL+CO
	Hk/vkDbTde0/2Ok1viLtpKBs1tM3dISfg3z2g3DbqlU32LgvM0XvKVco/b5fq0DyD+WMd0EwB6/
	uuX/uzRxgdg9rBJDv0C3bgefCtNNfuayt7Xd67VLxFRJhpPcRBv2l+xOa13i5nj2kxU9rFyXY1a
	NTbL92do8N5JttvV0OwZcvp2MebkJ2JQfg/kWi9ChYCxiY=
X-Received: by 2002:a05:6000:2586:b0:432:dc1f:6982 with SMTP id ffacd0b85a97d-437978cd85emr24996379f8f.16.1771357342109;
        Tue, 17 Feb 2026 11:42:22 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm34488531f8f.34.2026.02.17.11.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 11:42:21 -0800 (PST)
Date: Tue, 17 Feb 2026 20:42:19 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>

Hi Fabio!

On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> 
> What about users who still have boards with the Broadcom Wi-Fi chip?
> 
> Will Wifi on the old boards stop working?

The Broadcom-based WiFi module was used on earlier revisions of the
VAR-SOM-MX8MM. That hardware revision is no longer in production and
is not available for new orders. All currently manufactured and shipped
VAR-SOM-MX8MM modules integrate the NXP IW61x instead.

Since the wireless module is soldered on the SOM and not selectable via
the carrier board, the device tree must reflect the hardware that is
actually present on the module. This series aligns mainline with the
current production revision of the SOM.

Customers using older hardware revisions still have access to the
corresponding device tree descriptions in earlier kernel versions.
Upstream support is being aligned with the actively produced hardware.

The same applies to the Ethernet PHY update included in this series,
which reflects the PHY used on the current (and future) SOM revision.

Best regards,
Stefano
