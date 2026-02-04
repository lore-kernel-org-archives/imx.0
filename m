Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383C283FC3
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770169332; cv=pass; b=hkJNs/j0BGzQOcZy9Uinh5hVLj3IAfIAEjWyKO753vgt0M1wFXcyusEwadhLjQaFckjsnBefXvvE5FBnoZIUFst45HIL9iapz1IHlMfI1ooVfmXzC9g2uGlci6fCsIAnV6sc1/pcXBH7RuXmd4jb3EnOe9//t88+vv9T+9k+WB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770169332; c=relaxed/simple;
	bh=E5VDEgqNSgpJbV9pmpdh6TWiOcyXHDjI54IDXUhzEqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ld/9jqiYhoZMbTZT2vbagSyFphHhTW4ed1HtwcZdqodiOipAf0lfdTGL1bZ9k9KE4fSUlb1dRJiz6Vi0/GEb82tFTkDACy90/n5hhF2Fd26oiBkQya4M8Pl5LGwUOneRDzXihN0aN/nsHa59yOVv6v/DXk9t+rkXCEzVJKjujrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gq7Jq9tD; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq7Jq9tD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-352f60d6c2fso4036185a91.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 17:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770169330; cv=none;
        d=google.com; s=arc-20240605;
        b=lLWgmbqxCskuOTZXsiwGO4G2HnfoRGoRFGsQReafr8O6VhcNzoecReTqoSNtvPbNB8
         DRtpeVhb0WGcXbhGZYBtkzgL89hH/n5BFeAi+O3OBme0jLnik0xIzIIwCGjl1PO/4U34
         JW3TJjirCMhrItw+TUHlIvQdcwuPD6azbBhULxEur+V42wYL7rpLmZrHwd8nppa3gKB9
         uoF2NWdmyXwgT8qBXlqwV+h4avWqSfKY2bEPQGD2LcfCOZg1gVT/UnEoFSRo563Axf3d
         6ng46Haf4K0zEbLz1RvvDWu67/jWP9l6L/BtPlz0G14RJiWqdLX8gns5FZmp40xNLpxo
         qlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
        fh=B+tV3jIpZIFbQU2m5O9U4tvAUTzrw2TBPyRSX07USL4=;
        b=idFp7LsEp22w2vTHfONeKO0qFKX1GWvHMp+UKh+R1y81R/IPHbccvjvY9Scl14v+dV
         kFuF7bUSGi7jve/ETKl6Ku8+7eM43y/oCa6BKFDPXFr1kRj3mKSGArIgBC8yONNuz2md
         q0EzOePRrYdYxVknTy8s31nSE30RuXo7JFQsDe4UH8JW7z6TIEoxj0N37tJkmqGIxy1Z
         rWNiGRDClMui1MqGTcAxk33gJWJGkeyDFwsyPeB77X2dLFqmYj6mlc8uBpqLdWDZ3JKX
         2sI7aJNy+woHCqDDwOJopsQbaIv33O+fQAD6qANvU+Wf84Snf1WM5S9RyuzkzdtkZoe+
         9nIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770169330; x=1770774130; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
        b=Gq7Jq9tD9td8LlWkgQRQSBapmjhhyHiCWoUb7+c2SMW1GkcQnVbY2aS5QAIG970SdZ
         ATuFTLrCDhMGrqH2fW+HJLaDOfgmGmcjjGfRurHcCrFTMTv0OpipsuGCgsdCSkhc6xPf
         rm3wmjD1QB80d5dXIKBwyorndYOgFAtHtVmn2I6tDZ0mBfEP7bvNbdDEVDbI5V+mJWKK
         WI5MwyOIVqceXTHTjK/qXhS+Mbm9SfStfcLb1RYH8dpWbcuytSHL66UbtfczOzjQzj80
         3Wz16Mgpg7f6a8w6TE1mZIUEaYhAYkonXGVNwrn8wCF9FSGs83ov1QrcKJjQhONi7j/E
         KUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770169330; x=1770774130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otKMp5rfnNzFq7n/nTMXUM2adMPBqwrYoSOvEkMyM3M=;
        b=I8xzpx6tHnCPXT/YFBLDjXjLQ4wIRQBL37CxnejCSsqAEWGD+Hf0qO4SsnW9ZVecAo
         ADD65LJK/eL2gkn6i+nAUAZvbcdlw9osixk627J27ludHyq+uDEUO1YmCn6mUfRI3/qb
         dAyFMjo81Px4FGjjZoiaYWW0Mo4yVVgehz9P5GwkD5M0hfiUTeTkFyVtHvWFHW4Db8Gf
         m9PoEcrgELvbp3Mn0IvMdSafgISimEO4rkGomUTfM3AF17sQra2OkD36LjhsBfaJd6/+
         nzVSIqYUuWb5qJlLjTahxCDDc3twiZeWJcx9gMAQ3I4ZhJGzbQ0tqy40P6OeNMMYGoGG
         fiRg==
X-Forwarded-Encrypted: i=1; AJvYcCXQzKvaepPuJx+5QxYcxObf2eX65QeSEDkM2AdSu6m405aSsY3zaa7pdbJ/IMmRIkeNo6E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZlDIvfLlHkjjZ6QHWro9BIbqRWYL+VWbnNSQaSEY3EUINZ3yk
	tCJaxqkOjD0exr4/aMY6zobq9f5e9okkxXY0Wg2sp9W6G9kbFtmxRHqYUezvRZUSo2pL98U72Vb
	r/RKUHrxi5pm5nM5LP+/NKgGBYRvijEU=
X-Gm-Gg: AZuq6aJGJ9MVTniOK2Pbpxc4VJS9pE9qJ//stwxuIhMDTx2yXHPKn/q7KyCWp5+Hjhk
	xRHi2y1qqXEemMoGrs5wbbpeBTkDQvunDh9cJctlW2xttCZGKhB5K3l7+CEEmlwThUuZB7Sp+xX
	At6lZ4N3eHgnIHUL4B3IYuzlic8UiisbfRKqIR2JZxk0DCEKT8QmulXpxiODywwhSgpZs3iIs1X
	+qsXQB286vR3pU53Ty71iHHcXdzOTpqxjPTfurfyWQLYR4u2GoE7jw3cuFigMIeV+Q1K3U=
X-Received: by 2002:a17:90b:4b8c:b0:352:d168:fc4 with SMTP id
 98e67ed59e1d1-35487207d86mr997612a91.32.1770169330154; Tue, 03 Feb 2026
 17:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com> <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
In-Reply-To: <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 4 Feb 2026 09:41:55 +0800
X-Gm-Features: AZwV_QiSHr0nHk0_0QYvmlQjWNW7hjgw-cP6U7VY4GcjLXalrmxQByJgfsR4Ri0
Message-ID: <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com>
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

On Wed, Feb 4, 2026 at 1:53=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > There is a limitation on i.MX952 that dma request is not cleared at the
> > end of conversion with dma slave mode. Which causes sample is dropped
> > from the input fifo on the second time if dma is triggered before the
> > client device and EDMA may copy wrong data from output fifo as the outp=
ut
> > fifo is not ready in the beginning.
> >
> > The solution is to trigger asrc before dma on i.MX952, and add delay to
> > wait output data is generated then start the EDMA for output, otherwise
> > the m2m function has noise issues.
> >
> > So add an option to start ASRC first for M2M before ASRC is enabled on
> > i.MX952.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> >  4 files changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 92fb16f7be45..b6d4f1e09e2e 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo_siz=
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
> > +     int ret;
> > +
> > +     /* Check output fifo status if it exceeds the watermark. */
> > +     ret =3D regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(index),=
 val,
> > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val) >=
=3D ASRC_M2M_OUTPUTFIFO_WML) ||
> > +                                    (--retry =3D=3D 0), 0, USEC_PER_SE=
C);
>
> are sure need "retry"? there are timeout, which should be equal to 'retry=
'.

Yes, "retry" is what I want, timeout is not what I expected.

Best regards
Shengjiu Wang

>
> Frank
> > +
> > +     if (ret || !retry) {
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
> > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >
> >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> >       asrc->request_pair =3D fsl_asrc_request_pair;
> >       asrc->release_pair =3D fsl_asrc_release_pair;
> > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_device =
*pdev)
> >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> >
> >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > index 1c492eb237f5..60b6865ca952 100644
> > --- a/sound/soc/fsl/fsl_asrc.h
> > +++ b/sound/soc/fsl/fsl_asrc.h
> > @@ -257,6 +257,8 @@
> >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_WIDTH=
) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIFT)
> >  #define ASRFSTi_IAEi_SHIFT           11
> >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > @@ -432,10 +434,12 @@ struct dma_block {
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
> > index f46881f71e43..77999526dd9e 100644
> > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asrc_pa=
ir *pair, struct snd_compr_task
> >       reinit_completion(&pair->complete[IN]);
> >       reinit_completion(&pair->complete[OUT]);
> >
> > +     if (asrc->start_before_dma)
> > +             asrc->m2m_start(pair);
> > +
> >       /* Submit DMA request */
> >       dmaengine_submit(pair->desc[IN]);
> >       dma_async_issue_pending(pair->desc[IN]->chan);
> >       if (out_dma_len > 0) {
> > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > +                     asrc->m2m_output_ready(pair);
> >               dmaengine_submit(pair->desc[OUT]);
> >               dma_async_issue_pending(pair->desc[OUT]->chan);
> >       }
> >
> > -     asrc->m2m_start(pair);
> > +     if (!asrc->start_before_dma)
> > +             asrc->m2m_start(pair);
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >
