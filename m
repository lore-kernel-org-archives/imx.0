Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95EF2F1FE2
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255872; cv=none; b=d+H0/gTaUmb5aAjYlFpX6dDaikG9WEcb480XaL5aTMPuWK33UWVnWJUgTzDlqfDNN/msB3d4Mrkp1d7YC8UbzQeLbfwwgDHyJai2rKWSCujN3TScbdtF9bfIejxwtJElflrKVE0tg4oIglqF4E27UZP3DQTzaTqM4/AQ8aIwO10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255872; c=relaxed/simple;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y87NKmv+/iq+iuHsnrrLfYbD18S3TEHJPShfKAHHNI0nlGZqrWRsk1A12Gft5eanEwx3YsNjkcms5zURrv2n1ooPjssWocnEyqK6J/O2aH1qhpmD7u6nXeFDcL79bbyVLbnqvli0QJzc2AMF8pSUOcHKMCW58EO/R9Qi2EUJuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXRqJh5x; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXRqJh5x"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b553e33e6so18271531fa.2
        for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255868; x=1752860668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=wXRqJh5xlrlNaISTsneVCRmR6Y8v1Mxcqcyj3GMV2UICfjrqdFBlEi9YZ1wfhH522B
         qZ/+oprGZ1mswX9EATAa5pjrR0/zsWRGudJmfbF0SFC5x6WsDfvbacVmx9b4fMuzRyeY
         o7tbzcD8ys5liHF7EQmQkWiYv7neKYSs5m69NXmtLMByzAoQY/J9+NHBq6T8CDQnR6W9
         wuxv3wvRjg7D/u6GVzHhC3qwO8PTTRQ8ED140BhgEdmtN06MVKYKxGs6lf3pMtCM9PUt
         Am2kphJDiskt8oC6p6woOj0kaGvAVX6/vZoYAMfP/XisJFGPufWJwuqLN5zEvxmp9CYd
         9XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255868; x=1752860668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=cofUsDQuAgm6fXBNpvS9A6cwnpwIV5PJsMTRc9HRoBLe+ykP/2avxy/7BysLVOOMyG
         uT2nSP4kfjphqljWvGlI71O2gHI9rUT0a61MoiU1PKnQeBmzRkoVPoefqlRIS/BDLhq4
         WytcErxuN26Xe+eynf0gGLe3sQAT8iH+MVBgvKeQbBDVL9817BWxXx7Mmbj6tX5rWgwf
         FUlbm1f79RAkJ6ax3y+a57ny0AIHSyqF3BoaR23h7m0Jmtyg0S9wXZZz7A5SEpGu+dV1
         b5mjpufIHftfct/qvSxCYcWtXoQsYCM487lfbfPYWfh6id9seZiCy0/U6DKndPs64yVS
         R8XA==
X-Forwarded-Encrypted: i=1; AJvYcCXfH5Gn+z8LNc902MQb3zpE9KIoML3ZBT3dJB0yDKaj0L6dg05GI+v6+MwyjPTOTNJgBi8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNDIt/Ojspt1aznOkFYpilVN97CAla/s0/JnixBnlU3xsswBgb
	8Lq9usUGqANLvbHoo7Cj9w3Ryp7Hky4R4P0Q2NdlPulbaNNeShSmg62Yjb3Y+Av1pbRnqzco1oT
	lO2zOM0z9eHJnUx0QHqivnM6yIxmGRXD59jKezkUw7w==
X-Gm-Gg: ASbGncuLLHXllmF2URGuUhKVH3RwOW65YQIoHzAB/cvwfyi/TWwonm2zPheAfFcCywI
	Coh3x2JDela1tpbFyTh5jxz6uZ5t0bSuvWNZjX6AayWX4h/1vzV6ELINSonhWXrF3FGQSenICN4
	TVBDVqWlnjjTcvn84H7DKoEgzysyLsAvGBgy4lnbqf9wbWnbSs+pXCeHpvejj4fPLII1+Q2mQ55
	d14mu0=
X-Google-Smtp-Source: AGHT+IHCwFbr6hM4SofCoKFNuaGsZexul62ZHJaP09xPkxTc5K3eZJNMRyy9Lqm+DJrLEpWrNm0Dt8rNW5UZHZ3ILnk=
X-Received: by 2002:a05:651c:111b:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-3305341163emr16031911fa.25.1752255868348; Fri, 11 Jul 2025
 10:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:17 +0200
X-Gm-Features: Ac12FXy5w5LZfYTJ16GWumg6iWoXPYqfrbZ0euf79O43X2SKG618Bj4k3h1lAGY
Message-ID: <CACRpkdZus86rP1BiSw2j24eaSuMrCEorZU9Rc4ouWmmz8iaqhA@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
