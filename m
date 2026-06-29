Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAC7352023
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745122; cv=none; b=FuSjQXU9F/pKHtD9aLTnXuzRf531gaoW3xIwqNhEVu8rW8PigiNY4cnsnmZF4cNVOI8tBag7itYpvn454qMTITFNIAmlr3pNp0hlNIy0mXg5w8towuwQw7k1LtJh5lAviPCxvHqzUr/HHzb09A57eaxJcZWnGfipFQSJbGxI74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745122; c=relaxed/simple;
	bh=LAoZJqVfdU9+V8F5hBZtY//uWnuQHis0eN8ii8DLed0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBW80Em2FUK+W2jSKicvwcbzIiaHhk74Mi4s/rTaavoOmVdZ+d8DKkYn6JBUgYW084buklgIusH2HVBPdm9UUVGQe9XuqV53Y08EZfEK+5t391Yb+tgfnLYVab3hL22rGmTH1NCCPi2BuZeWGxhKATdXqrrawQmjMs7R96jWrik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44841e9f651so2236486fac.0
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745120; x=1783349920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=X5cARsYItFgUNBIWgSx9sNVjnSrSXRhsOa6vttYdeWYwgA7toNj357yIYHK6eFk1RM
         /rcy23yJakRWZl6zqkLLKC1R9znaq0PG9ncvzEIWDi9m5QvqR0phShFHTjBxC+cjXypO
         scr9mOXpdRQYjMY/c8TdUgxBcYE8mKpqBJktVK8owBjrIeB6jKTqBeuqcQjtTxAEH5Wt
         p4L3y09haobCsgNKYEJfRc6CL3HUKR3hcMbnbkqialj2MZkQihXHYsNWj9OJznobHvhx
         UELvD2iixe6v1anOWGtpdfJTH59NcJE6SNZ9lxvA9jrk/Vhj07knDtxEjeDokDQfLuWK
         6Ybg==
X-Forwarded-Encrypted: i=1; AHgh+Roi6QH96l2Nnc1GLtj8OomJXfyOhgbXQADmhKDcvVT+i1BwhtvED0NzX+Ycs2xwPOCbwYc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzecTaB3vDbV3WjacjnfrySQJ81vkaCwiY5gprgwlVfMiocTszD
	R8gB4NY2s5eTxq9w7kYUR5jE8ABArJcl85ytpOa76Ag956Q4RL53CeOZp7acv47w
X-Gm-Gg: AfdE7cln7S4jm3Smu/7MjP4WDKpNbRImWoONkRUr5C3xpjC3xpMlWK6CzlQetrBuEVe
	wbXcZcXOwDxpOY0PDfftKByx7/52q6NEOOeBkuBKsQbXqW55tt053wXEL79tyrFChahim9TqjcH
	Wk9TedU/Pe1LP4gMJiS5C3EsPhiLeZqUMQ03+0yVf2PsaN7K9V3MDln2NI5wOO5Rw/MNTKqO03B
	iqpysMXYJCCwK16cXR3Wh71v/74M8uTsrTtw4ZU2izwRg0BlPo2lBiyMss/E1kWWMXzzC6K07e9
	H9sz7IK/bfz7bo7C0Dp/LNg0f20swP5r33gjQ3DxiJaPu0p5ZLlphXgm4qJeEYjVgSeE8u11Lpt
	MIRuyGTvmWy05+TinhvfQsnQRdM6hgykjvS+GVhWexT7y87oAiT2PlfGLNRUTxukEBLdOmMyCgG
	s1Kl3czBzNuZeTLZVp0D4Jp4fuHZYG7wEofGMhV23JRcJmtV85xw==
X-Received: by 2002:a05:6871:c948:b0:447:7d64:95f8 with SMTP id 586e51a60fabf-44811c463b2mr13125816fac.21.1782745120010;
        Mon, 29 Jun 2026 07:58:40 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f0475e3sm21760300fac.16.2026.06.29.07.58.39
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:58:39 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44841e9f651so2236470fac.0
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpjMrLf61zEStI03HxOY6R+ZhWJMBifS/DYYGlqAZ8ggrm9NRXQMe3nPXaDN4bdoGgFKrQ=@lists.linux.dev
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
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
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
