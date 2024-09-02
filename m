Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8681D2798
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270625; cv=none; b=eAEX9EFIBh3w4+O71v4qlgVPdImSjX+75c90vj3+L4hyAsjfUmsJdZTN5WEYobvcMYXnYUc4mANFVxY0Kkq/jdsgmUo2+tHi5PW44MkXsxK3x8hPWDfv7j6zMioWHKm28nsN/WbUyOPDlhh5wA34qeKYJwuLfcaCVjk3Jl8c4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270625; c=relaxed/simple;
	bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvgzNVmyIC/1MprzG3+tBg2cd+bDYfcQQySQuYhrTn5594WXW5/ZfMY3lspk+ZAZDGFmI55SvxeIm1YrDUw7VNX1LYA4EPPTiWpeWPVT7AWrV4In83JCAv2nc7d78CkMHzCf+GoW1h1er7Nkya0OlcujstLje2RlndkYxX60FIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ms4GrhBU; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ms4GrhBU"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f0bdbcd9so46765621fa.1
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270622; x=1725875422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
        b=Ms4GrhBU0XuVMcYjcAkLcGeM/mFpq21s+spSIwzYb3T4DQ3LkHrncL5Mz/O5bmQgfQ
         j7kiuAMcAAZMIFUTn/obB39iuYMT8S7jvyp6xWqrmUk0ay6YRCKqSP0ZG9uM+KtyLTNr
         r6Vzn9K2a5DaAeKaS9Xt0byzz3kSHUCZmnUeuPkU2JNtiO8noBj7Xno8Fd5xti23eozU
         whk7bqNmp9TcmRUCRW1/H9xxnRcDc3Kl57QZ9V7g/VBC3aXWMzrfIOL6gJDrP0s3Z/hs
         RpaQTCRWcF+ojhE8+Pg2x7k8Y84p/rgWtTaHuOg9B3niDH1PTUrJ84dybvzEnT0bBUqU
         9rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270622; x=1725875422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28McJcVKs42ZY9Sq0kv5hG33Yboh2UqyM8r6czZX88U=;
        b=Nsb7OaK0tkJMcQVzHP5ovKHQe+OMGiDVKFXZvG9/zp53qTYyksKQ9LB+vhtmWWoBbK
         yUVeXF2Pf5nQ6E94KElY0awZCFL+BV0v0L7fjTe+pcps+L6M/Z+ZwfsaUtnOpGUFnQCD
         75qGEKBwZcuxLXe/QX/JMlNCm9RhhxlCbKsbFHRGQUN6I4+sFgbyqEpv5zy+vMbL+D2k
         RdqDtTQcCzNNxzW5xLpBsa4mTSpVUh/1sm9AufDZ+upT2l3KPum3a2je6RVX9fVEn4X8
         vMYOdjdIVkJg0E7wrm57SKDcTKjHt0HIxvjsjGAiP/QegXoAXdB/9/r1AQG4hIvuXaIR
         +WTw==
X-Forwarded-Encrypted: i=1; AJvYcCUSdEMUXQyD3ZNaaW+WT2gYlEBMQA6k3YCZMF1PEMSUpKWx8T6Brkxv/5MR7mzVhktEJdA=@lists.linux.dev
X-Gm-Message-State: AOJu0YynA98ASM1caykn41S6jAWnwcBNPoNCwmGUsu3ixbF1tNKYk6lf
	HzOS7/90oODYiZf7MzHZPfU13LEVufsUhI39G+QXcIxoNri3XUkB4hOdrZan3BtaBWn+sRVPdLR
	yLPbXIW4f8HNB1B0EP1+j2vg3swOF7NApx02sDg==
X-Google-Smtp-Source: AGHT+IHzAjC82O5fFXZUuxREWWYMeyebjNflKtG1tJUMYRTIdDHBfO7anU/6cm0HwOYbXK/491VB93Nh9ac09yNZ/4I=
X-Received: by 2002:a05:651c:552:b0:2f0:25dc:1886 with SMTP id
 38308e7fff4ca-2f636a04470mr20450581fa.10.1725270620988; Mon, 02 Sep 2024
 02:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org> <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
In-Reply-To: <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 11:50:08 +0200
Message-ID: <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
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

On Sat, Aug 31, 2024 at 12:32=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> On Wed, Aug 28, 2024 at 11:36=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>
> > GPIO hog nodes should define type, otherwise "dummy-hog" boolean
> > properties would be allowed.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I suppose it's best of Bartosz applies this to the GPIO tree with
> the rest of the series?
>
> Yours,
> Linus Walleij

Ah, I picked up the GPIO changes separately. No problem, I'll pick
this one up as well.

Bart
