Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A311CD209
	for <imx@lists.linux.dev>; Thu, 21 Nov 2024 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732189630; cv=none; b=nHkfgTbA1pVUlOZ8STlxbJxjf3U7DenfRB8c3M6HVquzV7oW3WoPaWTBRY5UmebZwj7tqxUXLdcXpSx6nN1ZXEbBuGuAo7DcxFrDcn39NMtrTus6QRifUkXtaqOsSWZSuqz9zEuFtyKYMrObxGSjPK2rBZegMdwLrVtuYA5PN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732189630; c=relaxed/simple;
	bh=6tBTumqtBmtyr65OhXGkI6NGqtaXNa4Lrl0W95sKHkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7Q0kTvfCy4Ls4BvqcjxHQgOoif+cU/W35fgiohPvUswhKX5lc1nvUwMFZXVnYv3q6B22oR/hMuVtkRTxgnz8qwJ9t4HzKZE0fDt2F3fUni4KGtamjoSY7EeZJSlL6pcgOz4ZCEOruAdyuzkRQI5RwQMAPKh3WoJh71GrBZQdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgCPAw7m; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgCPAw7m"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724d23df764so290856b3a.1
        for <imx@lists.linux.dev>; Thu, 21 Nov 2024 03:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732189628; x=1732794428; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oKpoaoKlTteKRfatjC6kRGeLlyxZzmGL1dkD3YQ10E=;
        b=AgCPAw7mBDZ3rB6Z/siMmMpqucZ0gZNIqq7xdSNyIU/rjnLptjeAb81afle+V9YHqG
         kPGTHwkS5/L22sNeOXdbUnLMzPvea7wDbs5Pz793XJhrE05jdayytA4H+ab0+8gXfHb4
         aFjumIh5VZKT1tQdFofmZXg++Ny3S+gF2/7rb5OnGxaHMXcr2hYI4XKDjYDCC2/q+MBG
         L2f+7I8kkNuE2nkAoHSpK1eLHGetQ4/AP4Wzw+PYpuAzcwYJ9UqFe4k6FLg752CVHzpo
         Tuc7z8a5oiLudV8CtCigBnoIIC6jfT62vwnlLBsgugEvzEX9mqdXcci/ZpbSjJbrQ71H
         5Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732189628; x=1732794428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oKpoaoKlTteKRfatjC6kRGeLlyxZzmGL1dkD3YQ10E=;
        b=OcbVFUOD8pdyF10G9LGtnKqOzTAcMdbv+kuSV6b4ZHD0dDJ4POcSBVsL211GS23m2y
         0TtXteg3IjIdQzDfWXaA7JQPbtxTZJh/A0ODxSNXZijNm2P+40Y3WMnoOHtZm6TloceC
         IXqd+cwXxUcKvhzU0mIwU6GVJ5ewOCmJZ6Z6rHDcDagysSXE6HqP/xVY4lrK9E6mp6I0
         cTnqLLc3rKzWkJ0C6Y0+lje5kzHzQf5rjUtPSy8tW2rJfUGJk5ykzwahkOcJZB7729W4
         Lrs9xYar52FnJN4OWTYbUBDGeTUwufJaaThK53ncNVNTZ1GzWzmVSuUy754oB/3gWXln
         qTvg==
X-Forwarded-Encrypted: i=1; AJvYcCUfX59xzW2d5sP/0l0qez5KenPcHjvidHQAI1a5HeoPnwupGEpsHaQeoIw4NWqcN+b/YEo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8krAM1X1ojCYgLJqrR1R9tK4VqqBkV5vPNRiZ9AkBSfjVv686
	wV1zpUgu2jd1Mc/s2a9yxNT1j6Tw0xQuiAxr/i7wKMeITFWjsbS5v3qQPeTVudnYewfZcX/Fvc0
	JRrDPweXoarmeBeB/oi/rCSQ7Og4=
X-Gm-Gg: ASbGncu9D2h3FyfTiZaUsews9/TYzYydKWfA8EXlhcWLFjqr04EhQqmw3UPsFA8Sf2m
	EDi2HfVxHF8c3IiaC1B20Qn/hV48o
X-Google-Smtp-Source: AGHT+IE2h2M+qxLCspBarhNsj5yqwS/EMhkBWxXjcDD9u0KTCey5QLScBBICtmjBrds0ZAtA4MlEHX5fwedUO4F3uCA=
X-Received: by 2002:a05:6a00:2284:b0:724:5d26:d904 with SMTP id
 d2e1a72fcca58-724bed2f146mr8063161b3a.18.1732189627973; Thu, 21 Nov 2024
 03:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
 <20241120135859.3133984-5-daniel.baluta@nxp.com> <DB9PR04MB84616B3F5A76AA1C588DC0ED88222@DB9PR04MB8461.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB84616B3F5A76AA1C588DC0ED88222@DB9PR04MB8461.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 21 Nov 2024 13:48:11 +0200
Message-ID: <CAEnQRZCSvOE5jQtSoL0xGJNpx_94V29TbidR8iSDC5jOwy6xQw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Li <frank.li@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 1:33=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for
> > dsp
> >
> > Audio block control contains a set of registers some of them used for
> > DSP configuration.
> >
> > Drivers (rproc, SOF) are using fsl,dsp-ctrl property to access those
> > registers in order to control the operations of the DSP (e.g for start,
> > reset, etc).
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 41ff40ab5da2..fa4ff75af12d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1616,7 +1616,7 @@ sdma2: dma-controller@30e10000 {
> >                       };
> >
> >                       audio_blk_ctrl: clock-controller@30e20000 {
> > -                             compatible =3D "fsl,imx8mp-audio-blk-
> > ctrl";
> > +                             compatible =3D "fsl,imx8mp-audio-blk-
> > ctrl", "syscon";
>
> This requires binding update as I recall.

Yes, indeed. Will update in v2.
