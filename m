Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF4757EA
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762850735; cv=none; b=WN5xvtqkqykOudiN4XGWaY0jfgZN9CgaYsYzFjh4r6OfhFh/wZl6fO0dQprUGvb5tP7LyYYoYr1HyrhaFbv1lTj/d2jUs0L5ksPKlpQp2f+yGz/WTkfC4LhppmazCRPssrn0gt9p6zmXTNAUtAzn8tpBdGn5r///X9AyYI2BkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762850735; c=relaxed/simple;
	bh=3nnAWyr034dlww4gOSVC0sm7Af2ZgKc/X5ULm9PEN7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kaw7i7ab1qjvqpKhb0cLFGKZ0OlTr+km5ddJWDYVrzZYTVgIVBctkxNnMFwKnyvxNRwunGFZ/Lm/MMj1F3yM1U/YHPAAzUiISl88x27uVyRJCNoNwnWouAzUxWrO7uXebFS6EuVaA8o3lUYV3VW8tUJLB36wFZYRObjVzbpnbDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLndNncF; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLndNncF"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ba507fe592dso2425088a12.2
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 00:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762850733; x=1763455533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+hmxQBj7IsYd1S8pXVYnG/VuhGQ2SVQVtQG6+CGoaw=;
        b=gLndNncFNExMy+3JfRNy/W2lsIXCFqrvNksPQORgDc9Sc53IjeTQVTGJ2jcHz7EGH4
         2x/RjqAb7FvyLoqUT6yehDWR7FmOYxXSx/jmRLtVfuG5rSivLg5MVSOHk6EW6R+dHr9p
         9q2C5IxxUC79ufGF2emlUcJFcB5SUItCy/IAwcsPRu+9FmxvXiqTJX//VdEi6kudYD0o
         Um5PnF8unpopTKke4/dCh86d49AR8b5DM/Tx2zwFpIg78lZ7Xs3nPdXSSb1mjB/ITrG1
         H74luHKsZePJoCnsd/L8Za9xaY4J/Mmu31Xb3H3VUsk1VRDfiFEpbPGo7opubt6J/66t
         r4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762850733; x=1763455533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+hmxQBj7IsYd1S8pXVYnG/VuhGQ2SVQVtQG6+CGoaw=;
        b=A6Qo2yYGKf6iZKbB+Fs4+ugxfVCSFem6ckFSTtIjsZl0iOilq4KCzpvWxS98lmoAjJ
         l4R9ziWL75uX0SyOziwg/JxGSLiu/SgejF/2tturmSlFIw2e3HLDuGKLPvUzxjW2UqL7
         TUEcf7vYugK3p7/oMjUeOtcpPgvQQT9z5kv0vkfXFMD7Qn2YyC/ClNWaK4chExidAAvW
         Zyn4LxiyLgvC37bCtfyH4mr64aOPWVFddpCmFA2kLgXGgmWD8Nryyc2c7zZO5mpbRjVx
         gKxL+dwh5gZA52HsR9/kRzKnz9aLoemNgKWvCGlWD7GxMdH1OlmcQ/potXWPFn6PuG8E
         i9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWt5KeFkJzeTc/cA+pXz2AUVzjOIq7UuxSvMlsODp1P0X264Bq3cc4Nip3w6rWemrd4iOw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEaCWMlXU9CP7v1F/PubQF9nPwRXcpFM/L2VVh+np/145bQLcT
	GOaiTS91849MhZ49Tq06manm42jPziMv9DylwvX2lcDkERPNtz87poC14GftW403admH73OVdIj
	Ck3N3TtibaWsvBu7f8uvhq65AzmrfzEA=
X-Gm-Gg: ASbGncswWj7J0N9jqIxotb28QTOv+AzdfJ8vsVvC0MdxxaItyxwUkV+D56hBSiHkBlI
	q4eL/wbpXpeooLi9ndXS8CyyaIGxiwJ9QhAd4Z5yeFgNrR16shWHzRqKJnsNtF+Yn0TDcdlHczg
	tV4LNrioXRNZYcvJ4qqdk+3BPU34ish7d79msqPuW7+nJcIwlyYaL23KRn4PdixjpYPqAqjUCxP
	0j6i4U9SCdq3kb2WERpUvMkYyFUwwnbw+D+7vJToPAkSAMRwWlZWEynYrbyqAsdvLT7
X-Google-Smtp-Source: AGHT+IEbIBPvg62Y1Iztl106EfvgBmmryD6TUmDM5qu02qmAT6MmSP20+OStlbhgquJhSpSV9FwS3gQC37Rdo9EXvMw=
X-Received: by 2002:a17:902:e80b:b0:295:7453:b580 with SMTP id
 d9443c01a7336-297e5715410mr146810455ad.58.1762850732603; Tue, 11 Nov 2025
 00:45:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
In-Reply-To: <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Nov 2025 10:47:56 +0200
X-Gm-Features: AWmQ_bkje38QBVH41X3V5QeZd3T9fbYsWDLt3kUsgCWuUpLG1ylXQ7gyr6WQwdA
Message-ID: <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, marex@denx.de, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, joao.goncalves@toradex.com, 
	frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 09/11/2025 22:45, Rogerio Pimentel wrote:
> > The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plu=
s
> > SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
> > 32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIP=
I
> > display interfaces, camera connectors, and standard expansion headers.
> >
> > Based on the device tree found in the NXP repository at github
> > https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
> > board kernel mainline device tree.
> >
> > This is a basic device tree supporting:
> >
> >  - Quad Cortex-A53
> >  - 4GB LPDDR4 DRAM
> >  - PCA9450C PMIC with regulators
> >  - Two NXP PCAL6416 GPIO expanders
> >  - RGB LEDs via GPIO expander
> >  - I2C1, I2C2, I2C3 controllers
> >  - UART2 (console) and UART3 (with RTS/CTS)
> >  - USDHC3 (8-bit eMMC)
> >  - SNVS power key (onboard power button)
> >
> > Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> > Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
>
> Incorrect DCO chain. Please look at submitting patches which explain
> what is DCO and how it should be organized.

In addition to that, Rogerio please read:

https://docs.kernel.org/process/submitting-patches.html

At this moment I think you should keep the original author of the
patch.

Then mark your contribution as follows. If you just picked the patches
tested them and made minor modifictions only add your S-o-b

e.g

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

If you made significant changes add your C-d-b like this:

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Co-developed-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
