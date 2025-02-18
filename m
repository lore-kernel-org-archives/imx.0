Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65A243392;
	Tue, 18 Feb 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882098; cv=none; b=fRpf7ZUIWIcyzNJdHNrAGYTP3LxvWXa9iYMNSxQfyFJ5AS5kk64VNVt5gE8vJsJCNmFmZZB/HaN9WQrBE+yFYKAvv6UFtR0zL1Z4HcVCl2stf1be+1LQb3nFbze+7lQt7+WAFUlw9s7lEvUqFIw32ERZByPUOnM3PUaDE8Dmh8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882098; c=relaxed/simple;
	bh=tMVRAzuzBpRTZlihfsRY9cdts21bPdJ/6WhLJlq511k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ne0uV+dqAXvtkT29S1thwENLSqfLq2V5IZwtkIWnGdMtmNmr3eejO8TkBciFsPkBPeNS3YnErQ93927IsOItx2THFruyq1Okn0Iu1aZsKzEflZg2CcG9EWAzvcFF1hr0O/LtQ2sY9sn/s8LEVdzEPmSHj2IOQdUHBnSa4wNNrO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb7f539c35so596364666b.1;
        Tue, 18 Feb 2025 04:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739882093; x=1740486893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+VJIQ0ApMIfEX8niiA/w5UOINZk4mk6qd15CEV+pRs=;
        b=AFOZaPy0ZNX2Bl21m2zppmAoHcNvbt3Mh7arUt2/Ry44G3SRywk3yUPsFl8yVto3lf
         OxZMc52GujC0QoLpLSFTXXT87xFTFwBJL1EIAOGKcI5l5XzFDd+Jv6zc6C2J4Pim5Wr+
         AHVaaA5Qvn1X2sF+tStWvoT7kIxBQMm0muhWKH94oSreiwri99sZznLjYF5seLSMfg3v
         8wtfR2wroixSkLMke8bcMNBhC054o4FwQi4Y1ZVZ+BBcMewNYzBrsdIiVoOxZZnAVatr
         Pcj6bZOJu7VgCwuJES0gw1glTGDTXCiQ8swkqrsoMPmnlHfbvvr4SZkG88kNXtGdBvws
         V4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyd3j6KCtxDenZ20i6l/VfVSmo+2yyf1FA2akOt7QtzuHWyvZxtb6Z+adbJEFbB/+4C6F9Jftrs25ITMI=@lists.linux.dev, AJvYcCXFGLCWkKYY3DsPwuMkxpck3Iot/RIMCB50H6pJQnmxHkHW1us5kDEISuhnx1C+YyJllTk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW0lygs53eBRcsZJM/5aFM9H21XQSJOHZEGyyBtliAylsRRuz7
	y+8ekOYKcVZiC+BeyvDooOmqy+BT4fSc+onyJ0V82XN52rSy1/WkwzFq9VFfWS99uA==
X-Gm-Gg: ASbGncuDFgDRrcGxkzZs/oVAhiO/AfYQ6Awkh73j35XDOXXp9pH4D6NitunrLs+QBZI
	fvhFpCmQ3JjvxHF+vY9toc6elrei7vG8rRcpA5mvHBG5oJrId44xLLoFzarGmNcbZZAmt6gr8g2
	OZXfUb79RK5DupvGOpcVEa+RZw1WROuy2EsAK1k2a/oGw8dzUkb/Lcl4scly12TX0rbBepUySWz
	5YrJIb73txvB17yKQUE87xH1PE1itfbzH18H6LHH2bMkqiRrdDZAvCidjEKFEizb/yDtIHQ4CP+
	av5fmLYfX+lZfDXiRgNfx3DOFSCwtRiCABVW0Ldg0Zft
X-Google-Smtp-Source: AGHT+IFFxiMGH1u6NldjXRWnnXpxstoYLBXO+2lkIgUpoZu0eKN98ri8rsp8tCOdT5qFZSgYIYRXTw==
X-Received: by 2002:a17:907:7706:b0:abb:2334:af2f with SMTP id a640c23a62f3a-abb70b18461mr1114485166b.13.1739882093442;
        Tue, 18 Feb 2025 04:34:53 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9ec913d5sm338728866b.170.2025.02.18.04.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 04:34:53 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb7f539c35so596356066b.1;
        Tue, 18 Feb 2025 04:34:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOMm+8gB0/AgD0LQBP3gEecRdEguvoaSPreiDGCSrv8bTr2hb8eWJQ73dItL5lSW/iIF4=@lists.linux.dev, AJvYcCVYFHJO/7v9LNpmne6t/gdSgxZz2r6d+DdWrzZF5mo1ybMICNM2qMHMRKHcDZYLJVmBF+mCilnCHqGTIAw=@lists.linux.dev
X-Received: by 2002:a2e:9995:0:b0:308:fac7:9cc9 with SMTP id
 38308e7fff4ca-30927a474acmr41266951fa.14.1739881754898; Tue, 18 Feb 2025
 04:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk> <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Feb 2025 20:29:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
X-Gm-Features: AWEUYZmOiTlBF_l0MM194DGfKDDxifchVc42QrgCh8BPzRfhHgMRNbv9Q3dSaz0
Message-ID: <CAGb2v67xPoo-LQp9Z70yEBDXmgJTD=RvLP0tYYEXUJZr6B+Xkw@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: "speed" passed to fix_mac_speed
 is an int
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Drew Fustini <drew@pdp7.com>, Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, NXP S32 Linux Team <s32@nxp.com>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 6:25=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> priv->plat->fix_mac_speed() is called from stmmac_mac_link_up(), which
> is passed the speed as an "int". However, fix_mac_speed() implicitly
> casts this to an unsigned int. Some platform glue code print this value
> using %u, others with %d. Some implicitly cast it back to an int, and
> others to u32.
>
> Good practice is to use one type and only one type to represent a value
> being passed around a driver.
>
> Switch all of these over to consistently use "int" when dealing with a
> speed passed from stmmac_mac_link_up(), even though the speed will
> always be positive.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-

Acked-by: Chen-Yu Tsai <wens@csie.org>
