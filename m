Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52D15E5C4
	for <imx@lists.linux.dev>; Mon, 27 May 2024 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814433; cv=none; b=FhXDXvh544LdzApcSXCuJCFTL72njysL0l7q/4QV2DhLZ6NnKVhidu+9sVJOFTZ5MX53K6tTSyavFFpjJs/rJDUqnVm5RWk8LsR9n/j6XQFonNNH2161YPiwkdnuhU6f8rGMEVw8ylzLXwfcKNyJUDWSsi5/zKmJj0yz4T4cSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814433; c=relaxed/simple;
	bh=kRzIkfk9aA6AIARat06tGUsnw6dX00qMxa9B4WK7jyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyYKiFNkPW7rP3az3/GxI/EpBn3oysKn9aVu4ooQg7C4wDXfPoPPOq1yJHsvhGHw8QhRQzxRJEXEZMHFFhfwNGZFN40L8XavX1/XXj2f6ixA8Q60sDdbl9nW4IgZvYkg+X71DXpnkxMek8FWhFAhWkMmbrO5IhfYa/quLXFW5tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCF+rL7l; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCF+rL7l"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-df771db8b24so3076886276.3
        for <imx@lists.linux.dev>; Mon, 27 May 2024 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814431; x=1717419231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n38xc1OaRNv1MJQDIDghtRWtDAZeB5O1XOyPBUpnu/Y=;
        b=PCF+rL7ltMnyYfA4FlYzHktjLEIhPxg55B91zfleh7AJWo/+a/NPHCgL37cU754sZ0
         QJto3zGUi3PHpB6dzHtyI/ynPOj4J22Jc12mmdGDstTNmvI39gixluOuGQq8RqOnmdir
         vmXA6vFgu0i0tiIfwEvBsvKxZ4agzESa1mYvgEi+dz7vktkkJ51DTO/3XgJFpLJ0hL4O
         IBFpWAV5TL47+gSfYZyk7RaGtcIvxE2EfntpKR4c8vXzBlYu3K41TJKJz1smLzIhJWaW
         kb4vd4zhaC1Wpq0jxKlG/+JVcogVVxjZ6UuIbmZhFeaMi8AZvQbLcmi2Zo836GBfsBqF
         GfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814431; x=1717419231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n38xc1OaRNv1MJQDIDghtRWtDAZeB5O1XOyPBUpnu/Y=;
        b=vwapqUwp9kNNb7K48bJIuPpU2Pc8XC/jnES6O/iCWGzK4hJzMbujsfVlcLbODEW7ku
         PQjJwtQmOdupkDVZiClkHKf2248NJmpendHbSbTNXRZ9M9rf9vy/dtGUoyhE79DGq8ft
         nOVtrVA7lYTJM3l+JQccuJEvraJEYTA2FIk5O1RgkGDG681s89PJAbK4n03PaQpOBFof
         AmaeYHbjslmuuQBK6mmaZjSE1BFjxcBOTIg8opMNdDxVlxYkSJa3OZStB8EiSGklVzZr
         vrozQylQBqvfD1cAICWfV6mZZauUErpAK3/RevPtbBLVxW241Iyo6qIlTjrqtkXDOE8A
         ihhA==
X-Forwarded-Encrypted: i=1; AJvYcCWmCTctqKUlO4Wz1ZJzt0onQlUXYOY4kxAT8pKU5pxy4tRbUpY+GmJfE+eBh+me2iA5vbpAHLsxBXW6F258Taj1jJBS
X-Gm-Message-State: AOJu0Yy8rtZ5G0GjBFOwSinZErVtL4FO1ywHqsvMtL1CotZyBDQAOBHz
	fG/jroZSJ4Cfu+VXJKZv4yMliZQINsrD7Oxb2H977gQ70ePSI8Jy6B8h4tSm6UVClUnba0ZN5ha
	0cih6JLrYnFKhp2a1/T8NpRA0sWD29kJx1zvSaQ==
X-Google-Smtp-Source: AGHT+IFzU18N+mOTSmGUX+D8nV9CprtXNPZ2YG3J4xB1E5yVmFBi3UzDUGrPZaFYiDw2nCnS3zR2JAFmDI/T6iCD3W0=
X-Received: by 2002:a25:ad50:0:b0:df7:887b:abfb with SMTP id
 3f1490d57ef6-df7887bb0f3mr6066354276.15.1716814430908; Mon, 27 May 2024
 05:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com> <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-3-9a1175d735fd@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:53:40 +0200
Message-ID: <CACRpkdanc3gJ7_z+V5zwKbn+L-Qy1+nwsPLCSF9ZQ_xk3qJOXA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: imx: support SCMI pinctrl protocol for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 8:17=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> +static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                          struct device_node *np,
> +                                          struct pinctrl_map **map,
> +                                          unsigned int *num_maps)
(...)
> +static int pinctrl_scmi_imx_pinconf_set(struct pinctrl_dev *pctldev,
> +                                       unsigned int pin,
> +                                       unsigned long *configs,
> +                                       unsigned int num_configs)

The code in these functions look suspiciously similar to same code
in pinctrl-imx.c, I bet it is copy/pase/modify.

Can you look a second time if it is possible to share code between the
drivers?

It's not super much code, I'm mostly worried about bugs having to be
fixed in two places.

What is the opinion of the othe i.MX pinctrl maintainers?

Yours,
Linus Walleij
