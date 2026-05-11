Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57593BF675
	for <imx@lists.linux.dev>; Mon, 11 May 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519272; cv=pass; b=H6uF7J/B3z2E12mhrkfg5CwMCvt5D/p7p1hOHZGq/haf8wFP4FfhdCM5lJEBdm8tyZGgMAQGrklnRR9e6VL48IBNFwqPozG9ojRyhN/8qfjrp4hClGqBXbQRnqNWZZSK5SByfTvKFRK7i+XA1z5G5UqtDtYSHE+Dn6BQQ5krYis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519272; c=relaxed/simple;
	bh=7GhCI9AhWgUdS+8+tjS5pyqtuvrqYJJDRvj+OCtchLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJEJ9lG1ZExHM02VXQMCrx2V2lsJOQ4IdNqdq6f7BPjzAjYDnjJ+TuMtBLx29w98N9abg+zXvYzkMR34n9uDeNz6aXCX7qjDarLomsSA8mncQDKlEJkKYb9K0vrZc7D/zuXwN+Ix2C+f4uWhOwfjCALakFhaNRcEbUv3WfqT9yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izCIitfl; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izCIitfl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bce57c132b2so223643266b.0
        for <imx@lists.linux.dev>; Mon, 11 May 2026 10:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778519269; cv=none;
        d=google.com; s=arc-20240605;
        b=NaXn5Die0DPIoDmHTOn+zhD7QdZBYTJtxtO10iG2EVbz6lq9ZcVHk0R1yt+O3f1cK+
         hfogARDiTRtgfELYznJrlE554mDyf9q8VLo5kwWyyNmebTG+C0KV2o28gGyroNaIGBj9
         1L3oUUaUeQMP3e4AGbJKNs+rGstdsyQph1eIzWIQ0el/2J3DtTovh2DKXouZN+OxWbEy
         060HTQ/DqXqDTe1v6uEYkS3QD0qJT5tVuMJRdrt2ZglXDj2SsPjPi8EpAnoMaT3Wx8tK
         jgsuechiimPWnkZq4F/6IjlDI8eaQlJSGmEzD+/tsTbdKMPfTpRZnhjFcpyXca7V7yQG
         +s/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I/eWkxVbwCJi4fviG37ZdresVY6FlsKqOTbZfFTd3O4=;
        fh=U7GQ7rZyIQX5rRHHD8wv10zSIPSaiQfmEQ8GQDd3WZM=;
        b=DRGUnrwl5BAtq4ogvkHSjCkhU/2jk8hoRRpeORDRn/MDNaWiB+skyRxddOX27tYu1Z
         OBwO3NQSB0pBTdykmmZgHhq0pX2bJAuKhCX4/UlSE9e2hoTf8AF/5IRM5M9L08zstihH
         YqnLp+RxKDXH4Gxma94nohWebwnTo+BpYqD3WANzvf/FYiQyCjo4W2ZnqBjJDQrHwnln
         qCXKBCvVdFeHIdadC/0usarIeahuoqBp+D98WD2uqe4wP1Fq4KFU+XaY5hFqfMz6+8aX
         lGtVldlIoGHvDmgZgzbfG7OkGG4gjEKOFMpBQ2g9N4ab5PxNAo09UQJeVAwKb+TlFVgp
         +56w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519269; x=1779124069; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/eWkxVbwCJi4fviG37ZdresVY6FlsKqOTbZfFTd3O4=;
        b=izCIitflddKnYKJBuMxFfXq5rc7Te8UMMtYZ21FSjDEvqrWnH/gyvAsItOe9iulLsf
         MpPEQ5EHZKQ+coB428rnt2SmW7S8x2r9MkQ4oXhlnbj7+LqR0/MlQgf5qui5xQcX96x5
         7/LtJQMpqDTncfiotUDt9aoySCAwieZxdTeMAwKLo7hhXMihSzWzDzIRtdspDjJWfdDP
         E9D8kN+Ap5jJ2/z3gyVOFce3gygmov6tfUnQw5BSt7oROZBmua6+OG++32ih4flJupBj
         f3OQGZvKgb3UfmvJ3ZIQctM/Sq5mqkciOCAQ7/cQvzzO84SvkLWkNepiIz0yy3cHcKND
         N1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519269; x=1779124069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/eWkxVbwCJi4fviG37ZdresVY6FlsKqOTbZfFTd3O4=;
        b=UWb8WRIDQsZR3xp6paWqB9rHG6ddhIzUJSX1sb6VC8E4hh9ukbh8YbzT3pMUCwIdDZ
         0bMBdWb9/7j9qB4k/Rf65+cm7kfFS3SQTdx5aIyaUC38GFUhEeZ9pa8Slv+yvw4cj8cW
         M9/u8dta4rHOVqtX1TLodM0hrz0EF3N6A2pKxWJUZ+FS3VEGo1xbOHxHcMm1BeJv6UA1
         fUsFujk7H3Ycb6Mj+6XK+tR/8VwEur6d/miKQKr6vxoORwa8zsvbMAIj00P9j1nISRUq
         6HHsMMRlXLO7CrVt/96YEG8V3XqlWkFuER0ozTVbWg1WTJE+f7YakWQTri0vEweF2aET
         TZrQ==
X-Gm-Message-State: AOJu0Yy73uzOUxgMZgaYLRwd/wBrEwoRmin/+qmuXZ9IvDN+cjcvKslY
	N7BrPMsZzSznmUxqoz/c5RkhVMgg0BPhMJfIt11N8XKsv8f7C7bo3KzjodSjkgeP9CV/O1FiHOB
	mHHFPZEt2EFBIvLr1FhmKEedd/8gm5w7A2QsTgL1NDw==
X-Gm-Gg: Acq92OEGG95I2DWFJ9/i7AC4bz4WrhOo/u4o5UgP8n2ZZ0LEBhVlbNJHlCV+UihCYx0
	L/4809Y58tsrSUCsO4eMA/tLW7K4iZBsUIjkBAbqgGfo1PMVSKzIG3gTfr4j74d2JSzKAitTrPE
	A5Gjo8Ew+RwE4NCHRVIKtgpI0VUhkF61beDavGh0HmGTfLdhPani4wvY4b6J8cNLeSFp7zalo1T
	UttQ6Hl7mmX1qfBLGdBhg0YwhsUUcUCADDSNuX7YNTQtN8jzzuiMUrpLhEqRBF10Jauj/hwV2yu
	Xx3lxVWFTbMnJyNm04T1a2jTYSIFGodoYV73m9Tt9A==
X-Received: by 2002:a17:907:7241:b0:b98:8494:3174 with SMTP id
 a640c23a62f3a-bd23cefd076mr22158766b.24.1778519268980; Mon, 11 May 2026
 10:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509115719.12546-1-Zhiqiang.Hou@nxp.com>
In-Reply-To: <20260509115719.12546-1-Zhiqiang.Hou@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 11 May 2026 11:07:37 -0600
X-Gm-Features: AVHnY4II3uL7VMLf38N5WMkRQDRE4eLBmdCpHOIITPZV1IHf9hjN-dk40YLWOM4
Message-ID: <CANLsYkzB8CcJ-dpxPjkDYqVDxw2oz4p+xThiWQaDYbWAp__eNg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: add lost DRAM range for i.MX93
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: imx@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	festevam@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 May 2026 at 05:54, Zhiqiang Hou <Zhiqiang.Hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
> 0xa0000000 of A55 mapping view.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244aca..175c2d3099794 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>         { 0x80000000, 0x80000000, 0x10000000, 0 },
>         { 0x90000000, 0x80000000, 0x10000000, 0 },
>
> +       { 0xA0000000, 0xA0000000, 0x10000000, 0 },
> +       { 0xB0000000, 0xA0000000, 0x10000000, 0 },
> +

Based on what this patch does, I'm not sure the word "lost" in the
subject is accurate.  Would something like "missing" better?

Thanks,
Mathieu

>         { 0xC0000000, 0xC0000000, 0x10000000, 0 },
>         { 0xD0000000, 0xC0000000, 0x10000000, 0 },
>  };
> --
> 2.43.0
>
