Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467F1F63F9
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918234; cv=none; b=NWjGXezYJFBl0bPVlAJIC7RNwxq6c0WSVDJ4wBukJrHcYcJdvNDR7EzPn3cGTSehevAaT00x2tDS426jcYZLacg3sFpl+jLgDZkcXUNkNCNHASlk+1DzeV8F5zQZVHxNpWG12ulmFElrYQHQYh+TWu750hrfvgk4QkTksLs038E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918234; c=relaxed/simple;
	bh=B0ki5WVqBAKBRusFcBBrcMjDpyZxRQJNqVD9RLqvS2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=eXUCA49pVEJMn9cp/ydiaSzGA05JymVqjqPpkivAXTWk0IpddW0SdU7oxeLojEKIasFrmPkA5BQ8lrX3D9fLNCdyaE9PanapTelSWXARyxTEMEjxkOQRQcI0xSJVlErP0GK0PRWJcL7JSg43cIKwTld5lXStnGgJptp9XKW3cGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRqG11+I; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRqG11+I"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e72c2a1b0d4so5414554276.2
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745918229; x=1746523029; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=;
        b=tRqG11+I/zNzRvDGMgoZXkbCM5FmNMATw89d+zjW+/nclHg/UKn0PWVFXI9zMIySbG
         7WElDW9OPbjTkJDFgmfmvRRU5lUgcfnK/E6iEADAWZJs7zQzQwPx8wYG5nuZAfDAM2RS
         FGxzt1/EU00i2CVRhU4SaggEIg1lVKoLA1JKEaketiUb7hIdrfKeqxOvXQn5PZzdEwGv
         ytwprq/jbDXJ9H00UiLOc8nMyEQttCZih5aaEIQEdwu8ftB8RqYPIqOC7qY9Z3v0jjAg
         Q3qkLux0G1CgF5+wKgwdtQ4xowGRQifMgNon5+/w8uA/roak/ku9+M4ajTLC6P33XCru
         jV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918229; x=1746523029;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AFZuP5QCiVw2bvfwORhzfZHSaEjFI09KNVHM5hnVfQ=;
        b=V4spm6VABJnG6xRlaCFc95phMA2e1jyMU/HPWBfHsXjD6MgQtckAj+d89vF/VEwfSK
         +XA4c0wJcsqwb3sgP7tepQlzaK44qgLEGarTtwdugwIJZmSGkAc9z8cGMPD7GceQBwsR
         XZffYkBciX1B2ESF7ulW2o3ZrZrXbqDrv4yrNFHwSIeuXdZmNhrIxnby19H6YG65DGcx
         n+70/4zWAkYQxl7D5nDQmJxLEsHcqsykPh5xHxeIfh0WCIkGOtpgIhh+TQ1whRCG1KPA
         37J3jYjaSEjjUP5vZBr5hFMIwjcm9gxXFNaMldEijhUXO3xb6Ei8EctI7/qI+F593/cu
         9QWw==
X-Forwarded-Encrypted: i=1; AJvYcCUgQpcdRCBryv/m+TAWxCB+hjRwFGkJtifHisHlJdZHaVMwgPc9F+pPEKtvO8z2IqrYK5w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOPzlwCQKSnfxXrbFIHLvEZHvnz0uS4I7jNkz5iQ8nOa6vl2ID
	mTWbikKsPrY5MWK3Y709y3A5CwD++VPjDL3EMU/94gFg9eT4nEJfG6XsVlLHUSmUYXNzDBr71Yl
	7iVNz33CwCPTQxwkmK4aNLREmSE3iqXdtKPd++Q==
X-Gm-Gg: ASbGncvqfiDgRGStrbM+KvY+1yhXJp+5v1lSmGEvDhJ7XWNiyyfnIkCpL8HRw3FRdFh
	yrSUrInYvS2u839P76F2FovfuTOiTQm42cI0syBr8np1qAbyzHcOvD6MIPPnW/uDSCytjhU9Arz
	XP1qMTUEk9yi0Jb4zQ1PwZkXs=
X-Google-Smtp-Source: AGHT+IHzF99Jc5zjHiTwpYwDuGNz5KeVf6zfylnYOW5l1S9c2m17qhd0GLM02sExOq6djyUCeukxpH9Gv2n/QOZUitk=
X-Received: by 2002:a05:6902:2085:b0:e72:ecd8:6d51 with SMTP id
 3f1490d57ef6-e7323471842mr15952277276.46.1745918229201; Tue, 29 Apr 2025
 02:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com> <aA-yRD3FX5Nr9ypK@shikoro>
In-Reply-To: <aA-yRD3FX5Nr9ypK@shikoro>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Apr 2025 11:16:33 +0200
X-Gm-Features: ATxdqUERauDj9X-EyfbLPJoHlMhqfczBHusMUQhGDJMr2QFYf9GT2Yl7ZA3WSRs
Message-ID: <CAPDyKFrWrw4ZthJ_GGZQ-qtgrPjQ2j0BoJTVbHH_qA1oTMt0kg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ben Dooks <ben-linux@fluff.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Hu Ziji <huziji@marvell.com>, 
	imx@lists.linux.dev, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <vireshk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 18:52, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Ulf,
>
> uuuh, I overlooked this mail, sorry!
>
> > Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
> > related functions in mind. I think we should leave the mmc_retune*
> > functions as is as they are not "can" functions.
>
> I agree. I suggested that in my initial series, too.
>
> > mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
> > mmc_host_uhs. All in drivers/mmc/core/host.h
> >
> > According to your earlier renaming series, we should rename these function too:
> > mmc_host_can_cmd23, mmc_host_can_done_complete,
> > mmc_host_can_boot_partition, mmc_host_can_uhs
> >
> > Does this make sense to you?
>
> I don't know these functions well, so you are probably right. I'll look
> into it. One question: do you really suggest:
>
> mmc_boot_partition_access -> mmc_host_can_boot_partition
>
> or should it be:
>
> mmc_boot_partition_access -> mmc_host_can_boot_partition_access

The name tends to be rather long, perhaps while at it move to
mmc_host_can_boot_partition and rename the MMC_CAP* too?

>
> ? I tend to think the first is better, just making sure.
>
> Happy hacking,
>
>    Wolfram

Thanks and kind regards
Uffe
