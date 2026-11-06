Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793935347;
	b=q/3lXO0CF2YTOiTHZUaEngkOFSSoJIgg197XIEA4lDSg0sCTFtGOjnLKs6zHj/ejwF2U
	 kJMCsHQRRXRmV1Zb8Di87Uj1+zKxhiKoNh6Qc8jHQYJBEL+qDhM2XKmjG2CcLSRWmkTHp
	 6gpMI1g66QHM1Dt3LVF+79KylmScJFpPbQiGYbHujGnvz5RNvRkeeLp8FXQKnagIuxzd/
	 4Q8fGMd0bPjb/UJpwxUg3jcewgSwnwanx7A0bGelDONMB690fV39OoieLLjlFdvZ6kDSq
	 T07XyLC126og3zeZUHbXs3jyl/r/1UmhVcstpj1v+gX14KYu/N4LWDBGcB0kk6RLxig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
	b=N3FF0CPVpV8Y2S9b6vL3SIxU7n+t1QzzJnGemdrdFzKNtbFljwmNRAWCCgvgWPn1EbBo
	 MY1XJY7sabeUQRXQtpJIaQsjXPxnzYPVRTNdZ70xBtB7nEkXvEnssJ4q4/HGScIDT1VMJ
	 HIV/B9U/ZspeqbNrxj6H8OZLyC2ZnGkzY0ZxEzHr3uulP47IMcVg4X2lOt9F6IxqGI3yT
	 y0QqntkkW++wcKPWNyEi4zEnNTB4WyHus00sd51ejapqDDJc5i061HsBcso0Vl2Qm9TuC
	 sFZsyHxVuKeQ7kWYfOeCB0wtdt1nADkyLWXwRgmRaQUGKqhdagQF5ovASYw4P5mLXXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwAwtTEj;
	arc=fail smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF1606A32D
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 03:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0EF1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwAwtTEj
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so179476a91.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 19:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793935346; cv=none;
        d=google.com; s=arc-20260327;
        b=Yjh6nj0TeLSdVHpXYKHXvdNueMsPux01D/RF1ILj19dYqoKFly+Noavo/47SrzxUMo
         PPy98x4m5L5kIpUlRCm8/hgiwDyvv8Ut/nzmSl12aaAjnaHDkU0BFf1hSLRV49VI+XHa
         GvcaB4WOYVbSJBH8WIW7Ob7zVVUJ1Kn+eIQma+j/dYx91401299bFMZxi2mwO+JECUGu
         Zz/CilTvqom+yC+W5YiM1zZphFCgcm31JZ+75ydDR66FTCn8yY93PDpxtqVVvFz0XXHl
         lUYVIqOo+/cIJi7qfVtbfe/bD1fghu1oMZuHNj9xALw8za8q3pf9U9pj530rS5idAQA3
         xwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        fh=YXzmdTG+5Y3Zb9/G4ruYSj1sKn3WGtQFG/y9V3G1/sw=;
        b=g3g8uVI0OOZCFNkkF1p6y6AGiyHkH6Bw8V/IzoJa9TeieLPpzj4K2jwx1LUQI7Ox/o
         M2flfYSGJEVKLakIfQl4xq+TjTSePWYjGTNi3O+ukYTK6S7EJEiA1Xy8RdHOKpGAdV0C
         vV7nf2qeW0tumx0FCIxukkzftY/Cga4jghSd8E3awkzv73hMIb4eChuSwcc+mMipHWGP
         LE2BbbtNq5IeUWlBvNVbbHI+50M7+cQu1MBhAKQlHQVOCP3A9z+zBa3KYu5Xz7Ybjtls
         aYZQHnad5fJYAuGB7MluwKFPVkC7x8rLq+vOIkKLJmpesRCf2gAUmP/yVG4v3iOqhkCo
         yRpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793935346; x=1794540146; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=EwAwtTEjl+17SBF7QGSv5SCSorfHscg6h2znXor/JsXRupf0K1wZ/sZLXNS8wL381r
         9mGbU/WhOc5aWyIDUHX1n3BdqNPKD8I7bIlZIaV05fDWowPw8/fnWFOEUM81MJNOt1FO
         rB/gUuJLAeziY2V7Cyt2i8H59s18ixRWheRyOlV75+zrcX9Zbu1nZ3A2kD1KOFuPiKFM
         AsrZNFke9BVFlw9GbHRDHCVHjx6bhCuHL0yrvmBA73JweDaUyOSarAGUmcpesWXn2ZNc
         m9F6/w1ZdH/qdUWsV9LUxPPkWEVJIC4mnZLmWng2i8TgIwOwjYPQgnJVPyQ61zFgh+c9
         nBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793935346; x=1794540146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=ZiWRWtTUGNlvCioYs1nhxwV1y7zjkZjdgrxIYQIzqmUwctsyPSwXqKQL5KFWcejWYR
         aOkh7YfxwqF2JLi5QR9TNSe8lzg9tvP9KhGyO8Ao6SpQLJ9+fbVdHkHmn8FrQG36DUWK
         nA3ciubon7/2rTKSlNAZd3CnI8SQTj5j1u97lPuqDgeo5LxDJ9/mh3QmF/xCwX+i45LF
         +9A04muGOw81oWRf3qZlhVRrEKa2s29tWVXctx7RZ6Pt2avHeXtshgB0s0v4qAIjDdct
         luSs+CmcixzAztadLqeXSwnEOmGEno4hRfbwCX7/XjBjw7g1Di0fioeM95q2uzlTzn1b
         ALYw==
X-Forwarded-Encrypted: i=1; AL+hErHioJsNrhMZYjcJoT0d6cUgkdBIECqqxCp6NTLY9CFrRSM2BXsoJVCpd61zgTe6CHWi+88=@lists.linux.dev
X-Gm-Message-State: APuU4Z9zecb2E1ETnDZgL2OQte3O8svYmBkxoxKgKbH437vmfyxsaJ5D
	djiSU1Wol2kAo84dd/whEyCuEAHOmPVdCcAPi5VITH+RMJOMXWx6vKEQg8iUQ533JGa78CxBpDb
	FiT8cvl8+VAj3VTMJoDZ9RIVQMnJLrnw=
X-Gm-Gg: AYBFou00rXIAFOJtfqG7+vzaEDxy4ePRrzpmImenu+vx2NuhunoRUumMazahzph5j4U
	vDcC9agWODQAgAmAusHHSuDsKQYbAiwH8lJ3/CwKSVB9U3fRbq/Ol4Yq1/lnM8JZXEXe65i3bPB
	XBUrmfwJEuI+zEJG0mZbOvrXburm2CzZhxb6Fjz7aquBp2JVknuH2Y3WVBAi8NIe5JeFirXDm1q
	wLkeoifYGUCMLIiMRGZ1ul0D7Lice9NhXiHVIsaqiPJ35bE73SLtB1GsSFVXLI+QpUklQYAUagz
	cNeQnhgkTGanfLcjoHMmSFyFkWLGjNFIkI1D+tOn+D3f2Xl1sKoQlwtVtB2OxBXpaClPnUQ83p1
	1e4zFQT+/1vAMYXotxYsf99UdehBO0BPeY8ru
X-Received: by 2002:a17:90b:4983:b0:3ac:9d26:551d with SMTP id
 98e67ed59e1d1-3b0db6f11f7mr1320600a91.50.1793935346215; Thu, 05 Nov 2026
 19:22:26 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:21:57 +0800
X-Gm-Features: AclHuK-h3hDpTZTCQrDXlURnXU4dNiye78ZL33OWRSh0a0w-nnzOWFYn2sw0Q-0
Message-ID: <CAA+D8ANwEqFJYQ39h+1A3zXhcUfpFGzSvVjEzx2htoYxB4sLGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC/sound: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Frank Li <Frank.Li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	"open list:SOUND" <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev, 
	vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

For fsl part
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/core/pcm_dmaengine.c         | 3 +--
>  sound/soc/fsl/fsl_asrc_dma.c       | 3 +--
>  sound/soc/fsl/fsl_asrc_m2m.c       | 3 +--
>  sound/soc/renesas/fsi.c            | 3 +--
>  sound/soc/renesas/siu_pcm.c        | 6 ++----
>  sound/soc/sprd/sprd-pcm-compress.c | 5 +++--
>  sound/soc/sprd/sprd-pcm-dma.c      | 5 +++--
>  sound/soc/stm/stm32_spdifrx.c      | 3 +--
>  8 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..41feb5312ffec 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -169,8 +169,7 @@ static int dmaengine_pcm_prepare_and_submit(struct sn=
d_pcm_substream *substream)
>         if (!desc)
>                 return -ENOMEM;
>
> -       desc->callback =3D dmaengine_pcm_dma_complete;
> -       desc->callback_param =3D substream;
> +       dmaengine_desc_set_callback(desc, dmaengine_pcm_dma_complete, NUL=
L, substream);
>         prtd->cookie =3D dmaengine_submit(desc);
>
>         return 0;
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe4..cd3bf6340b650 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -76,8 +76,7 @@ static int fsl_asrc_dma_prepare_and_submit(struct snd_p=
cm_substream *substream,
>                 return -ENOMEM;
>         }
>
> -       pair->desc[!dir]->callback =3D fsl_asrc_dma_complete;
> -       pair->desc[!dir]->callback_param =3D substream;
> +       dmaengine_desc_set_callback(pair->desc[!dir], fsl_asrc_dma_comple=
te, NULL, substream);
>
>         dmaengine_submit(pair->desc[!dir]);
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f9..c6970a7e88f3f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -176,8 +176,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
>                 return -EINVAL;
>         }
>
> -       pair->desc[dir]->callback =3D ASRC_xPUT_DMA_CALLBACK(dir);
> -       pair->desc[dir]->callback_param =3D pair;
> +       dmaengine_desc_set_callback(pair->desc[dir], ASRC_xPUT_DMA_CALLBA=
CK(dir), NULL, pair);
>
>         return 0;
>  }
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 74e2ea002fbb1..fa21cf47befff 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1375,8 +1375,7 @@ static int fsi_dma_transfer(struct fsi_priv *fsi, s=
truct fsi_stream *io)
>                 goto fsi_dma_transfer_err;
>         }
>
> -       desc->callback          =3D fsi_dma_complete;
> -       desc->callback_param    =3D io;
> +       dmaengine_desc_set_callback(desc, fsi_dma_complete, NULL, io);
>
>         if (dmaengine_submit(desc) < 0) {
>                 dev_err(dai->dev, "tx_submit() fail\n");
> diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
> index fd5b20b469a4a..7208514e16a43 100644
> --- a/sound/soc/renesas/siu_pcm.c
> +++ b/sound/soc/renesas/siu_pcm.c
> @@ -125,8 +125,7 @@ static int siu_pcm_wr_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit a dma transfer\n");
> @@ -175,8 +174,7 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit dma descriptor\n");
> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index f790b959cd4e4..a810c9c8a0b5b 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -247,8 +247,9 @@ static int sprd_platform_compr_dma_config(struct snd_=
soc_component *component,
>
>         /* Only channel 1 transfer can wake up the AP system. */
>         if (!params->no_wake_mode && channel =3D=3D 1) {
> -               dma->desc->callback =3D sprd_platform_compr_dma_complete;
> -               dma->desc->callback_param =3D cstream;
> +               dmaengine_desc_set_callback(dma->desc,
> +                                           sprd_platform_compr_dma_compl=
ete,
> +                                           NULL, cstream);
>         }
>
>         kfree(sg);
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.=
c
> index bbd7516f81954..968901ae4c335 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -287,8 +287,9 @@ static int sprd_pcm_hw_params(struct snd_soc_componen=
t *component,
>                 }
>
>                 if (!runtime->no_period_wakeup) {
> -                       data->desc->callback =3D sprd_pcm_dma_complete;
> -                       data->desc->callback_param =3D dma_private;
> +                       dmaengine_desc_set_callback(data->desc,
> +                                                   sprd_pcm_dma_complete=
,
> +                                                   NULL, dma_private);
>                 }
>         }
>
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.=
c
> index 88863dbd05d9b..44467a25fb69a 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -302,8 +302,7 @@ static int stm32_spdifrx_dma_ctrl_start(struct stm32_=
spdifrx_data *spdifrx)
>         if (!spdifrx->desc)
>                 return -EINVAL;
>
> -       spdifrx->desc->callback =3D stm32_spdifrx_dma_complete;
> -       spdifrx->desc->callback_param =3D spdifrx;
> +       dmaengine_desc_set_callback(spdifrx->desc, stm32_spdifrx_dma_comp=
lete, NULL, spdifrx);
>         cookie =3D dmaengine_submit(spdifrx->desc);
>         err =3D dma_submit_error(cookie);
>         if (err)
> --
> 2.43.0
>
