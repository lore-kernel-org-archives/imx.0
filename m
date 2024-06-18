Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C8213D888
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706372; cv=none; b=TLIKnWTVnnI/gVRw4lqwI4CRnBkRbnvNn9+eN2XWm/k6oYi/AlgcwiP589MoZyK21/9vkbqHYFhpngHrcgL+6eZUOm5PoYz7OvUxrG8pldh54MaCuwgx9YUzWiDqju+3SZaZYqAkTIQaU23wJsbsJiCXXUoUmq3pA0p/gjMwSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706372; c=relaxed/simple;
	bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs1nR7d81FiguPoykeblEQ1ijWRpJMS/io66s28WEgQtjih5SrzlGgB69pqmYmCIEiGaECOStif5q3+u2CoVmzYKAOo6ot9xNbVVlej1a9XONzcF3SaAcTu31p/NJi+d/o6LToii3dYiAyUrjoQlOK8RHnnjVpTD1ExfCFVtxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0485SaG; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0485SaG"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebdfe26217so49724081fa.2
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706369; x=1719311169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=A0485SaGxcozhY7Hps6Gnek4WDlQGySjiF17j85FwtFpy/CzqcmChLCye9XT+aRCbK
         dFpYkFezYe5nsiOnUmMEp4St6xLSe3C6cQ0a9O9YgVc/4ZKN6xYR9Y5/zSJbMaJLyu//
         7+u4RlWy987QQ98o627XS7mJSHPXPy5XU1FQbJpSTN4pxkbF25u9esSO3u3cvYA8NG3o
         Knpjc8WXJc7OSzqecDfpkIVX21jZYUQiDDXoonUGS6tcbWEo0mHAc14EGinwiGntpazz
         8ianoYS+yaUWb4ZCuhPgbI8tA1BS4nkK1lE5b8A6gLnjljSxwQJa9DMo+LaNIn9uK/bk
         a2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706369; x=1719311169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=heUXaQSTN7+oRhRKkKDgnngek8zbyPB6UifPKbffOyS07VSBOIran2jZWLizDwvIXR
         3Xxbv8XkCxEX18A6FdwU3NYlv1TqrXsyOpRJxu8iQxe+gjf92NBjA2h6L0LQ1+X8z+7g
         DWvYVVCHao83T20P3xcrLuE7S4cZnQlLAVXorfPInI+EmQsxSxWYmIwO/8Xf+xKkEGaW
         XqAvN7so9GgaVAQCgnmE5usgTJT0fXun0kT/lR4Kc+w9fbKexnIa8gG8Dpi+xy8/vfV2
         hOcY4IvrqATHtwnY0XpVrqg05OkHaztqI933MgndmCqfwZrNeBtvIIG29ZJarsyFl2V5
         OtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCtHG+kxG796YmKlgEJ6SisbOt4u6JB7FPS/nXtQRp9Jhdzjk+oG8JeiAbh2Yt1BbyHJ2EZblqq9JANVzIZJCrXidE
X-Gm-Message-State: AOJu0YxpTeUTivuHt5StlcoLsMQo370PmcJmN5B+KsaxWL8Q1B93HdSB
	p69TfIQuTk3ZoaCUI55dycxsmSBogZ1IR9sA78hSyTY4H6wjOjyZU4dl7PD3kfxeEjqHheo2E5q
	dqbC81UVXZdbBBkHra9wFHssASjgPjesyggP57A==
X-Google-Smtp-Source: AGHT+IFVnhzqBoiu9GboooE5iY1zi/XLlllZteuuassl+ZmbxgbyJsQPD3pk6oFTjF6bKUOXQjAi+8CRlASoDk+Kx6o=
X-Received: by 2002:a19:6912:0:b0:52c:99c9:bef6 with SMTP id
 2adb3069b0e04-52ca6e5639fmr6700866e87.7.1718706369027; Tue, 18 Jun 2024
 03:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:25:57 +0200
Message-ID: <CACRpkdZdjL7Z7qY5MTtZZRKQBLWHPKoHKKyoy56mKzZfu=WfPA@mail.gmail.com>
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 7:51=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:

> With ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx=
8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mt=
k-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/mes=
on-clk-measure.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
