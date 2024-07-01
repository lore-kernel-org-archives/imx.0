Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66216D9D9
	for <imx@lists.linux.dev>; Mon,  1 Jul 2024 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850462; cv=none; b=t5mC2zqcGzZp9wF+RxAcl0pbIzjkVdc+aVwv55+h8rtoVshS8ojmM7bqBNrlYS2fynqIVXU88MYh5bD+ZCvahF7BkII6cBxHffDGQ4oBERqX9f+VKVxRL8jp1q09W8b5dxXJjyRI4N7qRuyf+MBhQRKqHFmcmoJxpshiWVI04F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850462; c=relaxed/simple;
	bh=0RU0GQGcEkH75BsHRkr45z+TTTqgKiPUKJEo3MLeH8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbo2ksRbyn+JozfpBkjnnN/ZzC5bV6CkXlrZaXM/IxzHRd2tI1YqB+hFW9CzONw3RdhkamErTOM4ebPBoDU/E3WDCj/AlU6+ETlaa00VOASbRG72J1cW6j/oprb+ns394cwKxu2SLU/KVYEih9amxR4gM7AibiAHPo1v1/OASd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXvH49a3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXvH49a3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso28990995e9.1
        for <imx@lists.linux.dev>; Mon, 01 Jul 2024 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719850459; x=1720455259; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFC/haLZ9KzQj+xaIDgmhhZVWM9GxdpG2nMd31da2xM=;
        b=PXvH49a3JCET0W8NrZhE09TEU2lafYRyRpFytN+qB3Gmm7ivjLMcKy2dyY5zO+QpXF
         dY69iXtiFf/EKQy4VbUuvLdJstvjFg5DEFlTFsdLH00uYpP/Hj+6ghJ/tjxE8qU3hEtW
         VPLCnnfowfNXtA/qJeseq21iqRZXkJPDfC6Vfrb4FcI093YzWkH16i6abLsnvx0+fX58
         SuNs5l6kZQAa8ecr0oKIDMTbFy/owJmfMLfmm+3Lo/PIahmQS6mRa9tO78/xnfnzSn+p
         5Y9Q7dkCC1q9XX4gacbD/BNvyVtu4/aWBDoVbzCiMQRAbETB0cr0arQmIkt4XVztMZHO
         /2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850459; x=1720455259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFC/haLZ9KzQj+xaIDgmhhZVWM9GxdpG2nMd31da2xM=;
        b=CLfL84oYVeg4qs8t04u9tuf3UBvj4XoPDG8oQMNnBCKeT9BniwCjYuDcOtXkYcAq/Z
         g/nmW3tfpMlw/p5rBmqP3Ov5umPvXaya65qCb8s1Y3MerbtVhzSt7bw0TIJ8dDTt1+gO
         /OYFWnZSPDpKx+Eh3EPIXR9ksSsQQ60bhgskiGKzm5twY8y2hIlYlFpsN1C83Sc9IVqG
         EFcVcHuxQ+BiJi3KU8a3G/058URSz9QDR4/5L+mikl5z8QFo7U3DPbKTS1UxKDNd8Jxa
         zGDFJv2OSlbUGeQ8Uyf/AKR0ddR4MCftiwnpdvjNxCPLb641rc/U++vdVi+JjHTDSedB
         xxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcVbE+3/OEgTWInvHpVyTZQ/xydCkRazGomg16JOojn1MlKHDEUyjzNTrcLBrtpdkT/yG+miW0RpeERpJfUnrXr7l7
X-Gm-Message-State: AOJu0Yy27zPTn3W6Yuu7Nfi1fp9A/A6OSv41tNAr+NdNQQuQc482gfFN
	EBQqQYsWVto8TrUZo9ZTph1R602z5O1BRQX9ksZmfGquB185/na+SNHLHvzFiQs=
X-Google-Smtp-Source: AGHT+IGRrPzTXHiPkwd8Me5LrECNfH4SPW4Xfceuvlm6k2ecNUC83zwkdEYq2h00D81su32yvfY2Qg==
X-Received: by 2002:a05:600c:1c21:b0:424:addc:c7ae with SMTP id 5b1f17b1804b1-4257a02041emr46524535e9.28.1719850459405;
        Mon, 01 Jul 2024 09:14:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a2bcsm158762215e9.36.2024.07.01.09.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:14:19 -0700 (PDT)
Message-ID: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
Date: Mon, 1 Jul 2024 17:14:14 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
To: Marco Felsch <m.felsch@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/1/24 2:53 PM, Marco Felsch wrote:
> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
> as single device isn't always sufficient. There may be partitions which
> require different access permissions. Also write access always need to
> to verify the offset.
> 
> Port the current misc/eeprom/at24.c driver to the MTD framework since
> EEPROMs are memory-technology devices and the framework already supports

I was under the impression that MTD devices are tightly coupled by erase
blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?

> partitioning. This allow using of-paritions like we do for SPI-NOR
> devices already:
