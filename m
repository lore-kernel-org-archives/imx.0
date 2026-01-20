Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA238E120
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768893297; cv=pass; b=sNrr4+WX/fgMJFUFVW+UTZnZ22/ahr21rqPhxLoGEWQ8CTyE+AgFMIduwijoYteAvUowS3xA63dZJaQzk7/HOsGKg845ojiEo/SuHjsow8bD7uLsmcvNi6MB4TYgtTOoRljkuiwqMF2BERIBjcBJZoTb5SeAsseijnU2Q7MoUdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768893297; c=relaxed/simple;
	bh=2apavE+c+60xBpwAPAfHfp3nJczltL44E4xnBaDErHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7/esdGU+6h+iTL32zq8Jhjq+uBo4prL4oeLNIymmPpDZK2cbtBOVRkvAxAFrAFgJKG1+o54ldMJw6ghxZcwvmQylaIWZM5lAQGGXX7gBDKYroGz4c/4FC76+JXjU/mnjyFORuFYBtDOPtyw2Kmy+5MV7Y6TNDCorrKVQmik4zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIxVi7ec; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIxVi7ec"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so4025980a91.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 23:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768893287; cv=none;
        d=google.com; s=arc-20240605;
        b=eob66oJcX7Faj66X8pCN1QKrxeqd0ertJrPNkJtrlITvtUxn03JV7dng1vfk3jKM5Q
         51W1ZPKqVK1Qfx/o6f4GJi6YwazzHsr9LWVwdYCbmgfYlQv8AzOELnhxYWVUXa8SUP0d
         j4fCBtqL36gOxWSU6NrLS73E1HoKb8B3EQRCjAzTyWZqPraMcicHdLWjjNINao6v9gPC
         tnxl2ewvQYEamHOzuJOTR7XE/GayjDuAOx7RsTIAYOzPqqetWGkFP0X7QzpWIfF0q5PQ
         I3bzJHwxAarJCbm+kV5FbQgC5Mwf5gPI9C3ewFqFrfuEcr2tY12VGLKv8AyrOQGWWxgc
         MOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGLQil2RG9d2Wuf3AJIGoH64VyiurRe3JNq+iqICMGc=;
        fh=VuAKF/D7QlXJAYgB0wxDW/R3edDI2dVwphVA0fPCReQ=;
        b=Zo3PGTX0M59IbeE2+qycAUnf5G05Ew3oiUy1ttV9gbUCf8wNIynangCxc2vcsxgcxb
         41gD5rPNYusdURC6toIYZT+c9E/p5OT58emvwdYRAQ8/iLCEOXR/F0lMvUO5dEf+NGOK
         UXLcwOhe9cgfdSzAGitK3//1fSGz7B42vaqIxTQsz/5InpQiSSL49f16imwt55DXO90/
         7PuXI2Q6+ZMglLbz/Uk1DEDHEnTG5O5zDUxmzEzuTSD6p6zDyn5xuOtmeOOcaRZYbF0b
         HNYJ1N1poPTuCXWeFdB2YFunB1UVHtCutYeQpLuthHYzHJX1eoTyVChvlEn6QxsRihq0
         QjZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768893287; x=1769498087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGLQil2RG9d2Wuf3AJIGoH64VyiurRe3JNq+iqICMGc=;
        b=TIxVi7ec1T67uFg2lDNHqkf+VyJ60XydDIO2i52aPyIHKXyXcaSgGDfguTK9an3tdT
         zRCKqQjYPJc0zfZMMG1gLYZzDcD8RKoZSN3wdQrgV8RKV2Z+rZZ8L0nMzEIUmj7s42IM
         46WURu5SVYZVoNea8zYR6P9+B4SIK8l76K0jUVUPuwxIw9X1lWhofJpXNCLLUou6p24s
         ZcXYdl+a4hhMYoFtpcTkD+d++dJxvN+0kSDO3Xuns8ygnbO3OqCP/JR+294PIb0H9lco
         LYM7oZEuTjfqU4EiLF0s9ECA+6b5RVM9xEkiVSmmShwGAiSurnL8ehbKB1x6UXed2B/I
         rgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893287; x=1769498087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGLQil2RG9d2Wuf3AJIGoH64VyiurRe3JNq+iqICMGc=;
        b=QWwnynVqd/FdD/TptGs8M+QaDGOWjBiYE1ApAtACl+3QIxc1AFYAwo1yLFUG9EUONf
         UG83COm0ybSgzth43n8aIBvCKHv0cNDZaUYgtK7+cK0TSekz+//z1N88qQPYdnbQit0k
         +CkPzYA9/qvszVRRy1CSwmvII43oSFoYktDSs8/O9mWi1kbvsGkZeLOxHvu6qdClzwyb
         YKx1rQXvMfPZKYvTU+5Vhm/P7A2R6suM7nUl8USItvWKXoWF3OI/P0TYgLc77ziQCj/E
         uvPs0a1ZLKk6A2TT08vJAUUvt5SG8P0W5afTpDkcOz3j7IPGKTNsAb2na9yIdIwnWxrU
         m3tg==
X-Forwarded-Encrypted: i=1; AJvYcCXm6I0/UWIcNMv6n4HwhszT1ZoB7DAua6D9NawzQRUqZnn2rRCbS6jWhreq4THSqwU66JA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxvgdNYb1ZGeC5H9k4hwwhGwbaU9TpyarrP4+FngzETkhEaPj9
	3NOhXgEa1vTQu44oKrdPBBwYHtvOdFRz0NPy0xezIm9wNyCRonVG/5Q+Vh1V1C4QMkVGDa+c1mf
	jtnFBuOYALVwti7zawPvlcNk6guasRZs=
X-Gm-Gg: AZuq6aL0qWaAEt2yKHrPrDylo/n16iBWiA/CTJsVTnoQoj9MZc7dZ9j6sXvD34aARF2
	GymmuDQdMPyP2hLFWADS11ZiCiTw1cTfBdagrvWrl4lYA9u8y7se7phxiYib3FfOZPZRWsOfROy
	FhfPZ0vPVAiWNIssXKjwDOyIKznPluGfqZtAaDCH/wD+QRn51PRtsRpRtkMKz4OY1+aEstthMvt
	/InHzJjbnfSTzjxv8k/dVrZu0VN9nMOCxqtsow52orA11/GLVl5+9nTarKI9RjBwuAW/8I=
X-Received: by 2002:a17:90b:1c84:b0:343:f509:aa4a with SMTP id
 98e67ed59e1d1-3527329c737mr11291662a91.36.1768893287413; Mon, 19 Jan 2026
 23:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260118205030.1532696-1-festevam@gmail.com>
In-Reply-To: <20260118205030.1532696-1-festevam@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 20 Jan 2026 15:14:35 +0800
X-Gm-Features: AZwV_QhANuYAMbdvOcsvLwzcsqnrExKdw3Lq6AQB2yvSz6Q2_jO2O5XyvjGg3fE
Message-ID: <CAA+D8APZ6Un4ViiO0PMDdUhnef6ny7BtJ+DUVL0d3qUkNVrMjw@mail.gmail.com>
Subject: Re: [PATCH RESEND] ASoC: fsl: imx-card: Do not force slot width to
 sample width
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 4:50=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> imx-card currently sets the slot width to the physical sample width
> for I2S links. This breaks controllers that use fixed-width slots
> (e.g. 32-bit FIFO words), causing the unused bits in the slot to
> contain undefined data when playing 16-bit streams.
>
> Do not override the slot width in the machine driver and let the CPU
> DAI select an appropriate default instead. This matches the behavior
> of simple-audio-card and avoids embedding controller-specific policy
> in the machine driver.
>
> On an i.MX8MP-based board using SAI as the I2S master with 32-bit slots,
> playing 16-bit audio resulted in spurious frequencies and an incorrect
> SAI data waveform, as the slot width was forced to 16 bits. After this
> change, audio artifacts are eliminated and the 16-bit samples correctly
> occupy the first half of the 32-bit slot, with the remaining bits padded
> with zeroes.
>
> Cc: stable@vger.kernel.org
> Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/imx-card.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> index 28699d7b75ca..05b4e971a366 100644
> --- a/sound/soc/fsl/imx-card.c
> +++ b/sound/soc/fsl/imx-card.c
> @@ -346,7 +346,6 @@ static int imx_aif_hw_params(struct snd_pcm_substream=
 *substream,
>                               SND_SOC_DAIFMT_PDM;
>                 } else {
>                         slots =3D 2;
> -                       slot_width =3D params_physical_width(params);
>                         fmt =3D (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT=
_FORMAT_MASK) |
>                               SND_SOC_DAIFMT_I2S;
>                 }
> --
> 2.34.1
>
