Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF43672B1
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741456; cv=none; b=Fu8NrazFAURfnhkqRSoKS0FtnXAxhmplFu0xhrLm83YIWI2ugMtoE4V8iKeWJiKhuXIpIKTVDrzarHAG4KQ9+op1KAVwYYXm9IoQN1E/B4tAAmkKBK7ajHuDx7YI5WttUICwj9Y0OR00SlMo0atobcxXnnQG3BuCA5A3w8wsMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741456; c=relaxed/simple;
	bh=UvkvBBzeyeMqgudY2G6gDFJg27JiOFKpvozKSRN3iE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCrKyCzPlLjZKYbi4xTTcn8oFxjpMyaU/XGvnW7N7lCNJmQvj7pLVBgYukXYjPeMePPDSbnIVncY94DzvLFjb2TNfH0DI5ehqgv6KKczRLjlvhz/pVW5k+p8eaWo+sWAFTdWiT0iwii37kI+OQMfuNxEfMbSL1rH82l0ythhxZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51bf2479349so13119201cf.2
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 06:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741455; x=1783346255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=Lh388w2cOZD5iqgMaGFGC1NzVk8BuJ+NwgpBHugl/NILnzViowvV4M4GxjSMKgIftN
         D5W/vP1lqom45mLVvcVL3e9HZdBBT4ZbxYmAp4WZfE1KscXcjIP6LZb7iyalFdGBlLhi
         RGk4pPSaxhfO40AKVwmqcBY+v6wS24+TKe3Eafw8/7h4Rl3z+/dwyTK+rJ2M5pzKT8jp
         aWdOhy8trNqfnDgCzEPQa2Lm6OERlUcx2qDO7j38pzlftZZZ4o1WyHoxmFYuTCU1UlEw
         9MZlz43KcgXhd48Q7P+VI2kqwQz3NvwbIXyals1mHW0SWemWAEps18ndXKE6Tt2nZFaL
         4NrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oINtVH3KHgtRKrKQ98G+M4X9bdircaygmhKGegy90gLQp8kXscxHSb/I9OCYW2kbryRg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMGuxmHkRZVdpgo84dA78OSLC75MCFbUtWS8uLGB4doyhgYRSt
	SuOVw+EaC4pab0i5sMHJsL+sj9CQsPXeLB07bN/jKh430yXG+8kDZzyeaalyvZ9S
X-Gm-Gg: AfdE7cls7jw1JAzBFBcJInAZXjrJflwapJApKgGW5B77PJn2LWgQy/uAe/YTwdTPgJo
	lKL5yMepkAM/Uy2F7G4mw/Y9MMXU2SCiuqRldauHbSsf1wrnedtrD+uTImimJoyjvYUc1+zWhTh
	eNyjrdva7uH1vSMXkxPkBsHdNAKgQZxYCZHogg3quxjmq8ftLSufYoO3Jb71xhdRW51R0GKQbrg
	sgWim4FBGG//gayGUz85O77emsNC4U5DGptW5U95qM101yn72XRV3/EKe6iCKdh28NqN4G4oYfQ
	nfx73EgMpEqaUW79t7wPSiM/cds9lcCpQsbdo91fsV13hUG+fQ93cgTBFypJWAhAINm3cuUQgzk
	enEfKBMi8NA7HI4mZewU+vgrWp9DUe3aM+BXsdArkkY5jqCpbaHx8iSBmyE6brMXx11b49F7U1D
	rk5djcB/4X6UIqLqCqammlHaEFDOsHUN87WgpcdroDoQK6o21MQhh8tQ==
X-Received: by 2002:ac8:5d49:0:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51c0cb03b12mr11489501cf.66.1782741454642;
        Mon, 29 Jun 2026 06:57:34 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51a9c6b6sm165125091cf.16.2026.06.29.06.57.34
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:57:34 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91562bf6c12so391613485a.2
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 06:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+H7qJjd8V85pcwlZLO35pV9SsVdnlXg2IXvNdVmMJ2CCmlD4B0Hi8l0XgrZ2Ur6/lYbs0=@lists.linux.dev
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
