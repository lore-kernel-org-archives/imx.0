Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5E0212548
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740162; cv=none; b=VCCXkOG0JX6UYG39YHCWP4cvJCrjP4m8swvsFBcPAOynVExrA4/tN1U048U82rIcv66OiCzfqrkkuXz55eCaXbd0Icm60d1Tp2cU9xUwtF5puARONsMSV1P7pIIDEkAVytnZUjsquOeE04x/3jzQJUmuA2RhCEVYqekxvS1SFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740162; c=relaxed/simple;
	bh=zqrAv4ptgcQDDabtUqrMSNTpUU2PxpRKSgX2iLRPyeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwaEtChwc76FmUuI/wDDeQMxomcgHLiHw09UIt6nZpD78a4n3K3R3tmXDW4mvv7lBSReg18wRSKzX+z7xthfOhC7slk/3v12q+l0ZBM9SX/L0mCBxFELZOUqCG8h157lFHATqGIFUtoXcoft3P481sjzQDjtO9e3JPjOsb9iFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rohGWZwx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rohGWZwx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4924593f45dso43704755e9.1
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740158; x=1783344958; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=rohGWZwxrWYYpDR9u1pxhEDp16zmJjtUk3bcAB0obxbIP0ymvSj319cO09s4gOeFTw
         Ru8VzkvccjQsfUOQ6541WxVVnr3p6v8WgH+Lbz2BozAO/G0rC5Fbwo4sbsGQvxJrbHum
         EpMqxW3k0MViw8GfyNqklVulgxpnthagvyot66AVI6S4SJfFqGI5rsRIxsL6kjQ6CRUz
         2jl0xcajWz0QoiRZPr9XTQFMtUeLtK6LqxpOFWMlXAsOgQFWgDULUjypsj2QniAFhxAf
         v35xT9UZdYXw2M2YoUEUmrmZy/iWrqAyL0rGrqc2oHfaHOJeJPdtl0g/B2MonbhVE2F/
         4N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740158; x=1783344958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBM+1nAZz4BwsUG4gfSKzLFy6PeoM2OFZ8wfEYkLDpg=;
        b=Hb16LIV88s2MTL/w+1nLtDBR+EimZ0vS6+bbrS0Qp+EuxrIL9hCJJy1XU2ZetUE/C5
         y9zaibClsM5wHOab/hIBSNuSGs23tO5QryXILUorwmWRYiUaxdluTuYigyhoI+w+1kzt
         2ylNw4vXX39o35DmaLgdRrBxBV9w1s2svJ/ba8PiTd2xRF2Q9amfRucgyAG+LiXH2YpM
         ocgsXlfziCUg5+e8cD0fxRVY475R8v48d8I948hFebcNDDUWOT/wMI7mIXyeSGKLVZNP
         NFVsngfGGO9Tumds/ZDsW8/JecZnDi9XPDvaa4p68EtwUU5TwucfYQAcgMMYwvLpG2qt
         6o9w==
X-Forwarded-Encrypted: i=1; AFNElJ//1cEaH1NP2NKYIPrPRPLY6Xk8CXciJYouIatK35Nuf3fZawas33PcZGqqSZqFan39Brs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbJrgj23wtsw8s/2+7U1k7mcpw78vSMKQjV7U4WYzxRgCYkYNW
	eE7ziwdX0Pa706UtuFB5OuWBANqsQLWK/+b3B4h8DWTmCi8jKAkOr2VE
X-Gm-Gg: AfdE7cmycPzCzJuF3I4k9FzJj4ncWikhg8VOwSgyQHvnhgw+OtcN9nhKyRaBwmaFL3j
	sQGM/cWwboITjOivAlo6QCfciSrJYV0TudrZ0/9v1TNCuX8dWOQNyJ14LX9OrJz7zLPTdSMZm7E
	RWuOaJcgHpj28hH4wJ/YHJDjnEEK0jxRW3mwt2QY7wgXyX5VDkMP6hF+TBmVXJxmKgvwFEF3zkY
	paw9MqiXaScF4RvF7SHp8THAGikJEMKjLF1wsZurh7GfeoWz4AghEvDO4IQzVw5b9z+70XY4QKT
	FVQMglHF3NNKFHYvH2XHbePsX7q2WXbnauu4VZBieMpk9YHCdM07HBCqT28HJf5FWiGUOQuQJ+A
	5zYRKtjpHHR+7ZslMXHzfOSXkxSGNEqYux+fZu6mwTDmqWGLTrYU7PCEG81GA4N08+QLExQsY1p
	ORol8F1PqKI9dhopBSyOThPeTdAG82JK0Av7jZeTdR6rpnVexNOdXGjFVJYEgcREb8SxcZux6cg
	ifYEtYL
X-Received: by 2002:a05:600c:524e:b0:493:b2c1:b302 with SMTP id 5b1f17b1804b1-493b2c1b445mr34652035e9.16.1782740157956;
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47327c47122sm13954850f8f.34.2026.06.29.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:35:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2496717f-12b9-4d33-b6db-1db278aee8e2@gmail.com>
Date: Mon, 29 Jun 2026 14:35:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-2-1b7fb95b51f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bartosz,

On 6/29/26 12:28, Bartosz Golaszewski wrote:
> +config PHY_QCOM_SGMII_ETH_SCMI
> +	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM_GENERIC_DOMAINS
> +	help

I think PHY_QCOM_SGMII_ETH_SCMI is missing a dependency on PM. I get a
build error currently:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [y]:
  - PHY_QCOM_SGMII_ETH_SCMI [=y] && OF [=y] && (ARCH_QCOM ||
COMPILE_TEST [=y])

drivers/pmdomain/core.c: In function ‘genpd_queue_power_off_work’:
drivers/pmdomain/core.c:936:20: error: ‘pm_wq’ undeclared (first use in
this function)
  936 |         queue_work(pm_wq, &genpd->power_off_work);
      |                    ^~~~~
drivers/pmdomain/core.c:936:20: note: each undeclared identifier is
reported only once for each function it appears in
drivers/pmdomain/core.c: In function ‘genpd_dev_pm_qos_notifier’:
drivers/pmdomain/core.c:1133:39: error: ‘struct dev_pm_info’ has no
member named ‘ignore_children’
 1133 |                 if (!dev || dev->power.ignore_children)
      |                                       ^
  CC      mm/truncate.o

- Julian Braha
