Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621185;
	b=f4KduomKSUOSjruGgL17EXoYV/qOH/Gc5k2dSYUt5VifUnXbKlMnGEx/NfeoOS4q5EAw
	 16gYdB18BPN4JwpaxRbgcoSP1JQedYRy1AXlnWJBaIq+jTwzApj2JZF1uuOKs+yjPr8mU
	 dZFyFeE9Uyw2T4z0rUD65P7CoIdqcZZl0OkHpDOpnGm3nR7URI9qHIeccV6Frzi+LckdK
	 ZA/IB7eJxUYKCR5nwpOfWu4kNYwHN84p2qXqIsgtUMM7KRfUDqfGSIEfSrlVdIJ7OFnyO
	 AbQ4YkwGs2bFVq1vDPPECnp/fpJ7hnYHMfYQxrsgGCWMmq29CzSQmmjgANtClbvw3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
	b=zsMuiycewD4hGBLjs0nKtViqVN+q7mPZ1/sJGBn/ScbIzP696/okcXFzFczP5w8PqD9e
	 4PBlOKSa7Y//DzlaXjh9/Xpzze1znLowhu/uinrR4ZeA9qHyJYpQgdjppg32mgg2NuDUR
	 OJRomzm56VawLV4DeuliEEsm4Y5NYdUQo/NXhsOEDAT2/tbSGqluZ8p80ZHjik0Fa0I0/
	 B6XfBpClVdZ45ObGuy6P2UVWfeOCAW87cAtd6S2eAtbnIpoIb/n/7epsOpvdfXXUTlX7r
	 /jxs0rzRzJBzgW3jKbUns8jGV8EsH+2HUHVU+K94rAFTUGbaPrtcsN4JEeM06xX/1UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="l/29hpMp";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DD2606A689
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 15:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6DD2606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/29hpMp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso13424415e9.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621183; x=1796225983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=l/29hpMps6LwIP6Obn70KbIG9tmu5FB+ag/0ZznchEuew5LDSuMcsPI7JedGqRII8L
         wtOyFPI5+F9ZtL/YdknjbatDF0HiV4K5628ySAXqraBlKWbE8NRPjhMOGGj3GdvS0cor
         Q5Vn9s+PuVnM4vQvSQjGsmOi8G00jUesINaAn7BFP30SCP/Kj2KpF9bCjMBumsSXM3zT
         YohyuhWje94cntOgeBZhsJrK6ogPj6axzJD8yvYXzl/TbsQJZPEtgzGWAhVaPCw6XhSo
         WooVjPgo9VQwOos2zJGg7FKdHbRyivOdkHOCWu3Y3KpjcMxxipaULLL18Cl8a5mpvnvo
         kGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621183; x=1796225983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=Qbh0fe0upTOGKS5mKsIro6hOTsPxKnmRpJeHci9mXDqZQs1+UEeH5W3it/1iU2JpvC
         hsjpTFy5CdOIufo1w7MNjYvrPuz0kK95reIgpouDvLNpeD9EGiDCYrHfG9E7KFvTB3YZ
         vJGAuW3+lOaDdZX40p8gghlZ6OBXbQhljzyKbEyzKzhqK2Iq2qFEv7jQcugmvZl2+toD
         Fa01rbwI51jHGLCxv5UigcudtkO5fWsEvBaxVtBf86XigmvySxTxGVyCtMUbAk/UqK4+
         OlKvaLcPhURQwSUMhmZXQHz33KI3xfmHxCxCLQuQMXY1Zdwve88BnRgoR4JSECrtuOXX
         oyOA==
X-Forwarded-Encrypted: i=1; AL+hErGcKzqve7hLzQOKNAggeEXVrsfghwy4rRMjtqYFvyDSp8w5Bi9V+DG7F0wWYYWEeF0I0UM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8btzsdtHYU3MNMBP7vrzINK0j7G+8vpoaKQQiuLn2xVmj6J5qZ
	iDSG6k0H8akiOGIDWA74JvNkLTOiZnUgiA4l1qy/yKsiYDOjGzrXr8Lj
X-Gm-Gg: AZFdTZchXKNcMyolOihhoZ6IwRLIDxF67TgbIzDfRHK6/d1HnKZ14A01FnzdgJMtbpT
	lUq+/QPeIMx9mOGMUHQHrghrnT9C0MF0ZQEnjic2aPK5VFB4DdH0dIaG3me9gmHz7O8fvc52HD+
	jvjxMdZv9e1h8xAmFskzZ8v41uSbPEGD2JmtHzE5Kp5aZz1yhGEzUk66+bzpCzinFvxa9yFbUN/
	uWsa8ZALUfeK4bOYYDh/jQY5j7mry5KZjevjgm8mDrxXb7EoSYy8XCgVvj6rldDBKx8uqIINO/Q
	ja/+IEG24k4fJxPVMnGEV6OuBfATWkIINO98BjO/CqUKDcjs8fqUNJ5NPAs1FYqdIGMK7RBO8ip
	aavBMX2WFxtaO/99h8w/H6kas1JG8NICX6GqPWnwcALl8p0WIvG2IjBVCWgOHRjbTQ/EXYiiFb0
	BGbrzgUZ3itVh/RXiPWX1ddp5OgstOz+epRZ1F5v01GXO0QYqz0RD0HR2Q9VyNoGOrQYY7RtmSd
	gWJGm0Cg/rNyoVuaxkc8GyNS69y2qIeMy8FJY4LK8IXejo++3bNqJtUjvUx3AywFMtUguAPgApc
	GrMq5SXsB02rgjBLGhey5jsRRTc=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr340731425e9.0.1795621183256;
        Wed, 25 Nov 2026 07:39:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm474497565e9.9.2026.11.25.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:39:41 -0800 (PST)
Date: Wed, 25 Nov 2026 17:39:38 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration
 PHYs
Message-ID: <awcBID5pfFm2FadY@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:39PM +0800, Inochi Amaoto wrote:
> The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
> impedance calibration. Store these calibration PHYs in a bulk array
> and acquire them by name with devm_phy_bulk_get().
> 
> Initialize both calibration PHYs before powering them on in lane order,
> then keep the SATA PHY initialization, mode selection and power-on
> separate. Use the bulk helpers to release the calibration PHYs after
> SATA startup and to unwind failures without repeating power-off after
> a failed bulk power-on.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
