Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E971C683
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980314; cv=none; b=C6PRLvBa/TjORiJSIIbVGBBoj59eorWhqzsbsYAPejJRCLF7B27oeXcBk2OwD3XuWvMoE5yA8yTIREsqL+04KGD9/pEVsFFcsMj4H8H5ugspX0vwTfLSkMxUAgSmCT8atlY3VCzmh18rMCaMNlh9EIJb62SYV5+lAWGyDFU6zKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980314; c=relaxed/simple;
	bh=18Osn+o9xTHzDTfvt5jq/dH9+/i3xRIFr76Wqmc58IA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c26cUl0yq3EVhj8VcfzDjdpJHR1XrQH8rIGmnTrguBFTEF1NYn4AR96eEAZZJcukfZbhwGzsZoNjFL9Arfw3cE3my/4sqIq++hgVdjFtvI+f3FgQWaIy3mUdJtQ0Bh1WZPof3KbMhkt7NBnR+68hxBkzDKCq9VEBzbzy2EloGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=UF9fzFQS; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="UF9fzFQS"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso24797546d6.2
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980311; x=1745585111; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=UF9fzFQS6IXf/JO7+Ic4FSOqndgjOrnkWCfwFXd/PUOroa1GApxsdZaM+d5dn/daAB
         9rrZSB8JdncFHLiJhpj0aYrGVdzf1D4BFbNt7pbQ4oENVv1udLdRAIYai7lVMT+Foudv
         t8E1O9hfli5y7VnGkFMRkunNTrHd8d+F0APA8EPeiaPRF4df+B75LrBsnQz2vPAb+5cv
         cWBZZgq5j6gAzyqbUUJWJLvNRZyqBD2CoI1Pwx1tyQQdRvJMM25XpewJ/Yv23jOA5OKD
         7ylEDXCk+DBN9GGk7Zo46dPgz+6zgHj/841rNa2nrzFV3z7e2A/Gg5wOgdbWFfZJQ/da
         9Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980311; x=1745585111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXkCfmEUc7LzpxVnLIg/IPHBctqoHaGPnaOOKS8P/Og=;
        b=KQ5qMMw53JMlWOKnTZQr20m4/fgs4zPBV61z0t8FiLJk935KTp5UaozRX+sz5fYy71
         kVT/CVgxhxccS6Z5AbyLycINJVnpNtX+FKoloiCFGRlXJkEH5tZyjOmba0P6eGSdBytI
         vJ60wQVhkUNmkhsfjx/EHPUAXi2hlF+8B06t/EwNSOWpfHR32N51BArnyqAC4iiGamCg
         o4NYfog6M5ATJKQOPjG+GYL+MHieCyBtJkJ93IYdCYi6SsZ7cXBPkRAQqixj5PPbAWbH
         nblzjYGvf20jLVwsDuJIM1Cp+5Bd+V50zD+lnvQBZfDTh6I4RVRhmWMukms51Es7HCiD
         V9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhgQKmR0gZcxMhenz6WCorPa/a8fpcFdTUCD24AfNs58xXgvN1hwYxtpkanyJ4khsh/co=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznmc/mJJ07My8kzATEjT6YtTMfObfGhN0v0GRD8qtTSjBH5hgC
	5FkPjHnS6/M6+S4PV6ghGTtT9IQE1TJOEamQ2PTZn1tJMXyu7JS0kBwj1hP5onQ=
X-Gm-Gg: ASbGncuRF2gIoXYYbMOzGr1nSa1Gu1hIksLhbTjcwkeR9pFQD23lGe1ajgCiUJzNIDb
	JfLTUopO6bxBrHbyK+RF23PtHLBfqx8Fn179k3n5HVjI8DvaXLKVfBt23FfpnQVVFr4IKl8QCKv
	WFkCRVfrNQboFh6VqJ5e3VR6fymv0WnRUUt+f0Dgod/qWzWo9oCOqVYT0GdFGvVjNuZMPFQgyte
	E66ao5Nk1poulQ2eWh5/5vPJV5eJJl+UEE9sZydlsASYNML+2CVa60dDX2doITz9Nkxds2jp44+
	UrdZaCJ+iWr0HmVYf8bSKkZmVWhLrY4fr0J1fE+gPyzXEg==
X-Google-Smtp-Source: AGHT+IEZdyYA51jGvbZkm/yOrNHbFvp9m23H3RTW5HtgAkzz9w0U+ZAEqEnXFIW9TtqYnKH54EJ3Ug==
X-Received: by 2002:a05:6214:daa:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6f2c4577f11mr35766706d6.24.1744980311082;
        Fri, 18 Apr 2025 05:45:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f939sm10224416d6.48.2025.04.18.05.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:45:10 -0700 (PDT)
Message-ID: <275992627ec612d0a82f5a63bcdae47efdfe16ef.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:45:09 -0400
In-Reply-To: <20250418070826.141-2-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
> allowing to call that function during allocation failures.
> No functional changes are made.

Since the following patch is a "Fixes" and depends on this one, you
must also add the tags here.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encod=
er/Decoder")

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Ack.

> ---
> v5
> - Split the resetting pointer in free to a separate patch
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 40 +=
++++++++----------
> =C2=A01 file changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 0e6ee997284b..2f7ee5dfa93d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_da=
ta *slot_data)
> =C2=A0	return -1;
> =C2=A0}
> =C2=A0
> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> +{
> +	/* free descriptor for decoding/encoding phase */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.desc,
> +			=C2=A0 jpeg->slot_data.desc_handle);
> +
> +	/* free descriptor for encoder configuration phase / decoder DHT */
> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> +			=C2=A0 jpeg->slot_data.cfg_desc,
> +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +
> +	/* free configuration stream */
> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +
> +	jpeg->slot_data.used =3D false;
> +}
> +
> =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> =C2=A0{
> =C2=A0	struct mxc_jpeg_desc *desc;
> @@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> -{
> -	/* free descriptor for decoding/encoding phase */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.desc,
> -			=C2=A0 jpeg->slot_data.desc_handle);
> -
> -	/* free descriptor for encoder configuration phase / decoder DHT */
> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -			=C2=A0 jpeg->slot_data.cfg_desc,
> -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> -
> -	/* free configuration stream */
> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> -
> -	jpeg->slot_data.used =3D false;
> -}
> -
> =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx =
*ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *s=
rc_buf,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer *d=
st_buf)
