Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD8205502
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744397269; cv=none; b=s6B3JmAFJMd55MSBFLQoXcie8hB6D9/NrtVTNzdt7BQ+yjSU3ANB8IM5XohCK2TbMIFwRN+8FPs2WE7h6b7/XTCGAZwdbpC1WxhETYzDusPb+xsAP7oocfP4T6p+FxkXNvyZyuew6W0K2Aqsb1eGA7a2lW9DRQBXUvY5sxWVF6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744397269; c=relaxed/simple;
	bh=igfmk052ohOfBX0sJswb9359FPqtwwRUyoS0iYxyj+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S54HG0kJYcw08CfqbA0N36JkVtAmmbAUHBfC+83sXU116YRUnaPS5+N23dhpxDlJB2rHGzEyutbCqhmK5K0Q5aGugUj7Op3GFm8+WoPyH9ukYaqN84gEzfsnkYlW/MniACHr10qJQZFWoLKs/X2WfiWIXJYcPeutlLLJj9mGsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZaYFJkZE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZaYFJkZE"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c597760323so225488785a.3
        for <imx@lists.linux.dev>; Fri, 11 Apr 2025 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744397267; x=1745002067; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=ZaYFJkZEuZ/uw3u9J8u21FHzxeUPR6ZkLRN2QRm1N6ndRGYeyhFSlcyaRkpqEtyLjB
         HjdR9tNLhSiI9a9O7pS17E+1x+dxDtU1h+RPKSnvNSZqiBOBTMXQ3gq4bg5yY3S+GUz6
         uMpNd3VLmI8Is7YN5IS9IutJ7p+wv1MJfkX41HYUYvlqzweHzh0o5zeTQ+IAoJDLsXwy
         5rkqAzNVhQBI6RxKkZDVQ5qZXhvLUtrUSfPGImGIDFjQiGzcHcNQi3QFf0r4vQchO93X
         mKXiqAxOJUGKoVw2z1UpTnmGOw+c7AGaVRfNR81f+Ylxl73uOk+huig2JSl5nCL9ZjBB
         N5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744397267; x=1745002067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=o9eYNGvOf3iIYuw9MJKgn9Q+uyeSA/HEeEZPQ+aRYBQ/WsytuWqJN/h3/IPfCgPuyA
         SIjtoh6BwAb7mTZerGZ+RCG+ANVCBIDHHaEd+g6hNqoahu61uUmScdIMJf3Uti3+wov8
         leG9VTswvr9OZAX9XnLSulOpQP59jXtxM6c+piVSm1cYnERG2pXaBoNq4SSf/mb0s0pU
         1xKy7UufIp/m4AmYXcb7tUClTuLdJ41eCt4a4Na3TtyTfN8KAyY8lSFNrE8fClZ+/U/c
         l2FUrT5L+Fu3zraa5aquyz4FBVRMy8DKr6KXTMdqQ8eBFTzkRMV3a+jMhiLkheKnDdAk
         peoA==
X-Forwarded-Encrypted: i=1; AJvYcCUhBIflyyjLW/lEqn+l8N+flsCXC1nEUvZbz/rycVTHjQmR88BLLNNCCOqu8eZBCgfBp0s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxvn9iMuvorjxLQBPwZHLv6yQdOg8T6976wmCL6Zt2l6WttJIcr
	CB0F3+CsXtewwF/nDeKIBUPTJo18LpItgrUCKAZNzV2ywKisutwY6davOvm9UGc=
X-Gm-Gg: ASbGncswt9S0CS4ezAaO9ZxVbKQet8LJt/rD1MB98Y2x01wc5lIXPJFo20qagbK7gaG
	g1vSfYII05xQCQv/cuc4EpRdjWopecK9/uVy+Wi++qFertE3tUWEsNEG/wNb/s6Mk0K92x8feNx
	1lqHZVWV8PyahFzxZ7FuIbxCg4A400+eTvk0NFjw4JkIfaLI3wMHH/qE0B5872SNnfOplW6bvrH
	EW7WRLpE40WORlSFO9i5AWDWbwY14+QYrHLMh0+Mpx1b1HjrOPVAqCYi+ZSU1TlGuMlnnb2iTua
	7RxGC+lYA3nHKtjpceyugWa6AGCNBEnHNRDBMoVrzs6ywg==
X-Google-Smtp-Source: AGHT+IFtKnV9+w0FwXGSzvq+4jUfFCuVoEptoZcv67KhNBh18LEdtioKg5wo6qZbIxlKb9n37yn5ZQ==
X-Received: by 2002:a05:620a:17a9:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c7af1328a8mr627352285a.22.1744397266859;
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8951969sm298592885a.45.2025.04.11.11.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Message-ID: <588eb09a61dea0c07e02c8b474972c6ca9b3b3e8.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 mirela.rabulea@oss.nxp.com, 	shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, 	festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, 	imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 11 Apr 2025 14:47:44 -0400
In-Reply-To: <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
	 <20250411074347.809-2-ming.qian@oss.nxp.com>
	 <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le vendredi 11 avril 2025 =C3=A0 10:36 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Fri, Apr 11, 2025 at 03:43:40PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data(=
)
> > allowing to call that function during allocation failures.
> > No functional changes are made.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> > =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 46=
 +++++++++++--------
> > =C2=A01 file changed, 26 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/m=
edia/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index 0e6ee997284b..b2f7e9ad1885 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_=
data *slot_data)
> > =C2=A0	return -1;
> > =C2=A0}
> >=20
> > +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > +{
> > +	/* free descriptor for decoding/encoding phase */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.desc,
> > +			=C2=A0 jpeg->slot_data.desc_handle);
> > +	jpeg->slot_data.desc =3D NULL;
> > +	jpeg->slot_data.desc_handle =3D 0;
>=20
> You add above two lines, it is not simple move function. Move above two
> line change to next patch.

What about just making this its own commit, give you the chance to
write down that your making that function safe to be called multiple
times ?

Nicolas

>=20
> Frank
>=20
> > +
> > +	/* free descriptor for encoder configuration phase / decoder DHT */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.cfg_desc,
> > +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > +	jpeg->slot_data.cfg_desc_handle =3D 0;
> > +	jpeg->slot_data.cfg_desc =3D NULL;
>=20
> The same here.
>=20
> > +
> > +	/* free configuration stream */
> > +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> > +	jpeg->slot_data.cfg_stream_handle =3D 0;
>=20
> The same here.
>=20
> > +
> > +	jpeg->slot_data.used =3D false;
> > +}
> > +
> > =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> > =C2=A0{
> > =C2=A0	struct mxc_jpeg_desc *desc;
> > @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jp=
eg_dev *jpeg)
> > =C2=A0	return false;
> > =C2=A0}
> >=20
> > -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > -{
> > -	/* free descriptor for decoding/encoding phase */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.desc,
> > -			=C2=A0 jpeg->slot_data.desc_handle);
> > -
> > -	/* free descriptor for encoder configuration phase / decoder DHT */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.cfg_desc,
> > -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > -
> > -	/* free configuration stream */
> > -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > -
> > -	jpeg->slot_data.used =3D false;
> > -}
> > -
> > =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ct=
x *ctx,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*src_buf,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*dst_buf)
> > --
> > 2.43.0-rc1
> >=20
