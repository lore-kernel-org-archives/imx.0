Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F92F28E3
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766136913; cv=none; b=hgUsOqOQM5/gBWT6Yqq+lLbnkyjkgxIfJoSkmCeo3b3gzHODQ43VHfIhIOAJdtpLAO4aZPu0CJ/UtYI3DzZKuAm/aj7BsxZXRXRRThbcCNWVVaXjTSStmufyr2MD1fJ9xWPisu6u8a5amg6ZTaNLpaKacWkPVpRmXwwQnZKVvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766136913; c=relaxed/simple;
	bh=SMRBcCua4y3J4lVx40nefBHxatUhXaC6HcG+AbQljBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIR2ddXv1aqehIHEQC3K/Nk+G5UpZflwjAQz/AJEEb7HU2oEpadxmLUZuUB+ahIcb8Os8AIYYuxJ6VtdOZM0UedmE0CyLNKD404eSdJXQcvKTU3j9RO7+DraXgmWMu66jjssOOfS1Ti1XVUrTJVyrq+0wyOXdZaLKemPNhyxikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWleGNXt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWleGNXt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0b4320665so23703515ad.1
        for <imx@lists.linux.dev>; Fri, 19 Dec 2025 01:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136910; x=1766741710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyAGCUlm+brXr7pmh+HChqf8cAz1yyIjxqldlF7yhcs=;
        b=VWleGNXt5ZpWZFR1UldHPyZ/SCfUYGCT3fqxLJHaTQ54SmG7OQoTc7zCTcZcHxv68S
         4XktF31po9QQkykt8rsiRD+PVr/lXTH1Iee8NeDlvm8RmdC+TX/wzDYT7YP/QFcCwdwP
         /HcaN79y+jaIqw0GeOw7XQqX7Gm0f91OluAJslg4hNfkb8kd6po9DjgS6tlk2pGAJQQO
         jFEZK25J9fkDvGdgolJtAxKAJIJ62f4M0owlG+Fti5FwyERkWUCR4rBrVHfha74Pp/kx
         bc5tzlsK4qv92+5gSkqOV+//2ZLlU/490cqdgQzbBlpLQLdR2KqqhyfmZ6xARUgoOOpQ
         PMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136910; x=1766741710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyAGCUlm+brXr7pmh+HChqf8cAz1yyIjxqldlF7yhcs=;
        b=l5jQqXWa/0f80c6wWQu00KiyNN39NsIWeWIi2SZDz9C5SnKl/8XKZn+qpUch4BY98m
         0QvgSZxo1lzkK3HT14iTkba8lnsXRc9bCPnhLUzYAlpLQs9ePJ4h9mtL37jJL8Ybls/U
         apfUAoZ7DQjgWxt21USySCy1fVKReaobyOUVcQUMSM40CF7PemKIfHAHfYgJHlTB+w7d
         6+iBC/Ve/Xcwo6KQMSSXtcvL8DsgCXpr5cYBM2tr1cS25dynuHStEfNUCyAkyx+pd1pO
         gRs/RbPR056ub1zHv5lv9ohXe6eCY08Z2EyUig2r1rR4lnQtEOh9ijon2NQprPwI9aSE
         /2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW6bjwVejo+XKS7tOl7g68e75UfynGqQ1YkK+LQerpYU7t3HHlWeYuuErg83hp0BeMWa8E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5itfPm0NvXKPuMnb2ULmM7jCi5BGaMksLMD7z/FbfqXH9dN6u
	+Zzu7wsFZFbDiGzZqVgR5bvJoYAHR/eChLUxnZc7K7zD0fRACDV9qV7I9qVCu9+BdC43Y6mE3Rz
	FhTOEencATrQSvpNkSXMnVt5e8dQJ4Oo=
X-Gm-Gg: AY/fxX4JpyONNda8Q/5KCfDJFJvvrTbG+ZF8zV1pQ4/37m0C28p8+TOyBGDYfRYhvjx
	20DodPDT5s5icU0BW5R4x8H+Q1Ki7iXOXv8DjwskE1h9jOA2RbQOFCP5AUfADrHRh2sdRMCgbv6
	KDWcuf3XbzcSPLqRE+MFol3NIEfonXfADx4kOQcU9PAgV4vdljy76aoa4G4s2Otgpkp6WwaQFc5
	heP3RAZojDe/6yCah8V92ftM6LD6jHifZ9D+wkiTKgWXEaYg0RTC6yJ49piQGSXKcSCjOyjt3Ou
	FHJkWwVegGqo5ouGmB7xve3xxM8G8nLm0YAbadvZUnmAMnDaONWV51oOOL9F6/blisQrdyiWF5k
	rkAIr1h4hlQ==
X-Google-Smtp-Source: AGHT+IEC+GRfBHy/wKtqpZsBBkP6Qw8fpQs3utuiawRsmustP1cLTt5mwJXD98PkDBYzd2Voi6o2nfAACcKqpL0sZnw=
X-Received: by 2002:a05:7022:2586:b0:119:e56c:18a7 with SMTP id
 a92af1059eb24-121722b4e90mr2430820c88.15.1766136910154; Fri, 19 Dec 2025
 01:35:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219075447.3672833-1-xu.yang_2@nxp.com>
In-Reply-To: <20251219075447.3672833-1-xu.yang_2@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Dec 2025 11:34:56 +0200
X-Gm-Features: AQt7F2qZpM6npqbvUvhl8gYuuDP4SgIr_o7BiZ-Bvy86V9dJT-iXFljB710VpjI
Message-ID: <CAEnQRZCZJnkXCM2ACf3dXQ-ZynRB1q2zcarWLAZO_1TsL-1GcA@mail.gmail.com>
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: add debugfs to access control register
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 9:56=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. While access to these registers is not required
> for normal PHY operation, this interface enables you to access
> some of the PHY=E2=80=99s diagnostic features during normal operation or
> to override some basic PHY control signals.
>
> 3 debugfs files are created to read and write control registers,
> all use hexadecimal format:
> ctrl_reg_base: the register offset to write, or the start offset
>                to read.
> ctrl_reg_count: how many continuous registers to be read.
> ctrl_reg_value: read to show the continuous registers value from
>                 the offset in ctrl_reg_base, to ctrl_reg_base
>                 + ctrl_reg_count - 1, one line for one register.
>                 when write, override the register at ctrl_reg_base,
>                 one time can only change one 16bits register.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 221 ++++++++++++++++++++-
>  1 file changed, 220 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index ad8a55012e42..cb2392008ad2 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright (c) 2017-2025 NXP. */

While you are at it can you remove the (c). New policy
from NXP is to use directly:

Copyright 2017-2025 NXP.

thanks,
Daniel.
