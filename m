Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DBA14EC56
	for <imx@lists.linux.dev>; Thu, 15 Aug 2024 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723757016; cv=none; b=P4Y668rTRLWdEEqlKmvkjQMIY/diYpGPYDokFvJV1t/NwQs35hC1L3l0s4J6c9COOlLFCicX7onbrk8mX9EmKccry/J1g356wvo0psoaCfTsokr1AkEkPlg1sZZ1QxGG6cQ1abBSk7a6GqFnIZt/1WnK1Nz3VwppfwqyXDWjKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723757016; c=relaxed/simple;
	bh=hxWMuaf3kQDtZ1suhHm56wzGoZrFxDQcZAFuWwgN03k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8EEBJ2ua6Ed1bUlOPQ3FItsrtC5CSD0nmwc0oxLt1gM7aIVj0Sc2s21U9/pDcFGmxlXr/gY6Ge0JvBgz7QglkznlbnfM8q2xp0HvoI/b51zzjhw4yzpvjEuBNsa2kKWqLbTmRqh7BQFYjZybzPUv5EdtFu/yjh8LtOIGV9thVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h71BiTst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h71BiTst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642DCC4AF0C
	for <imx@lists.linux.dev>; Thu, 15 Aug 2024 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723757016;
	bh=hxWMuaf3kQDtZ1suhHm56wzGoZrFxDQcZAFuWwgN03k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h71BiTstfgoAm/AnCTnKYndjfVW5cVXX1zSAISPTLlUIoiXYBW3quGqNjF4Zmsc1q
	 gzPdLT3eEbpyDZXzvzopq6TepiB+j/9t+0yTinKgt9mx9Gwr1//QZyFOo6F+p5E0/S
	 6KsPHu9nxL07xaWc2xL88zU+uP0i0QMnPlJNryJMqV10kJzmHhtFTLzPUAuZLoSGtc
	 S2JamK/u55Z9Mg9nyHZorA73+04CfUfTunrR9Kras7i60i/iUZirNCzbzwx0CksQRk
	 34sutnEX4N7W9UvAJi7OfaKb/GFOi5yoN3JCKrG9B3PAh0883ZBpLGYdIipHrwlyZz
	 hoVf/YjjUw5Vw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f16d2f2b68so19526461fa.3
        for <imx@lists.linux.dev>; Thu, 15 Aug 2024 14:23:36 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxv/fI90ZVMAyjIUu8FRDHESU3Hfbforgc8ZZJxrge5j6YZeTLi
	NpQrKho1gH9U9oIeWVdInK9ai0TnFXwwRUw0hOinzWrtdwSgBDa2y3YcfuiJrF5RvxfnArjWDHZ
	dT1zDnwK7bmbjSBrmub89QayvaA==
X-Google-Smtp-Source: AGHT+IFnMt2Qcsj+larikgTlYpDJaH/2cmr55i2Wk+bCKHNq/0V3FP3D+2VsQAYZBkaXkZovpP0Di4baGfxR9chLVak=
X-Received: by 2002:a2e:3518:0:b0:2f0:1f15:5a16 with SMTP id
 38308e7fff4ca-2f3be58389fmr7028291fa.13.1723757014701; Thu, 15 Aug 2024
 14:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zr5LAhuieUvM/uEC@lizhi-Precision-Tower-5810>
In-Reply-To: <Zr5LAhuieUvM/uEC@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 15:23:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLih5nbNhP=Zf=LG5xMG-Q7FmSwHcHS5JgE_=MquPVMng@mail.gmail.com>
Message-ID: <CAL_JsqLih5nbNhP=Zf=LG5xMG-Q7FmSwHcHS5JgE_=MquPVMng@mail.gmail.com>
Subject: Re: How to delete property in device tree overlay dtso
To: Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:38=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> Rob:
>
> It may be old topic:
> https://lore.kernel.org/lkml/c342562e-f915-a853-c2a8-eecefd94b88d@gmail.c=
om/T/

Yeah, still no one has figured out how to add that to overlays.

> When I try to fix below warning,
>
> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb=
-hub-hog: {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output=
-high': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']} is valid un=
der each of {'required': ['output-low']}, {'required': ['output-high']}
>
> both "output-low" and "output-high" two flags exist under one node.

It's best to design bindings which can't have invalid combinations,
but too late for this one...

> When I try to delete "output-high" in dtso file, I found it doesn't work
> and dtc have not complain /delete node/ not work for overlay.
>
> It may cause some problems because people think delete success, but
> actually not, espeically some important flags.

Perhaps add a warning to dtc. It may have to be just in overlays
because there might be reliance on the current silent behavior.

Rob
