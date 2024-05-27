Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CC15ECE6
	for <imx@lists.linux.dev>; Mon, 27 May 2024 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814669; cv=none; b=LKLUe5XMknKaJGqr8vGV3MULOL52UqYNWF24y/big7L8Jej2LFQEh9fa7rrdBfeoIzrEmNCFBfEd5DGl3aEOWHT9/sLi3nnfItc6bHICKi7w/V/bvUf4LMZmqltRaAh8mj2IvyQWkNRngnhG3ZSmBqEyXDy3IaD1QqzEzG6Mtl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814669; c=relaxed/simple;
	bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FY/G3jAcvQz0ZP3G5+iqSURSD1e0C8dyld7+En8XQWjXyymZrssmmZyUvujTyCx/nWcGu1zuYjqHJtRXw2WWWqWv3Qek1ejX8FIyCT8JBBMqeZSriRgPEo4CfnJYppnR29sJO1oJK9Oq2KRJ9KvAxhtbIL4HIYhc2cufJwuXyys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gk+jur9Y; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gk+jur9Y"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df4e5b89e49so5153613276.0
        for <imx@lists.linux.dev>; Mon, 27 May 2024 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716814666; x=1717419466; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
        b=Gk+jur9Yhve/bmZbO1wBMZg26rB01Kg4ngpLxYvGGFa3vub/8i/bNpZ7FzhesCkl2D
         szCTkcGox240iDJ+EVXkv4LnhIUcGTZutvb1i4fwWXKMwLiUDSp959LM6+/y7dBjKegU
         RDeRVFNZCqBmileDegRpRzQtFLIP55883SSky3a4Ovk9c2d8dW1vglTPrwdMLO4dTdyU
         /C46emKG3UajdOStd2MSypW/589MIIMmmi9SdaZGTv3fbNZAhg+pdzBR3627Oz1nkrj6
         nkIH9Dsw+l1D+B73TB73R01X+pehu+OFa+9k73Su7Av6bx+UKYkHm6nuMO5jdX8gbBeS
         Ticw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814666; x=1717419466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNZ98tycbIm8gHCECF6fFAUqvVWA7Py4cjGRVlBtUzM=;
        b=tm+9DxTh/B9zHsunNOkTMYSy2hmfSpO92QHQDxeAdjGhcZqC9cSiXorWUI3tmcXpVw
         F8Zy6iKPKoe9GfHBFdy9fGn7IW+h8eD2t6FN7fTl/A6txvVz9xe591aCj+2pgoG5lY6f
         YgzOyLIzgfZe/Q7GEhuJzwL73G+awxEI8VgJYJsZ8O4WfKyTcilRtsiKwWC5QeuQUYFj
         cKrq+jTpuGMtpCWMdccocHaE8So2I3heF4HYIVVZNKG2vP8x1UQnja3ugd0t58GsO5aY
         wYJPJPDjPDYX29+7yzL1Ha6X449d0Vi2pofal2kK4u1avRTeg+ZXPLF6HwWzNUQT6uie
         VoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7unswViFL5e/en/9LyZP/x5w/LS/V2aw0sM0h73aZi1AlUR1Zp+PTtt97PvUz03rj9oJ8F1L0TsqX5CEa0kFkyCC+
X-Gm-Message-State: AOJu0YzcKIsIiz/ZvhHDCLlykV9Y2qAaq8cDIBwCn80rIHcbj7buObNj
	rjy4M3FbB1pjoAgUe/Zu/2NOdANIHMIUEkytj9kt3i6SrJ+2W72IV/tRWymSpekS14DNMlXj0Ba
	GlBtz4qqStjRv1mdoTzkeIKjoVBuf5jZjhAIZrw==
X-Google-Smtp-Source: AGHT+IGPHGbdeDgQwNEq4mWXFwTqV0k8iDBOK2TyTZ4utk5viKokv4dr91DnLp+C01zzJZrl1Jzg3NthvUqaC/NhrDk=
X-Received: by 2002:a05:6902:70a:b0:df7:9946:b32c with SMTP id
 3f1490d57ef6-df79946bc95mr6983978276.29.1716814666366; Mon, 27 May 2024
 05:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:57:35 +0200
Message-ID: <CACRpkdbt0kE6VP3O+63U1rmJ_JKRvWENCnETT4f+mvNMMphLeA@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] pinctrl: st: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij
