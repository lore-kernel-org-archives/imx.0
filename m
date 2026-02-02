Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F234D4E0
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025473; cv=pass; b=q/TiBMtvl84QEhl1D/t1/eQgl/DFTHf5IvE9m4U4tjOfs3bfYeYn456ZJMixPmzJeFC8aP/KD9Ce9CFsngO22CBNzV+JF6V0MxR9+U32CU6wMJcB5Hqt3CP0iYuxZEE15zJrT6cxGKQe2bSAyTItPER6qh0mjM96+paBG74YA5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025473; c=relaxed/simple;
	bh=TxocIH3WSUgiuoUqSarLJ9wDs59/gNeIjdpFZaZiiIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfgsmovwoYdxg15/qEozOa00NWWwWLhCB2V8Nw8VNR2nQEr3gYzmaQePSa5XvuKvkciUxGLyuur9jLsUCVF5y2Y3i7iPX2uKoCFK2So57rwrRKsi/Lt6RIndVgrvWDn34wshZats73UGy/1dwbk1CdQwPTPAgKhPsiSqKHr8Wjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvJg/CEX; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvJg/CEX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c27d14559so2234358a91.2
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 01:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770025470; cv=none;
        d=google.com; s=arc-20240605;
        b=g4phpPMd+UA7Vbgiu1Dsg4WLcjt1nmjKtHTCPP7gAyF6NMlnODm/ooCFC1+cN+Gjxi
         nO5Fdp96Ig3bUkTcYZc/XuqnkKXaK1Tp9QCUvR2Xx1wh1RzkpFcoqLBAR0Gx/RHHm00V
         XC3N12Q3sj5/0CO47DwgID/ZTKqnRmT3oewtq6kp4wKHoJEzgrCJvT0wSA2bJyG0ezKy
         lSg1VOm1b3RBfA8Frd7CA8flFgSjYG5wRwr6kmilHt0j4xFTOKlDQUfD8K3ajlZRGqU2
         LXg3OMURQFNlLM32NA2dtznxoD3o837NWvNYEiqAm7qreJEN9d2jGkdlqQ1aUN1U3X6a
         9sFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        fh=XlHJ7NUetW7hdXCwKrJmXencmT0mCTjK0w1X6nM2R2A=;
        b=RZFJO65QOi+q8sx5dKWcnPttW/52rbR/LHmFRbGkInKKWq56aQlb0FBA65N8REyYMq
         oZPE4ntHrsfoSzevIwwcy3ikmCvCtN2/P5S3XpfcGScNa7gmbBv4mMt+RIGXmgSRAS5S
         LA19d0tldg1H/7V6+uxK1VZFnmH1x1LlzG+zMjRiAUKVI0TNCgq/0U132QHmajjCZ+V0
         +kSU3S0jGiqKdkzqiSSO7E9kIH0auprGQaid22h2awIu/fpqDTiF9y2E471UNLSzbJKC
         t5sOryT/o6FZlqv7ol+7GQcNew1SvvZjkxSvkYxpVgG47Y03cJDaOADQt0qUB1qdz8/D
         wY3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770025470; x=1770630270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=EvJg/CEXSruWbrMeqzjbtsARE5v8Uur2vZzYoU0Q7MoYuHAMLDCWkuV3gy0CItC14H
         jrtYfic6aDSjQlth7xZ9lRl60sFT+7acCjiLn5tr6U9YqMyJ6x5TjyK2pO7sp7ch1On2
         bNTglOWyuDH4GGgRnOcJKv9miuSpwCsDHn0ozYwYugHfw3pCnJ2dgJnMlLMz5L+GfcP/
         7eWyAMwD+BN8i3luNOsbuQoQZ+26Zq1B25sToHsayTNiLnyhCr9+jqMWLS4dMTT4D7BA
         0EITfa87UGfiNN3Wzq9JG92lbGhgkSGrp2na0Onzgyg9nnPA97gM14q+qIgHlVJLyjKx
         7Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770025470; x=1770630270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAF2UH/s9XOKetfcQpOwLtcTNJG8Fm6zI5indZbLJnA=;
        b=l0NBV1QJ1qmPqcrW+MDbIdto/MaSZqwjeSfpmIRGRTjG96+lhIALGg/bAiC9H0h3QE
         WB7747jnZDLKhrY3kLNy0dLuHFIL8calYStmCYln8NRmS+r4qjBGBmj1wEAa8FAFnmmI
         5wCSOhY2KaykzEpp001qghXjYXLFtUdatdCRUoVOfRma9iweq0l1AbkD/jgFXjzR38Pc
         Uz1rQb4VrLZQCcAtGgyKVktgLFKFZyBeu53GVldZlbN0icdtuq9y8uPW0ZHcCv9D6+Vc
         vvIGv+g3g5EZcyyLu0fjdnotyAGBxLzvWDzbw4vKUR+vcVj1bHaJkQUBGrqC85I3tFUG
         zKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXQpeH1LVHFvaURje3En3ggTUDl0b/rXC+SgBHaMhH3BPRxPOHPME4Tm3tnle12xFE4SY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWTsym7beoTjwpiPP5P4QCTu0jRNfKwgMLNozTBa+NJOnVU1Aw
	HtQVs8fcoaDfM1O0HJxuDnjuypwra/vmMjqs+9bqR1QqMkJDVP/TK6i6ROeILhs6O/BoVZ18skJ
	Ha3lmwunEdJBpzqHwbkEihNjVEcEYpxY=
X-Gm-Gg: AZuq6aLttcNuWDB8LfggtRoTo8bNVCF1YKL5cAS9FGGAQPV47MMiQbkgNG+1ozCmDj+
	PYo193Hc6rR7UQJ9in/OBTanJHWFcT8TyFtD0AZ3xCk3ye0I9NrcQ36K+IBCDsY3lkI+ErOp+KL
	oZFKPqP2rMFU55qWVhpy1LZ3+QRGnUEQ9StWk7TOSTweoPVgcQwYjFLeuNfgQBNukb2XT9OWRt7
	hqXPDN0wSbtAeTfiASnQZA/78Qeoy5HhloubHfGNzTS3WrFR07ucoX4Cm52KF2qY0DIIlsFKAEN
	Mi16Sw==
X-Received: by 2002:a17:90a:e704:b0:340:f7d6:dc70 with SMTP id
 98e67ed59e1d1-3543b32db3cmr10551164a91.13.1770025470178; Mon, 02 Feb 2026
 01:44:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-4-shengjiu.wang@nxp.com> <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
In-Reply-To: <aXzDlScEXfmUys32@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 2 Feb 2026 17:44:16 +0800
X-Gm-Features: AZwV_QgU5fRT0_5Q6bzl-9D65zjMNMGvATERP1AuFCLfH7W34TynL2XUXVAiodw
Message-ID: <CAA+D8ANrW0N7Sjbat_LN3d8UbcuN-=DOKjfF0XncgqqM62rCMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: fsl_asrc_m2m: Start ASRC before DMA device
 for M2M
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 10:43=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jan 30, 2026 at 01:43:29PM +0800, Shengjiu Wang wrote:
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > So need to trigger asrc before dma on i.MX952, and add delay to wait
> > output data is generated then start the EDMA for output, otherwise the
> > m2m function has noise issues.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 25 +++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        |  2 ++
> >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++++++--------
> >  4 files changed, 52 insertions(+), 8 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 5846a2b1f73c..2374577c13f9 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1084,6 +1084,28 @@ static unsigned int fsl_asrc_get_output_fifo_siz=
e(struct fsl_asrc_pair *pair)
> >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> >  }
> >
> > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > +{
> > +     struct fsl_asrc *asrc =3D pair->asrc;
> > +     enum asrc_pair_index index =3D pair->index;
> > +     int retry =3D 1000;
> > +     u32 val;
> > +
> > +     /* Check output fifo status if it exceeds the watermark. */
> > +     do {
> > +             regmap_read(asrc->regmap, REG_ASRFST(index), &val);
> > +             val &=3D ASRFSTi_OUTPUT_FIFO_MASK;
> > +             val =3D val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > +     } while (val < ASRC_M2M_OUTPUTFIFO_WML && --retry);
>
> use regmap_read_poll_timeout()

Ok, will update it.

>
> > +
> > +     if (!retry) {
> > +             pair_warn("output is not ready\n");
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> >  {
> >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > @@ -1281,6 +1303,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >
> >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> >       asrc->request_pair =3D fsl_asrc_request_pair;
> >       asrc->release_pair =3D fsl_asrc_release_pair;
> > @@ -1295,6 +1318,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> >
> >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > @@ -1565,6 +1589,7 @@ static const struct fsl_asrc_soc_data fsl_asrc_im=
x8qxp_data =3D {
> >  static const struct fsl_asrc_soc_data fsl_asrc_imx952_data =3D {
> >       .use_edma =3D true,
> >       .channel_bits =3D 4,
> > +     .start_before_dma =3D true,
> >  };
> >
> >  static const struct of_device_id fsl_asrc_ids[] =3D {
> > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > index 2f67b085de24..1be93148a879 100644
> > --- a/sound/soc/fsl/fsl_asrc.h
> > +++ b/sound/soc/fsl/fsl_asrc.h
> > @@ -446,10 +446,12 @@ struct dma_block {
> >   *
> >   * @use_edma: using edma as dma device or not
> >   * @channel_bits: width of ASRCNCR register for each pair
> > + * @start_before_dma: start asrc before dma
> >   */
> >  struct fsl_asrc_soc_data {
> >       bool use_edma;
> >       unsigned int channel_bits;
> > +     bool start_before_dma;
> >  };
> >
> >  /**
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_c=
ommon.h
> > index 0cd595b0f629..c8a1a2b5915d 100644
> > --- a/sound/soc/fsl/fsl_asrc_common.h
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> >   * @asrc_rate: default sample rate for ASoC Back-Ends
> >   * @asrc_format: default sample format for ASoC Back-Ends
> >   * @use_edma: edma is used
> > + * @start_before_dma: start asrc before dma
> >   * @get_dma_channel: function pointer
> >   * @request_pair: function pointer
> >   * @release_pair: function pointer
> > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> >   * @m2m_start: function pointer
> >   * @m2m_unprepare: function pointer
> >   * @m2m_stop: function pointer
> > + * @m2m_output_ready: function pointer, check output fifo ready or not
> >   * @m2m_calc_out_len: function pointer
> >   * @m2m_get_maxburst: function pointer
> >   * @m2m_pair_suspend: function pointer
> > @@ -143,6 +145,7 @@ struct fsl_asrc {
> >       int asrc_rate;
> >       snd_pcm_format_t asrc_format;
> >       bool use_edma;
> > +     bool start_before_dma;
> >
> >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, b=
ool dir);
> >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
> > @@ -154,6 +157,7 @@ struct fsl_asrc {
> >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> >
> >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buf=
fer_length);
> >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.=
c
> > index f46881f71e43..296e13a16490 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,28 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > -     /* Submit DMA request */
> > -     dmaengine_submit(pair->desc[IN]);
> > -     dma_async_issue_pending(pair->desc[IN]->chan);
> > -     if (out_dma_len > 0) {
> > -             dmaengine_submit(pair->desc[OUT]);
> > -             dma_async_issue_pending(pair->desc[OUT]->chan);
> > -     }
> > +     if (asrc->start_before_dma) {
> > +             asrc->m2m_start(pair);
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     if (asrc->m2m_output_ready)
> > +                             asrc->m2m_output_ready(pair);
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> > +     } else {
> > +             /* Submit DMA request */
> > +             dmaengine_submit(pair->desc[IN]);
> > +             dma_async_issue_pending(pair->desc[IN]->chan);
> > +             if (out_dma_len > 0) {
> > +                     dmaengine_submit(pair->desc[OUT]);
> > +                     dma_async_issue_pending(pair->desc[OUT]->chan);
> > +             }
> >
> > -     asrc->m2m_start(pair);
> > +             asrc->m2m_start(pair);
> > +     }
>
> if really like start_before_dma, move common part no change
>
>         if (start_before_dma)
>                 asrc->m2m_start(pair);
>
>         ....
>
>         if (!start_before_dma)
>                 asrc->m2m_start(pair);

Ok, will update it.

best regards
Shengjiu Wang
>
> Frank
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >
