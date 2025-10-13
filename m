Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E55211290
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366896; cv=none; b=Mwixy230A2jFoLSOQiZx3DU1xoNTuBynIgzzVrLN06j5C79u/HeLIZh4Huy74h+UOhezcFbx2cbhPXsJE3lbGvntkVLbcMawkr27mtUqKAgFqjrE5c4kwz6abTmNZc6fZA0D+LRemd25I1X3aUXRVSlJcfRxn+iOSjtPrLCCBpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366896; c=relaxed/simple;
	bh=a8rzeaiQ54tOFcMOe+sIUa8tfmcif5r7xjlXNM2RFaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWBHIvyHf2AmxE5cN6qeueYlxaNaDebrN1bzL2u4aGiED2RAsCWDpqp4KP9noF8vZNxlHAD9urWuCy/kGTqt6jH4i0Swl1YsQHGPgDNhuQPb5GYF6eqLe/A9kfMOetR37H1lnjexXdbIaJHKXwLcQGb8kK3vA4NjSpw+Ke76IHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso77745276d6.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366893; x=1760971693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=uWbLRQ/c07zJEawFxQQL5xV3BdlAZbhb8DG49PI48cFLY/NjpSQfTAego8y3VzFEBQ
         H3LSUKsbt4uDj3Mqp4uRQvK1zyzbO4m5Hsjseu6KpOpy7KMW70A+BV0oNVFnwQNaJZjF
         IVZg7H1QcYOm0mBc8FBKPUjRSXYylmtd/rQsfOoPbgZytF0LtKoiUT54j0firn/BcyJd
         x4kdyZTs0cuiC4S5pVjNphlnaJagkjbSKMDrHd7E3xwN2WtSEbdm3uMQXMWlHuC9qicr
         6WaXmr3XkB9+/P415vxFLNLPUae9LWmfuD7RcYd1Ydh53Zh7FaFEzYLQ9cz4IRyXm7Az
         3PIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEQ+l71eQmcPbTDOXUqSDO9ws5QhpCA4Ui9UE/nupbPhVrohRMZg/ns+LpQjUCFLx4iGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgY6Hl+6uCbXMqpcsVCsv8S99uN3mom8KPmggiXruvIKEksR3X
	//VdoIbMpElfuQIt/Iw4ObpmJYdE6KKnIVxdvsiycTEIHkeaNJq07CcDjZs8tOnw
X-Gm-Gg: ASbGncuHwIo7iM7oLXgYelb+/4N/8YJvjdyGeYDIbaD+CBAnuTxG3Oz8JB77AvA0hcx
	jeKg2xWmwZ+Qh4OZ66PKrtI5wguzDIZ0mZzhpW+AfXqDTbfGiYasgKhcqC1RGACmKqWVD1usY+v
	lGqjs26nDR0Bz/sTK3weo77ln4quzx2VEOyeQxh3lsULtSCtP5uneJkv6Qw36OAcxhnq0QPWnI+
	4ZVKSR4GDrpOSiI53O6dVBYTiK6l+nTA8Gbaipkf2NUtntyH7E+O/TkpOy6k5qcGyE/4JmzY765
	uogAvCHB9ohxwJWYT5pHXrepL//GfSECVTTxdf78pf2sHW+Uu0TvYWgo5eUYMdOS2mjui6zoAjH
	gWcesLXwK0aXo01VCNoTty81I9v5ORvj2rGbIntWXy7RFOdWeP82EM/42IPDqpKsdnTwiT0dc74
	jrGRx0xLKY0Jm2qA==
X-Google-Smtp-Source: AGHT+IElqP6oqnP1kfQMfLgza032VA0stnxR1WpRqJZVvjgSn0CcIAeG/z7QvjJ4yjPPaRrXqX8ntg==
X-Received: by 2002:ad4:5e88:0:b0:78e:d8f0:66f0 with SMTP id 6a1803df08f44-87b2eff08a3mr322330826d6.51.1760366893371;
        Mon, 13 Oct 2025 07:48:13 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3594630sm73010406d6.47.2025.10.13.07.48.13
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:48:13 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-796d68804a0so67493466d6.3
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:48:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+F86fV1Htr865K9hHThqEt6SHWCf7KBscem1KaLiyIlRac5ruNQ5PNB6LBCOGUyJDHMI=@lists.linux.dev
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
