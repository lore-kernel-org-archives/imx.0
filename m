Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008901EE7B7
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873647; cv=none; b=nvu21XN4LLP7SGjcTM6atfR3Cc5HN5CDcuKGFA0+ibKB0zrao15K9SoXOt59thkTwNMc3OxOptO+DxdCFjPWEVg0w5C4llrJAD6cfF3ZOEujeHEmFcSL8zI2YhlVj+j9POoSF3QuTya1Rany4+z3XXdeZKFQERSYLeVZ3gXKiR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873647; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZ2Lf/RA6MTSmWfFbpW9cTajJFe0hlDqO+p1WpWPBJ0SZKN+BM9ml9hegospsoO/4EnCNmGG3XJhP8DsREU0YoUFuIwIU9gel9SgbsirZE4pGxmiC0grb3wpK/HmcLzjxVuSjREE6T8qc5hnFuFe0tUPw3CPV3p1N3JOeCwp4hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZcyuAo2P; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZcyuAo2P"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33ac23edso48971085ad.0
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873645; x=1746478445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=ZcyuAo2PR/EbXdERuRfE0cpuUK70VeTGI5zKrfg+ZB5c4QHedV1h6wo4PBkRA46K6a
         oTJCZnJJ2zlA7eiwcRCRyeVD7MiKVtESpY4y4QnivCkrp8CbS185fAXBHIFWsCy/8j+J
         WasiDzT+JayDdBPyh2L+SF73wETNpoa81ZZm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873645; x=1746478445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=dZXf2wBkaX6yy7V6knJDAKyYK3pn6yZTPzljPnyllCyolbYf6KcXeL5bWN42ptoMNA
         gBrDJLw2XZr20ID+r/nZwrTglfZ7URnxSKn2PWxn1vEHJgL1ATbDeLny5Y5oLdwC7UJO
         yUeG/l2rIFaqbPgFzenrZqnLt4lQ7F7D+6AxKwc9L3lliiMNNfeo9IMj2YnrketIBlYc
         I9F2SJzpTKm11tmVU5v5iDjeYBM3yEh6V2B0bKdwgGqSQ8VlZqnl1AcdDIpG0jgzNqqL
         awSZGM93STD+pPIvbtwofeh8diiKdFw6gVqjBD8gzvQtZON95XTqaqktxMsB/2QGTlX0
         QQdw==
X-Forwarded-Encrypted: i=1; AJvYcCVxrmNlbrNkZhdln/W5i4ifh545uXuUzmx4hM1EmYrWKmBE0bA3hioHwW3QGdDf6A1gYco=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVcYwzMy6+E1qybuE2V4NBfC3gtkvsWOHV+veM77rQxqhIz8bk
	5FidGQULYO50ZvQ+GZutCezKS/GOEM9o/wZw92/Y2OtN3+gwziUN/k4Ngci0TfCFM66YUtznLms
	=
X-Gm-Gg: ASbGncut+CM775oirS86AP+VU33uAFGvqdXLLwsbElFlKOps3bxMDuDjmH3rDuE+5iD
	QiT1XG/fzM2BOZ2SLp9FDSCO2EauVHFRawy38RfY+FryfratLrlX1sXQYVztedyCdv5tKvgqVh2
	wrTzXwUyNZG4BmorcPLL1k3vJ7OBtsJDMTLILEAOhV99Qxm8o3UYndPydusShVqo/i3PNwZtZum
	qdongucL0KG4m+knvFzGRBXm9Hiv5zTIukgEFNt9fU89/GnYnfas1GoL1IpMxvYVQvYdE5xAehQ
	n/dquQs+Zm746FVracHXnqsgvo6ZN1caGHQFKCSm8NpMXOm/3M6ud6W1uIkNm+U2xWrE8eyRm2M
	krt5m49D1
X-Google-Smtp-Source: AGHT+IH2erW334uIk0xT7MK+zyXrxAg4egKwKjGYbjxO01aLc+D10koYbnwGXfDwSErU82mZ/3VDgg==
X-Received: by 2002:a17:903:40d0:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22de5fd202cmr14817255ad.14.1745873645397;
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76ce1sm88279065ad.40.2025.04.28.13.54.05
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4205350a12.3
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFJIVrStb7PCokFBuUjbJgSf5gnifddaznrResWW0P1zHIdOoIlcctOlqakjtX2mD4/Bg=@lists.linux.dev
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
