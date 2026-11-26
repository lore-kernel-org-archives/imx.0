Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714833;
	b=Rhdp47E7RXIrd6nPhwj6WpNKCB1Ymvk4VcFt7Ikuy7pqbLR08ZDFlympvRV1NPq8YnSd
	 OnE6VeikR/G3Hz6wHqr2V56F7YpUf6MQWp1ziOT1VD3AjZ/7EJan6SEkyjB87IC1WApI5
	 24cGVYb989aD3ccZ7EilTl4I8w7sHhj/6dBTRLPGarnf/UD0uZicCE1+J64izReolY3NE
	 fQmxnUyroIzhTbd91CF90LGtFmZSudUA5KoKxaAPrGyjdF2GsoIRYuZci980jjlZJTvKA
	 DVhy+i/Q7TmeeUnivwYRjJBtIy0CeFEx2LHvOlHPoxNpP2Eh+bl9Q+qhgyZiSlqWYTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
	b=iizH7dXQEmLKEThzRiQw5ezY17Li/JxnV0eJ0ax3oNgPTVLFd+FhRGRD2D5528DAIwqJ
	 PFqyithkXaCrfEcnQN67lnvPyDZueA2dKbPs9NzMS2z1u/VlsEZ7MLtr2q/0kCfMJEwgo
	 VMj1q6RZsdp/dUcGWM0KrfTK11S51B5FLYxcU6zgUMJSpvqxA7FJnNPAsDDVjHkZI0vuh
	 u7YURh8+6ghpESfcKTyYEXsc3U/Qw4NFtE6zTusFdTgnQwQu0Lvp+aMIx64e3EYNNJI7q
	 MSNdZZ7SHhTY7M7yDQ26IMh1jeH78mjdjbeAI76A5hQiGYw/DrhZF1y48LVdFTTxA2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R2ORhOTa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14C606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA14C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=R2ORhOTa
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92182125ec0so15197166d6.2
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=pXEGEmPu78qX1VGB6F4JDIUuJTZDIKPXofzW5wXdtkW0I9epA/8vTwFpjtDfmae1ph
         FYIoM+QFlslLx2HdXjirMJP8ZyPzIjbm2CFVhupJ9z1ZTLK2MnPbPtT0uUPubyn7bNYu
         xndlU3UuITFUCvTdmFgnXEgvgeGJSxnlzo/jBAS6MpSAR5YXbee1KyFaYo8el21DlsjL
         DyZcGAfeAFIKz5e1Lia8JwmF8tWwS1cx4Jyhl2DQCrUIi5sVbAAjHx3iH1ye6zF9n3Wb
         33qzRkv2Xzd1d9HRVxKhiJlBGumvv4F+7UKOSwUZ88+VQSywO4vpeaxCiU2GIoOkdGO3
         Idig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=EmYdMLyr4lTS6+lPGJ5CvE8F7W/z0NaYBP1EnRhmWBQ=;
        b=g0TayUnpObpujn4Uj5UMBdBRa6cj+1W63fMt60jjA/x/6kAZ+zz2kMx16VwfHOZ3rS
         3yqV+cQiu12sUJ/P9XsY+VYQi+wz7ejvTQdVD44xmiREH8Yel1jxEIp31X3gVhczioSp
         jtQYlD5kYUD5lKunz4PbYcaIV8WihD4sX3WnkZlgl/lGaGujpu38m3C4edmx9tHzLq/7
         X4jCNmXF2cR3pl4lyQCPYvJtHWMArHPhP94xCnhtAp0q56BZavnofleZAMx8sVCxv0kN
         Aqom/DF0E4EIMgFJxCpnm4T3kuJ7/vwLC7ka487OS3d94WE0ZSvhmFNgrkZLER0joXjP
         Oy9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=R2ORhOTaxv4xlyqibLKlMJCphO49rLVpTIFuuTNDO5A/9j7yLPCjE/3bVQ+sU7gRp8
         EeZJ8k1oKzZAup4QRbX2rliyPTaHyqZ6Q5ezeiFytO4SUzNhhrAKADqJfGX4DSKKDqOY
         gqRTHn/7d64xUtQjBG25LRg7EqbmoLDEdAkx1qORy+GrqVA7Aexj8kA9KRAEF5/5e+eH
         9k0QC4wQpTwphRgPTsnmgZ/enh7r7TJz5CYbJ/6Ytxr8wBozAWz0FRArZl/+BxOORRa+
         OOI7daCWCTRy67q9/giVg0w1c2jU9FiD+0Xh6DEONXzshYjdQMVQlQgiGLiNDVCzOVgS
         ZYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=iBXy245JmaO5N86E/8yAGOQcRJSefHDBAhUHbFEj0LV24OWiGeGAviBsDn8mT+o2g/
         fwghmBv9fyQVAJx01Jji1j1cvUTjxzjwe7PIRqGEjtaEqTtI/YPVpSoMs0jXe8qUYSCx
         jdSBKalQj6+0It+smlec5cKwNxdIzNwr4GpzMAZpf0MW9AaIqf2ykdgMl48Yt9tReXGd
         EOCxH6N6xNO2l1UVEMEPf44wG6w7a1AinQIez5Mqk4bNbcdp9YTb/ayuBHzWz6xuz6j3
         NWJn1dsUhNsiUmJpzCHXkeXf5n/1p7psFy5CdmrzbcNpl0rqwGfeqxOJedPKiMeswKGz
         VHRg==
X-Forwarded-Encrypted: i=1; AL+hErEdoSdgYtU5396ahR33OMP1Jo5Sn2yCWB33h2cURCzEG+WDo+g2BnWpJLCQqnrNCmXN7zw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/LWIVFQYosqTlL995+Tco1QL1OBzkOEMFP6zEzzb+3TJzhw/Mp
	RbgN++/8/RX4ChsF0i1iOMiGR2LIONxThSFklqCIUSFiHcNItonkUmbV4scHsRfKr3VsTd09+j6
	RadNylR7aHHkzexGUZ8gVZAYWmgt/ZPT7eK/p385cSA==
X-Gm-Gg: AZFdTZfCQEMzWdtKTWtTDBE1En+nFcifgGZ6gM2QYvjyLIuS7I7lx4cMgFR/jm6btJ8
	Is9MJPtSEa68d+ZITfRqqYioxd6Qi9B0Y2txBZuwrw1u0N0YRGbtQCDvzV0ajMU7jmRu5WrMwJA
	7K7cRWhnmKFSsfE8MIqlsd6y2/tdanZaFcJx2CS2NG2lqkHVytVj+1AVlzifafel1WQG0yJkgwG
	b0uHcsxZZjt1ycjZDimeLs9RbpYUgA5H0GMeGwCCWfm5402nLq+DqvHMG/Sk/b8d7GJ9fsOt39Z
	K5QgtRG0U67PAQZAkbEcxCuR9uiGHI/a1tvWx/cZHE8YQV5uJVZWY6yMoYhXeFmtp1kStYYSnB/
	zkBs8cj3ZWHaZGsh3mTcWkkGf+Odp1kwOayoEYvmbXBRO0ph7vhLC2bluDGaqM+8GB9t4p+I=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel
