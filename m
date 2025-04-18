Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83096275875
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980558; cv=none; b=D94Vv6qwVOm+NjWVIOZh+oyawhKG0NCK8seLIh8bPwAL4JQiFtwct3YxhvM0nc9W+wuN585ZIP2tA3uGgMNkJvsdCuOasBximI8M8UUV3mkjCZuz5sC/pff6o8QNHtyMUu9msGW8tBapZR24LhxCcfT4TQwLC9rVCDoKctkhEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980558; c=relaxed/simple;
	bh=gQlOxlO8930yO5ibgAmuqXeO4pmpPbtEVExTdD/GYtc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FzW4nN2TNISpBC9dBFaCoTrYV6XTa5SaytpCHu/7g6l7lVuQQ2/ZgwrUv7G20V+7+CZccEvSnX3+7jL58iD79UDJPcadH/wflPZv4fR9rRZQbz1bq40QJq2AAZ5BDVk6HlubLy1595VAzoO+R/L124yTEJPeJ2WB3qzCCGwnMjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZxBqPe2T; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZxBqPe2T"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5aecec8f3so269298585a.1
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744980555; x=1745585355; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=ZxBqPe2TmMhiVgotk+MkkZsTKDQaRqsWz6/BMoFqANovARZKvqPmPanhZo8QRhSmAZ
         dnSUB+w75wPzUPkY6ypWCYM6JGsGv3kSqMQyiqWJps6GOnn95URQj7SJgWeq9ND9ySb3
         HAiYKxiHKZlYlSjCKnHw0OG2ToDbfGqwt/LeJeXqzQXtcwPvxyvIcJ38qIDgxANLgMF2
         6AjDI0NTsY9l5TgEQY3SLnokHZf6cUplewhQpvox4UvP2vgeDe1uS35wDuWq8kzKtVGM
         w+dmIY43o5YAXnP0tGbq+aQ9bp1HJQcsm6t7pNUk7eVe6pWxauQHZ1G55P/efkWEaFjH
         hPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980555; x=1745585355;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYaJAf4mlOAD42xMe/rZeVYxGHqCckmap7vqxCNd/40=;
        b=CBRPQNppnP8XGVJKVNMi1M1yInzGIj1x2VuFozV3sDQSDh/FhWj63Tbb43FMUYizys
         gDBdsey50ED/XMziyzXvcSJQX9zj/BIm+x8zaWPS7oiZocj709WLdAs61JXd48FZaNTP
         m9PkQ152y3LPXSsgjYn0lWq1ymb1Om3iCoks0p47V3I6mPnmUQ/zcC3BMjZ0pO0F16U0
         HC/oJrut+yDgWFt2OwxpywS9PbZX07o1JlNFY6j4ls9ov0+pr9F1CIEFlys2RuupiwbV
         iPKONH9ySw588KSfAcwwtGXB1jxybHtuF2N8KNcqs+1kGY8+XGBo8DOtD3Z1DIxtyWGB
         csbw==
X-Forwarded-Encrypted: i=1; AJvYcCXIxHodYKd+++K5ub6GOMUTsUz9XvFqE3KEtz1wQr78hZJE5cwg+jxn6jCup1SfmWwqXG4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Fe5BWPtjGnvVoZlzTCZhMlTlzmEIvrcn7muB/PSjgpj84LOX
	RwMRKqPXuMwhJm4M0yXYciv7UqtjcKR+6oial9euR2SLhaQCOnyR5IBe2YtvtCs=
X-Gm-Gg: ASbGncvOI0QZrELr4yQrtjVXuAogiREDl+3rXRCmnG6okjydi5lD9B4kzCe2Bh14OVi
	MdWf1Y2dXQuhhGQYMlsf4GB+VHK6pS8QUj4OCF2A+0wSnQZMeaIs3n/NHo/EGMVk3ij93cmTS4k
	prjdUJ8/LeV6dm+AP3oCJeYDdMw4wFJ338b/2YNmQx4iUT1ixo8lFl1iECva2QmILrMEH/jMKI8
	WwREbUoBVRsAHFvWudRH3O/pJWEuzIWuy3N2y7RA5sHTxqL4Hi1V59+7Ou1WqQqIf6RwUeJE7o4
	kV+fPMK3YGxujI0XK5vvOF2UnuE5uaNPwO4WssXHA11USQ==
X-Google-Smtp-Source: AGHT+IGynna9oqlUfCvK4A2bAh3MndEe6O6J5Dk7XbTAN7GvFRmVsTQUL/cmbo1DTdHEkCI6hkR5wg==
X-Received: by 2002:a05:620a:bc8:b0:7c7:b59d:a6f2 with SMTP id af79cd13be357-7c927f59337mr381802985a.10.1744980555401;
        Fri, 18 Apr 2025 05:49:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f3c5sm103702685a.37.2025.04.18.05.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:49:14 -0700 (PDT)
Message-ID: <22e43e927514ebfc20e97f2bfd5fd52899820627.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/5] media: imx-jpeg: Reset slot data pointers when
 free data
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:49:13 -0400
In-Reply-To: <20250418070826.141-3-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
	 <20250418070826.141-3-ming.qian@oss.nxp.com>
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
> To make the function mxc_jpeg_alloc_slot_data() and
> mxc_jpeg_free_slot_data() safe to be called multiple times. Ensure that
> the slot data pointers are reset to NULL and handles are set to 0 after
> freeing the coherent memory.

Perhaps:

   media: imx-jpeg: Reset slot data pointers when freed


   Ensure that the slot data pointers are reset to NULL and handles are
   set to 0 after freeing the coherent memory. This makes he function
   mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
   called multiple times.

>=20
> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Enc=
oder/Decoder")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v5
> - Make a single patch to reset the slot data pointers when free data
>=20
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 2f7ee5dfa93d..b2f7e9ad1885 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg=
_dev *jpeg)
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.desc,
> =C2=A0			=C2=A0 jpeg->slot_data.desc_handle);
> +	jpeg->slot_data.desc =3D NULL;
> +	jpeg->slot_data.desc_handle =3D 0;
> =C2=A0
> =C2=A0	/* free descriptor for encoder configuration phase / decoder DHT *=
/
> =C2=A0	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> +	jpeg->slot_data.cfg_desc_handle =3D 0;
> +	jpeg->slot_data.cfg_desc =3D NULL;
> =C2=A0
> =C2=A0	/* free configuration stream */
> =C2=A0	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> =C2=A0			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> +	jpeg->slot_data.cfg_stream_handle =3D 0;
> =C2=A0
> =C2=A0	jpeg->slot_data.used =3D false;
> =C2=A0}

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
