Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B21D4351
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805990; cv=none; b=f3MepO8pFMzuoydNjvbx/p/XK3aJmmjftl7mTJkJWMw5N8Z+pYNxdQyOr0VkdvnHTVfXGvOp7E7HA0wg/VP90zLStDPloorBAMQJgOD7+L5n6YcnqIWpaqVUONifzejpGufJkgbAPSjSg6U4/sB/7ilYlS5P2TqXs0OVtUphJkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805990; c=relaxed/simple;
	bh=5QQgUw2ALK33YJykVY7tKUEL4qnSJZInxh6RWYviDA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZlA3AtXzKMX08+3xiMykXGS4J8THHYqTMNSp/wuXtpDUS1JG6BuZ9Jl+YSBi2nyKGymr/sYrrAnmj8miC1irdMyc6MLhRaERoV2I6ZtWlLWxnStcPdtn7PWIl/m9SGf9QpZkpIU/sDEQZrS44FHv9VpF5qiCN078fBGWHkHgEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyuxIqqU; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyuxIqqU"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3004704276.3
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730805987; x=1731410787; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
        b=EyuxIqqUFLgDPPbysawYWU1CCeKKXRfh4clgSdPVefoN13WVbyt/HLCYMdYTFC042/
         Ei3eZ0YDh/+KESKrdUx3DT80mzAFeQcVAmdVbN4vCf0fIf89/NGxp0qrr8R8fPPfexa6
         clrLhN81TU/Jfz6b0Kmivb4bbr64VyVfyhnFD8Z6CseLMSpV7hmYDNl9BetggrZy/M5U
         HQEp+IaQQvYXEWN+rTNk51F9Qn1TmlR5Xkc7kKlbmX3v3FVtjg2nA2xy0EAEHg2qVDJI
         DxrXEheKgggWIoMAZ+tQz9CV6FWYge+g3div25K+/LQ4JFXVgV+6hHnRMdgZ7KHfJ/VO
         it0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805987; x=1731410787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
        b=TNhaCxIIlwOYctnpiai7CE4VRrezvJC8/MX8ZtNEdAaobwP+FODAyQcX/UQI+vD+jC
         lEULD0IrbrdfILQQifgMnrASkOo7RIHh7p3Z82I8YZtLu3+nKmNCMojwnmHzi34BPF4D
         qzZh6W9cKiUNr1kDgSNCtVUYtvTe7+zl9PvfRzD44Wypxk/lHgTrRPCabG2vkWab7FEk
         /laSKYVyZ1TNc/a+520Ymhd1dinEupqoqMnH7dfzlwMue4BiM6sw1aa77n7nkrxXywqi
         jqTOeh4AzR/uTGM29124sxOcbkBj7EFMZ/nDZad1Vz6DbWv068W2MAGFafDjqLMGczWl
         rXog==
X-Forwarded-Encrypted: i=1; AJvYcCVtEIFTg4/ijHGYQlv9N53ldTidqAG1aDDVBRPx3p32mWJ+yvFaaYeWoK8ymDAcLpNkCD8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3lrxnzSJxiAeHfLcz4EI8JDhuE/aLgepJZpT/QIu5dt8aXlxN
	nrmHMt0BjQKFg4pd6wlEh+e9ZWCFx1CfFnmmHGXUeiU7BpkvgDKYRi6QmwQKlG7k1REDJBoclHL
	A6NehTLQwbNU45zkD7rj07lAzrKxp96WhaA4T1A==
X-Google-Smtp-Source: AGHT+IHwht1pfSwQlaqWWbyXJaYST2v470nqEkV0Y3tMwYWqipVeiUaNoITHKiBik6whym2zw0rsn51UBBneR8aGa1Y=
X-Received: by 2002:a05:690c:fd0:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6ea8d6fb48amr78680707b3.0.1730805987251; Tue, 05 Nov 2024
 03:26:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com> <20241028023740.19732-5-victor.liu@nxp.com>
 <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
In-Reply-To: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Nov 2024 11:26:16 +0000
Message-ID: <CAA8EJpoaLnw46DUaZ+z-YSkbdk-f45-dKMjoQWu16zaC6i-H-w@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,
 JEIDA}
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, 
	nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, 
	biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Nov 2024 at 10:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ying,
>
> On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> > Add two media bus formats that identify 30-bit RGB pixels transmitted
> > by a LVDS link with five differential data pairs, serialized into 7
> > time slots, using standard SPWG/VESA or JEIDA data mapping.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> It's fine to merge this via another tree, too.

Thank you!


-- 
With best wishes
Dmitry
