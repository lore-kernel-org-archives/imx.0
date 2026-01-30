Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB07331A73
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737500; cv=pass; b=gXXNd88naA3cuZvk56itRzsXdlJh/mFs5pjcNHzxC10ufbTasrVWh4QW6/LZ9td8uug9mfWVnqdumIX2qkaifm2xSx+SPWV+8ZsWv4uN8qNP0lnf2MW8uLEfhYx/yxrLNplok01E6x10prSoQ02a2kIkmlKMtn1Qp+85iA5OENI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737500; c=relaxed/simple;
	bh=6hJecC+jJ0J+VKAtd6bMBI8k9pmiUZLLcZyL9RL5cVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1n6k+RIBvZnGrNBEG4EiRQgKLjnM/26vLDBb96u8A4itT1CTZQsia+NTZgWaVszzB1MgnPxHr0enaJBkk7gTRENnzLMh445E+BkorwC25yJKYmvc5vp1YfBT+BeSxfZJf6xztoN9Hhw3s91mnX6F5lXfqOYrRUb+9vv7VicqQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fb0IS9xX; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fb0IS9xX"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso910479b3a.2
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737498; cv=none;
        d=google.com; s=arc-20240605;
        b=LbHnfxb7Ef/f1tfkheHvUV/HjfMbBXj3tJOhcNKy7jQjI6YspIGRjExX2nEhWraVb3
         XdUEwefbJYVcc6OSvlylcWwuXV8p5Zb7VFeXXVZKdgJn/yYshBZUMehqMDcx2E3quzt9
         TyAw3ZyTniKgHtXRiD1gSUbEVhqZ7uhm9GjTx8R8wpThOsSRg4j+FqHmiA9xpJJR8vvP
         WUCu9deYDFfKfQLrmfeTYAalgQxwdBeZTwMOtUGIMaMx9BuxRfpZ8BgHQzh0+Wz+VL8b
         Cl6rNuhuNuL8sQEJP2/td/jJ9zktAxP8WJj2PlyddJBP4MtuVNJ5OEIenDC65oNjOkB/
         S26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        fh=JQsAnlv9OuLynoGf9AIwb2lyW02Ay/Y0Q6ZXdcDFN2s=;
        b=ES9jBBjxChhGLrLaB4FhmhyJC8nAuCTDZ9TytgqDgoI5K5WKpdXHLcuCRdObIrEMM2
         RoXonmDQPObRr/rum9iKILlq2+UybMczcfXoRCrkYxIDwjs05GDqVw9vXO57F4bS8W0Y
         Dsd5MUU9vRuQDfsv+TDOZTabSFaADgG6ADvdgE89Bf/9dmdSfix7yNzPTMzih0+bNMgb
         qMaZlxSJKpVXYGufPl5D8Ookd+BnUjsBUmjPHG+GCEG13wwILumecsA7E3rk5rPl8DjD
         uJhxnQRiByRKc7+uHfFG1/uCO/lpMUiGhQtGa6pEoGzdQkp5WQmocFJCJQ/WYKq7v+dy
         2J0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737498; x=1770342298; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=Fb0IS9xX+yBjz1aVRA4xNs8Z0cIS1sVZ/5ukQGAVLd6BPjZQfuXDZ56nhiAF2n6fAE
         pxCx2TWIEtENuDK4XVGucFnQMD82rlP/99LO1jl9IKv44A7MIW1CuG/gunqecATDTKcM
         tjzgEaQEgDRUxxKjdrd6VhxLAG9YFIsQrbezgxp1tqiK6KtO/rggzeTgWu/fOWAuSQ7o
         CTVuycgzP2i4wNonR4ONt88rftTB9NqpMrUx1kwhStB5/4zWuYtKwB23I6OamwFRUTT9
         GqgupmbL/OoxoxOaqolDoJvewNVPLjkhACzHusU/F55ngPqx+6MSbeOODcKezwNt676o
         xVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737498; x=1770342298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jNEnnUWc0ljhEZKMEfW+sE66aVZ/mqoNGO+gH29mfjQ=;
        b=ke+tOTzN3hMfDuCccdugf3KunWF9E6x1Q/NxtTlsI6tTKk+bfe//cr27z0MRgzvAw/
         x8ZC6EKgoYqP5ahm8l9TfxOkvlMCVn6fD4fv8JCkowwjMRCRS3raJuX2Ia2zFBAIsgGj
         qjX8UIKPO6oWABhR7uHWWVmotcqfveEl9Jqt+4/b0wFG5UYwMhKjuURf0NyNcUNEuIRd
         FYWcF6Io0DIM8gFThMLvQZwW4zWnQpprk0MMVf6N/9nqjwcw0BNfBPUfjg3H5kS1UQlx
         3VKDhkv3u+z6GNg/HjZHLejOvrvDQMPPToFH6EBxMkjeV/mzmk8Hdk65FB97TJ6fh2AO
         vTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCzKGHqVIl5MpUfJl1w2Wqx9cASMf5frorIwYwL9M7HxmrDLQMeJ6nJM97ZMvFkl5XOAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBrbyLQ8p3UALZ/B8OWEXC05yrcBWk2fi4DsbGk0i96ZHowo1G
	lGYzWxVjfUC+OjEexCBZrlNbntgHS8X9r5M9sVRQg+heFxg9xchMazeGdjiWevhP/8zBhf7Zp1S
	2DsX4U3unftYVL++V0uJgeTXi9iXQ7gw=
X-Gm-Gg: AZuq6aK0FWMsQkuv39egMsK+xeNT2ydvF99TBMgrQrSLn+sjBRcxx7reLRCZFdnuwt4
	UsIM/4CpWQARHCHcyTp5UiH/qDtsOYrwqh8Hfuz9NCCIa+MEB4a2VDFJnHotEzIvco4QSpf0qGB
	k+rYqPFUK+PGR1syvRtX4NimsV1wJ9Gohq+SvjE+xT64LhmGBFg1HCgdQqEpWb13UpKxW6Rs465
	Oie6uI0qgEgce5I2HOqPy1Jllbw4QymJ30NNpVfE6/IN57uJgSIzSD7A83Yhlf5UjIGCRY=
X-Received: by 2002:a05:6a21:9214:b0:366:14ac:8c6f with SMTP id
 adf61e73a8af0-392e01842cemr1045926637.69.1769737497875; Thu, 29 Jan 2026
 17:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuVXruPir7hasdd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:44:45 +0800
X-Gm-Features: AZwV_QgRSYSkN9m3U3HWfvC48m_G_i-4n2rGz9NZqS3r9F4yXRNiuZDo3HAYyaM
Message-ID: <CAA+D8AMYEVbFTgTaVhTU_ZJ=eoyQAj4zygLsfuK+Yt+=8qQk1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
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

On Fri, Jan 30, 2026 at 1:14=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:52PM +0800, Shengjiu Wang wrote:
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
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
> >  sound/soc/fsl/fsl_asrc.c        | 39 +++++++++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_asrc.h        | 16 ++++++++++++++
> >  sound/soc/fsl/fsl_asrc_common.h |  3 +++
> >  sound/soc/fsl/fsl_asrc_m2m.c    | 29 +++++++++++++++++-------
> >  4 files changed, 79 insertions(+), 8 deletions(-)
> >
> ...
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
>
> Does other Soc also work if ASRC start before DMA enable? Suppose most li=
ke
> work. Then needn't start_before_dma.

Yes, should work.  but I don't want to change the original behaviour
of other SoC.

Best regards
Shengjiu Wang
>
> Frank
>
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
> >
> >       if (!wait_for_completion_interruptible_timeout(&pair->complete[IN=
], 10 * HZ)) {
> >               dev_err(dev, "out DMA task timeout\n");
> > --
> > 2.34.1
> >
