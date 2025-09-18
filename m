Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F388303A08
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758195356; cv=none; b=ntj+BwRkBjfFnltU0YfFI4jb9TpmsG6g8xUe0N7IBsasmXMhNCz6rSSoXtYfQXDdPVUl/lfhJSQp4md8NsbMZ6LYUBoBA6e63epcsqu9FClwajAzfPwgOofu6eOII+yMG6x/isRXr/dUMYC5IQe03ikgPDmV2FUa9gquJTru1g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758195356; c=relaxed/simple;
	bh=CH1PrPamLBcIL2akQUYxoj1jI5NyoHazD5PXsVbHZK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCVj95CEr2mWSwwmjEElEfLsmrS7xNh6ZGw7zwC3n0IJ4Bjkiebsj8GWGkLmqcpENeHpTEEsute17sDey70O5lO4dcAryocPgq08rIoh6xLlhs64Kxts9RzzChTFnO5lsSD+z6/utbZyxhRNjT2vaF6Gx/he65ouUgla0vOiEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZ046bCf; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZ046bCf"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b550eff972eso161441a12.3
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758195354; x=1758800154; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH1PrPamLBcIL2akQUYxoj1jI5NyoHazD5PXsVbHZK0=;
        b=HZ046bCf0Q59iYmoiCUk+TPPy/zRZrFT8ea7jY2GdXtoH+aH1lO6gTb3OIddmIGRCv
         3kk0qq3IG2Zfex9Q9Itt7S8PPNESKAOUpb/mvonlgLiRmDzZ4/vu4ga6sy+6xKOAIhIY
         KfmmKxLEOsPlb4msbMjQ2rNaD8FLTqGcoPCcez8X8X8aasypcsRPsGj/+0LZlBJnefZq
         AD4hy9Ofwc4CUXcEzrtRApbzRxbxVEbaHFMCPQmCl8XxrIx6zWDFv4bySTdlT84wKM89
         ukSJjm8vR9vmZpCekHVPO7NOLU7M827Ldx1DEA682KkrJPkMwzwYNbs76djRCtqeSxvA
         JEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758195354; x=1758800154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH1PrPamLBcIL2akQUYxoj1jI5NyoHazD5PXsVbHZK0=;
        b=A6XAySh6xhHGQ4hEqJ0mpjphI2cxeYD8eXXWfogOPMluEnnlO0u4jbihlOgJDucSfS
         QJINepOk6oUjt3mTWsajcGV6EIYG+ETpXeZdMvsIPohkSVxShv74N90Bdt6WlvHcKNHK
         bv3RZedLYU36lHnmcYwUg6QNARkwM6ej7vYlvFnGvBRk7nBO/HZDJjnfUwcHrcG4MeBo
         QC8FgCDSWZKa+4pPSVkyzaK2Jjcw4mluvg2IQOUD7wAjXDOTH8cqeCFChYPsyTgqzPnz
         5unmFvFbRIHy+5V3/7SMkbgDX+yuOeZpmVff6XpUC9BM0AOtz/27H0lfABfkSwCj3K3e
         8CDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsQqoK4f6VPXXS4ic8RPiGGFhGagF8qKAPx/YL2940US5y+wMyQsGX2bYWa8ASjRtEI8k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcpQZ8s1n/eXskI/MEqy92RwzNNz8daIm5kAX8zjrNhBZXsPsh
	BBaeTE7g64c2R20JmSaZLyTe4clr5xcL3FgknRRaEhmknM/XJ7V55YubBOQCbP9n7MEva1pHRhl
	lA178F0PIdXju2zd2V/KYSkAgIsUS2J4=
X-Gm-Gg: ASbGncv0hFfdFOglxHwtoU1BC7MJzorQHZyOOOFSE6E5YQaVEqorE/hyNEXvMze2ud2
	JxsWRxmM7AlHV4tfVd7AhUeV1lLk0qD8oIMsGfv8yByC1z8ABV6F+TsE0DyAhfJWC/EXEJbUfkp
	DP+sjmlio8kZjFohBL0eaWFNV9NUxmm6jWqLpTysfnaY5/dY+3eWeVkdlScvYtmaRrUeGupcYqn
	EUu6h+68dqd8BrnnujBkO9L++kH71OhO7US8m6cqNV0T6gQvmRBZsc=
X-Google-Smtp-Source: AGHT+IGj6a4sc19wyzd63Dixg/UySiquRPpGXq2m5G0nsVQ6YbTUTB+pMgEHhGrVA5tqjbsOrjjh+YB6F+lqKoiYvWE=
X-Received: by 2002:a17:903:1b25:b0:266:d648:bf53 with SMTP id
 d9443c01a7336-268119b832bmr72456925ad.7.1758195354344; Thu, 18 Sep 2025
 04:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918014053.696710-1-rpimentel.silva@gmail.com> <20250918014053.696710-2-rpimentel.silva@gmail.com>
In-Reply-To: <20250918014053.696710-2-rpimentel.silva@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 14:38:12 +0300
X-Gm-Features: AS18NWCUGtPgOgXzmXtowvoHWKNQHRraFSnJDD8RcxIe00cDqMMkAGlPM7jIMlk
Message-ID: <CAEnQRZBb+FOah-owK2u4CM_ngLm675_tbrn5tdyUTnTSu-Mmbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, marex@denx.de, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, joao.goncalves@toradex.com, 
	frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aisheng Dong <aisheng.dong@nxp.com>, xiaofeng.wei@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 4:44=E2=80=AFAM Rogerio Pimentel
<rpimentel.silva@gmail.com> wrote:
>
> The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plus
> SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
> 32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIPI
> display interfaces, camera connectors, and standard expansion headers.
>
> Based on the device tree found in the NXP repository at github
> https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
> board kernel mainline device tree.

Hi Rogerio,

Please keep the original Signed-off-by from NXP (DCO [1]) and also please k=
eep
the Copyright line from NXP.

Also, adding Xiaofeng for comments.
