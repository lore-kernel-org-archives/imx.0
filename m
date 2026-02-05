Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB352BE641
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 02:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770258974; cv=pass; b=qBZE4D5AEgEhS7+N2l9grP2UVaJ51NHfWsjvSz7tMEDiAak4vwIvUydOEtWN4MN91n+lDKOt888rTvKNOa7LAAQpcqKs43Cx8VnahIiaEr4L3hr+G7UbTfotTQYO09HHhwrfV/l2vcAz07gSKJuzQKckTUzISAnqxVxNCDJlWKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770258974; c=relaxed/simple;
	bh=NQVV8HUc0psH2m9YHAJXRggnCctk9iGZTyOGajgLGcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZjQGuU3b+OdOp35NlKLbleQG0ymj31l/fhXtrf+lZg1mKFwXtsn8nRCo+bu4yyriKR/hYbusev471XLM5iEPB8wzOVYuIh+t/4nOAABkqeZVFdG65thUi2OLS0WbtQ3Z5VEQ43Bhplqi06z6kCsHvJdTaILHvOPbuWrO0LgHXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7c8CASf; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7c8CASf"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c634bb5bd8eso75038a12.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 18:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770258974; cv=none;
        d=google.com; s=arc-20240605;
        b=T8fE/Jz3s7tGJVgMtSN4SFQW0QKo1eDD96zb3VJPbCFQ6yXPZ/Za0W8esT4HCGfrdZ
         UIz3NQUNZU2R3615dr774p9rBLLXS5HT00bMCzgnRA+KZxT/ZYPdVP5urPWOg2MXCBj5
         yuqYr2Z9cKKLl0pm+G3/tg+byG5qFG3o+K0Sw3Rz/VCO9l9qli3CnQxKsgkr2EQZs+vu
         amg1z5InabFc4p2y+Iwzq7J1fBDLLdMs+OInjYZAYfQmvgq1OYuIpLq2IESEB9DfWBTp
         okX4jFYB8t6th4gk0aLatdIIPmMc074MYTmRhhaLFILp0LdSzTZTF+p7UWxYtaspU0YB
         mgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        fh=7xQO5LeMUepwwfyg5UjC8VnqtPgn1NSqTREw7WoMO6o=;
        b=fAzNvUm2vky8UO9MFs2oEEe0YoInrmnx/rV1WJ35a2wugVIXOUSJP/dlHXs/LMUbNe
         CZk8Fmu6wZlxdovixcTZsoX5xdzx2geC2rNGGGayPwijTbwzsuUncMv7Xi0f1Z5SEC6u
         Leu94zlula1eBC24ZkOyGVpXSkfCZZv5kU8Nw89b9FSD6QiS6JpP3Zpbl/+3RzeyRVDq
         jULC/8+mbrSl6+kBU5mC+XyGQXv9txnSaJ/p+4eG9qjUw2RlHhGfdL73hwazhrlHd5YK
         q0gudvmr5JwrqV6SMad73iVMPgj68mmGHUB/Lb9wa7Cz0wLwVMQ9IHgWqKy7UPoYX3HL
         GNnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770258974; x=1770863774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=O7c8CASfUg7+pWZ2mEUHDXCw6R82eFZwGsD0/cSKJ23fTK4wpix81lJ9m2Lt+GMdFj
         fSq1BCIKbxfds05GDqh7jaADCcrjNq0zb/ZV03PpsTsIR4vVzOmQKYf1e1vg6/dJu+H+
         ThjZJv6TjR2bZbbGflezCWZLvcc38q0l/kt6OVvFkXqm9TFMgBK9YzFYkMzkFOCNGQ6k
         njDty5bIISiAFh5YqJWyBefdt2yMfUJQydR+xkPsNN1oimCFnK0VWQv6WRaAqbCXaYZB
         BecCe193PHZSNdu/fflwMTwPXxUgPVaX+r04HUcn6g/yrEYj75uYllMqpRAASy2iWlfW
         djRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770258974; x=1770863774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=HT5lCFBxmcI4yqovQHT5dGd50qiHcJ8BMaQ+4uQF10MUwfzLwKVP2yo0ufGXdrD3Go
         h+CnbUmbzovPwfCEjzlkdScj8kbvRf1sph15TPxlh6qQWWoBwlhu5okJGhCjX6C9fFL3
         40y8KiLiKgic/INTbVgmCQ2jx24UmXrlrmDNkezHoN5fWzJswhn4Y4Xlw18P4HUQV9ct
         WbbLi2yvTMlSs25rIYvp/P6zUvi0ryDywqyslqE+9KEFCsWqGCh/JrXWn1Y4T2KsWaRm
         kWPDYDOSPERaVSb+yN0XC/eX5C8mzBRUU/r3PVtHewQhdvQxp52JycTkH5KLlFtX/R8I
         t4cw==
X-Forwarded-Encrypted: i=1; AJvYcCVUpeZA4f0wzbUAMtYsXKfzgCsWbr2lMDA9KGRG96So6rYkpcPupTuhcx0dyzT1F2gmNfM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTNuzif09G1uQYjHTgj3UP2F+LSlBuFC6Wo0vVU8cMzeGJcMQ8
	xR5hRJpuYbGG+gSwxm0Cw/IJB4ObeDwgrSkxErYlgckS1tTeZcfDNpxk8fuoeAFv/iVigaHNQgh
	l1dfL0aucbb8bjLqPCQsQk3UP0dqZKBo=
X-Gm-Gg: AZuq6aLVclmg5emwK85qDBIHeg26+/P1k+sOMURi3M1SWc/5L3DhZvH/nPYO+CKTi9d
	3huo5LJMQgOos8CA8jX8N6ZB0a1fk4w0GeD+Pl+oHiOIFiKgsiURqznLImjCDndse/842s/TWXx
	m055pVLcjSdXB0HD/RyEY/V3vZxC1LUSnz9YYwvDzty1QucQnNfni7kZ86VFH8s3ucVwio0g4C1
	Frxoe2VSHLDu1wOMyjZ//OHVAGQ6U8EtGB2UMwp2+mixTPQBJ9oiJOWM6NFsXCwWun/Bh1wA2jv
	X/QeUg==
X-Received: by 2002:a17:90b:3884:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-35487125d82mr4318915a91.16.1770258973498; Wed, 04 Feb 2026
 18:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com> <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
 <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com> <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
In-Reply-To: <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Feb 2026 10:36:01 +0800
X-Gm-Features: AZwV_QgTCuKmUaXOlpjmbiCTEgTaxxVjxr1vFqJ32-N2ro_Vxt5AFFdiFJtKCnI
Message-ID: <CAA+D8AN_xej-DWHbWKMCwgZVVcW9N2mHrK=4GUyoRiGLXBAoTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
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

On Thu, Feb 5, 2026 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Feb 04, 2026 at 09:41:55AM +0800, Shengjiu Wang wrote:
> > On Wed, Feb 4, 2026 at 1:53=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrot=
e:
> > >
> > > On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > > > There is a limitation on i.MX952 that dma request is not cleared at=
 the
> > > > end of conversion with dma slave mode. Which causes sample is dropp=
ed
> > > > from the input fifo on the second time if dma is triggered before t=
he
> > > > client device and EDMA may copy wrong data from output fifo as the =
output
> > > > fifo is not ready in the beginning.
> > > >
> > > > The solution is to trigger asrc before dma on i.MX952, and add dela=
y to
> > > > wait output data is generated then start the EDMA for output, other=
wise
> > > > the m2m function has noise issues.
> > > >
> > > > So add an option to start ASRC first for M2M before ASRC is enabled=
 on
> > > > i.MX952.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> > > >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> > > >  4 files changed, 38 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > index 92fb16f7be45..b6d4f1e09e2e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo=
_size(struct fsl_asrc_pair *pair)
> > > >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > > >  }
> > > >
> > > > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > > > +{
> > > > +     struct fsl_asrc *asrc =3D pair->asrc;
> > > > +     enum asrc_pair_index index =3D pair->index;
> > > > +     int retry =3D 1000;
> > > > +     u32 val;
> > > > +     int ret;
> > > > +
> > > > +     /* Check output fifo status if it exceeds the watermark. */
> > > > +     ret =3D regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(ind=
ex), val,
> > > > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val)=
 >=3D ASRC_M2M_OUTPUTFIFO_WML) ||
> > > > +                                    (--retry =3D=3D 0), 0, USEC_PE=
R_SEC);
> > >
> > > are sure need "retry"? there are timeout, which should be equal to 'r=
etry'.
> >
> > Yes, "retry" is what I want, timeout is not what I expected.
>
> Okay, but it will be strange. you polling a register, you suppose it will
> be finished below 1000 IO read, which is certain time in SoC, for example
> 1ms. Compare to timeout us value, 1000 is hard to understand why you choo=
se
> this value.

It can be removed by reducing the timeout time.
will update in the next version.

best regards
Shengjiu Wang

>
> Frank
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Frank
> > > > +
> > > > +     if (ret || !retry) {
> > > > +             pair_warn("output is not ready\n");
> > > > +             return false;
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> > > >  {
> > > >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > > > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >
> > > >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> > > >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > > > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> > > >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> > > >       asrc->request_pair =3D fsl_asrc_request_pair;
> > > >       asrc->release_pair =3D fsl_asrc_release_pair;
> > > > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> > > >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> > > >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > > > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> > > >
> > > >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> > > >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > > > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > > > index 1c492eb237f5..60b6865ca952 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.h
> > > > +++ b/sound/soc/fsl/fsl_asrc.h
> > > > @@ -257,6 +257,8 @@
> > > >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> > > >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> > > >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_W=
IDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > > > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > > > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIF=
T)
> > > >  #define ASRFSTi_IAEi_SHIFT           11
> > > >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> > > >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > > > @@ -432,10 +434,12 @@ struct dma_block {
> > > >   *
> > > >   * @use_edma: using edma as dma device or not
> > > >   * @channel_bits: width of ASRCNCR register for each pair
> > > > + * @start_before_dma: start asrc before dma
> > > >   */
> > > >  struct fsl_asrc_soc_data {
> > > >       bool use_edma;
> > > >       unsigned int channel_bits;
> > > > +     bool start_before_dma;
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_as=
rc_common.h
> > > > index 0cd595b0f629..c8a1a2b5915d 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_common.h
> > > > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > > > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> > > >   * @asrc_rate: default sample rate for ASoC Back-Ends
> > > >   * @asrc_format: default sample format for ASoC Back-Ends
> > > >   * @use_edma: edma is used
> > > > + * @start_before_dma: start asrc before dma
> > > >   * @get_dma_channel: function pointer
> > > >   * @request_pair: function pointer
> > > >   * @release_pair: function pointer
> > > > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> > > >   * @m2m_start: function pointer
> > > >   * @m2m_unprepare: function pointer
> > > >   * @m2m_stop: function pointer
> > > > + * @m2m_output_ready: function pointer, check output fifo ready or=
 not
> > > >   * @m2m_calc_out_len: function pointer
> > > >   * @m2m_get_maxburst: function pointer
> > > >   * @m2m_pair_suspend: function pointer
> > > > @@ -143,6 +145,7 @@ struct fsl_asrc {
> > > >       int asrc_rate;
> > > >       snd_pcm_format_t asrc_format;
> > > >       bool use_edma;
> > > > +     bool start_before_dma;
> > > >
> > > >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pai=
r, bool dir);
> > > >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair)=
;
> > > > @@ -154,6 +157,7 @@ struct fsl_asrc {
> > > >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > > > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> > > >
> > > >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input=
_buffer_length);
> > > >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > > > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_=
m2m.c
> > > > index f46881f71e43..77999526dd9e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > > > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > > > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asr=
c_pair *pair, struct snd_compr_task
> > > >       reinit_completion(&pair->complete[IN]);
> > > >       reinit_completion(&pair->complete[OUT]);
> > > >
> > > > +     if (asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > > +
> > > >       /* Submit DMA request */
> > > >       dmaengine_submit(pair->desc[IN]);
> > > >       dma_async_issue_pending(pair->desc[IN]->chan);
> > > >       if (out_dma_len > 0) {
> > > > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > > > +                     asrc->m2m_output_ready(pair);
> > > >               dmaengine_submit(pair->desc[OUT]);
> > > >               dma_async_issue_pending(pair->desc[OUT]->chan);
> > > >       }
> > > >
> > > > -     asrc->m2m_start(pair);
> > > > +     if (!asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > >
> > > >       if (!wait_for_completion_interruptible_timeout(&pair->complet=
e[IN], 10 * HZ)) {
> > > >               dev_err(dev, "out DMA task timeout\n");
> > > > --
> > > > 2.34.1
> > > >
