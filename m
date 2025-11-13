Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9728350A2F
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039943; cv=none; b=EUxr6FBTq+oyudH1QWzGcrOq6BFww8z/+3zOY9sEaP9kA5iIWLSamfWsQpYwSUuIDikalt/fIBXNoaqZPnQtU0TpAc2k5LakBsHsrLuobH+MsTX2xhcP4u9fXZsSn7aMYram9/GRuSDQ643qlxFzM7XHSaJc2s1H5Hg7cE+YXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039943; c=relaxed/simple;
	bh=dZ2FevfKGBfSlzInaPvMVB0Ytsg/HnbfQojoImKv34o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiwybQRc+O3t13QG1YRDDFlCc8t3woHX6uWgxHKd9WzveHgAySnuPgFSYB7eiXzP/6B7/ZwVggRdSMKiBsyR/FZdjcb6ybL5/5UpmdEqEISDy4YfWwfsZ8vRU1OMRLYE1y7dJEOrUIZeNHWRw7ZkyXjKXML5DFkX5ywHRaQQJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v9zBt0DF; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v9zBt0DF"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-594476f218fso603917e87.1
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763039940; x=1763644740; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=v9zBt0DFAclk9Tc+/X75SAxmihIQKM/XRwTR8ZSaljAUcQ7/Hq6PMijpmJ7XHGrv/z
         UUAkT2lx9d8pgGNX2rbRnTrjtDRZw8cmsBK1Qa+Y2H2xZPIs9umaS4I8RCzgnBJ/GB2g
         /mco+ICOwWl9jlzEnJcWMNVY1F+ZBwQ6byaKAnHtBFvufrxZbo4nHTMWekmIPjYEkyHz
         /FZB1MW1+wMGGAA+yTx9TbrYf/n6EX8Dlh6SDlomZI03f33SiLkIZikVv4h+9VrsuujZ
         mm426wrU293PpU9JTaOFJIjYLPeTE4WqToKSGqrY8M4WLJ0Y6lX83zaUBcRExA9HH/F1
         gQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039940; x=1763644740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=DGrJe8Jhw2d3C82HtiMR+O8ZI53sztfRXe6JBRFhX2HLYPq1R9H7Wd/EFqM1W3dP3M
         /GYi6zbh3uKmbxvSr+ZVMi7fzKFW2HPro00kTFFEJVywu/LQEkqoyyPqXUM/R44YtWT/
         IetQaxWI+AzdXYjH2nRNW7VjHLSvDkzx75ELNXYgWeg/pfNA6NyKnLdoxNCZQquZIHbt
         kUa9wUdSvKaj5cEIXAFuaQjluZf+y+TYAOGo4ob7bWS1A9GFFo1skGmLGDoldiyuGKiH
         ZNSt0JgtO21ctov8fOn4w9s+CD91F2sq7MOQz9DcCFuC4wvND3SnmxwlVZoERHgXqRfP
         Tbcg==
X-Forwarded-Encrypted: i=1; AJvYcCWghlFT/z3CbzVJ3+rpYMhd99BnBtPrW6sjKicmubw+304ogNkxFRYwt6jonKWozS0md4E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws2AXtnWBZ70MeQRc7KHs6hhaonFkug9RVS+edxeZh8wEN28cj
	2hvHTOPhZKw7kQoP9gKV9Gdq+oJ+cE1hQXPC/O+HwT8+tydEjnxXyHIZvbavtaGrknaL2GYW1i/
	ZEyu8lV1tGswhiAiD6yZO3ueAmecjVdyihVkgb8fynQ==
X-Gm-Gg: ASbGncs21zGM52PynXzShFZJKhX0g99Os8MrdHAK3YW8iyEwJCM3Hr7Hqb6Mz5I+iUN
	8yroqRySlVvoMMiA5+JrNAlA99Zd97zpfqaC1t46hc+h49TXpzzqKOQW6GIXOv1neQ+yBXzqZyN
	fudJA5oxbTCi/hQmJtsj/crhTpP9ac+jIzsxuyoa5Jgcb/yf6FU1pT00iB8ID67/RlsTQ9zJ76L
	ZqJRwXxE1APyYhgzgtbQae2sIH/3zZel6defx2ZS9btWkCnw260fhzpiViBUHmdwsaAc1N2eVLs
	rLfh0LXkyFd53WmX
X-Google-Smtp-Source: AGHT+IHeVzTuj43c2XKQpZBw2ErEf3YOWTRFAtQ1vaZEEtKBTkEs3tR1Hd50SIgH+QjYllZZcXodcrSS9KZ8vRhrh3k=
X-Received: by 2002:a05:6512:3152:b0:595:7b24:d36e with SMTP id
 2adb3069b0e04-5957b24d58cmr1396653e87.7.1763039939830; Thu, 13 Nov 2025
 05:18:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
In-Reply-To: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:18:48 +0100
X-Gm-Features: AWmQ_bkdL6yYgjauNyydNchJ2jLFj9s46UQ7WB4-Hc5rFElcxZ0Jmq78mNjUwDc
Message-ID: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 11:49=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to drop the dependency on CONFIG_OF, convert all device proper=
ty
> > getters from OF-specific to generic device properties and stop pulling
> > in any linux/of.h symbols.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> > -     if (of_property_read_bool(np, "snps,tso"))
> > +     if (device_property_present(dev, "snps,tso"))
>
> This is a change in behavior - "snps,tso =3D <0>" would have previously
> returned false, it now returns true
>

This property is a boolean flag, it cannot have a value.

Bartosz

> although it seems like it's the plat driver clunkily working around
> not including the common compatible and inlining parts of the common
> probe functions..
>
> Konrad
>
