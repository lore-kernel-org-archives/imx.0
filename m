Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218288;
	b=AqiqJ2BW/ya3BBlvVGVbW6SLbblKX1MlIHwBAIOnYGHBD769K5wE1IFTvy8wyoSIRTc9
	 zSwrhp5G2HfhxxLlJFzM2bqSORrity9j80t6qKasiyebVrj1HH/XZ++gsiKQtDfD2pU33
	 mOUTQaRNX9QxMhcPrFAjHCggAUZCo7Ehpu0ZLkQDTMORUSsy1xWNiPjPkCiESr1gpW0D4
	 KFsgWdAy7rL1wgNxRxzEdfzFhC5/BrIHEbItFmm5gtyMhjqmKYjg1qde6zztW4iner8QU
	 qg2HhQdQVNKf+fu8g2Sfnc4mfwsqhnmMdbmxGOIfkPjAWT/NC+S/g/ewBF3GuJDu8Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218288;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	b=mzkjB5FNr2H/JWIfZ4/xe+oVpvLRFgBWjmpggeZl4hlTVYAzrI9F4xbJNK09VtPMRXVI
	 MBgax4NdeTnaFm/a2nKQSLt9l9eVXBG4KACRzRfWW1znsrHAiSFJkulJmK3d4nf4PQKgz
	 3eHdL63tSjLlVg/P9VtOXXciU3ResjZGjvk3ZoaK+tq2ABOuE349n6dBjzarD+361bRrh
	 VCrby45O0gQ08FPruXIY3awg0vjMHzhByaCxCIktJKiegi5yjXGaIIgG9qWGbx2PrCyPY
	 Ci80VgPnweB2x0cUJdHGAAhcTE6CO/O1ujDSM+K80HwvmQy5pCRIuVbB1ylJa5gJN9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81853606A31C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2901F008A7
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218287;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GiU7Bxtoaybvkr2gAUT3yojx7KVrIQj5sQtwNARIabBI/Xz1yNaf9KfzSNkjlh9UH
	 FLVF6kd6xzvAa9r+rdhTrAhRwKETpbM2boIYE/kM4Ftwc6As5sVXrG8DNuLKfvKSbR
	 O6iQtYcMB7B8lLupSrYY0sMVM0rPD3QRJni/DMt4/9wpLv2olp5ZR4HSRgiDb5owU5
	 /qBaAbYj/x9bDyvOYEg5V/636GMO5okouD3Uw2ckMRp1JT0Pe8hbdsfv/7iCWSeEBH
	 gjCawLRRjst4hmR66QFBP9pNVOXSUAJOF3cPYJ98lkOcPhattlx+4gbZ5GbQQD2L9D
	 LwRuHpj0RxkXw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso400393e87.1
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 01:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF8rdP1nzUFrUr2PgO7CQ6e7aoUqQ5O3mehQFY9RLABKhwAlrq3Qq9wKnhI2xhfpm+9yjQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8xf6HzmlUaw5uNnRBAUmAEoIPNi6ilGjH6Og3Mvc15mdYeOc1g
	qSSAnzXmHyFdujil8Y66gjL5VGy+cRHn8b5GiLziOchVj1dZ6ZoAxIOZad6voj5NK0A0CBYi5me
	/3ylVI+yPyf/e0BriSonmOM2LPlci6+A=
X-Received: by 2002:a05:6512:438e:b0:5c1:4cad:c31a with SMTP id
 2adb3069b0e04-5c14cadc385mr777117e87.63.1794218285785; Mon, 09 Nov 2026
 01:58:05 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com> <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 10:57:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
X-Gm-Features: AclHuK8oK7P6B9InDKuo8Ak_aj4mmjEASZmzu1jiS_QJYKoqcrqXJkxA1OxDiQ0
Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Zhang Wei <zw@zh-kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:06=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:

> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver_probe().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
