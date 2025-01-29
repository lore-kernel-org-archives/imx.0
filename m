Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40D42A80
	for <imx@lists.linux.dev>; Wed, 29 Jan 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738156696; cv=none; b=ZZiMAg9S6FAyI2N3/oBTCEclanOxHgLEoFayyB9LytKDFzP2FHBUZ/1LVQwP0EyHvJpSqK2Uj9yDKzfbgN4p26fwhlNs1Et8/EgzwWtqGfMFavHRoW6BYsVJDUcoXWBZ8awS3Lj31RcrEJENuVMVoNQv0aLZts2yNcaop8Opxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738156696; c=relaxed/simple;
	bh=3XqX4J11YN9y8rkaksX0x+FoIXwM8FEnpGRK0+mZvaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pP53hVFKoJx4cntZtIzvvWAVzKL8RHJ1TMfFXuutBECNvpbiGTAvSdK1rRcTa69vee/LX1NMqrlEPldd+XbSsa3grMOyQBgAdtsuD212IlNYyJeLmxjmqHLHSszDAlcudAl8QDJu/xkuiTJi3A+VU0QyTedwwxnVVlF/eWkm5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gvaq8D3z; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gvaq8D3z"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30738a717ffso59974531fa.0
        for <imx@lists.linux.dev>; Wed, 29 Jan 2025 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738156692; x=1738761492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
        b=gvaq8D3zmFoT/esfj8As8JIMWkcp+MjmUHD+lHp38/oJOLMIJFHNX5VJbvQOEcZDwM
         F7HOJNFZcWgFsdsHoBdExMAkGRnJcwxUMNHmvGDvXgKqyRNfSH0oLC/L2eUwT5f1B+cZ
         WTzYp1jsticmqNnEuvEDw7rXlNP9Z3cJralt8VoHWE40YHrpg1yfKTq4vzIPfGVWQADN
         z+RijMKK0tz8kLl4IAUt1QZhR7JcXuam4mK6qJjLvQ8Q7KuCY4o+2iabjxcrZMPmr+rl
         rd8JRQ831BJ8sUZN6CT+nwqi9U3AGTMhXwB8d4Ps5DcQRM4DA+f5VxDhNMiFOnMMIkGu
         riIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156692; x=1738761492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
        b=CEe7A1lUMXctMQEeXn6KoH/Czf4mVkl98XrFsIUPAG/l6Ms4CK5gkTcem87BLb3ya1
         Z97fcdLX6OvScd2lAotMBxa/qKgGITZWr86DAjHtd96vIiF2nrAAWqGj7lI5pDX6vwSL
         XWsbBoElmZUXS6okPfqR4VY9Dt59RgfsaWKh8xiB5VIEnSGSNS47IoVYzZdsU1N/TNfF
         uiGUepeMvjNNy/uS6967kXbbHf2gOBEhTiN8mRF+Kcmyc9A9u6drbqz6XvCGSoBCCkiz
         IpM+TOCrFJw/yiitU2wByoSfmWmFuuvp94LG+xtvU5Hf0cZlnBMmYrOrwqNGj4QEiZAx
         dRGw==
X-Forwarded-Encrypted: i=1; AJvYcCVYFJclz2LrDNo+iU4Dv6t1v6XkCI3dZfzYwqjz8exR9QG5y5+dI6ylgSnxfkyab8U+aa8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyow1Y8z/SyvF+xL8fdg/jP/8Yu4AdAC4FBVZM/2Wruuu6Mv9+w
	q5N9iFGXOukegXLZjVrffcMrEqtDBY0v5T8VFCy4mlg6uG9LbFrEpzdiEE6RHKsPzRKO79I5jR5
	U/8Gm5RlfmbfYVM5BXC8gygKUnXIzlokSNlQRnQ==
X-Gm-Gg: ASbGncupDS/ZST8rVzXm0ZbNWag1TsGugcjWliidohZNH+fGE3vKg+5oQ2hawowMLXC
	DY4Gqp9I3+mxoGXX4N9VBqzbbc/aQrZbiOI1EqpzMe5YxeqorL+gedagB6SjkfdbFW5C/J/w0TP
	uZ5waUUv1STlf2THf68wJ0STtBhpyM
X-Google-Smtp-Source: AGHT+IGFRC+m+r/a8Okn6oewxCN7IKGCsP32ORqURIUMiUOfm5o7kOj6AXMqnFWDbj2MV05dJpu5VXuc2FEJhvoxCWI=
X-Received: by 2002:a2e:be9c:0:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-307968bfa7bmr8911111fa.3.1738156692452; Wed, 29 Jan 2025
 05:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com> <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 13:17:54 +0000
X-Gm-Features: AWEUYZktkNT_EsHcnViFnfugP1naRJeQlMuaRyszOFwlglEWr7DXeU7KaxFISbw
Message-ID: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource() usage
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anusha

On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915e24=
a236f620bae932c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>         struct platform_device *pdev =3D vc4_hdmi->pdev;
>         struct device *dev =3D &pdev->dev;
> -       struct resource *res;
>         int ret;
>
> -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi"=
);
> -       if (!res)
> -               return -ENODEV;
> -
> -       vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -                                              resource_size(res));
> +       vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname=
(pdev,
> +                                                                       "=
hdmi");

Whilst I totally agree with this change, why was only one of the 8
instances of this pattern within this function updated? Is that a
limitation in your script?
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdmi.=
c#L2957-L3020

  Dave

>         if (!vc4_hdmi->hdmicore_regs)
>                 return -ENOMEM;
>
>
> --
> 2.47.0
>
