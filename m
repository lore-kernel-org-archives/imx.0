Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B581D2F7B
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270707; cv=none; b=Sj5rjTXewWy4jh97YT+DNy93QC6RZs9gEOznGtENgp2pD33+Qkw9TI4ivE0unGG8WgasSMh6Dt6I5cd5ZdCgBCN3N/UYvO+zP24CiCvPitVK+Ragd3xi2qM9P3299wIGAAF3zEiTW35krR0XglfHovkFZ4X9Xj0RhTqtVbB0Hf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270707; c=relaxed/simple;
	bh=qmsZkQ4ZxF52i7LYuHENnEzSp1FV0CuFPl/eYLGnvZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dP7P1nrSQfppA3YXPF24d/gdipK8XwJ0leLtu8SFBa6mAn+8+SsbhVw5zAk2Zw2uwesw4On8zcEfe/EMlfW73QquLujlTyOVBPGQy9Q+g+yzRhFMsdxY7jXtDl5iItHz0yAuZkk4GbTK6HMrcGrkNeFvqV6RofoshOWS3PuDQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZqITxIBM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZqITxIBM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53351642021so4258247e87.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270704; x=1725875504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmsZkQ4ZxF52i7LYuHENnEzSp1FV0CuFPl/eYLGnvZU=;
        b=ZqITxIBMLVHs9LL6kRXUDUsgcBh0eJKxf2iiJxhPIyi9KVPWI/EIgOjmYeyR4SFKKd
         KtwMY2T05qV5knyS1/wOd2UB326oe6c5VEPUCMX9wJmSLv/4WX5OI6WH7mbklhgh7kKa
         S7dr/ov5wS0EaRZQn2wbHpyLLpOOJ104khkO7imA0wnvA6lC1ZmnerRzx+2KvkASVrFc
         sXAr6ven6w+9rcycEPd6RzCJS4YopQktS/Xlsq9SNxEozQoPzu0nHIx5/DZfZnSD5MyH
         uViTCUhGkaUNsWZuRsiW2+8TGc471R3q/kng5sH4HfSr/ADoerGscXtSou+k2EFB5uFP
         9Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270704; x=1725875504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmsZkQ4ZxF52i7LYuHENnEzSp1FV0CuFPl/eYLGnvZU=;
        b=QC7EsWxW3meP56V6jnukXTUwulF4AyFTT8bCeDq+ibNbu9XDZi3jN7SJebwKVteDJz
         YduRmgfB4JDVnRmeODkGLtWFFTxNKe9LiJ/+LwzO7PA9PoskTI1lQo6L3T6jy/tRywzD
         P3rhJqeVnlPxK3L6LftMUgtmsJ51c9SvraJ7hEx3Sifuxx1/SlfWv7vbO5q1Gm1Ki73r
         BjjLPwIu3YTDSzLH0nqCUdNChOKrELqthyaPJF7LjLoVxKjlix1Zpr/lI6sKfb+5gClc
         yMVoZVSefXe1L9zyPnOhCm3lAjoV3SVJnTCvGw2znvgfuqTEfXClAlE/Oasrx+hIhb0v
         GB5w==
X-Forwarded-Encrypted: i=1; AJvYcCVfQtjVQthQOjhbYRurAX5uV4uUdd24zQNpHhsqG8c5ZtGVg36ftTrXgN5OVYLA/epjtGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwON4BgSjAnaI5sGyAxuLtcCIK3VxlNGdsKsRnq5qWC2dlJ0ueP
	3Hsw5QYht+nc1L/WxiBPx8ISBBwoxUPznCpQY4aBRR8ChGkFXuAcWRF9nRf+XDnAdvBFUiGGxcd
	wpxgX5HCcqzeFw2KcmDvm83BdzZ2317gzu7+86Q==
X-Google-Smtp-Source: AGHT+IFqfLvZ8mKMDJqoWKL8m+Uh85ScKbEqg+TuVzZr1GdHMS+OsFqDlasVBn+Gh/2ybEBwe2mEjcHCj8mZ6Tu9m+4=
X-Received: by 2002:a05:6512:68c:b0:530:c1fb:51a1 with SMTP id
 2adb3069b0e04-53546aff14dmr6365059e87.17.1725270703170; Mon, 02 Sep 2024
 02:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com> <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
In-Reply-To: <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 11:51:32 +0200
Message-ID: <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Sat, Aug 31, 2024 at 12:32=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >
> > > GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> > > properties would be allowed.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > I suppose it's best of Bartosz applies this to the GPIO tree with
> > the rest of the series?
> >
> > Yours,
> > Linus Walleij
>
> Ah, I picked up the GPIO changes separately. No problem, I'll pick
> this one up as well.
>
> Bart

Nope, I cannot, this doesn't apply to the GPIO tree.

Bart
