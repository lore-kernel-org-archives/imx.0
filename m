Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1457312
	for <imx@lists.linux.dev>; Fri, 22 Mar 2024 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711124960; cv=none; b=BhvXQUypjinYSo3adtCjMJfMqye8/2AytPyY3tkpAadNduCf1Z32BD8GTG/yxvIAmWUESewlbtBV6Yx6/lTXKsvllwH5/89g3zh1xoijmz5n4syAztFCaM0y/7jUCg6gB/r013Dg407vnMuJEax04XPkt/eIWUi6rduYHry1Lvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711124960; c=relaxed/simple;
	bh=NeAqeTVeviIxXnXomn14RmAblPjhwq1FWPD7pUA+ghI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIObE0sXueyxFZb8JmwhsP3Zci4IDyCc3CZfy2+gZzAGUxU2W7rhqpfFR1zySwwlXDNmCFrt19YT87G1S/v3YGP93d1P4I+Fn3BmAYmeisojZ8FWspYiX52q/i1jtxv5SFAN7YVUDovDR/kqBF0ETLwQvNjPBnWKJwcO5ZI+p3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqO50O2z; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqO50O2z"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29f8ae4eae5so378116a91.0
        for <imx@lists.linux.dev>; Fri, 22 Mar 2024 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711124958; x=1711729758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeAqeTVeviIxXnXomn14RmAblPjhwq1FWPD7pUA+ghI=;
        b=hqO50O2z6YgJhBAO0/2Ft0NiD2igMdropzRXtovu8u+THmKMRpUA/hRzU3ATXxC8Iz
         23E3Es+o/KtMghTf4Ea/HeIWM01Gdx0X0bwmcix4H7Ng4mO2fp7E00VKg0U7jr/6hr/6
         gL4eQSj06EpGeL7kcV4K6eyY5gf6edw8P8m9HdNQkG15fCzuuojEml7u48MCflL7t0Vo
         AolwfVj/iNto/3MaUK3EvSe1dchFGVxhsDlhMXJaIs89hrE71XxYT+qgSPrKqAiuhnuB
         pGi4XHVQaG8YWPvMhhgd625P9UqW/LPF6VQiwbzIs9cXDSbRYClOiJ3gpkmFu8QdSKST
         FxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711124958; x=1711729758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeAqeTVeviIxXnXomn14RmAblPjhwq1FWPD7pUA+ghI=;
        b=puWFNvMyJTR92yNuo71VHsVvD0uIsdLw7MW5eqTDXdGbkKwRxVHbjOpftGm4RCS3uB
         +iVeW78bQ6JIifz/rHZ6Wfnv3d4RucdQ5pN3Y8rLP3whbTuL33DrQ9+A9hkA6t7JElTL
         sDDP32yRiuOalRSBlAm2muFhmuGqa/S3QR11QxftgUKh/lLr622VKNvc4OCd4UwquIYo
         X6a47GWnjbjFsA12JQjQUBCWFGhZhEFgyuv1OyEvQ0zrxO07aUJrLAyH/TQ1CRHDJGQD
         H6U9tx3wbBUWLxeBTuohJDM+/hP5pTMsljGti+uQqgIf+kjszNXamojgnf6CxNS31lCq
         Q4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW8YDGZHHUxkfWOWmi59PnpmsYt+Lbo50N6Eeo7VerS02p6FWL5seyV9/Ie3b9mAyblkzCuFV4JNspA5WQfj/5S4gNa
X-Gm-Message-State: AOJu0YzQhlNPd2tiSLvj8HuCR2GOfxSi7AXUhbKkFEn50y1i27pxvsqG
	0O2/OPqKcv4Lxe+FmOiKPl7vBvkGLN5JhgRRF8GPefO/xNFmhJ4mULQaR4saJbaH+mztBqx3vod
	A8vhzbE331vX/iBYRhyNkGmMG9LY=
X-Google-Smtp-Source: AGHT+IFjaOeAw9XGYO7zNRizWZ0C8XANLVydJhzwF7Py8oqF8bVQ/2sMI4hkhGm8mTPw1JtDipQd8lCaIGqro0z4hnM=
X-Received: by 2002:a17:90a:b395:b0:2a0:350a:a7a8 with SMTP id
 e21-20020a17090ab39500b002a0350aa7a8mr123918pjr.2.1711124958335; Fri, 22 Mar
 2024 09:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322130646.1016630-1-marcel@ziswiler.com>
In-Reply-To: <20240322130646.1016630-1-marcel@ziswiler.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Mar 2024 13:29:05 -0300
Message-ID: <CAOMZO5ANM-ze3=ZG33ZgO+=4V_z5QJhqherB_d7WSe33sVB21w@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] phy: freescale: imx8m-pcie: facing pcie link-up instability
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-phy@lists.infradead.org, linux-imx@nxp.com, 
	Lucas Stach <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, Richard Zhu <hongxing.zhu@nxp.com>, linux-kernel@vger.kernel.org, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, Vinod Koul <vkoul@kernel.org>, 
	Yang Li <yang.lee@linux.alibaba.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marcel,

On Fri, Mar 22, 2024 at 10:07=E2=80=AFAM Marcel Ziswiler <marcel@ziswiler.c=
om> wrote:
>
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
>
> In our automated testing setup, we use Delock Mini-PCIe SATA cards [1].
> While this setup has proven very stable overall we noticed upstream on
> the i.MX8M Mini fails quite regularly (about 50/50) to bring up the PCIe
> link while with NXP's downstream BSP 5.15.71_2.2.2 it always works. As
> that old downstream stuff was quite different, I first also tried NXP's
> latest downstream BSP 6.1.55_2.2.0 which from a PCIe point of view is
> fairly vanilla, however, also there the PCIe link-up was not stable.
> Comparing and debugging I noticed that upstream explicitly configures
> the AUX_PLL_REFCLK_SEL to I_PLL_REFCLK_FROM_SYSPLL while working
> downstream [2] leaving it at reset defaults of AUX_IN (PLL clock).
> Unfortunately, the TRM does not mention any further details about this
> register (both for the i.MX 8M Mini as well as the Plus). Maybe somebody
> from NXP could further comment on this?
>
> BTW: On the i.MX 8M Plus we have not seen any issues with PCIe with the
> exact same setup which is why I left it unchanged.
>
> [1] https://www.delock.com/produkt/95233/merkmale.html
> [2] https://github.com/nxp-imx/linux-imx/blob/lf-5.15.71-2.2.0/drivers/pc=
i/controller/dwc/pci-imx6.c#L1548

The detailed information above is important. It should be in the
commit log of the patch IMHO.

Thanks for the fix.
