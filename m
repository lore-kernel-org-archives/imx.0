Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057671;
	b=ivGte8/Fh+LxGvxrkJn+XHNLPTCtvTebL12afjr4n4U9JwigFZJjiIz4+W5/UMyLSs0V
	 621zPzHmrvsqSPFMbMXOzY/GhBq7EAzsDp7Ckvkzs7IJAy9UtfRB3JVjFt4WBGI8LO5vK
	 Of8JzQpIn1uYPS0e7h41Gh4y+iPGWOn0BlFo0BJEnOC8JIuSBtK0Ii4SVR9ZTC8Ah961M
	 EX6spcoxPeb2NYBlxKtOUhobJykTRUGTpFpsAmbOYNjznAn4+GKXYQGtfT+6BuoVCPQMc
	 +GSMj/+hpzUbxU3FR0cq4SaV5j2WhQd92DlqhOw918mB3haz3iHZsnP04k8yTI+Vypw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
	b=oanVKhKoHUWV3JbB+z1+AJfTHWbT4cJKXo4JM+QJPN+1NoKTvCmThanWKYoAYCFakih+
	 hSpJ4cu1hRrQj5bShfrcbv3s92rvTXOmrS4bPy9oIp622jl5iz2VL8+XG02dyuoodQFt/
	 vqbv9hZ/nYB6lXNyObuIsaMrN80J6xMujqowmt+QY64Y8Um/5i/Uy95MzGe0QdTMOgijA
	 6WuXUdO3Gc3SBUjEDvdegpx8xFAU53+V9o/aZoyczsOeGmOjTusT39jzpEzPrDG5Dp3N1
	 PkRKk90xXvOhPxjdcvyBHblykO+4W6JxaVFyoYLtxiFPkAQlS4dHE3vZ3B3ihnpomnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0v3mAHg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD960A2601
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 03:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AD960A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0v3mAHg
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1364118b3a.2
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 19:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795057669; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+nFQ0fcGqGRpmIRpAI2Vd53KuzEyosyyUw0U+DSQNEiouNMk5UbZIDUGHkt/j7ALI
         /DSXdQK26Soj14PaSl5ZWczOjSbjIiToxFO9SO8gsX2rDKuKk1TKmxKl+UnPQPpALV7n
         m+cxvvePWeUM3gt+DOh+DKH54PD7xZ2IpEvxfhDR95ksPu2Kte2TnJeOTBd/h77ZtTfJ
         buRpUr2WzV4E3IXdPIc/8DfKgmYfBvs3GYrzTyjm7LjE+gM3sbFFfXjRl1zIN9FkHh52
         O1X9RYcntTGBxUbxxAgUwyJWe1xEkAOGoB7D+QX3lQbewpCG1EKHlj389rZNt3onFipO
         qpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
        fh=jb6cURDARcheCu9xVo1wT+XWL24NZv1i6MIT69L5zoc=;
        b=p8OAScptdlaXJ2j5aVYhLiTx5PAyuXXUlPCuM1/PAzbeTrYyQtxrpCZn/JXQXBi1ZX
         OEZdGd2gEIIfAASlR0+6fBVQ9oer4gXvHWKhru3lMbd6kfzYOjJsBk6Spbx1fBj1rb7N
         IvYdjtai0sBDpZ9/lSpAzswuE1AzLymu65jJOVtAngIWwypoY776cjm08e1yj9VB9HtT
         V8QKbuJuqCBfvs436gpn4Lx98l93kC0tLgHIA1PBpg+cdwgKb8aomzdMY4cUbQiMJv2y
         jTc5ocdlqLnIx0SeIdYbuijgntgy9lsurvA0Nw4sdnSB+ebU91lOh7KMxHrc7+zEtjG9
         VoDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057669; x=1795662469; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
        b=N0v3mAHgBX8D4mB5ObNwshrfZXav2Jt/wyQk5JhioXpl4oGMpUCEPGRyGiuvyADydl
         icwladDg6EveR+2m3IuO2iXIlrXbw5BbFiTZj2VhNNQGNs/S5e4OBoectjX5kBnnUujH
         H72Cqr4JM3yUITKRJnhG2f79GE77F9QR94nL/LwvPwlYSaIGhGrXkr+mg3u8CW2pCh8x
         keFQOXdihJMjxHArV3HpCeuiFYCID12tyBTqyQieJ2/Bv6SAk2uw53H1QNNpa1fEvRDr
         ZIxP1kDGfIpnep//lx23qqsElsak9P/qOKuepNflKe/5FGSox1YhaYQl3Zwm2S4A4zEM
         8dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057669; x=1795662469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eNqLToJhxaeomt2tnOjSxSscr+R5g8wBYJh9gCb4ck=;
        b=ngXED6NnEBWLoajTscoj/Zg3tAlhEGTWuLfL8AtEq+UVMKMzrxCNGLkHffTsX2lZ72
         /q7eF50kSTtPeYS/1nCHFs6xK1KDd+c1s4e67ODHQr5Q3h5N1BzKG3Pw6IZ4sPgOzVsh
         1gzZOqnM/qGa/gmzkewcQzYB3eJ+bg9UEZowUYn2XHZIUSEKouOb5QBN5125Z+aJy09w
         KMN7U4lLXUSyLwcB9jRMT4n8XsM1qNb7VAdjZfKIM2HbGenE1ye8cxtamPLPRj9jNQhU
         2CEftmIOqcvMEa2e1mC3u3PpUggax/Bd05XggMpOaKyrxN/DCwQVFZfesX6VCpDb0CtM
         yXHA==
X-Forwarded-Encrypted: i=1; AL+hErEbMLmuFc/y3NUDIAzdgasAwLMHXjnOCbBn0lggTTkdZNS6NCrwiz8HJHjzFvnPkQtgoT8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+H7NKtNXD/16tKemteuEv1FrBg3dJHwUyF81PBagW5Y8XEib8u
	XaTGjoic+hp6PUPblRnQxzDc50Srsm5iGl0fryvQuVfwPgfoXmjC5AxGjE7xCWchSIRF3XqYov9
	1W9nrkWvZ/Rwx0sU8UxQq3v5Fjt0q7wrZbK+OCck=
X-Gm-Gg: AYBFou3HqFJ3quxJW8wqpS3hvdjts9cCX0vxcOaX5WFWekUXDo4mnXOVaP8haji2rjO
	e9XFOgWABpXJlZMVCOC8hXcncTTyAv2CaTiNHvYq9b9mGzz3FPIyi7fcjrhI9Q43/Zw2bODEGdQ
	NK39+AnFOkhjTgpB+jiB7Yua87Gtjv7Ru3BYTYomv0z08fLx7OznnwoMJ8L7r3uaFBDcAMVZBlB
	kKLEf6Yq5wFayDADiB8bHMFZKEGFtXLD40ZHZjm4HWBYZ6MYX1Q4ztTh3bz10Ou1uHgj7iScoik
	dxnbjc7HpdOpbc0Hq7bIAF8UMxCnB/XS2kaF8PTxSU3Sl/NR4957PxQQLefYxNuc9BJToMo/XvH
	KpAcNWnwPv1cFhG1RdbMAW4LKEK53u6EJpR5b
X-Received: by 2002:a05:6a21:1404:b0:3eb:ab99:9af7 with SMTP id
 adf61e73a8af0-3fe8b5e99d6mr4610640637.62.1795057668780; Wed, 18 Nov 2026
 19:07:48 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116093751.138455-1-stefan.ghetu@nxp.com> <20261116093751.138455-2-stefan.ghetu@nxp.com>
In-Reply-To: <20261116093751.138455-2-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Nov 2026 11:07:34 +0800
X-Gm-Features: AclHuK_cT3iD7Ffvch2F2nwvYrR_J4jujPvEa81BRVMErAOFxU7rIO6bAXKS5E8
Message-ID: <CAA+D8AN4q2BNceSORnZTO_BSOnBpvhdOe9AgVCO3Lo9WcA+cgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ASoC: fsl_asrc_m2m: fix out-of-bounds write when
 draining the output FIFO
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 5:39=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> asrc_read_last_fifo() checks the FIFO fill level, a number of frames,
> against a length in bytes, and ignores the frames already drained by
> previous iterations of its retry loop. With an output length close to
> the 512 KiB buffer size, which userspace controls through the task input
> size and formats, the drain writes past the end of the output buffer:
> 312 bytes for 10 channels of S24_LE with 8 frames left in the FIFO.
>
> Check the space needed by all drained frames in bytes.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 21e5cafaf823..5e9dc5b956fa 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -53,21 +53,27 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair =
*pair, void *dma_vaddr, u32
>  {
>         struct fsl_asrc *asrc =3D pair->asrc;
>         enum asrc_pair_index index =3D pair->index;
> -       u32 i, reg, size, t_size =3D 0, width;
> +       u32 i, reg, size, t_size =3D 0, width, sample_bytes, frame_bytes;
>         u32 *reg32 =3D NULL;
>         u16 *reg16 =3D NULL;
>         u8  *reg24 =3D NULL;
>
>         width =3D snd_pcm_format_physical_width(pair->sample_format[OUT])=
;
> -       if (width =3D=3D 32)
> +       if (width =3D=3D 32) {
>                 reg32 =3D dma_vaddr + *length;
> -       else if (width =3D=3D 16)
> +               sample_bytes =3D 4;
> +       } else if (width =3D=3D 16) {
>                 reg16 =3D dma_vaddr + *length;
> -       else
> +               sample_bytes =3D 2;
> +       } else {
>                 reg24 =3D dma_vaddr + *length;
> +               sample_bytes =3D 3;
> +       }
> +
> +       frame_bytes =3D pair->channels * sample_bytes;
>  retry:
>         size =3D asrc->get_output_fifo_size(pair);
> -       if (size + *length > ASRC_M2M_BUFFER_SIZE)
> +       if (*length + (t_size + size) * frame_bytes > ASRC_M2M_BUFFER_SIZ=
E)
>                 goto end;
>
>         for (i =3D 0; i < size * pair->channels; i++) {
> @@ -89,12 +95,7 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *=
pair, void *dma_vaddr, u32
>                 goto retry;
>  end:
>         /* Update payload length */
> -       if (reg32)
> -               *length +=3D t_size * pair->channels * 4;
> -       else if (reg16)
> -               *length +=3D t_size * pair->channels * 2;
> -       else
> -               *length +=3D t_size * pair->channels * 3;
> +       *length +=3D t_size * frame_bytes;
>  }
>
>  /* config dma channel */
> --
> 2.53.0
>
>
