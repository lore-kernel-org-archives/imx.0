Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD332F4A
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764020; cv=none; b=glU31PhD6C9Hva/mWZZRk/3hOVelhLRdLRJjy6+r0pmTt0x95QZ7Y2QnzOCUqGbm4TAL32J4zQFP3Wb70IYuZObNJYOgdGEghqpubm5L+SmbmwMTPqVNjL62y5qhcwDEkDghknYVfFAKX7coXOUollKkaUoJyX+yIj8/M+WFI1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764020; c=relaxed/simple;
	bh=5YQOUvbEt34uyiKkVZzozlI3idOMYzV0MqYkXRUemhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfaFuty2cYQGTJafm2hl80Jv/377+6EtrWIiaXVaR7XT3KtLiZeVgQwEve9kVhKpvq1+iWV8RAOB/dkrseVcIimYbwzZcdpBBHmkMo8Y+vmkFz2X7eUOQIlF/Qw2vVLYGbTQiDXOaQEBohQcpkUKavhd98IRA7jn+Mc5TBXqHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2WuI4rM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2WuI4rM"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78fb04cso95637366b.1
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755764017; x=1756368817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YQOUvbEt34uyiKkVZzozlI3idOMYzV0MqYkXRUemhU=;
        b=f2WuI4rMjqax16P0A4NGi9ILnnMv+pL33Jt7Pj08aYgxvVnIhc/dlNIASEBZoVPW+t
         N9TTukACu1kGhxZ4AmOH0TIprfyfxaBmoHoyET1wo7NptJFwVbyX0c35TKYpqcjwhbJO
         f4fhgR9xvDzHgXm6ptku7R2EHPfbWEg7BxeX5yGq0mEyIMHH32m9JX+CaAY37ZmIjKWM
         9AuYo3N2SGAezPr7bVaz4v60uG/PUDcVA7tnIqslrtD1+o872LHzLGq+mPjXoZ6L7iVl
         CZK8PTHuHs8gNaGDZ0n5X4XAMu08UljD7jMfxYKv/pTBeRKykMVzBSOd7/zOIvXovEzI
         xZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764017; x=1756368817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YQOUvbEt34uyiKkVZzozlI3idOMYzV0MqYkXRUemhU=;
        b=My2uMKwfprwyiEvV8lx853KWpuqGL0lvBnJ3RLXkwNJNOcX13/kZogeaw3r5u1yXmj
         lobX2qfCohDSeDEC1/p7wv1Sf9BIPsiDkI5cMRo4QrY20mCFjhlziSM00Fe1h+hWjncs
         o5uyZ9bhesPMhGQzVjY1CDl5oIbI4sGI/8I9ClaNTlIgwNoFROos+k9eHndtyPxsS8MB
         FvUv9w2Q6vLk8P8nyui7MUcDZcJd5Z4BJUIoedI9LOAaK6powsFEwH1DZPyJFrInHEEX
         2QeEOylfQQ36hE9mWT9oToG2fbbDgcA8KrctzihDte+W65c7xjIspVn//iuHPkudS1bR
         JQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa9E9X5lTUidBDsUq7qSU2SWdi4iYJluwIsGazIYipz6zCxGUvucHES1dKH3756nbkIiI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPXb6klGxM8MAz0zUFU33kPZrxPDArlaqoTuU9zMtqCSLNMxFg
	0t12FU8KBlymjfQ6hihqlA6JsdIiObJzct76CAoVTZXpWD1cfg9ElcCRIdGFfuhU+0XvtCojfhK
	Vvy+CsPr8TV3J7Dnis3uOL+IAwdAo3SI=
X-Gm-Gg: ASbGnctB7Hw8o3KiCNwOu8i2Kx0bbG40pkqXl1lLVHO5vfazkjouGs3h9C9GlalWfrj
	dv9VDfbl8U7emYIMJInOr82144oeHNB3gAiwE+riVCzLVPLyWRVYPx1fubqXCM1EpYu2w8n1ZEo
	4ayp/EL0/mHU8LXPGsYHTimraarwfLOH0D+Q1CIrcVn5OkInG1zCucSpK7oSC43R1yWgV7b4PSz
	ARH0wv2tA==
X-Google-Smtp-Source: AGHT+IFBkMJTJYVwPqZUeM9AOOBtno84DfZL+tzYeh7BxO7r/uMPS8lWfXyVKwlrLDHM43Lcm3OKmlg0we9DQAH7T1k=
X-Received: by 2002:a17:907:d09:b0:af9:6bfb:58b7 with SMTP id
 a640c23a62f3a-afe0799eae2mr151798166b.5.1755764017455; Thu, 21 Aug 2025
 01:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com>
In-Reply-To: <20250821080723.525379-1-zhao.xichao@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 11:13:00 +0300
X-Gm-Features: Ac12FXxWcK6_xcvA9PkQqtCffXDbzCkBD6UYFwXVnTmPqIsWYmsRzpdWdDZcCe4
Message-ID: <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Crt Mori <cmo@melexis.com>, Per-Daniel Olsson <perdaniel.olsson@axis.com>, 
	Waqar Hameed <waqar.hameed@axis.com>, Yasin Lee <yasin.lee.x@gmail.com>, 
	Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 11:07=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.com>=
 wrote:
>
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.

when the error

> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.

In favour of this series,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
(yes, I indeed looked at all patches in this one :-)

--=20
With Best Regards,
Andy Shevchenko
