Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971B387592
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836981; cv=none; b=cYbwAoHlGk35GRBxGt3IHjGPYjIdwmIEVlbd/qTAwu80o1HEZvEfaNLSW9jzyn73BK+mNAwkQZ+9obqYMFQzeEWWao550xqKNmPUCzxoDe+9utwXG8ftg9MdTNmcugnzVrf2xOh/SNI/Cd1tvQz6mPprvgnaIoBg+JKo6VsyFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836981; c=relaxed/simple;
	bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cgBtsYAGGXxksCgpTHZ3N5Jis236GzawXRhg4RrQbtQOQJJ+UH14BecL71BMrUWJjz7fsCkwCK2xczLcYYnfX2MvTj4ofNC/CmrYluIws7t9DhT3mg0oC3ETdTeV71Ry+IC47k+abXkxersgPsuH5mpf+sMpzejM1NPtWjlQJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFOARvgU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFOARvgU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee974e230so36053445e9.2
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836978; x=1769441778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=DFOARvgUMXf0cHZ//u9O7LvkPSCTzM5xpP9EC4xcYg5Ov1AHuXkEnBtz6LdIUFtqxM
         x5/8AKtMVl6jOycBJgaZ+WeuvYnIntCcNp7bHExB7mqMWflU7fcce3bG5ETo4RYdJMFg
         erz9Hni8bksL1cId+T8zKUtHOWlhzJGU2eaP87FxAcAn2PIouOx6rUpkWh/Xc1BfjyIa
         IdqACNafwzpJHWxX/gd5qpTWS2z/IGPdYaZLn52c/Vizd6LWPjQT87bOUpDMP8sSBOos
         bMms9qHPA3kCi0kjXjD6E4RW179TFNHLjNtSto+tB6i0MbBJ/8FRc2MQFLs8muMe5KS/
         lmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836978; x=1769441778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=LmQXLzbg2ggl+Og6m0TtgsLk522TfmDf4GHI2mllEsaQmGthypMUBwpLx9xCdzwZ1Y
         Cmd3szmpaqmT/Ak8YZajsLJIEWIp7aYbtpHqhFYPVJCMgj/OJ51jxb4I/7h6sZdqG9H5
         8NKaQjsmm0Z35pNrEY4c4oExAe1dISm8L70mOkPI3fOJw+Y0qShsNkpuH84tiVW8grcw
         lmWR9DrCZ5xQfYJ69mYAHNxl3iRDdZcey39VPPsJRJActdThS5OG5t5iewKSe9A3/bdj
         X/y2geDov675b/P2v03TNFGIuvXfBpvebZUSr1dhT0GtRgq3hXT2Rmj+SeQBOjXlUR+e
         l+9A==
X-Forwarded-Encrypted: i=1; AJvYcCXzQFsWeuW8I6s1CqXltPaVGjzYhIzVMungCC0WzGIAJfIZ9y/tCHG6XGXwnFmBbWQRxtA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwF0UKWNN5bOleml97KVM7OMnL5zEv/0Y8RTaCw1QK8z3Um/NHf
	6W7ILIfCdpSB1lLRs/r5VpE6gKTkCKBRKxVOK/hgPdH7OYAbZ9MroqPK
X-Gm-Gg: AY/fxX6IVND1iDqveGFJmjhQO5Pxse3bUcA9BuHkWhh1wk4MBIarB4H8Nf7X39kVdk6
	hdBxslaQ9lmGNUtnC84H7Ol/Yt+tgzgYQe62DSQFh+p8fvduDoVysA/K+u7HRmupODpc3Hh2cTq
	JVX/WBIha84k8EPz140kNI/HCKYwVaORDazFA50XiALuMqpgbEJwq97VnP+xs/V8p1SO7yZp30A
	XL5wZRa9HXpd5SMIULe3TyiOpDK7KnaUIbd+5u8jF2Rdjth1jr42no2A9ttpjuUfXh36Oum5S5s
	mW8cj6AA4Ix92Fgq0BsBHs18MqCmLr2vZACkt1p+3yRD2aOtbHCKe4QReNHjky3wzVSDaNdvgrp
	34ScwCOKFDMwBzQNHfKgJ+qBxV2mSSS01pVQYB9+ExPZyQKW9nKQTNSO8AmafR1SWLJwl2VRIL6
	EmYOqUsRdh/lb4OZXIrg+74ZPqYhJ5lBcVO9v51wozY2QrQ/uE74WUYn9hD/5opvaJBJEg
X-Received: by 2002:a05:600c:4584:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-4801e350af0mr140088985e9.33.1768836977812;
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-4-198.dynamic.telemach.net. [213.161.4.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm23614533f8f.13.2026.01.19.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
Date: Mon, 19 Jan 2026 16:36:15 +0100
Message-ID: <5957177.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References:
 <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 19. januar 2026 ob 11:40:19 Srednjeevropski standardni =C4=
=8Das je Bartosz Golaszewski napisal(a):
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


