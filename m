Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793934171;
	b=y1o8VnX9v5i7JhSXy3HUCaXfigp8Zujt1gdwRCnk6Cx2mhktMuc7vRvO1stsLT4pIbUm
	 oBBjk134y1BwdrsvcB5yeV8dbv6IOudVJ/QwNXUUjG+kzogDGBA/nezfRlcmOrVYUAFQC
	 xnNL0atCDP87CDOrwsY+uYmJkDFFv5mXmFv/wtKjVxzEBXmKtCvviyv49Vr00WIbgHnfK
	 Uochhgzp5X3Q0+8v+F6QPdk1hGNXGc/wBxav3rlBips+APlR1CIFi0FYxKXr8ElcfOcWP
	 vRW5p7a5ACmm72FiLdaujjnXDA/t3bQBUdn184vE5tK/XkHV7Av8awdT8dPyxA1f21Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
	b=3wfL6zZHH8eIGQcsnzH0TCq79ABEqqDDjmCNkd6kXxutoEvusdNmUkY+2lEYu3DDpnpl
	 TfN0AdF2wonZD0LXLXK6zzwq3MUbJt746bG49TA948HzfnnN2TV2io+dM+La626c5ZdZx
	 iM0cfejo1T5jQybZu+kCBKsoIQBJ2A29O1sNV3FPMFmSEYTcFmbYNNP1wBJXHqMTFDF+y
	 mgJe1w2V5SUymLpKlmwbd515uABQtk4u2SnPjSzbqNMJg0akaezMhS8x5yvBuFZbSReHd
	 mf4e3MGWRCT913XkqBld0eu+X3445YcJ0mylLNFRmA4R9ByFpYDNwHzoUxt+AFCFx4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPVIkq6V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25E606A328
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 03:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D25E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPVIkq6V
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so544731a12.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 19:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793934170; cv=none;
        d=google.com; s=arc-20260327;
        b=r/HzaEUl8PgDfm6MDHeoSFae5prcLTAWalFX87iAtv3p5MKaYo5s1IVdnm4KRXWdTD
         YyDzG2qfB9ucaEunkf7d8wVE/qWm7NErG6JO4/g3QsBgnwMpF4H1c3LjsUyWjrFnrtHH
         MNl6UvtfAEa/QOxQHMUaitcMoOiJui7BoOAaavPk4mH3GRtaOTExF6Grjc8P136+dmp/
         6bDAd0V2/BFX3tZY+4vHIilo/i96JrGlPjHpqhzUIdtpfFpjLcaYDngFiEtxaEmGzO6G
         x+xmsFtBeBet3wiNwzYQsaZuxkibX2bGgUoF/lNK5IWvvKp3kct/daWy4Ly8YS7EB3/q
         IA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        fh=ZhoRWCgMVsNSsjifHWsL/ANsGTBGuMo1uYp+w6gyTGU=;
        b=r3bAvj4CMhZpUekDdydGUKAeDG8jphCmOfCpVLy5Xth+N6mgyGRw+l7/q8Fd+iyOtE
         t9zE1hjlNOnAKSL4OOBVc71z6lrIuzmMQ3DWFUHJFHi+58WWNTpuiJIlZ0CdYb0C1N9a
         jE/PKinK7prto3uiG1Q5D1nti2uZZpxxrPFejQzJWtN+8NWW1gb2NkfXenSQGqqeygsA
         Kh06AmcSCYb1Ppx2pCfajXdnH9EIkPkGFQLdiQ5D7ibREAcgSORiRJ4YB9tWT7Lt1peC
         Ac1kANiWqC07oqxMZyWk0ZRWfAGAqdzsNjYMVNbJMcDO9gs7rSGX9XosV0lzZ4d6zQOV
         EcPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934170; x=1794538970; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        b=jPVIkq6VIOwLmf/r71+k2PWCVqZR0OkM/w8eONnGl9aVaK6uParr6819z+RAFNzyJT
         td5h/3kZpL9a1WI0WltYYPaeYFIh6GnRuxm/NEdx+NZEssVmIiXZaINuKdBFWdtowaMZ
         uLpm2W8sxTRTLUtZMth4u2KMcdUEpnSYJ7c1SBthtKsbgTCKQhoG4cJs/yzNi5urUXEJ
         a9c1/IJtTvGuKb+tPewGuYwqDALY6INbUoAdgC3XQF54nToAcwPmQrWbHM6YIHes+VwA
         mMcTif2buIOkAOZYWZBcIbniqBXKBKEGfwaATX9u5Vn6CQiqn3G68Ut7bGQkBrIQ+zfg
         Ji4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934170; x=1794538970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        b=KJ3qQPvHN2Tb9PY9/FXaiyBsJ/ELs5LmEaoUN3LZWPgM1Rlotk3leL9HAtgA8XZY8J
         A3o1ZVrCDYiKS6B4tgEvbul4IKjZYqtZ/76n7NLemuDtCaSC8i29wVajdhwrGqS3gnMs
         5M9TNcZIYQeuPqptv42D4s6uuV0b6QxAWbc8zqQQOppTkfTa9RBscb89iIMyEwYQowiN
         NfXrngElhYLFvDhwbLLTqG1JIPIl4GK1Ql+szwyquBClkPcr+6fw+cBuDliVMDALuL6i
         UvbkH1GEOGnHTQuJn11hkMSbC4Zk7KuXu5BLVMVbbaYD8fkK2GKTapO+W0Fhwu+6jLVP
         5GXg==
X-Forwarded-Encrypted: i=1; AL+hErFeuKeq88yUz+wRl9Hb8J1rJWLMamsYej+pdGVzTjSXkpl9qjyo7KIYZrevUqKESOW60eg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Q7sI/ElvOsygvTOfy18gQ+Ktbc03On0oVhDuyk1p2tLNZlNa5
	s95ad2fnYK1j+sp3qgR+gdLfrvnKblaE+WvgK7IxKVQi0+kiDXbxsJSC+z4kpLCJ7jPrfF8ZG27
	Ai5oLdv9xyBVv5Jd+mzFHN8MISDPTECk=
X-Gm-Gg: AYBFou3nxhuiQ75y2fRlueS2GJstR/zypNBXQKvEt1JN5i9FL8FqmHZ7RGr52yyyh/L
	87dfQw3QdxLB7dSa5F2PO9w+Q2puMYaxVeMxUuyaNQqwIbVebUAsdcrj8O77479c4rBb+Tw02C9
	tD/EzQ0Nvgv1UNN/8Ciovp6LZ6BCgd9JZkXKMu+namrOQp63ZxFykByXUAf/Mo1kcy9oB3CduSN
	WjaBk1/NW9C3LsNPjyupCI+ccfpa0+PKKlarsNwJ9Lx61hJR3GhmIjjqk4GqvhbBxmTDQJ6Mi2c
	0g5rVBRQ3b2s6THRiPrS0p6dXI1jMiqLGigP52ZvRJDX3gxIspRpSTNXR4UAB98oBHMtzMp1EsS
	fSws/5xIqiMNFC7uNnHNYw5cveGZ4lzuUa+04
X-Received: by 2002:a17:90a:d88e:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3b0db608eb2mr752950a91.2.1793934170297; Thu, 05 Nov 2026
 19:02:50 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:02:22 +0800
X-Gm-Features: AclHuK-7yWfD5nIIYc699a1XBrVl3zaaX5gaE-98V3Kig8gZod2anKcZN_IDxRY
Message-ID: <CAA+D8APkR05hUMm+KrRhZ+dkEzppNCqD9C3jSGiG42bFziE80Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_asrc_m2m: use dma_chan directly for dma_async_issue_pending()
To: Frank.Li@oss.nxp.com
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linux-sound@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:52=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use pair->dma_chan[] directly instead of pair->desc[]->chan when calling
> dma_async_issue_pending(), which is more straightforward and avoids
> dereferencing the descriptor to get the channel.
>
> Prepare to make struct dma_async_tx_descriptor private.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index c6970a7e88f3f..796a78124765f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -257,12 +257,12 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair=
 *pair, struct snd_compr_task
>
>         /* Submit DMA request */
>         dmaengine_submit(pair->desc[IN]);
> -       dma_async_issue_pending(pair->desc[IN]->chan);
> +       dma_async_issue_pending(pair->dma_chan[IN]);
>         if (out_dma_len > 0) {
>                 if (asrc->start_before_dma && asrc->m2m_output_ready)
>                         asrc->m2m_output_ready(pair);
>                 dmaengine_submit(pair->desc[OUT]);
> -               dma_async_issue_pending(pair->desc[OUT]->chan);
> +               dma_async_issue_pending(pair->dma_chan[OUT]);
>         }
>
>         if (!asrc->start_before_dma)
> --
> 2.43.0
>
