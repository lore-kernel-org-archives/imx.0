Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872602FD7C8
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447089; cv=none; b=dQJ3qUWUSnxQ2LsrxCeBVF90p/lcD6fe9mvNaUWxhomFVBFU6qwtbKKCsZ2pW7cWIilh2CfQ+EhQI/uekc7X2s1X18YCQDJInFd7u/SF+G9MdXBRNIwIxt9wu9PXz5IeFzCWqkVZtid1cqG2cU4Qhuina2P59Qrzs/y9oYu9g2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447089; c=relaxed/simple;
	bh=69X79MUwLlNysqrenmpwIMWai79eQpyscgHeiMgLaos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIYDv5h8YxelJwpfTzzqouuYuxRmUTpP8p80vZ3PdxEYzu4XqjANwKY/Ih9mw4r0TEBgaxPgbXoG2mCZJoE9mrukxrkVF+bF/mT623hb6F/Zk60er0KQ4kr/FtLeLxQ92rER+a5a6VgMSOQfTb8X2ardQ6JboA5F6oHM5+eZN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UB0amf9c; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UB0amf9c"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343f52d15efso846519a91.3
        for <imx@lists.linux.dev>; Thu, 11 Dec 2025 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765447086; x=1766051886; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
        b=UB0amf9cmQufl+Nhpb4LT636PBqPQj1H+NQaxKnZ60QnZNW+ipYVCUGxw+H0BBlXv3
         hrP4BjrCkjdzEosyzMeg4o3Dq7rmmZqu5uFx4jbpBGeWeQCyQBeZ30yod4Cu10KWScnJ
         7u56ezEq5VxcuLfrVcOaG/wOY4ZgCjljN3xTQEewLBCkqYa16jFhhamFNsN9kL+jwEht
         RJB17AeuLdxr3hfWYx0oHXn960hHqkVdE+PHBEqQoAnyohOrdceoM79qqZLDhAwQAw6c
         vTd0sIjOMeFdAYG82o82X+55Ev1zjZq/O1XaqYeaKXe2HjMbgA2WZFuBlQxEFz9NsUOe
         2eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447086; x=1766051886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNyn85HrHsekSKS6qB8hQwTaMqNxQMINHyw04qloq3c=;
        b=QDmWR+4W+NXOOgfT+Yq4l+ZMoirez4Cvmulhl7WsDCGExMF2QbFqXyJYbf30yGQMic
         nmbZY68kRBOqa6fmxcojv9f8NFt+wj4W4/2z2iW2Wg57wJDh/WEpnvS/Cbzxmttyirml
         g9iErRA/p2ehq6PLKADpiBjPWO5V0g3z+Tkj6mxxIzTdzxDq1K9JYIQQsO0mkUsV1Dex
         Hx6edmszqWdPWybfBjPLGSo8M9z+19YU6V8pZs3CUEg4rq7V3/trTK8+f/i8i5onVDS1
         h3xWdqVQ4uavrKPEdmzzgiWsMvfjKQg9NTRbbLZU7FBrvisOGoq5705zeNC7XhkQ/6mT
         QjDg==
X-Forwarded-Encrypted: i=1; AJvYcCVvKHINwT6euiKJ2e2AVgs1ud8sKStZdlUo89FMOpcJ0xR6wCYSviu233BHV3soaD0n6b0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy03HpZkn5o7KxiWGhKJ5CjKsRnl+JBQVy/oG1fS13++V1ZD8I
	gm/kr25/ayucFUzqDWUA2698la++eibzjz48asFGYScGRiNzfke3W8+UsW9z15RAPGIbD/Pjx++
	EpkoLF/KDGb4cwJqk/zgIapf7WQXHaPY=
X-Gm-Gg: AY/fxX5DNZHJGFb0emuxgaL5s3gedyS4RE8dl0dxBeMHgYB0++URzxz4RDtLWtPm8rO
	YaQ0oQ1LVJCzAKYx5yuLNvdB7GgMJUaycgkaCBn4zVSSCbA5KejZhqX2pOtRR55bKokzOpNwzfW
	978gk8seFbIiKkHfUsa0Kth7RnnBHTik3XeYtSkVhSVKOHF51rrJzf2Cj08Y6dehGnb+kt1+7Ek
	czDcC+Xa7nS6SzMNqgfA1j84bYokL/k/UZqKlekJzZpCocaPoLFC2I+CmLYHPXhtP8PjPQ=
X-Google-Smtp-Source: AGHT+IEPAez3qFaiu86XfuGUlJ09om+vEZUN3OHHINJOMWyOHJrmK5BgG+nV4ll7eif6AQOdoUJeVXNmsvHcSg/da2I=
X-Received: by 2002:a17:90b:3d0a:b0:340:bb5c:7dd7 with SMTP id
 98e67ed59e1d1-34a72808b46mr4444610a91.5.1765447085709; Thu, 11 Dec 2025
 01:58:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251210062109.2577735-1-chancel.liu@nxp.com>
In-Reply-To: <20251210062109.2577735-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 11 Dec 2025 17:57:53 +0800
X-Gm-Features: AQt7F2qVkg95kvsYnRruHeVoiRu6n_5hGKsx1QSuPHUDHP41AdIiLfw6-a86lEE
Message-ID: <CAA+D8AMfBL9qQR028iQGMSiMVB__NAiyE_DQ1qiJG=xABZhWdA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Constrain sample rates from audio PLLs
 only in master mode
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 2:21=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> If SAI works in master mode it will generate clocks for external codec
> from audio PLLs. Thus sample rates should be constrained according to
> audio PLL clocks. While SAI works in slave mode which means clocks are
> generated externally then constraints are independent of audio PLLs.
>
> Fixes: 4edc98598be4 ("ASoC: fsl_sai: Add sample rate constraint")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 72bfc91e21b9..86730c214914 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -917,8 +917,14 @@ static int fsl_sai_startup(struct snd_pcm_substream =
*substream,
>                                            tx ? sai->dma_params_tx.maxbur=
st :
>                                            sai->dma_params_rx.maxburst);
>
> -       ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> -                                        SNDRV_PCM_HW_PARAM_RATE, &sai->c=
onstraint_rates);
> +       if (sai->is_consumer_mode[tx])

The sai->is_consumer_mode[tx] can be changed after startup(),
then there may be an issue for the constraint.

It looks like there is no perfect solution here.

Best regards
Shengjiu Wang

> +               ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +                                                SNDRV_PCM_HW_PARAM_RATE,
> +                                                &fsl_sai_rate_constraint=
s);
> +       else
> +               ret =3D snd_pcm_hw_constraint_list(substream->runtime, 0,
> +                                                SNDRV_PCM_HW_PARAM_RATE,
> +                                                &sai->constraint_rates);
>
>         return ret;
>  }
> --
> 2.50.1
>
