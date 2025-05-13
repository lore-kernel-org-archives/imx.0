Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB428DB63
	for <imx@lists.linux.dev>; Tue, 13 May 2025 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141483; cv=none; b=nHPjl3QYKG1p7c9p+SMc0Vchd6Ka5IS9Hl6aWjDtL8WwUZuXLRjYAoqZDwCbNE9glTvPaIHWH16gR8mGfT0CMAAU3z0bJeaGNm9y9vLXHkUUqr4QxpsdQoJibLpV5f0Yasx5I3h4M3FnBu8HXs56374EkKB6IT6NKIpdF/Orx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141483; c=relaxed/simple;
	bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2BIZ3fh74FN+iDSGDJV99hlF98y+mRjtUnybwNffu+hDB14gBuuU2Q4W5DQiTuKMen86Ff4isxxe/syTQhEyj2g0Fsralz30MehqEOwiB/QDv0PRwdIg8+LuIPU1Jy9f3a6My7goq1QfxKosbL3m80M/ABeCdsDR3ML97MnFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Htn3xUsC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Htn3xUsC"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-550d09d4daaso1188161e87.2
        for <imx@lists.linux.dev>; Tue, 13 May 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141480; x=1747746280; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=Htn3xUsCBSTJTels2c97+2Av/3q4Y66ASI7Uxi4DCeNtC+PgZo5bStbWKxt3EToHmt
         N68Czbpo0tzQEwm+k2Mab0/p4HK2U+N92aFjd1/44ghQfAosORFLXqAnpyymIJw9TQQN
         jJJLiVMkuZaHrnPhEEnUSicPDs1shIJdcubmVK0FZ+hKuQclx4Bx04izUEYgWvrKDLZl
         Np30qPwI59yXfGrKFWxUjTCErIpOYvnKe+A604H/S/JSc2Ve6sZ37g+CZn4gykBB8SRd
         mncq5in21rEfkxnpKVMl920QO4MYwhO9vB+XNbGTTof1cY0DY+iAeuHU2XYw0JzeRsOk
         N7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141480; x=1747746280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2ZxOoIdi13WjQ49OpkZmrMWrhD/oEbMUsIPhKeBTyY=;
        b=MepTM/bOYJm28wdsuonq1ETQzUwENhMIdddXJ/bRtJlPyXYbhcoBWYUEXOKUn6gjSg
         de3ipFH790oQSvl8uSxgZ+yVYzS0wHoU32rYoXOolD1kUqAKYrunpFokFtkWNbB0GeDI
         Qq9dAZwkbW1SHIQAVrrWb4dGOKxhRzyrlraSQdXFSxL/z1lsR/YKJFbW4/Y2CEc4U1q7
         sMPRI5xfHS3WcKnH8FL4eT/rQhff0yfYkakwkphtIYHqmjW7SoiaxT8mbcYYth2IyXnl
         jZcegaGSmD1NHq67gBtbocZFp0TxFMdlySQaUdAc5oPa8lNVfMk0wJ6TkzJ3OCPa0gew
         PCzg==
X-Forwarded-Encrypted: i=1; AJvYcCW7DEQwRS4O2IV19f0B6+Y74UBrRLA+7NfbBD5tHpnlg5k8R4IN3UuAPxaqAmmihs+t3Bk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZhj/hqOvRsWIqyby6vqkCwAzt66QUD86cUq4SmCSgk+RDcUFy
	amg5q2gXhsCaUHZ60yWxUsV9eHF64O7X5NMnHLQhZmJuzPipwLucbVc2yYZFmjCtd/RVn8krr2o
	hd6Heb1Pi0whGMfhZs785ajMMowe21/4o1g17Mg==
X-Gm-Gg: ASbGncsm+NcWJRqTFEeUwRnZAKSMG8rD6BBEPqBOnKAxLBWGHz0Ohjn++Ws/MkZxwsg
	sOZWbBNgqIynMWW19jvEMWtzyKEvzC93MVN/Qb4VGDZV8wNhn6XEabnbBKpmUyeWB6mVEMiIitP
	TqZC7QUIuw4sc7CUqf1vSJ9Fbh9c4TVSbb8WRyAfOgeRE=
X-Google-Smtp-Source: AGHT+IHvP0gooDDmu568VdD7x6FFv8psYcJXM3XY47vCtvEw04TEGbdJAZqsD4ocAj63/kyy4PnOyiTDBOr/SlE5CrE=
X-Received: by 2002:a05:6512:608b:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-54fc67b5d02mr7159396e87.13.1747141479717; Tue, 13 May 2025
 06:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:04:28 +0200
X-Gm-Features: AX0GCFt0sjPwjvA5EozAKBAvIh0YXGHalZHBo5O9eCpuXVR3ChNSqR-rASM-_dk
Message-ID: <CACRpkdaBrxwWd4JPAJCZRj1Ov8a_6U+idGzi2pnEr4MJ0Eyf2Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 3:07=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.d=
e> wrote:

> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
>
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
>
> Yet, the warning is annoying and has resulted in many rejected attempts
> to remove it over the years[1][2][3].
>
> As the i.MX GPIO driver is device tree only, GPIO_SYSFS is the only
> consumer of the deterministic GPIO numbering. Let's therefore restrict th=
e
> static base and the warning that comes with it to configurations
> with CONFIG_GPIO_SYSFS enabled.
>
> [1]: https://lore.kernel.org/all/20230226205319.1013332-1-dario.binacchi@=
amarulasolutions.com/
> [2]: https://lore.kernel.org/all/20230506085928.933737-2-haibo.chen@nxp.c=
om/
> [3]: https://lore.kernel.org/all/20241121145515.3087855-1-catalin.popescu=
@leica-geosystems.com/
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Well that is an interesting way to do it. OK I guess!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
