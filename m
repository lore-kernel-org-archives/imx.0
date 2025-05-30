Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9BB2AE6F
	for <imx@lists.linux.dev>; Fri, 30 May 2025 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591483; cv=none; b=ouf0BiQUJj3bYWyT2DbPNo2hZVN6GCBozjH3hbFStFTh+wLwVtK+rWZWcKA1e+oKhycyOF2rW2cJp8as8ztBDhrOn6iDK1WM/l5/c0h/Q8n8WwvIt9o2co9BKxPBNnBhTROyGRI9WqQc1hCO/QgSQ1YTqhkBP310Vl7DTuvpTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591483; c=relaxed/simple;
	bh=kg16i4Orfl2Vn03xor4gIQua0MLqSkj3tvVWVzEOlc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsmI7VFT8XEPbt5iFOqZiIfKTzSc1oLq0dAvcJgy4ifD78+iZSCb4Trd/knoXSutbdzzHZqBB8pmrlck/Uf4RCmTwv6+0+I11A3j9l2ggzo7NOjzMPwW6jpqsCS5I90GpMJSBejMzEpv3FdSUHaJoJ17kUFvtYmdrA/cj3XcfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52b2290e28eso459900e0c.3
        for <imx@lists.linux.dev>; Fri, 30 May 2025 00:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748591478; x=1749196278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2WzxSo6sYbiM6b0F2XSBjn+T4nA2ds5QVgGNEvrhj8=;
        b=bfWW3rHP0mE6zjAzDZbAZ76YkHY9M4PnTcpSAdDA4Ho3R0MZsgt2ERHXJ5lPIEWl5K
         Ludqft5+pyie9mGOFKitHIkSEjI2UJW0GD/gfBk0KMS9iExa4SrXKvmIDkiH5OJitFIi
         7J/wYPLnjrKi5gFOlDsTvL+uRDiDCbcvEsKurOyXDV+/T8YDhrTnWAGanSYtRtpBj62M
         14f66XsoPILmwmObVJLtWX9Typqe4a6WZ4TpLOmLmo1GNXvamhoOv2Irztv5raFRwD5y
         NIRaqNwmh42wrxXJYMF9KimwIjfUCgxe7r3zy8OlVZe23kAyQmPVs2WRwDvFE88DQEjD
         +1gw==
X-Forwarded-Encrypted: i=1; AJvYcCVLyFjNFt63ik1sHsIYHpTiWBwPP3Iku4B0flRr2nnWZqG29g98+KluPM0Du2deNK7qVhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfkUJMXcRYdCTrS9tzV5K5XBBaKfvg/taddKvAzc4ssAI+eOYA
	uRNjCwycEfNcgYu0CfaJ32aZ9m54K061PFHB17VENi722IY8MHKqoTijINm3h8xf
X-Gm-Gg: ASbGncvK0gz6c5+uFumUj9lTTGz2MTIH5iWvfNeMYDC1UHp0FynWf2DzMYmbHT8pM4x
	hbtoUhsihE6UxN5HWXMa6QjXxw5Lgx3I988LKrDV7kUnJsgBIHRxDhyDtQ0DFtCZVWe9QNxf5S2
	CXfg9RxN4QMAxLZ/Owf5BWwaQmE2Nhs4rdsZJxnOKK2Y/ypHqQV1sRYtcNAETp1h7d8weorMhit
	Uc9rNfmS2wJW4VUOEt7HjNzNufx3Z9lsu3W2E9eFBWQPr4UIgu7DpKzYivPkOguWMi/E4BosoFr
	E5emFEB11ZdDR+l+qzhn72hJMnAbBpatDspCDD8Qaf/rfZ3rmOUFyQBHmPok5q90RMksSe0Hgfh
	aXDcL9Sx9hdFO/G/Mmg==
X-Google-Smtp-Source: AGHT+IGkBpQi6HJ2v6lmHA4RTDh+2zupupAXw+ZbuFjUGlKlLinhSQ4e9lLeCdEJKm17S/X7Kzqvjg==
X-Received: by 2002:a05:6122:2188:b0:52f:724a:c748 with SMTP id 71dfb90a1353d-53080f5955bmr1748255e0c.1.1748591478534;
        Fri, 30 May 2025 00:51:18 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074aaf498sm2700779e0c.5.2025.05.30.00.51.18
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 00:51:18 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52b2290e28eso459891e0c.3
        for <imx@lists.linux.dev>; Fri, 30 May 2025 00:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6TOjP9UR0+ltZ0xrKUdukG/qr1dzzYL3SSklx9bzdvKPPs7bVVnFOmEb2tBoMQQZnl58=@lists.linux.dev
X-Received: by 2002:a05:6122:2188:b0:52f:724a:c748 with SMTP id
 71dfb90a1353d-53080f5955bmr1748247e0c.1.1748591478153; Fri, 30 May 2025
 00:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529112423.484232-1-j-choudhary@ti.com>
In-Reply-To: <20250529112423.484232-1-j-choudhary@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 09:51:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFrPanoO4CcRKVWhDsXCUm6ty3oayZ6yLs6AksZZJaBg@mail.gmail.com>
X-Gm-Features: AX0GCFu5SrfJ6XEYDFBe1Hbl2dYZBDrGAQ09XF6wFfWGxGH0eSYgcybRaCFnqRc
Message-ID: <CAMuHMdVFrPanoO4CcRKVWhDsXCUm6ty3oayZ6yLs6AksZZJaBg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Add no-hpd property for all ti-sn65dsi86
 bridge consumers
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	cros-qcom-dts-watchers@chromium.org, andersson@kernel.org, 
	konradybcio@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, dianders@chromium.org, 
	linux-kernel@vger.kernel.org, max.krummenacher@toradex.com, 
	ernestvanhoecke@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jayesh,

Thanks for your patch!

On Thu, 29 May 2025 at 13:24, Jayesh Choudhary <j-choudhary@ti.com> wrote:
> In the SN65DSI86 DSI-2-eDP bridge, HPD is not supported as of now.
> But DisplayPort connector_type usecases does need hpd to be enabled.
> In order not to break any platform from those driver changes, add
> "no-hpd" property to all the existing sn65dsi86 nodes (that don't
> have it already) as hpd is not being used there anyways.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

DT bindings day:

  no-hpd:
    type: boolean
    description:
      Set if the HPD line on the bridge isn't hooked up to anything or is
      otherwise unusable.

On all Renesas platforms listed below, the DP bridge's HPD pin is wired
to the HPD pin on the mini-DP connector.  What am I missing?

> Upcoming driver changes that will break platforms if we do not have this
> property in all the existing sn65dsi86 nodes that assumes hpd is disabled:
> <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

Breaking backwards-compatibility with existing DTBs is definitely a no-go.
I'll reply there, too...

>  .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts     | 1 +
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts             | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts                 | 1 +
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi             | 1 +
>  arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts            | 1 +
>  arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts        | 1 +
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi           | 1 +
>  7 files changed, 7 insertions(+)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
