Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD081A83E0
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 22:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288550; cv=none; b=dJa5L2KMSSm8yhkyGci9Nbp8CTZLn9eVyZPQqCXTJAOz2CrToY6xCmfeEd1bjeQNYu5KPlJwtwgPde+Zy6zYeH8OaPlNmLwi3a9WbDfNa3WI7azK6QFkG/Hxw80hqenCFLErwJzhsEsXyMLDwtKeJvQgn2n+sUjpCcf8HnK+VSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288550; c=relaxed/simple;
	bh=/C9V9k4oRr9NIMlvxTFyU0lVbVL2D3A5g1PZx/mlgWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IegkLqxk4u77XzIAJMfY2UbKhsALrIgIjRk/5drfCQNUvkSihYZzy9c65nfeDT8yC+1lpEDln18015WFg4xTn8GUdOu1paZzpWTElIlUpJerLYCCC36Gxtng31+8Tmrs+hTlCzN/0tbulvXzQrieGZzTRmMNj4Kwc0thBlrb89A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DrrrM2gq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DrrrM2gq"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401be44b58so16974103e87.0
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736288546; x=1736893346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=DrrrM2gqoG5dP6llykmiTbGXC23c5vRIeU1Iz/tbZCcSkS4aOLJqE6cFLHPqp8rewP
         zs+Q+dTXA3jp0/DxJl8Ivwfpn7ZZxc1XBUel6pAJp5OM/o2TEl7F+iUgC/3waJQ/cd3I
         2QqmVZJMDgeJfbZCMX5YWUxeBg6tRpWzM582V+wPbL5PuDBfS001rkDyYDw5ZLOr5SHy
         aOXMrSkg01i5DOC4+y8j6mNNmpDs6wVV4qqf3cyjhJrGCKSMJAhwtVZcp64zoEUEu8OY
         c+s00sgrL6Pt/AW36leJg0ThjnzEmwT1/e5DUNrWsZ85F3LzD4FECHXcYPQS7n7P4hvf
         aDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288546; x=1736893346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=VTZBzQYvV0kBiAWQbIUwYd7YwVEuOx+9fyoOxAo3BV+JTxuBJxQUwFjI5Li94OQiWx
         fOWpYY2tVVHA1j6GkNNtQbuRMy67XNZv88Yb56XI+6JLlaDo7QWEzRRi8g1oo1wycoAm
         NMso7Fpv3KnASokDUt0lHeF9EWId22Gum0riHD5Zuxq6exJgGf8jzhN4sDqhn0GpYVL7
         94xWWMnm01GzksLXtE6EmDUBjVb+fpshu+04G5IpLNFYB6Kp40eFDvRdJrEy/ZjWYtPd
         34xmLwIUULaWJc4Zl5m4/3CyIbNjeELQ86dMvam8ZxZBUbuUHWc2xq4OUsUSWZCPFL03
         aPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQ8cmB22koXXWqjQhEqXBYfxOAP8D4sCPrK6wy343ak4Lw8Wo8X+fSzSsY8ynnO182hc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO/VhNxd1gdIAeEdQ2jZGkrbYwdLYx2VNjXw4AbxVfitBUAypE
	VHCtl3gFqBo44lGw17yaEj2PT39IAiXWXx1EFohahizwaDtEojt4/V6XsH/Est8=
X-Gm-Gg: ASbGncsxlf3hL6XZlZo/UZG1akk2F8vfCjvfPavcqDz+UQ4S5WHcnJ+G55J/28sUX7D
	Pq+m1PoEjZ+9aqnqG5V1QD6I8O/JvgX4PJm0zRjWpjGL9CUe55kQ0L/8EOgk8sOyXiFYYx3WrB0
	J+gypb8WjI/BhhMwRURRhiRlu/aVEIY9Ne2/9oVh6FjZtT7sf5g1yxIWNhbpnXOkxtR2FkJXwOK
	vQZibVbFNMPYOpUkaGpyXMaRDeV2c8+vntBzXqspihsOHN/W+/uElef6XxdUzPejx2svXoHBYm2
	awWo7kwFmYgGkLivWqfa5xmufIS9BBetFaBz
X-Google-Smtp-Source: AGHT+IFnS+89P+R20rxSVwXMFgmVIida5oAviwnvCG7UgPRL6sqycM/IAnw4EINYUJaJOUGjeMeCug==
X-Received: by 2002:a05:6512:23aa:b0:540:358d:d9b5 with SMTP id 2adb3069b0e04-542844ad98bmr149812e87.0.1736288546084;
        Tue, 07 Jan 2025 14:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b6csm5379607e87.273.2025.01.07.14.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:22:24 -0800 (PST)
Date: Wed, 8 Jan 2025 00:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Mahadevan <quic_mahap@quicinc.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <g5u4xazpsgoxes3bwowufrdd266uhwqw2qidqs3tm4wq2qbk6h@bpzh4cnwybaj>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 07, 2025 at 01:58:51PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

I think we can take it through drm-misc-next (or even
drm-misc-next-fixes) once we get acks from Renesas and iMX maintainers.

-- 
With best wishes
Dmitry
