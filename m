Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3851528688E
	for <imx@lists.linux.dev>; Fri,  6 Jun 2025 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202112; cv=none; b=B0HsddHMJGphXKzTlCSLHcXR2wm9YzmuNdF77UgldkHb/G4LnMt11Wk18TP0mVyJMqVzJ6ZpchwBK+yYNxML05HHNj+xkbJ/esSqtU9kTs04jxyc+KyI4WySiCi3BBivD/UR98wdmLvKANblo2LEVCOX0GcDrzAOCbm7pUG8yF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202112; c=relaxed/simple;
	bh=0doAiajRRvvEMk5cGmmO3oLLBcTxRUG2QibubLx7Mco=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=G57RblyetpFPnxFtECIuIYNzWsb9wl8HAceah7NOBkxOvvlR0ow1KpD90YQ7/V+YHn/XRmbF244nOcOWUIXulsGucqhWuOaWjSMkA/DW2IDe41lNU7Qd+CoaLEeC8no3UoQ9NikUO58tHLkY1xE7TAMqoe1wQ+0YusJBSvnha2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7fMgOoL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7fMgOoL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a53359dea5so206841f8f.0
        for <imx@lists.linux.dev>; Fri, 06 Jun 2025 02:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749202107; x=1749806907; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlmfCFjMuzs1N1lUzyEgna955CGY1iJJdCz7vJgm8m8=;
        b=R7fMgOoLg06p6mtqXYWG54gImhwdDtd+bvUd5NpFop4FSzkdvhZZHtRnm4EV7ITZcj
         RLsSznC537AdBNG0i+QxyrfsSIB4DsO5UkjXJNACTrJABAfpiAydsTfVnJf+eMxgzO/k
         NGEmNdDHK3XSxycsA4shpM6Iu7R/hKDW7OO2hD147MARrAjFNJ913keHIupptUfw+Tnt
         tauAfd+ygNCDI+hJaQUKL54fErlZ3Ne0ec+nNUUS2RxPQeGR89pBDSFpPfc9W0LNTZoV
         k7+jMazjVsIioZ2iWYxjs82TUDWMLXU1OSxsBvnpLbB6Oq7mSO35XsHUsOnicfq12lSX
         3eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202107; x=1749806907;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlmfCFjMuzs1N1lUzyEgna955CGY1iJJdCz7vJgm8m8=;
        b=n7CF/su0GySCMG1lytoGnFDuhxI1O5qsdc8kXw5WbBnXvxXxPy65i41AyGVbb8pkkU
         SSCz/cVUEjF3Nx5Py2FZ3iL3YK22oTF3jZUtdrXPs0A5wBjfoqXJL74IRiVdpbke6cpP
         KU66Trc63Gh0LHCqWp0jX6WXH7xa6Qe5ox32RBzWpRx3Xn08vKZTv/wLjQxCWIZUdfEJ
         jnF61v1Hx4zGGiAtT/x3WbEz+O9BJG2kt9tML9W+m0befJtSpj2NbhE2gbfTfnQmuqEk
         /CUuI7rnJy5WoBX/l4HrzRUh4fg5o2RSjNP0LrswMoTCzBEb7Iplxz/zEPvKCkmx8DfD
         TDLA==
X-Forwarded-Encrypted: i=1; AJvYcCU7hHoJ/M2+XkpRjKbg4H/Kdscc1QOZj98ioXiM8VthcEwpkTP1vCza4bacH8XxBEnraos=@lists.linux.dev
X-Gm-Message-State: AOJu0YymPkLWZk3LgxURUAuDtX824iDFOgAiQ7j3ranT+0/gJ4tQZpAz
	jPmyWzTSy82G6rhRxwvFUCC5c22hi1mvTJxzGnp73kWkp0XqpnC1ZdRR
X-Gm-Gg: ASbGncs8MEkg/vF3eHfN/dUU7/6gGdOIH+1xc3ikZlUIIsAC+dR/ffazwNqUZ1gkL56
	xtbIAGXTmb/rLQ4zNAvzyPX0i8umXX0E/UDnTyHz2cMC3zjegzQO/2aEUg/AJM3NWTZBTe+vHks
	gbnl4tCKNlZSAA32c3JA50rdYy8RPr6pVAxMo6b1j86yDxHI7DgRliEcNNTpiOjRvaocJIC9++/
	xRtFfryxjYCfU8k9AX5AN7zXgJ339AKhU2Ja1EQcrbfUc1HyeblqqojMVXzfNSLSL3BGv6RFZgL
	cD+64YuDPh87RC/LPt2TIK81nTXUT/gBJXxqZxmRVv/QQW96byRhmTPlj3EhLAXSXqWX8NtLOaW
	QKqw=
X-Google-Smtp-Source: AGHT+IFXqDfgMTtfe8cy9h2sP2ZJe7Kh/xgvxpDhb7elUjTlSiIFsinjlxm/PD0rKLcQuBTqLIbUqw==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr2268379f8f.58.1749202107146;
        Fri, 06 Jun 2025 02:28:27 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5323c0819sm1302118f8f.45.2025.06.06.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:28:26 -0700 (PDT)
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
Date: Fri, 06 Jun 2025 10:28:25 +0100
Message-Id: <DAFCE9SLVTFF.2T9D30I3PYO02@linaro.com>
Cc: "Rui Miguel Silva" <rmfrfs@gmail.com>, "Martin Kepplinger"
 <martink@posteo.de>, "Purism Kernel Team" <kernel@puri.sm>, "Stefan Klug"
 <stefan.klug@ideasonboard.com>, <imx@lists.linux.dev>
Subject: Re: [PATCH] media: imx-mipi-csis: Use CSI-2 data type macros from
 mipi-csi2.h
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>
References: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>

Hey Laurent,
On Fri Jun 6, 2025 at 10:05 AM WEST, Laurent Pinchart wrote:

> The imx-mipi-csis defines custom macros for the CSI-2 data types,
> duplicating the centralized macros defines in mipi-csi2.h. Replace them
> with the latter.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

All looks good.
Thanks.

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 68 ++++++++--------------
>  1 file changed, 25 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d060eadebc7a..2beb5f43c2c0 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -28,6 +28,7 @@
>  #include <linux/reset.h>
>  #include <linux/spinlock.h>
> =20
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -229,25 +230,6 @@
> =20
>  #define DEFAULT_SCLK_CSIS_FREQ			166000000UL
> =20
> -/* MIPI CSI-2 Data Types */
> -#define MIPI_CSI2_DATA_TYPE_YUV420_8		0x18
> -#define MIPI_CSI2_DATA_TYPE_YUV420_10		0x19
> -#define MIPI_CSI2_DATA_TYPE_LE_YUV420_8		0x1a
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_8		0x1c
> -#define MIPI_CSI2_DATA_TYPE_CS_YUV420_10	0x1d
> -#define MIPI_CSI2_DATA_TYPE_YUV422_8		0x1e
> -#define MIPI_CSI2_DATA_TYPE_YUV422_10		0x1f
> -#define MIPI_CSI2_DATA_TYPE_RGB565		0x22
> -#define MIPI_CSI2_DATA_TYPE_RGB666		0x23
> -#define MIPI_CSI2_DATA_TYPE_RGB888		0x24
> -#define MIPI_CSI2_DATA_TYPE_RAW6		0x28
> -#define MIPI_CSI2_DATA_TYPE_RAW7		0x29
> -#define MIPI_CSI2_DATA_TYPE_RAW8		0x2a
> -#define MIPI_CSI2_DATA_TYPE_RAW10		0x2b
> -#define MIPI_CSI2_DATA_TYPE_RAW12		0x2c
> -#define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
> -#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> -
>  struct mipi_csis_event {
>  	bool debug;
>  	u32 mask;
> @@ -357,116 +339,116 @@ static const struct csis_pix_format mipi_csis_for=
mats[] =3D {
>  	{
>  		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
>  		.output =3D MEDIA_BUS_FMT_UYVY8_1X16,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_YUV422_8,
> +		.data_type =3D MIPI_CSI2_DT_YUV422_8B,
>  		.width =3D 16,
>  	},
>  	/* RGB formats. */
>  	{
>  		.code =3D MEDIA_BUS_FMT_RGB565_1X16,
>  		.output =3D MEDIA_BUS_FMT_RGB565_1X16,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RGB565,
> +		.data_type =3D MIPI_CSI2_DT_RGB565,
>  		.width =3D 16,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_BGR888_1X24,
>  		.output =3D MEDIA_BUS_FMT_RGB888_1X24,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RGB888,
> +		.data_type =3D MIPI_CSI2_DT_RGB888,
>  		.width =3D 24,
>  	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.output =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_Y8_1X8,
>  		.output =3D MEDIA_BUS_FMT_Y8_1X8,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.output =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_Y10_1X10,
>  		.output =3D MEDIA_BUS_FMT_Y10_1X10,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW10,
> +		.data_type =3D MIPI_CSI2_DT_RAW10,
>  		.width =3D 10,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.output =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_Y12_1X12,
>  		.output =3D MEDIA_BUS_FMT_Y12_1X12,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW12,
> +		.data_type =3D MIPI_CSI2_DT_RAW12,
>  		.width =3D 12,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	}, {
>  		.code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.output =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW14,
> +		.data_type =3D MIPI_CSI2_DT_RAW14,
>  		.width =3D 14,
>  	},
>  	/* JPEG */
> @@ -494,7 +476,7 @@ static const struct csis_pix_format mipi_csis_formats=
[] =3D {
>  		 * SoC that can support quad pixel mode, this will have to be
>  		 * revisited.
>  		 */
> -		.data_type =3D MIPI_CSI2_DATA_TYPE_RAW8,
> +		.data_type =3D MIPI_CSI2_DT_RAW8,
>  		.width =3D 8,
>  	}
>  };
> @@ -583,7 +565,7 @@ static void __mipi_csis_set_format(struct mipi_csis_d=
evice *csis,
>  	 *
>  	 * TODO: Verify which other formats require DUAL (or QUAD) modes.
>  	 */
> -	if (csis_fmt->data_type =3D=3D MIPI_CSI2_DATA_TYPE_YUV422_8)
> +	if (csis_fmt->data_type =3D=3D MIPI_CSI2_DT_YUV422_8B)
>  		val |=3D MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> =20
>  	val |=3D MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
>
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> --=20
> Regards,
>
> Laurent Pinchart



