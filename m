Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B32144A8
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981925; cv=none; b=mdgGQtTDZNIIXJsoREUpWKr++bX2cbI/35wtk+ZbFdwstEVun2N5tvFIfaYuF13Rl+cePFg1nOfhkCtORFPyOtSZcrT0QwqlSo3hLhjod5bRxQbg8PD8kpDxaizStlh0oE7uFlRorWBHtXenbVLC0aKwz0TnnjpX081wDGFNkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981925; c=relaxed/simple;
	bh=Fpyrr7Bk+jIkRZ6OSahA38xlx+xTco2EMP0Gwx5qCPs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TZ6PxKSEPqKX7/AH2iH2htBKqT5Jgdj4eiHUpxkPRNLzZiG5JwqBdgRdWoAkxs4avTd3cA59kZhb1UPtIdJOl3nFU27z9eBx4uI6GqDQY9iqLICKekI9235y/PB7tZWjoDJ/TdszBbP+0yGxXY6BHnuc2al6RlRpv36W0/DhBx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lsY60Tys; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lsY60Tys"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5675dec99so166747885a.0
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744981923; x=1745586723; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=lsY60Tysqn5kyPtiJ0LeSZGx7Zsgu0epw4xQgFjBHqVFtR0jVxC+9mMsVT+nBw4DZc
         FOdKHjgzr4YR2o/tsjnI8ZKyyAUb4q3wKNKlP4qDr4dyxTsTFzp9Bi/ZeQCVyOav05t8
         YeieKbuH2n2OtcIV5dkJ4ZylWgZC//rIiKeGSAf+fjS3ir0yQPqz61hO8twYoD6ZIUng
         b0mFpK7fBtF0lDeQ0NTga4IsqMSJOgim3qM5aBEDQ11YapaWZDShpdp5mOI12WSxQQCL
         Gnc7jGz0VNBBr9rS6SiNqpWAfyYlr3nmA7RZ3ttAadgWL2tS8fYlfB6TzrnnO7f48eKv
         cFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981923; x=1745586723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=u5azkR2COytZrA9R3yUY29hh0jXavHTeP2l8Pn+zYO8jr85x6r2krqs0yC5JpZK9Xv
         n+RdSAiKTZGv+Em6HLDlxoG46LSS6SCRJZvGKzBjp5Mnrq2cizOs9gb6j5YK3IpbomtV
         jXxchzh1o4FhVrVr7kspZpciyekHyHwbAgb8iAbRuVCqL3JYODe4F8YSOgoSnBY+c/4D
         fzrc1a5Dk6eHKSVzYSQ2PBPHy9g/az40+/K4++V3Yih0YqeevUejw3q3u6cagUTLzoy2
         CdvBbuzLqZ9rmGmT/KtU00k1IX6FnPtjBQB3pEo7L1XQOUeCnuo0WE1HriGM2VbPn4XS
         laAA==
X-Forwarded-Encrypted: i=1; AJvYcCWtFfR15LrnozUZArxFbwTVSW2rIje192X5n/ut8vBU+28TNBDE/5JSo4n8z5jcKavs8D0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhNhD+2fzE8xPH8uOhiGWe0ynDExSMzMqo5QNlG72CzSKUvMLD
	070xFQoyJdr2tEGfZ9eJDsDeDY1J0VuBy0X+SnA96Be+Yn19RejzbDyqNlmW1GM=
X-Gm-Gg: ASbGnctJ7LmT07BrlGEOfTfYSXePq7yHvcy4vpK4hmDVfG0RTZzICoOw4kz5+Va28Lk
	5J1CHg8YHkzHS25AjyXySfWvaBFS2fUuTsGBRjPBiSbprAD+0AgqWyyhqjbhmmauRvrtGDoITn1
	qWdaXGXQ2n+9Qshxk6b4FJ7wxM+kEs0BApSEdFpTXhu190hue7YQyvVxhjykPbcDGgDe6jup+hJ
	tx22UxutV8pS2ZxlC2M09HgFxEkmRtYoCw70U3cnOaCi7J6Y2r49m6dTIW1wrJ6/ohZIpi4dcoS
	sHFkl+m6AeNX5Uwy6f3BFqmJvoNsZh5leszl/nwJiRp0Qw==
X-Google-Smtp-Source: AGHT+IH/XoxSUArL6cVz4iPViec3wwwSipsn5opstVs0fi+r5E8l1PRZpdXcrSGXm10//nNhqxZmPA==
X-Received: by 2002:a05:620a:c4a:b0:7c5:af68:5019 with SMTP id af79cd13be357-7c927f97bbamr406396985a.13.1744981922969;
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a7147esm106040285a.14.2025.04.18.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Message-ID: <4549d9abf5f93fb6f417d0fb8f73877272d7c495.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx-jpeg: Drop the first error frames
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 09:12:01 -0400
In-Reply-To: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
References: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le mercredi 05 mars 2025 =C3=A0 10:25 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> When an output buffer contains error frame header,
> v4l2_jpeg_parse_header() will return error, then driver will mark this
> buffer and a capture buffer done with error flag in device_run().
>=20
> But if the error occurs in the first frames, before setup the capture
> queue, there is no chance to schedule device_run(), and there may be no
> capture to mark error.
>=20
> So we need to drop this buffer with error flag, and make the decoding
> can continue.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

This seems like a relatively important bug fix to be, perhaps you can
offer "Fixes" tag to this commit ?

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 1221b309a916..0e6ee997284b 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1921,6 +1921,15 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *=
vb)
> =C2=A0	if (ret)
> =C2=A0		jpeg_src_buf->jpeg_parse_error =3D true;
> =C2=A0
> +	/*
> +	 * if the capture queue is not setup, the device_run() won't be schedul=
ed,
> +	 * need to drop the error buffer, so that the decoding can continue
> +	 */
> +	if (jpeg_src_buf->jpeg_parse_error &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ct=
x))) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

Looks good to me, an alternative implementation could have been to
merged into the error branch above.

 	if (ret) {
 		jpeg_src_buf->jpeg_parse_error =3D true;
=20
		/*
	 	 * If the capture queue is not setup, the device_run() won't
		 * be scheduled, drop the error buffer so that the decoding
		 * can continue.
	 	 */
		if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
			return;
		}
	}

With or without this suggestion, but with the Fixes tag, you can include in=
 your v2:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0end:
> =C2=A0	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> =C2=A0}
