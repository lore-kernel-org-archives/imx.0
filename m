Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3020B7E8
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434461; cv=none; b=kwMjO/kA//7JLIh2FtoXE451b6swff2V96HahgUxgKGXdJbr1t4D086PZnYKAW2VlcNTzzpCGQQygUTijPIQzX+KhpJpOKSNJI5o26WuYAbETdrMMB6hO6LeRPII1CgZjuLSCaSrqnEznLl4e89MNcb/hIzWeXTN56xnLwalRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434461; c=relaxed/simple;
	bh=oxo5VknzmyosiN70TxoSyT6j6915qRwF1UviL6zfZrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPTZAvAH70hdZMk4tVdK3VSIrOn3LUS0Np+xkJXbyYTfLhqZShL09NkGOoHVzTyqQD2SFrAxsQAwjzKomgscrRqFS3GWQoWXnyYEMkykiJLlcuZHP/vrZ5uQByf9FORuVHBf9Y9tqp6FaeVFzJWdYgN3qf81Vig85WiOpcLT6W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2EAdULpj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2EAdULpj"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30902641fc2so5405381fa.2
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 00:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434458; x=1740039258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=;
        b=2EAdULpj5hssgM90MCL3bnNBVBKsBwQo+2fmM/gZ0TpLa4qlykpLfvp3DpGefTxQhw
         PguyeDJYpZ1m32WvVDTxlPwSmK1LY/PPdL9gWuhVrwGgkcVJcOlhc5mqEo2ZRUIFVAQd
         fhyO9uTxkxaZAsoZ1PwTXRQ78UI852cX6yXok3YL06hT2R45g5JqL8bOA+Oz4wMbdmVt
         CUkLcDEGjaN3OIuYU/wFqETMURLNYMKIDg5MTHz+RpRaBbt6SBpuBAw32+ocd3po3wMk
         LlO8oEE8K5/QbIuqOZDs7BfkqJZ/7aYjwnB6w966lJW089g10+sIZ4cORoVo7hmZGshP
         Bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434458; x=1740039258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ki+G0JPNrh9TGAEWfL+l/C4IFlJkUDv2DnvQNOIs8=;
        b=Wo/Vq7Jg2tt7Np3tn/Sc8vPAccZi///2nLlmqYCPSK/DoLdHIC1HKsRdBuAmpO1YY0
         3apOLN7+25KLOvZd3zsZY3e5GOOy2/lBW26TI1/Pl5inFEjB/wbG8cGL2Jwikd1UrzDW
         DWH65JMtZ2SiKZMA8JK/HAw2cOLWLdHp/Eoy4XCQcm3vq+lDERM22qNhxu2YHOzOYTkR
         KKDW0P5k8pzMYr47OR/IoZhdgCQJMbFmD+FSHKAcEWMFJya+U4bbhVhSNwD1HFd5TA3z
         aP0yyR3+2+4lTftAeMsqxG99Do3x4+EoDGVB40qRsWPGCpy+OPR7YF8yLy3YwYW5YElK
         9WiA==
X-Forwarded-Encrypted: i=1; AJvYcCWCFcifpifWiQv9UNQwHKLQvoOc/uw2XvGLnG2fJ6wYMoIaeZ3r5NxHrQ2RJu3fM46Ylbw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeCDSshOBXmtYnYdA4OporAqu30b04MV59FsUl0/Vu9jp3Er9b
	sp3NpqiLva56h4lkxtXpcUpsKzP7zhUP41Pig4QSgt65m/FxlnJN9IdtWVoDxigQ/GakNbZpWyo
	kHTxXkZ7m3A+IUnO/cRMn6RX/V+xyfT+GCcsw
X-Gm-Gg: ASbGncu4s97n734Y4tZgbLG+waqHq22SN66j/KwQRkA98udlPhaCYMjztaiv6Bu0TSz
	akuwXS7gBtbiZ5FU6DLt1b2j0qJHCUINvjgY9IW0+xiY9OApvWQ6jAz8QPoWsBAGu1Usw2QY=
X-Google-Smtp-Source: AGHT+IHf9iq2n1PUU5HCWe9soaH4SFA9WbopYOlEastjkCTCAX4hoUJGTt7Zw2wOUBlbY2AJ3VKHXgQD1OrOSfhwXZM=
X-Received: by 2002:a2e:bc85:0:b0:2fb:cc0:2a05 with SMTP id
 38308e7fff4ca-3090ddd1604mr8206891fa.37.1739434457896; Thu, 13 Feb 2025
 00:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:13:41 -0800
X-Gm-Features: AWEUYZkG9pGG1E2hWQ62JNBsrZ94QFIvS7VdMRQU29qCe8Cm2dCEy_nhw7vZ3rE
Message-ID: <CAGETcx9E1MYgzd7Hupz8YAqk7-D1Aeb+AAyQiEMia-6hnFQTRQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: scmi: Switch to use machine_blocklist
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2025 at 11:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With machine_blocklist, the blocked machines will not have pinctrl scmi
> devices created. The fw_devlink will link consumer and supplier
> correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..f041478758b50e85d99214f4f=
e42208d0c8c808f 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl=
 *pmx,
>         return 0;
>  }
>
> -static const char * const scmi_pinctrl_blocklist[] =3D {
> -       "fsl,imx95",
> -       NULL
> -};
> -
>  static int scmi_pinctrl_probe(struct scmi_device *sdev)
>  {
>         int ret;
> @@ -521,9 +516,6 @@ static int scmi_pinctrl_probe(struct scmi_device *sde=
v)
>         if (!sdev->handle)
>                 return -EINVAL;
>
> -       if (of_machine_compatible_match(scmi_pinctrl_blocklist))
> -               return -ENODEV;
> -
>         handle =3D sdev->handle;
>
>         pinctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PIN=
CTRL, &ph);
> @@ -561,8 +553,13 @@ static int scmi_pinctrl_probe(struct scmi_device *sd=
ev)
>         return pinctrl_enable(pmx->pctldev);
>  }
>
> +static const char * const scmi_pinctrl_blocklist[] =3D {
> +       "fsl,imx95",
> +       NULL
> +};
> +
>  static const struct scmi_device_id scmi_id_table[] =3D {
> -       { SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> +       { SCMI_PROTOCOL_PINCTRL, "pinctrl", scmi_pinctrl_blocklist, NULL =
},
>         { }
>  };
>  MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>

Definite NACK to this. Please don't depend on indirect
conditions/flags. There's no guarantee that this check will hold true
in the future.

-Saravana
