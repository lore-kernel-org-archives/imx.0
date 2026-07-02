Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD473C4B94
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984238; cv=none; b=UK/m4QrxmfndJrEdZ0DcdK/C1LaHBp3hgL5mGHNlh8dG2A+ptPCLwAkg0/vym6dwdQLIJw1UOkn+HiHkTWfWD3DnEdK7oJ7Vhzzk+g2VPAi1ROhHx2107hYB7qM+JTqjdoyxbNJipYqHUXDswx/vS5Fr8CelsxcX0FpTpOqdm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984238; c=relaxed/simple;
	bh=n9yLVv4ONKzRdpCf8VFwTS/MdDc1G1FjImPOjJ/IqKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLc52r6FfgMeB222grFGo65SwT8eccxt1fSsoIwZPfx3KY2sj0Z8/MMqGnWEjkdaCTh4RPIQeVN/MGsVPmJgkfQBlWcGPNTO5Mw8CecTYUJxQDDPh+rk1v0uqT+gpTCg+iqP8pH2ASA8gnaV/lLcsEa2WWwdawCduMQ8VZGiZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so15155055ad.2
        for <imx@lists.linux.dev>; Thu, 02 Jul 2026 02:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984236; x=1783589036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=FnSJFlUNM6bWW/aSFDDcBPTNbWavgi20qlj4rCBu7u/5G6Kf5y+o3l3Ko4K7imIiTs
         Lz2tze9VLxJXp6eP7D96gJfARTc5blMaeWOCmc572TTgHwA126GmUwEet/Kgnma9o0gm
         ECbuFat8H9jzrNv8yvYaE8CANKd/qzeVPlC9Gyg2gsp9vHTOtEdCEeEsQ1q6tGmxUheY
         sKpuKvsPCgu9yPKhyNAN4y2W59QJBRRNiqizb8/HsT1ofTnAkzpMBV3ypwm25lo6md4V
         g3u+nfAoEYIGbYPq5ukSOAMDLS+L274GSLIkoRPjotgqRnHoPktJhfgqN85AQ8P7WxC8
         CZYg==
X-Forwarded-Encrypted: i=1; AHgh+RrQnt0cIlw3ZqyGloV59QlMaf4d19yUe0ObKMHErQX7935E1qbXPGQrHEqQSnZNUlDRe50=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrXoW8CFGGkn9R926XbSiw5leEgEF97cFMzXmHP5O90N0y57R3
	6OaQUUGOqL+44CQX51GQEECJs6gXUU1beKIDjzFVzljeO8/WgyNaefQboQufmFOQFDY=
X-Gm-Gg: AfdE7clGQ3/UCyZXqf/u+RwKnik65lTta06C6WaVjYLn46g+A8RUNbwHaYns0XagLSV
	fees/QGkYq5MCswpHZotkF+1sbhza7zZ14WHLoVFzHvKjTY2QF+iqzGfnVlBNGmBh1Qe2Am9M8Z
	2tpnhZdjIxDsvTd96hooJHR6u87wkBycUY8LnSz0AOV6F2blAycCORS7jjH2OoNtnz0nN4W8CaN
	1EXMYOGg89bQ/bjmXWxDALVdS/Ngc59X45xyiBmhyyHj4arWwrDDJSk8iz1zTN3vvsqho9BVrza
	rauIUBqFpjWh0e3YiFmTwn2E24RSQ441GKyxmyLzHbnaVv+xPmMXf5S3RP0NnL+QLlzlOd8V26Q
	y+hVF2ANurFKd3gCAmziLAEv+9gqRfBW+9P4Irbr+9VDLV3APCpa2GIu9wbRtVSibjz3GC6s5w4
	prTvNMZplukwwUnv5qgCVxfbup9H02txNXoIBwOFpD8agAlW5B7g==
X-Received: by 2002:a17:902:dac8:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2ca7e9078bcmr59699095ad.36.1782984235745;
        Thu, 02 Jul 2026 02:23:55 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2caa9a52a55sm4552495ad.29.2026.07.02.02.23.55
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:23:55 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so1201002a91.2
        for <imx@lists.linux.dev>; Thu, 02 Jul 2026 02:23:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrKBm1mkIm9gAc1VqkqccLyCFk8laLf6+GK1tk7HD+KcK9Qwz2C6WxeSyASNjGoKDBX+fs=@lists.linux.dev
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
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

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
