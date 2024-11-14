Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276A16136
	for <imx@lists.linux.dev>; Thu, 14 Nov 2024 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731551880; cv=none; b=NKwduFol7HoyVYpFb3N2wk9d2w1ElMjHbvnbXmKv7B0XYhWPXiGx/I99RgFoC748CAPMNJnWJoKW/DzAPen1SPRsuCMXTWYVz7yguyILX8Y5K6Z6dO09rhxcTiKHotpkBxTHdJdMq0iatm53bWlV9zfrF/3WkW7LGjmSHFxj1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731551880; c=relaxed/simple;
	bh=S4IFutQpnD3EFzpHxLT6cMh43oP/wbiKwdQWUo6R1nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fc8C8Sf33pU9OCf2r9+QXnoFKWCzczNMFRkPpaXuVMnZo/FYyhIxG3k5D+9fqnWw9NRdmj/sKWre/Mtv9Uf3fcVbTQz5F9t/zpkN3eeXKrxIfFHlA05/hmnGdbiTbU3n0t5AOJUkb5iUSpq3FJqTXHFiLAoITVYJxrM3zXocmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqK8sIXf; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqK8sIXf"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so446785ab.2
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 18:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731551877; x=1732156677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StFhRyIpCM9Uu8eeMJnktRCq06AyyCXEprdzl0A/TJI=;
        b=KqK8sIXfcTasbwphIeN9wE7Vg4RCsmaYiH3bSdlhNXVkqQFL9dRwtvtCNkH1IMfwEj
         weSPVinZ58JvjlpjxOfiCX5H+8C70Uhnif2UUUr3tcpSyDck/mjmKV0orsH7d0Q83EQC
         ZIg9SBRuucRrbO+q3NIl5/QtHcb0GFwi5MpkteAa7kWL1HMdFVnGXr/i+J7Z/RH0RDCY
         IGRl2o74WWAANiWY4m0YyzXC+ydpaAaZqfWw51X49FgD+1A0w5kN5uxp15q8YnCeE6tg
         CWh1SvHFs1BktqhidYlg+fUj3i8SDaI2qiQ2MtHcK/BCk7v8GOWDRjn+R0Etd8A+vrjr
         b32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731551877; x=1732156677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StFhRyIpCM9Uu8eeMJnktRCq06AyyCXEprdzl0A/TJI=;
        b=NAEgKlZTZxGDFh84PYFLyT6F1qm6Ac9eix/cGh3zHELqpLZXGHV+YBFo/d2xDLV1dX
         1N6S36B5VpJ8w3u32nppff4vjXRP2Jh9BYOzHLPtn4lkScqSZjW+5EbUIBlsmsAEus3Q
         j5VIWMFVmnVqFcMreTF7sIvpTWvIA6YzOteus/6aHBRH/2XNgChj/rvtSFUTnxfNKtQ5
         C3pHSDzM/eQqb1y36KppPGRhERAMNImrKIEBjXs4zdvNlYtFcAPXuka90gnFz5k/VH/X
         lZx4DD8ClKaxKe2MpLtDlwyPO5v2FVXqUfrvzvV7XwMONqvGljaP94rgENKhO1/YrZ+6
         KrwA==
X-Forwarded-Encrypted: i=1; AJvYcCV7/pykEfWsqnVMIQTNJteMIi0tsK1IPxq2rj+KvUTir/Lp+yD7PfXKJRN7Ho3s0JCDeAg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVDl1jNsXNpQ4l57UU7kY+Rh6UA4l7YIN/TeIFnzT3towH9POL
	3KGILqta6DlbJ7a+V2/qJnHW74frBDsx6hw+ye5lGZHKboSi9l9wnNSRk30dF1w+eq+qAHQ7fMr
	WdvoGn9HEB2eDemGN8MLlOUf4AtA=
X-Google-Smtp-Source: AGHT+IGcTJSj30ycrQ3ffIAZN66OsQquO1B46KfWjrwu9f3E/Tq4Zk70MH8L6VADeTi2CDkmD1g2VJE9cA/VEkQCcgQ=
X-Received: by 2002:a92:c56d:0:b0:3a5:e1f5:1572 with SMTP id
 e9e14a558f8ab-3a71fed5de0mr5894775ab.22.1731551877130; Wed, 13 Nov 2024
 18:37:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241108100759.682260-1-shengjiu.wang@nxp.com>
 <20241108100759.682260-4-shengjiu.wang@nxp.com> <PAXPR04MB84596DD01E6A066A621F590188582@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB84596DD01E6A066A621F590188582@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 14 Nov 2024 10:37:44 +0800
Message-ID: <CAA+D8AP=cdyvhtzDib8-T5GuHU9pXhPVgdomTQj8R=8CCFr5HQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as
 SPDIF IPG clock
To: Peng Fan <peng.fan@nxp.com>
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 11:11=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH v2 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG
> > as SPDIF IPG clock
> >
>
> This patch has a fix tag, but the other two not have. So the other two
> will not be backported and cause issue.
>
> So use fixes for all or drop fixes for all.
>

Should I add the one same fixes tag to all 3 commits?

Best regards
Shengjiu Wang

> Regards,
> Peng.
>
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which missed the
> > clock gate part.
> >
> > IMX93_CLK_SPDIF_IPG is the correct clock.
> >
> > Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >                               reg-names =3D "ram", "regs", "rxfifo",
> > "txfifo";
> >                               interrupts =3D <GIC_SPI 203
> > IRQ_TYPE_LEVEL_HIGH>,
> >                                            <GIC_SPI 204
> > IRQ_TYPE_LEVEL_HIGH>;
> > -                             clocks =3D <&clk
> > IMX93_CLK_BUS_WAKEUP>,
> > +                             clocks =3D <&clk
> > IMX93_CLK_SPDIF_IPG>,
> >                                        <&clk
> > IMX93_CLK_SPDIF_GATE>,
> >                                        <&clk IMX93_CLK_DUMMY>,
> >                                        <&clk
> > IMX93_CLK_AUD_XCVR_GATE>;
> > --
> > 2.34.1
>
