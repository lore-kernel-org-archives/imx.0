Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12372253F07
	for <imx@lists.linux.dev>; Thu,  2 Oct 2025 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421995; cv=none; b=Vm4n8oOoWdQqsNOyhgnyjU+taiRpvyyLHjxGrug4R9rH2jpaP79FGvWoFeqtUzHPmsITJ6QWCh6lQbCXgR4a+Ge8tH27huFSuFTBm86IQ2BSjyG7cFe+ayvcJvIm0Cdb5mgjqJJ3mMFtWorj4+aid4zPiwbzKFuM/kOJEdEu/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421995; c=relaxed/simple;
	bh=Lr0irlvhfvHdwzVt5sqkWNyNfM8w5CssLQBlywqWjhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVgcm7Kg0Oa1xlxOa+PVCimLauhNYxx1BWc759rJvd/DxjlsQXO6w2OiZmo9a2U/9Zma0PXjPyQhRmmrtHsaP5IFHGA3H/8u6gpVIzaTtzviItJNdmfJRKelz8PpONquVEMDtTrNyxt5Qa4phwpI6Jayxsi6/m8GbFxC8+MK28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWtmwhuQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWtmwhuQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3352018e050so1243820a91.2
        for <imx@lists.linux.dev>; Thu, 02 Oct 2025 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421993; x=1760026793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
        b=AWtmwhuQKfhR3qekTyip8EQLaYs0yrFFm23BtX4KIgBnq/XZAOwuZhnZjJG1VuGT7N
         7IEsF2ldOqtCh1hLEFpsZejUf4GUGE8vieaR/t80rAaDjx+I6LFoXdGQePbrD6vicVli
         /bjMyDXv8RRvRie46NCJiXy7dl+C02yWHF/807bHm60RMXOrRxOyMKOcNkvFcmIqb26y
         LAL1I/ykys0MthMsJ2lzsLz4GRhf7qJ7VViUFtWfvELdu4xteFS+pypJO0EYt/5tSXM9
         8+Hd1BHAmYxh7o3BYmK5P2xrEXiJxj9x0NpAr56iQxZrPGg51I1A2IAt7u/BLVWx09la
         HQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421993; x=1760026793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
        b=uce06SrJ7GLpOnhVIx40vfLrB9znMINXVmzchKi9UyDlQAbIDU6LjjB04JEmHA2VwO
         971G/5fQsBSFcqf1ofEmpbdVJY2NEgJIlWQLKFolq04kb/Ntq8lsFx8/jm+wkjLg648R
         /V7rZn97t3XU5p7OfYiCWrsQbrJ19yRaufz5MvisQTpX3EoLphi/VRARJahlP/WtSoKC
         Y6SgARPOTcz+dsPvKEt9RT2bA/D5BiqUyzfhB3d6BQxHXgDNVp8d7B931kMAQXlwRkkR
         x16/+RzCOhmMyTznrQQ1nExjiYshjRlVfSrR5gnecRdV2gWfFAVEB59X1PvmbP5ezzGG
         5WRA==
X-Forwarded-Encrypted: i=1; AJvYcCUwm3vbSrYZEzisc5yMYLx2ib/AZdoTozsHyDkZcC4BZdmxCTIfvARMcrrZm0dek+aiOH0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc3OuQF71xkw0uaoJ5x6i7ui9polMv12/1tD+x6WdLWteWbZDB
	PKQpn/xMZ8NlMmpaqXhbqvbsnY3fJtNQkgBzlIkMg2rpTeMgnkPUXew1NTZsaLvoqOaIo9/SW/H
	lC5G3kOSYZ48PbL6ZvBfRX3sH1hQ9h9M=
X-Gm-Gg: ASbGncvwH/BcYybQYWiTPdjsLnjWWkDyKv3OtWxnL4CJYgDRAGDf/aYZb6t7lA7MSi3
	tjWOw/GR74zXvfpV8OeUYO85EEOY9e07Y7xOQPQ/MAIAG4gEBQZpyueeMryvI5wO6c6f7pBGtKN
	5H3DJwcJgaZZMueQWWnxWIdcDezv6iebHq/cPdWrTF3svz0pIQAf9XHtg4K6S+SxFuW7AqIxQk6
	iez514OmDYaz8HjmZMaBJjAykTP/yY=
X-Google-Smtp-Source: AGHT+IGDpezXRZoKRUAmvsGEGRKGV3Cca8QMZMZ4Xe0LAt5a7sDWIZ6cqn+OuFMFCBuqxZGgIpVxUstpBqxpNK7ovio=
X-Received: by 2002:a17:90b:3145:b0:32b:ca6f:1245 with SMTP id
 98e67ed59e1d1-339a6e6329fmr8873915a91.5.1759421993437; Thu, 02 Oct 2025
 09:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com> <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:24:49 -0400
X-Gm-Features: AS18NWAkW_WGgw7RLjcHXntiCLOoMqdr7Jd-sVtGc97imtAcuufyjRqKmj5BmR0
Message-ID: <CALC8CXdUzp=sKeOaPnwJ3GWg8=qrXrZKNsKg6XeXxvutty-U-w@mail.gmail.com>
Subject: Re: [PATCH 09/10] iio: proximity: Drop unnecessary -ENOMEM messages
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah, dicks it.

On Thu, Aug 21, 2025 at 11:53=E2=80=AFPM Dixit Parmar <dixitparmar19@gmail.=
com> wrote:
>
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  drivers/iio/proximity/ping.c  | 4 +---
>  drivers/iio/proximity/srf04.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
> index c5b4e1378b7d..e3487094d7be 100644
> --- a/drivers/iio/proximity/ping.c
> +++ b/drivers/iio/proximity/ping.c
> @@ -280,10 +280,8 @@ static int ping_probe(struct platform_device *pdev)
>         struct iio_dev *indio_dev;
>
>         indio_dev =3D devm_iio_device_alloc(dev, sizeof(struct ping_data)=
);
> -       if (!indio_dev) {
> -               dev_err(dev, "failed to allocate IIO device\n");
> +       if (!indio_dev)
>                 return -ENOMEM;
> -       }
>
>         data =3D iio_priv(indio_dev);
>         data->dev =3D dev;
> diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.=
c
> index b059bac1078b..f9d32f9aba1f 100644
> --- a/drivers/iio/proximity/srf04.c
> +++ b/drivers/iio/proximity/srf04.c
> @@ -253,10 +253,8 @@ static int srf04_probe(struct platform_device *pdev)
>         int ret;
>
>         indio_dev =3D devm_iio_device_alloc(dev, sizeof(struct srf04_data=
));
> -       if (!indio_dev) {
> -               dev_err(dev, "failed to allocate IIO device\n");
> +       if (!indio_dev)
>                 return -ENOMEM;
> -       }
>
>         data =3D iio_priv(indio_dev);
>         data->dev =3D dev;
>
> --
> 2.43.0
>
>
