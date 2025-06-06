Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF6288C23
	for <imx@lists.linux.dev>; Fri,  6 Jun 2025 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749218175; cv=none; b=WKrKB4X/NtlhGXWPUhe9HWkYBvL2/vq1VJ6rNWjns8mjYa/8ci998zNcH8osUF6fNKHTj58BbufqK38k6oAnI9gbMfDI2HbtghMbvKTTbHoJ2xTBATDfgfsSJEP1j9e5OnE7sG//thDC+BvseLBATuxtVis/31IIDn261x4fyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749218175; c=relaxed/simple;
	bh=qN+pnPVxT4gL2Vpc8rdlce79GZAw4gPEct3l5HddHvM=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=cPAmAe4ipbr2rN2UOIdHdzml649/yybLKd7x3Dtpx+RgFO0Kl9YJPvTXcrYFf43p+xgQJp0/CLliIjUBl8K16gZmxAsdmemlvQ2g54CniNO96ud+ejyip4FWCJCLp5C8P8qcY7zx2lqd34scxoojFehxp1swuf7nlZtXUbbev0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM/VhSbH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM/VhSbH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36e090102so1299561f8f.2
        for <imx@lists.linux.dev>; Fri, 06 Jun 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749218172; x=1749822972; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=;
        b=jM/VhSbH5sOO5EdgnqHqep02MPQRMGXFcgkRWt0a9cGxogFt0AHMK/0uc5mJsL/MNt
         PLKaXx5DN1ZkLj4ZB8BlWkqs4tGaqDHDS8nD+mOTBeUBSNtlvKjIYBIST+X3dZ49Br1i
         StvarRKIib1CoiRsUbLyMhsuJhUiqLnc0lA3TVE0/NkllTBftH6LzmXUUZKAYIfNo1Zx
         m/b5RKGttdgBkPut2ZoZUxhePOAXFaXAbAxTIrDKyjkxDLzk7IsHQWFSggUQ/Day1jOI
         q9pViwDEl6Dv5UXQIvbq+6NwP8qXfVV2dsGcuKxFnIQgLxi4YKldSE6VmkxHxnxR+Sm+
         NQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749218172; x=1749822972;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D02VVevmOF3cQxFCCzf3uOD2IZ0DFegRFrqZJe6cxu4=;
        b=gLXgspznfKe7ur+jJgexahgt5TdXhbIK3OqNvPFJUnqxNkA47khGgOvtQL9+292Q8a
         7izGbWFe8REwqh1iIiuRGRAl9aS6GJPmXwc2aY7vnAs//nTLsILX7Iiy+kvP9UJDmY1x
         Sqfn03MA5pjkzTrdLclx3yocJ4y7ANENrjmD3t+45OKL6ZdkfxIfKqDnhTW+YLt55aiI
         sGq7P/iPHVdW2c+FCSn0bsz3qNdSS0eQql9HuPnf+htbq2anT/9Ym7Qviwa5ArRPO8yT
         fm859+C/T7gmJJLgoY9clSw8kyYg5VaUSKzw5AmG+70NSzmWHfcUQ8AxcEhj1vK5Jk3f
         FaiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV06oAmsKEqVVfGM5TqTDiXWo4i0359BoQbLjOxCqPxOxhTul0AqDNR94ue9m+CYEYNcZw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyztvSrfv9Y7HBEBCWPwVgEpYlEj7nBnapgJuplMRtOTnTcprbt
	TF/2cNkkdZxeMEbIpqEuzn3RqdDPbgzz+K8/oRa1RtFDTyiJKy4UPYqN
X-Gm-Gg: ASbGncsfRcPTqEfV4xqnOVuQHYXn2L+gEUuofeziJEJQrgU3b7DnlAA9VJP9OMtrUs1
	Wxdg3FMRAcKuiuXOXe9OG6S6XWAND/8zGERhuLU7YBS3MXC9Bgf47aj8ycryFoFYgRwKuEE5IwM
	HNegI7cYgJhp96/MKWXQiNp5Dm/k/1kZDPzU6hv3NfQw9JwQMVkzkci35zIgDaJaQXrTuuCQ+yn
	B2YhnYJuWHyu5MhYEdV4vfvUlb1/SJpPqF53O0DbvOo9WZe0iYH9xJ6MokQnByqOkO2T86KK/8c
	cIp52RSKSXw08yulC3vyT6koxnWf3x8BuvtEtEhaXk8hfe7gc47jVnzJ2vjLoG0Pnxaqt/4SvGd
	rhI/zUDLz+o5Szw==
X-Google-Smtp-Source: AGHT+IH/4Dz7vdItmgmTlnNXWLY79bYjxG+RnGnF5b/cbxCPhJ2PE6r5VIZGSsEVJ0iX7xCVJcwFng==
X-Received: by 2002:a05:6000:18ac:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3a531cba357mr3281306f8f.54.1749218171799;
        Fri, 06 Jun 2025 06:56:11 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452730d161csm21907155e9.37.2025.06.06.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:56:11 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 14:56:05 +0100
Message-Id: <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
Cc: <kieran.bingham@ideasonboard.com>, <rmfrfs@gmail.com>,
 <martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status
 registers
To: "Isaac Scott" <isaac.scott@ideasonboard.com>,
 <laurent.pinchart@ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
In-Reply-To: <20250606121403.498153-2-isaac.scott@ideasonboard.com>

Hey Isaac,
Thanks for the patch.

On Fri Jun 6, 2025 at 1:14 PM WEST, Isaac Scott wrote:

> The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
> status sources which span multiple registers. The driver currently
> supports two interrupt source registers, and attributes the
> mipi_csis_event event entries to those registers through a boolean debug
> field that indicate if the event relates to the main interrupt status
> (false) or debug interrupt status (true) register. To make it easier to
> add new event fields, replace the debug bool with a 'status index'
> integer than indicates the index of the corresponding status register.
>
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++-----------
>  1 file changed, 31 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d060eadebc7a..bbc549c22aff 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -249,7 +249,7 @@
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> =20
>  struct mipi_csis_event {
> -	bool debug;
> +	unsigned int status_index;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -257,30 +257,30 @@ struct mipi_csis_event {
> =20
>  static const struct mipi_csis_event mipi_csis_events[] =3D {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" }=
,
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported=
" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},

Maybe instead of 0,1,2 (magic indexes)... we could give a meaningful index
enums names, don't know, like: main, debug, user??? or something that
you think is better.

Cheers,
    Rui

> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even fr=
ame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even fram=
e" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd fram=
e" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"=
 },
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"=
},
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
>  };
> =20
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, v=
oid *dev_id)
>  	struct mipi_csis_device *csis =3D dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status;
> -	u32 dbg_status;
> +	u32 status[2];
> =20
> -	status =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> -	dbg_status =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[0] =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> +	status[1] =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> =20
>  	spin_lock_irqsave(&csis->slock, flags);
> =20
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
>  		for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event =3D &csis->events[i];
> =20
> -			if ((!event->debug && (status & event->mask)) ||
> -			    (event->debug && (dbg_status & event->mask)))
> +			if (status[event->status_index] & event->mask)
>  				event->counter++;
>  		}
>  	}
> =20
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
> =20
>  	spin_unlock_irqrestore(&csis->slock, flags);
> =20
> -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.43.0



