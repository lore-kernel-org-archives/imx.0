Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAA919F439
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355010; cv=none; b=b4ECHPrjXp2ujZAlrNLgfElECaLZP4CyxbNtojvMd3d8AlPPf1sf3u/XbU2X7TDQ41FKJ4dADqjYI1DOjkz5s6G4ZhJlfMfNxJMvDhTJa52N5CGD36iuu01UTeikEQu8lAei8sdekrbL/rDuzApfoKSkbLKFZAS4CClwE7SM7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355010; c=relaxed/simple;
	bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNhiygDEQ93cuXAP2ak8AEUrPEY2//X4EMrExzElo1PXuW3KOkujDJ0OJAB1ivtCSp+UAwKzm9zuKoTUQ7X4pQBcBB5eB4z3r7SOwy2ug2qgidPyr/KXEG7fqAvK6vPeeOAgEtfWBDYDM16efrh2ZpXbKwzTlxlWpbdPJXp0wu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IER7INjC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IER7INjC"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f5064816edso58196101fa.3
        for <imx@lists.linux.dev>; Tue, 03 Sep 2024 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725355007; x=1725959807; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
        b=IER7INjCgwlMj61enGOjEjBAMuQW6skBbgiB+ZmJziVhsIrdRvetI/kAN0vLfb1TCP
         enCaRknAxu9r7nfbP5smgAkMUo9IUKRK69GDY1z5VLv++PZ42k69QFB8Y7P/9TVZvpbe
         LB/A+2zr9zw/AdfFWKIUwU1EAiCyvq/zPOVslhKFWtQ3ZCZYUFdR8G85UIuNV1e29QwU
         GHyChSVvhR5WZSuDRCzvhBFxM7kupbc/Jthu+mgElLLz86RiVy+eNi9pHHc4d/jC6vOY
         rFayEJL4Rzt6HU4iT2hlCkFDiPCEOTS0ZF40KLBuS5gUAYvhHT+BKq7oU8RZiL/U367l
         dZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355007; x=1725959807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWjGQ4YHroQwD/57wggdSbHx9qHopndgiBjBXsMUmLI=;
        b=bmv15T0ZqmX2asT2kStiesrCf7ajJfynjL0y0yjv3JVOIDoss9CMQfp+PHco8g7akT
         u7CRJqVErdHYK56uZI03iwQ4bRqjlaahOQT+jYd3400fQaqcCa+Uqeg4z3whrHYW1RI0
         msLgT0Dk6lVbu9xeGJEEJ8GUrOeXtbsDtGUH1MzT6fEG+sQkBz88mdVMORgbFmDkwZlf
         NQvNT/Qc5x3/HRno6kbYd3HUtxxid7Hjk0GgGDjby3zE6X8sQhB42rDkQqEMxWRaohsv
         +1ZQLOPAva8NcVWespCOEW2eaJfqPlExdjFezt5TdEGeJZ60bUTbtlpErsf9ZTzUPr84
         mW6w==
X-Forwarded-Encrypted: i=1; AJvYcCU3oOR1hNxqcjO/gDyPluOXvwl9xkpdD0Bbvz5RYa75IGriFQOQ0aTZdv4XPrtxDFxQAQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGGwiAJeInhVSeK8a0Zvtj0wNkN0uwYirN3qTBvrpvfjes9l/A
	zDYO8Nl+HMv0UqBMvPedbElJUwLSNI3muwTay/uhpvdIp0yApk6lXEf8gbAkSJICTKYudhQFjA+
	wpMwAycJyDdsdze5uE+Ux3xKV4UpzShFxm2AztA==
X-Google-Smtp-Source: AGHT+IF5iXmXm3uBNGtfu2k2W3mUA/wL6HSlGri8eJbZA0MDiPWsO5xxdT1fn59W0sd0nud+XYxGXlKqBmQA/C+s9Vc=
X-Received: by 2002:a2e:a9a1:0:b0:2f3:d008:a54e with SMTP id
 38308e7fff4ca-2f6104f2859mr113545281fa.36.1725355005999; Tue, 03 Sep 2024
 02:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
 <CACRpkdZzF5yJQnnDsjU8cTr9Fpe7wZZXoW3K-wFYuAq2vv8XxA@mail.gmail.com>
 <CAMRc=Mcv9nfiG7N-ttS_A=Ay-5Wv2mYpT+41G1u8G4GrMQAuEA@mail.gmail.com>
 <CAMRc=Md9+pmiDSzjhNXBOzZeBLCemvxCzFMAyfFH_Qi329jG9Q@mail.gmail.com> <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
In-Reply-To: <884facf9-09dd-4454-9f39-67335b4e8c5f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Sep 2024 11:16:34 +0200
Message-ID: <CACRpkdZosOeBhEo460Wr3r9gF+xg1wJGdhvX0xf2_PWLZ2hkYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
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

On Mon, Sep 2, 2024 at 12:02=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> >>> I suppose it's best of Bartosz applies this to the GPIO tree with
> >>> the rest of the series?
> >>>
> >>> Yours,
> >>> Linus Walleij
> >>
> >> Ah, I picked up the GPIO changes separately. No problem, I'll pick
> >> this one up as well.
> >>
> >> Bart
> >
> > Nope, I cannot, this doesn't apply to the GPIO tree.
>
> Hm, probably there is something in pinctrl tree.
>
> @Linus, can you grab pinctrl bits?

OK I applied this patch 2/3 to the pinctrl tree!

Yours,
Linus Walleij
