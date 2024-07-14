Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93D13B293
	for <imx@lists.linux.dev>; Sun, 14 Jul 2024 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720976568; cv=none; b=bK8YyrcN0+XmrrWVhyVWIs/nhFmPXkx0VIL5hlxp4YwLH1qosDpGmHIr810+Iw+Lccg8Ja3+1ohRykF8FrDcq2XFdb7bUB6PSUYMHZJXy0byivINY8MgUWglyGm8a5+GURkhjHn7AO5Kt+ftj+e+fDa+YsWD2ORPq0Dnz6ndZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720976568; c=relaxed/simple;
	bh=imFGudE0abTwx4msHdDYdZAoZLvRkFY2Ru5F4Y8JOZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRE/3ZesobcPDcTGaIxvGnMkrRUal7W0KJRAOuOP3I0eUqxAhal6chIgXZtNng3/tcdKWFuNTdI/TRVb6T5zURUPHCHs90Gm3osFI2KwC2i56b9Q4VTed0FH/TAZDGwBj8hcTBmb6112o0GUMDurvz0i+/xPXb6Y8zyuME8rz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHwK0BJN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHwK0BJN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b3c0a00f2so2237405b3a.3
        for <imx@lists.linux.dev>; Sun, 14 Jul 2024 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720976567; x=1721581367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2F80DyFNnpYsHP7zwJV9lSVbXe9QpASbGWUomP7AEo=;
        b=DHwK0BJNylzhNwf09qxSqZQMl53Ved111n1eWJ6F2eEr1+FFWXlx+UJjgsBxFTldge
         EOIGtua4TisdLRQrB7SDwUSRbt/GWbySa+4ZqKHpILkElKQb//dWtK2fzwGU7gLQtw6W
         SB6Ml0UC/OhJ8WTwcpPKxqmLAtRuFhxBmrbxcq+jD7Zqxca/9wwC6GhoNVlR65LJL1y6
         Czs7vMJqHQDGfSqwfBsSMA1ibqRtIBW5fW++pnOIbptef4xc7gQwDEJFoIXgp/hYRWLx
         79FP0aOFH4y30/wCX76gTMNqNs3ncFKv75g2l2vSCL4zRsT1zJXiZhHf48SnnmfGvwuU
         Toiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720976567; x=1721581367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2F80DyFNnpYsHP7zwJV9lSVbXe9QpASbGWUomP7AEo=;
        b=ud6jLOD+j+i2EwXBhwNjiSE6uYKvDft/KtX+aCeoJPWKZU4XrT8Frj6FnfpBkTUfKP
         rB7IC3+i3WVxBBNaoMQ7ZGVrbjShu1bAHoiuVj8dHmuP1rKPuMVpGbRGRx8AwNdReEYD
         7od395VIJaBdXLvo3sOhETGtSdD0VliaMVzfY9pu6CBMKdoA5shd5YfqHIeaT0xGoqFe
         NJz4V8Lq9U3Zu4fIv/JTjyn7cvRzxK3BE6eHRcZyhMKjSATxXa4Pf4LEbCnsF6tXCjUI
         t3GlLXcCI0jNydgw9saQsF+LzlUoxsF4t8zM7FWIxkjcNgKUyrbXGriPhqivRVmtGqJD
         nbew==
X-Forwarded-Encrypted: i=1; AJvYcCUC7m+MyznD0ajuOA3FU2e/ahlZ6FlIeHrLq8+PM9VyYo0n9LNjtiE702vUrTYXT0rhVmsjdMU3cCAfPUhr8H2Dfcjp
X-Gm-Message-State: AOJu0YwVhEZ46UHD/8DyT0PmPJ+LgMYCe9D5UWFUwImVSAhfWul0yxe1
	4zl50ZONmVrsSnAJoVppIrM7qJiEcRYmnDHy19pRfpWuoO0eKUex0l1et8lv/j/f2Zkf7pbuXqQ
	eIfmHnaUVzm/mSfWNHiOl3wWKZQY=
X-Google-Smtp-Source: AGHT+IGHPlz4JVnrclkH/s8T8rzAqvI6Kcvne8QSso/Zp8ZfFWs0gedBWYKbzhNBAFNfq6Nmba+ZrZyBPvatXfS++P0=
X-Received: by 2002:a05:6a20:7f87:b0:1c3:b210:418b with SMTP id
 adf61e73a8af0-1c3b21041f3mr11115631637.52.1720976566543; Sun, 14 Jul 2024
 10:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607133347.3291040-1-peng.fan@oss.nxp.com> <20240607133347.3291040-6-peng.fan@oss.nxp.com>
In-Reply-To: <20240607133347.3291040-6-peng.fan@oss.nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 14 Jul 2024 12:02:35 -0500
Message-ID: <CAHCN7x+pzcdwSq19LefsyYAPUp8=kQYJeVbHm9sgSeaKXigMZg@mail.gmail.com>
Subject: Re: [PATCH V3 05/15] clk: imx: imx8mp-audiomix: remove sdma root clock
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 8:28=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> There is an issue:
> SDMA3 can't work without setting AUDIOMIX_CLKEN0[SDMA2] (bit-26) to 1
>
> The workaround is:
> As the reset state of AUDIOMIX_CLKEN0[SDMA2] is enabled,
> we just need to keep it on as reset state, don't touch it
> in kernel, then every thing is same as before, if we register
> the clock in clk-audiomix, then kernel will try to disable
> it in idle.
>
> Fixes: 6cd95f7b151c ("clk: imx: imx8mp: Add audiomix block control")
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

With this patch,I found it broke the imx8mp-beacon board when running
audio through a codec connected to sai3.  Reverting this patch made
the crash go away.  Is there a way to mark the clock as critical so it
doesn't get idled?

adam
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> index b381d6f784c8..88d8ba975b5a 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -172,7 +172,6 @@ static struct clk_imx8mp_audiomix_sel sels[] =3D {
>         CLK_GATE("ocrama", OCRAMA_IPG),
>         CLK_GATE("aud2htx", AUD2HTX_IPG),
>         CLK_GATE("earc_phy", EARC_PHY),
> -       CLK_GATE("sdma2", SDMA2_ROOT),
>         CLK_GATE("sdma3", SDMA3_ROOT),
>         CLK_GATE("spba2", SPBA2_ROOT),
>         CLK_GATE("dsp", DSP_ROOT),
> --
> 2.37.1
>
>
