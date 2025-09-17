Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08DE3397CA
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758122730; cv=none; b=Dp7Jl3W4pbhvE87lggoaC5+PBQUxAP5W4sTnHZXpOlJkfbnCk6COChBlay/47wtIh3U7/CcRQTZ+hmp7V7FmrXYXNyeIHJhlLxyFeTRHIYSQm13mydRifZKdtakx9nVrewKtVFlWNY+de6xG78MoEZ2jPJ8gpCCtLjLJGoAwGHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758122730; c=relaxed/simple;
	bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWQesAXylYrNi6JClTL5sRfs3kz3L13iTZPExeX8p1UC2TvATYPHUyA68o6m3tVq6HQz6UImMltWXqFb4n88sNZVTNm5B7adfYX/BDNTqm85Xrxdnfybs1GiimEWkaKWuk3qfqCsKsDsQz3bADdLzDqK3yPQax3jC5ZpdDcFhrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5720df4acc5so3824929e87.3
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122724; x=1758727524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
        b=IhbCOgWBvudc1/xLFXUomMUIqQiCdgx3qg+gGCLvbcq4SbmMCd7XFq2Yk5HDEhQfic
         VZqMJwfKP3DphjcNuwIb1AL5Bs+0RCEpR/I/ufHXUakaoAgCX1fO/ktKTSDaBABStiSp
         Ef9flXdynB8T0QOD9GxCPEa5YaKC1RtOyfZTIzRQl4Tm5h5w7izGKcCmQ/JOmbAnG2aY
         FfFd1IttL3prlXRmZz8WPWV0zOjvKx2mynJIiIR9/RkXVYBaZvCMIZ8mLjEtOajW0DQe
         jyu5/dQ5P/UBrKm4wapHcLikZ1pwiAfFucsXYdAOyEgj7VDdxRxQoqRBbMSto1cE4bty
         oPtw==
X-Forwarded-Encrypted: i=1; AJvYcCUiYPWxidZeQS4FHWh+qu8ZNIuM+zbQQ/PBwjnglKmMuEZpiK2glHeecsHK4fJoVEqWd8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe3n5ppOeIrdVXApcwMiyuJg5hNAamRouleyCaAD30bM0ngJqp
	QiVrbgo/MH69qIEu/vMqG54x01z4+2rniUYdfjDrBiqQjTUL+KhzxazwlfSXfHwn
X-Gm-Gg: ASbGnctpwi0njoo7j3b6bqliSjauNRVyuZbEWczBt+7U3t3KxBq5x/1dKMzGG8GkmIc
	z8Vg2i7kYWD26hfc2Xsp9WmM/TBYUKDDlh7BlI1zTYAo0vpOiNzxUxJM2ZxYLkkGGVJKtNa4ndV
	NkMwHMzHgTto3AZR3Du+DHV4GmyyS5PjnZ6bwsJj5JT/A5GvfE7RUhdv2GL3u6tTpvT5ekexZ/6
	KHSTYGF7rXNfEgN8+G+mcFDmPr1R9xJZLSuyrrB8mp5HQwyhOD9XNxvqTAAxBXuGv9t0+SAccZm
	kT00j4LtTDZS38LzQ6QhZcSpLweaDNyv85ZfilTjOYWT0TuhJpOhNSUMK6wl/92QjGzvXq6j09R
	u4Sc197rjdFY1z5qLPKCAq9GzSRfYt53E4wOUo28EV/OOaqVmcWs=
X-Google-Smtp-Source: AGHT+IFR755qhy2uRG6FWKGkQI3itPc6COM4JNYFqb8PY29zRgUaOBVPk9OVABLp/rrCDbfU7FaZHw==
X-Received: by 2002:a05:6512:128b:b0:567:86ab:2bd2 with SMTP id 2adb3069b0e04-577978d8160mr776286e87.17.1758122723297;
        Wed, 17 Sep 2025 08:25:23 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5cf2f42dsm5197301e87.33.2025.09.17.08.25.22
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f76454f69so7456472e87.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr+kq67x/WSm4WrjWojErW1S26coebaIYgqqaLqdUaySTALairMDY+1viCJHxUvvhPygM=@lists.linux.dev
X-Received: by 2002:a05:651c:2129:b0:336:ba05:b07f with SMTP id
 38308e7fff4ca-35f63f7b5famr7302181fa.21.1758122722394; Wed, 17 Sep 2025
 08:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk> <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 Sep 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
X-Gm-Features: AS18NWAKSCnNyj6DLBKT_D2jbUlV9UmfcpG5sUkS8PNH_1L_6YQPZfrfuWMUlOI
Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
Subject: Re: [PATCH net-next 08/10] net: stmmac: sun8i: convert to use phy_interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 11:13=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> dwmac-sun8i supports MII, RMII and RGMII interface modes only. It
> is unclear whether the dwmac core interface is different from the
> one presented to the outside world.
>
> However, as none of the DTS files set "mac-mode", mac_interface will
> be identical to phy_interface.
>
> Convert dwmac-sun8i to use phy_interface when determining the
> interface mode rather than mac_interface.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Chen-Yu Tsai <wens@csie.org>
