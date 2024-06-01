Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82111DFFB
	for <imx@lists.linux.dev>; Sat,  1 Jun 2024 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717263717; cv=none; b=m1NSw9jieaWB0mmmRl8kYVkB1lLaQEb0DaTsyk7Oj7862k1uNzpfdjFS036cb5zjbQwddZ9CxewMzkWWFX7Imz5Ckkd1WpfpIIJ1Ol0ibgjOTiRA5cYLt6A1YvBZBJSLCL6HKhf4b+bYjfvkqGLeBN8IKPNLy7phM37DhEq3rds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717263717; c=relaxed/simple;
	bh=bsEyydaAYT9XXqTl8bsO2MRBf0XUN2C/EVIikHgV+r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVZnKvLZ1s35G80BSc4NgEJuiuFBL6/8xexFuCezAEeqXVFxGycHVx0fhEPu8mNko1zChmxIvp/rMVcOF69nF+A4N8GEp97kHqab3eFbT1WUMdl/gg42cZ9wOoeCWohNOHBY6SxqUkW3b4JBGR9I7IjQvicr9lfSetsaB43xhtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lz5Yur6R; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lz5Yur6R"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c9cd96e485so65327a12.3
        for <imx@lists.linux.dev>; Sat, 01 Jun 2024 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717263716; x=1717868516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsEyydaAYT9XXqTl8bsO2MRBf0XUN2C/EVIikHgV+r0=;
        b=Lz5Yur6RGIQLqC3yVNhd3rgmTMG+y7+ceaUVdsGMVos5PvqCDH4hIjgu7B5fpvc1Ra
         6W0r4atBGSTcHCcvRs1Kfh+9a7JaaXpsFHsEb9TWCg06W5R3eyRIySVtu9AU97+L8ap5
         +jJwzm4IvZsrN7jwPaZKBcI5V+7DY+yu5n0e9KTgBdy7pAsuikqhMCr/dAWMDsXLwnEZ
         dkqYfo17R0Ia0I+rzhTZt4WaHWF1ancMrWERapji6U57Eipw/J/8//mIyKLbZ0vFwgA8
         LRHvmxJEQfM31VS4bHuqJifHlWD0mhclJMGSx6mdgRUVoYHoMJYNvlna04pcHUDyRP4U
         S4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717263716; x=1717868516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsEyydaAYT9XXqTl8bsO2MRBf0XUN2C/EVIikHgV+r0=;
        b=TbjzaNkg0fhky84IMAJ83alI5Pf+c4VuypL4W2aOOkTQypYnHZpzs6F9ZsNHVLuyKX
         qKNmvvND6AdnWbwHW7Nj3ptEoMTci8qmO4QAL/1VSAyWeeVTg8LvdWnmtqlxwaHGjvFZ
         eIktk67W5Jfo7/HXXJBGaxRBTnafohHK08rSuKICO9LfQsAxrsyW+KgWwG24DLHYE+8o
         oEtocxQ2LtfZgz9w00JiPhzq+rgmmNyMp8wyBA1wsA7dkwiC05fM4rFWBAe0MtNRLeSo
         IE5RkuyRDTOhjaGbu15HO8gZYEfC7zErokAOgMBE6kvnYVPiDiTPVUVxT79MTDxc4Nef
         vNaA==
X-Forwarded-Encrypted: i=1; AJvYcCXuXUG1ETEqXiBIM3BkuDaj9BXHujmXYkXLurDICM1hNIBp9Uc+FtFywdiAXu9ShiCb0f+UODroQ30L16BTab/JR1y7
X-Gm-Message-State: AOJu0YwxgPhTm7XfCIAtNHVyIRWvJuuP0TpXIlaosO2u18RYa6VUC9S9
	975X/pRM+Ctq64GjDw8opzfoif7bDN4cbdhKGMdJVX+UzeNXAitLlM6QtG6u9zGmUCiIGHQeYM+
	KMhO+2HbVlM3Wdnjo9x66RyvQF6o=
X-Google-Smtp-Source: AGHT+IGHnvmpmNTTfNUy5D8KhM5Q3tt4LuFd3aHPkPUX8XCjz3oQInk0yPU6lIldWfbHyomiGJxpxAAi2Pe+xFyTbpY=
X-Received: by 2002:a17:90b:3013:b0:2bd:e950:dfa5 with SMTP id
 98e67ed59e1d1-2c1dc5caceemr4430512a91.2.1717263715898; Sat, 01 Jun 2024
 10:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240601135230.89980-1-aford173@gmail.com>
In-Reply-To: <20240601135230.89980-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 1 Jun 2024 14:41:44 -0300
Message-ID: <CAOMZO5CyZsHEchFuguz2q4VZcO-3qgXT2w1O97WbZZpgFVaFMA@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] arm64: dts: imx8mp-beacon-kit: Enable ADV7535 Hot
 Plug Detect
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On Sat, Jun 1, 2024 at 10:52=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The DSI to HDMI bridge supports hot-plug-detect.The driver
> supports shared GPIO IRQ pins, so it's save to enable them
> which allows for hot-plug detect.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
