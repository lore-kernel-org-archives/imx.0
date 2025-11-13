Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592AB1FFC59
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041320; cv=none; b=VxgajFBruwsoObLBrA9dTy4YAycj7Zbwp0Wbyjef4F4u+ewCQwo1nLjEHSN/N2BLoP1op1zLJ0rHk4OzpZZyiE+6zkCxiOTuLtPKtl67Bwq+LFsfa23uqxOEuhYIezbfmyrCsMrQIfOVS/rXqwQ7ufjIEYA7bac5mkKl+X41gdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041320; c=relaxed/simple;
	bh=GLqncc5/5zGkwI1+bv2pb78gB9RyxcsUzYNiDGa3NKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdvNW8qMd7bBn4WL+W6daXDCSU1vn3WOrhhjGFbWkZ5VNbHgYhqlbiUQQGOJYbjt2wvGA0rZ3FgPKqtbrTEKZRo4FZTCZmCQL5U3miHZUHyTEQvEOKIJI/wERKzJkMi1kcRZMeuFFmf9s3LIw7GR+lSKrB19yWF1ph2ChNnnlOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q/eWlEY8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q/eWlEY8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59447ca49afso1055807e87.1
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041316; x=1763646116; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=Q/eWlEY8rYsnw6zJoL1IjUxFTiePCoGWS9fdZE7n2E+pQ40QqgwXbMq7pR4jxSKiJb
         TwJY9rilzEpErcuoy9BgSjXzumalTUiVkVQiHuXUKwLywLcJPgjeeW4g95RGiN0huZtw
         dS8icS3jV/8qivqFpblBrnL2tWJ6o5IaDsNol9NEOtGdicfNV3ngEQksQ75OgMFo/KTm
         stMb/m5SaU2ML68wyXnsQXp5+F9UjsD5o6P1NbgI/tRhOEnN0SPZ143Rqe0tpDNXMj1A
         Hzsbno1tB8KfSlIqOCuzdeqPXrANmkqL1i+uru2FyUYHjDVa4QgHjUuEj6MAUXUE0FxQ
         QPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041316; x=1763646116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=QaJ4dovOL0wvRz3VwPszd0jkt+pgcDuld0oixfCKJBMz65ETbI+R8+RkyRFLPm+CLo
         P4evgQwaLjSSZFvaosYMfe/jCyr6Hx+8cb5nCtW02kC9ELWdiyosedJpWTQwgTyeDlWy
         Bb+TIrnG7ZFhmN5lB6P4DsXFZjXqnjxOEvKDuTlYsfR/FCQQpWcyljQZ0614c49/DJpt
         BM2N6V4UcHKP4b51I4ZR8w1Gs4ecwBg37CXySWHurayNjpihIO8mpNKMLoWOKviMrd19
         7ouA5acexfaeJ/173zVnFpQs8DoVEwCSrz3EbuDqgbW9BFotvnN0/KPrAfNtxXg957NX
         o3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWZnVuHvfljp4QpGUVZB5HP3//lhpOMvJT7BWy2bU6eVuzf/mZCzkeiXtx/1d/efYn15ME=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfJL+g3K/uhvmaN3sFj1a8m4lUE3DiRgPNpsu2E9MiGYW7SJ3F
	O6DOUTv58SGBdRi/knhu2R/XVxa0NeNMvZYmI2EGrZz92gqdtWMrE6stWWFXomMETbzQt/gBo13
	492zTGRPShK6cw1GT1u+aEY4QT+Slh8m4XIT+ljV5xA==
X-Gm-Gg: ASbGncu0qBeKAqXJ2xi6sep/vOfKi1IZgdtrHg8C4+I3sd6yWzGBSHb6WwiExNcGgGt
	VR+1PmHfJg2enrbZpASEdcfQuNd1Vac4lmcnNu+GBCadtS8nUbfkx2qV32R6smys/CsHE5v0fZi
	hLQjEl+N6dnZx/7kT6cctI9jIo73oSpN3c/STZtYUSABGos3K9xyJSBZNM37zMksOuV0ReBclE1
	V99vs5MrpVLM0CDnfevlfSyDVPrI/Q67u/C+pkSPFKiLJXjI+Py21Uz/BeQ2ykA/FlEwZbBbDQ9
	RHvtrZVpkJAs/R28
X-Google-Smtp-Source: AGHT+IGgWlCG9kIv5RM7lpIk9LC7ddziZ8QniI5XBDNtHyHFdpWvdUKYxGgON08x+t3awJ+Cz4M6eIo1aCJcpUc2eyg=
X-Received: by 2002:a05:6512:3c8c:b0:594:2fde:a159 with SMTP id
 2adb3069b0e04-59576e552camr2521011e87.43.1763041316428; Thu, 13 Nov 2025
 05:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com> <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
In-Reply-To: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:41:44 +0100
X-Gm-Features: AWmQ_bk13TVZ2MEYPAt7pfoLg7e0lkaPcfsA9km-tpYIh11AXtLgw1MABlXNgK4
Message-ID: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
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

On Thu, Nov 13, 2025 at 2:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> > On Fri, Nov 7, 2025 at 11:49=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> In order to drop the dependency on CONFIG_OF, convert all device prop=
erty
> >>> getters from OF-specific to generic device properties and stop pullin=
g
> >>> in any linux/of.h symbols.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> -     if (of_property_read_bool(np, "snps,tso"))
> >>> +     if (device_property_present(dev, "snps,tso"))
> >>
> >> This is a change in behavior - "snps,tso =3D <0>" would have previousl=
y
> >> returned false, it now returns true
> >>
> >
> > This property is a boolean flag, it cannot have a value.
>
> Every DT property may have a value, so this is not as obvious as we'd
> like it to be (IIUC - unless that changed recently)
>

That's new to me. I thought that if a property is a
/schemas/types.yaml#/definitions/flag then only its boolean form is
allowed. The fact that the dtc can compile it with a value doesn't
matter as the bindings are the higher authority for DT sources?

I don't mind changing it to device_property_read_bool() but I'm not
sure if we really should.

Bartosz
