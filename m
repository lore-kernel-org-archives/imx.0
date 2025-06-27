Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375D2EA742
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 17:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047021; cv=none; b=KSqgu1gBjcJaxaI1hUuhBPYPmCkm+mseUdL1kCMED5sNmPGnQWya30pgBXi+h4rW8B5up+Sl02rz/7QAD4DJlb+q/JzxaLKvXduJWG98kdr6aer4p6Cnhq/aoii2koFSE+BKXJdNHawSUGXlWeREScG5y63eIemJXvYsqxWuH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047021; c=relaxed/simple;
	bh=czkJe6P8edZl5EJS+azo4RH37Yqc0TlWj4Ti1g4vPok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx+TT0fuJ2WkE2eYj6Zq4GnrrxzMiTaSyRPgYqovfEZEN/nPHDHykFEfNJLmvgVINWUl8XYMyt1GovLhunqFUQnkiYGFV/qCOI36KXF6ySZypy+4M2EzRGskkUlh0afhHztiKrhsPStHo695HFdpfKwqlTdC/Wxt6DZcAyCLJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=NxrT0he0; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="NxrT0he0"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-610cbca60cdso82160eaf.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1751047018; x=1751651818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=;
        b=NxrT0he0ksrXdW3DuGCBkIdJFgZfo4SulNysBXhaPpfnzlns1k3snDSLA09WKRb8N+
         mVYYCZSmtD9SpX4gmqwgzZeHnRb2ioaTonB8+JjbEI6wpnniLr2tETJuRQ9vpnXN5yVY
         AP7qec8+twSNE7CbsKG8HSuxbkKoqObC5rorC+Z4mKpb3F5LwV/KWcOEOvr2PX5Cjm8a
         teN7VfMpIcOgBZkcSeLawg5Hj1Bac26YiBZDpjZeqK2mZVc1+ibNT5xpPN2xeE4mhusu
         8ZarZvxha1xeR7xTdPyhJMiOwVfwaqSGDJVUq+GNNGs6yM3KYIAZGABr3iZGuqEZZm/B
         LMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751047018; x=1751651818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=;
        b=s6Y4fxdA9nU+32wlqednLgeL2I4muruHuEcwYqyx7x7AXRiwrckMYtZiS5pOrD05C2
         8t503fI8uegxh8a+KgWHn5iUArI+DhLgJZGZDRaKTw0P3ImBt8qT6A0XOjFY2l0/e7Sn
         VuOsgDiqRo75fBzMSYhbDgRY/5aQNCj9kKM62gvTvQOLKrYax5DBOIF9L2JFwsgPiv7v
         ZuRh/OSmMqIjb7VJeJD3gzsrOK5sK9u6i1/qrzQS0TecDu/c2YB+9JTaapmeeEHP6+p5
         +r8G67fSYBepmvERXpQ8wPov/rDxTYfJ/YRhxwSmPwqaZv0RqNxa5m7oj0GpON7QlRLM
         37vA==
X-Forwarded-Encrypted: i=1; AJvYcCW7g4vuG9dfzsZM37cqG+4vX1yfiAEyQhMde0yr5L+SF1y4iJMjyh0N9VhFVXnaLlN6Vts=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtNNiIuWdtrwwm6/EjDN+K4sfQp5rE73AqrCK1NwZxiv0X3jRa
	lA6LEAN4hHQMQKxUZ7g2VmWWNFPUgOLoA+a9CKUppRDD0Wh4KSeaPKhZn7R4j2tk+Z3uVo6h1Sm
	7vNu9vkqzC0vz9pSU4dGMBTELYTsgyu2ZE76rLk7A9A==
X-Gm-Gg: ASbGncvuUWqiaoFumvBuOojXr5o3fwob/IUZPJxk3G1MvDT9mNixmH9WRrDBAs2YUfq
	pJN+98ScmKn3UfZnmBEyqQBwOVFancnDvKtnvEsuSvm8wvtCyqdRtkja7qISQNNtEwojpNxYUBV
	eqGpC1yuZP3xkhOB10cbSwsjOtNnZS6ahpaZ9VhMj/OPZTCDmII8Up2g==
X-Google-Smtp-Source: AGHT+IHn/O+yw4sdAQD7guPzO4j4/3MQOR3FH8Nb/hBYMQX3XW0mdG4bsbuqDOKcybzRbPj3Ume9tDS47O4jmJlhfy8=
X-Received: by 2002:a05:6820:994:b0:611:b561:258e with SMTP id
 006d021491bc7-611b90965aemr2849488eaf.3.1751047017799; Fri, 27 Jun 2025
 10:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 27 Jun 2025 10:56:46 -0700
X-Gm-Features: Ac12FXwaCCVUyBeRU0CpBhDP3QxyDWYKIvfZAtJZ7SnZG3kcRW-1EnKbWFLlM-8
Message-ID: <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 21bcd82fd092..8287a7f66ed3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -294,6 +294,8 @@ &usdhc3 {
>         pinctrl-0 =3D <&pinctrl_usdhc3>;
>         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
>         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> +       assigned-clock-rates =3D <400000000>;
>         bus-width =3D <8>;
>         non-removable;
>         status =3D "okay";
> --
> 2.48.1
>
>

Hi Adam,

This caught my interest. Where in the IMX8MMRM do you see this and
would it also apply to the IMX8MP? (You've patched your IMX8MM and
IMX8MN boards).

Have you encountered any issues when running eMMC at HS400 due to this
or is it just something you noticed in the RM more recently like with
my recent patch that lowers SPI clock due to an obscure RM note [1]

Best Regards,

Tim
[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D96=
5976&archive=3Dboth
