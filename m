Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB091C84AB
	for <imx@lists.linux.dev>; Sat, 20 Dec 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766234817; cv=none; b=CCot0BUaCBPHFHP4CzAdMDYsQy+y4XrRotna7toDn4mNO/iGZPEU20z0y3Juzzcv+QPcNsNS1nJKMiiO+5yEb4d3sfQ1YC6JX+89cwWI96PeNmtawKZ4aG+g/VSV16slPAVlOrnB6v6A9Jql0rCJmbtuU5dNnDfb0Uy9M8qDn9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766234817; c=relaxed/simple;
	bh=BMqWG7tVLRpE0d5CCcucZYfHD30N453xL0DULNwoUjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiqbZ2rPprAA7vulJcWAFevLLDaZbnYdC2TtabLfwWB9fLR+JWBUax366uC6jGGr+bvAESzgGSfh6ckveaiJcZNAq6A76EIHGbH2gjYiJ3HTQ6xnVNYArkPjjgUoySqIaJQoa0x4T1kz+U8A7TuEHG4R90GQujlDDcjDNqPqNX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=nkiHhim1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nkiHhim1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a09d981507so18564455ad.1
        for <imx@lists.linux.dev>; Sat, 20 Dec 2025 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766234814; x=1766839614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
        b=nkiHhim1KVBfevHIgjSbpcz8m+zz9hr6XSaxSUfa9hFsUA7RYavTOwoOnriv0Il8cy
         5tM4AyEFQLkrMfBMbYPLS97Vt95FTQSx1HJeWPOjjmSRgG1ErdsFUy5VdUa0/UjXSdrQ
         rkcZbL4DAuPVRPcr0HhsxQZ8YaO5CDTKEwlPRgLBB1MJST3d58qOoxHzWtUDABPVEjqA
         LrtuCtpdw8nOpDhhVgMKyrcc7iHZgPw9FGctAEiV5M1Y92nTFb/X6JEJ270gedQuSDAY
         2jIH+Gh3V79SMdzYKPsp4pQypZcKA3OjNfdBKGoiyZDtr6dAwjCm7XFuBucYmLby26JO
         FgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766234814; x=1766839614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
        b=fH6NecYqKSMGbC6bOf7Du6iIRlUYJWURe9qCB9J1eBjbkCEbWp18WauD+V7LZSunWF
         9oFAvalOm1CG3+IrQT6FLMJZ2MkeRVrqM2kL5tIpwAEeZ3E+9BaLKxcp5fmWmfque09L
         h/Yv0eO6N9EEO41VeSyTiDqnBF50d51TkVX6Ft4m0GGcH9BYlqsxgcMvSqrciqLVMx5v
         1RR5J0Xp1wgCoGkc75ZbMNuRfTvq536h2thkW/JLOhnFy5zFUOzX6lAaPSr7FGYgG1+K
         fXoLS0GV7lrpXoWLiYPGzOXDNJybw6oMYj806ULhYZEYd0pVugfkVhx7+ihqkR13ByMP
         2aWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOchJ5t6hHeYurf0q904fGdZRwN5kTKoQxF5vD81jKIRUokLAQrmB5UZWCqITS3LpSK4k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3/sh8C8BEsZQNz7Q7yi69yuMfQX2fwaWLN+4eQIzVzElXkA6u
	c17ZKFOp0Lr1CbsPxniMcUmMCtGNyUmQGOAGWGniCgkBMHN/aAhkjCJDyEChY8KOS5TuDK7GA3A
	MYwEjDQ7/PJ37zfOTqd5REqkX8V/ro+M=
X-Gm-Gg: AY/fxX6CjaOwOiSQKCPtUspOexouH0A/+u/gloxrXqzZX/SbYdlPNQ4XIF86qjCYoGq
	hAenJFpm1Mlmbt9fD4L2nDPp4IrA+FMZN47hJf/gsn752KWBG74PG9VdbZquOtz5yjk+nN3Q8o1
	pNcu0AaPuCMI2dE8wf/6N1kWwgdd/T5kKGMFcL5FQ0bctVcwDaS0CZGG30KE2t7VBsU8htyw4LK
	d/bWTEPJ0DZVapdfm8J1eRp/pmImluIb5BeFk9kF3qV6wg2akBIr67nnH8SfiAJ1IAcYTL+VS/3
	JvkuN4pN72KhN0bL+s1lKWXrcX6EnaTrATL09V0=
X-Google-Smtp-Source: AGHT+IGTZVFXf6rAC1bEGZmO7YaQs0mj72/Bxua6dbMs1yZR8CidcfGRl/4LVrNe9mb+pBaCXI6UiiHmEjBYB9UahrA=
X-Received: by 2002:a17:903:198e:b0:2a0:99f7:67b4 with SMTP id
 d9443c01a7336-2a2f0cbc904mr55199135ad.8.1766234813931; Sat, 20 Dec 2025
 04:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com> <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Dec 2025 13:46:43 +0100
X-Gm-Features: AQt7F2qpxOToWQKPYlABMJwLqho0Xychdf9rQln23uKf9MMkpqj4U-v6YeXkrYo
Message-ID: <CAFBinCAXb87FKwA_=UEx5YTekevVUun1gieUfMux=oQAgjZS7w@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Fri, Dec 19, 2025 at 12:42=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
>  .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
>  .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
Amlogic SoCs have up to one power domain, so for the Amlogic part:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
