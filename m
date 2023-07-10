Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B35A568F
	for <imx@lists.linux.dev>; Mon, 10 Jul 2023 07:56:49 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-47e4d002e0bso1391069e0c.0
        for <imx@lists.linux.dev>; Mon, 10 Jul 2023 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688975809; x=1691567809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SMcg4ntVS4PMD7oU7uEd9PXhmzkVBAGMmfrBwEdvFs=;
        b=iZE3cTLqTyzvCtOmvj9sDwjVWhc1buL52BNF3H4kGzy6AKdxv0q2Vn/Tdr7hFl9lC7
         OpHD0yRFAhnnzwjLtfBggjDltoogNXaLmfJVv0qMNuMOG7R6nMx3KICPRgUhYH54XZB/
         wC5ksD0Ta7cBMma8swDrbkwbOHTYsowKLsuAqo+Iauzmr+ZAuj2f71cko+TEYBZLDEna
         8G9d3TqD4v6a2nbTpjIdNMz69418BWTE0ol+EOCDFQ0mq0fsBOdMXcOwj7jiK8E5a90E
         Fc/Xvie3PAE41Y+3rI2fPOvS6aIxXYW5VKWyLXnxwFD/qhlenQxQsz3mOnxa3t7J4/Sa
         eO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688975809; x=1691567809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SMcg4ntVS4PMD7oU7uEd9PXhmzkVBAGMmfrBwEdvFs=;
        b=g+vOd/e48yzidbY4RoXBCoKOhjzxBNbthai0AyqKH+Asr2IpnZMEMCwZ5DvS2Tih3q
         7ZrkKsvwf0vFFHkKZv21hXu/fZVq6xroeSiyGPVqTNGuNaRKl6WhVILGh7xQmKQP83Tn
         H0M4Ann/w4o0JaK+QQ+y8IWJob5wKs9zPzhv4CmycD4cC8RZVD/yNckUIQcIof1Tzybj
         jvfycKzrHkdYL6HaRMqGVqPdvmjLuD2BX+XijoruojjUXhhnFcDQQthb22uC0B0hiAmo
         9S8RkQ0JiSWIrVeVkji02GpmRxGvJ/EnKy4BR02rUKnafHOh3U6voE+vFdrUyaxqY4CC
         HWkg==
X-Gm-Message-State: ABy/qLasKV/DC2jqqiBtbZqJKePr2cX6N3c7EDVSD3dSUv7WhsQ37nop
	MEyOaRHFUcxK7rN6BDa21MFcEoV68iC3jle1bzInog==
X-Google-Smtp-Source: APBJJlHbtkKPCuN968hSsPZ15vwYlllyPWVVaeU9IeAWkVivLjjFnvDr49kZ6qkiG8ULoxOc2Nv24hpxunNjBqn49nA=
X-Received: by 2002:a1f:5ed4:0:b0:47e:47d4:958 with SMTP id
 s203-20020a1f5ed4000000b0047e47d40958mr5516321vkb.15.1688975808865; Mon, 10
 Jul 2023 00:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230706145611.2660657-1-shenwei.wang@nxp.com>
In-Reply-To: <20230706145611.2660657-1-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jul 2023 09:56:37 +0200
Message-ID: <CAMRc=Mc1H+JQF6AOpBEMA5-jVvppQ+Va1QXGdTi=PDn-iD9-XA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mxc: add runtime pm support
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2023 at 4:56=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Add runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.
>
> While putting the GPIO module itself into power saving mode may not
> have an obvious impact on current dissipation, the function is necessary
> because the GPIO module disables its clock when idle. This enables the
> system an opportunity to power off the parent subsystem, and this conserv=
es
> more power. The typical i.MX8 SoC features up to 8 GPIO controllers, but
> most of the controllers often remain unused.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---

Applied, thanks!

Bart
