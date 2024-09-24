Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4A11CBD
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163946; cv=none; b=oh4yckYd0VuEbXQgTf/mte4auGIASiliW5HwZC2aoeN2Pfg5KgNztHs5M0Oi/Y/7vyQO4KEF9z8v7q05RlBYUXYCmFl1xScoJve4Ka29LrVPS9EupoBNDi2paJQWGwQYOkh9Lu+DfmdfqpzourQckKfROF8Mz2lsMqW3R/PCV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163946; c=relaxed/simple;
	bh=MqhA2gxS9MTxmqX69mbrOYHAL9N8LKtrtunB9LWCxLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrCDB9tSHhb3JG89mn7hFd9IBZCBuarCaADr3WCGx+/EiWBSuNkPfIiJftPRmHcGp1yu5FbCNMW4D6DlW1eGIMj1F27kKEuO8ZvmO6iZHH7nVfyg9mFGQQHeXJONCn829SoppwGWTVxgvRc/KbbI0cIiavIhjGZ5SDAagC3xZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDvW5C/Z; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDvW5C/Z"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-535694d67eeso5359368e87.0
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727163943; x=1727768743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqhA2gxS9MTxmqX69mbrOYHAL9N8LKtrtunB9LWCxLw=;
        b=TDvW5C/Zqgtt4DSxPBRkSJAvD7GRZhLG7XWei1EH1XKCzeicaCcLRd1OI1ryVq7Emm
         UAfpPTfX79oHoYJg9h8Ho1eyMdEKGWGr0Z+0ZX79cDWV3Qte+0NTh4yTRdsXptOu5ALu
         AdYqP3nqNKnuIbxpcWIC1FEcnGN1UnyTPogxh3z/7xL+D3wFrv2wPGw3ryCFUUUBgAOD
         d/kxNqxO5jCkMr+Z5e5hclN1KwzNSwaeyY5iAPOCu+yTUKP9+sW6GaU0tsOVR4XAYwql
         t4cy054LuOuIxNZIgXGWaQl+CHxr8WEtO0vx9F+pnq4zdYnLStEL8BWXOBdpfDeLDnkC
         8bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163943; x=1727768743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqhA2gxS9MTxmqX69mbrOYHAL9N8LKtrtunB9LWCxLw=;
        b=m0RjRlZ7KTN12taR+3b0DrwVP1cImEh/9IT9jGrgUcS9gefs44/02h6sgxlLM+4IQY
         XWNtxmtCDExfvuObQQ/K9lzGyr8DqY+4G1jDpSZ0vt94hzGUDHLkhwNHSNH9MrXdKATu
         PgB3kl1TV9LynJXLh8DN50ipaDU5JunR9TVmiVHwTjhWwdSF4JU18hGVw8VKKT34V+Ry
         ZwAyB+TRiHIxkfkC4xH/Ul8CokcPI/EnprkuOJYl8AMSmza/MjC5rO5+mvK3BQtspavX
         DNDBB9lN1jahsUjKLAUhJPvJmMivl4dzeU0oH1G1HDobHpKw72850Ysmb8JGQxJJCO6w
         kOTA==
X-Forwarded-Encrypted: i=1; AJvYcCUYyTX1zhNof5zYDkGJf99oC4ZsD9pVe+1+uSb9MlsGLF88DRr8j1v2kEyIVoNC8AOiI64=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvBCUOmeCnjrVaVxF8ZohbtaxVgUAKOFNZRjcC2af2iPPxPsjb
	XM/BxWoMTuINu1m3Q8sDlTY02ClJ1iS2j3WnAMArPQj6JFU0k7N7JK2z4xZQoKzPj9q0ldJjapM
	Fvys1F7p7VB7BiTmxMf5BJqu+CkE0F90XQMLIaA==
X-Google-Smtp-Source: AGHT+IFSnhi2g8RCS4Pf7Wrz3+5o1CeBJkl9cOue8TFxLcfAoHEaLB+jSarR5GR30yYmfSCZziuzfKQojHEPSL+b7Q8=
X-Received: by 2002:a05:6512:1150:b0:533:1d4:546d with SMTP id
 2adb3069b0e04-537a651ac4amr734820e87.7.1727163943165; Tue, 24 Sep 2024
 00:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com> <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
In-Reply-To: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Sep 2024 09:45:32 +0200
Message-ID: <CACRpkdaW14PgLXTRPHUjaLNKfCMRs+hpHrYyMiNaqSs+m0rhqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:24=E2=80=AFPM Esben Haabendal <esben@geanix.com> =
wrote:

> Making pinctrl drivers and subsequently the pinctrl framework
> user-controllable, allows building a kernel without this.
> While in many (most) cases, this could make the system unbootable, it
> does allow building smaller kernels for those situations where picntrl
> is not needed.
>
> One such situation is when building a kernel for NXP LS1021A systems,
> which does not have run-time controllable pinctrl, so pinctrl framework
> and drivers are 100% dead-weight.
>
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this needs to be merged through the SoC tree.

Yours,
Linus Walleij
