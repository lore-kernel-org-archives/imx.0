Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4131619D
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 01:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737960; cv=pass; b=HCQjCO4/frH86IyPNoYNW6OdaL8yGYxK++LAOo5CALqBOdQwpKWDrcUD4KIwHyybEZPM6F0xjlF+qIcFRCAS7tkzAcAMR9zRny1ZbOii485zviFqJbi5J7J7E0PlIXtSEDRNT82AacUZS2zB9ZudfJe5Kg04gZllvJREsjl1wY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737960; c=relaxed/simple;
	bh=fMWES3pEV3esIMGppPpcAB+xXRHTjsaan83wbju+n2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMddp4OTa2sy4mhP1va+RcC0H5VOlJqCqglnteqlm0tXjuysCNd75BtqqXH17VN+0/PCENytJ1IQc0Eqtj4U55uwHe5VftPx4z1/0NEJLaKEfLpLYHvgSq+4w4olMb1U7lbaLNQ/I5fp5PrErCANc77F1F40SliUI/bhCo4FxdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJoW4ptq; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJoW4ptq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso1658738a91.1
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769737958; cv=none;
        d=google.com; s=arc-20240605;
        b=U9iWUAPx9uBzkC40GjUreCC6T2HZxq1e5b2UscDEpMabz8KcQB5IDZMo0V/WpS2Y0n
         1ay0BQs5Xf7ZyOP189Qma9GMNTDZ40P2eodRoA+kydkuq08mLFwwIASsFHYHMDossw6J
         5bYHmJaJobb4YPPrVQdQNk0vWlPBlSLVej9jftm1ijVoionnITyys2i/Gqq4/DtwD+jr
         UUadzwyuanHoHA31jMS7k2cj6u6DVCJPSa/G7ewRnOo1W1B4RYgDFsmQitmR/Dp9zS0h
         PDo9RlFfffuCrgIAG5LFqztdAk3c1RIvZ9C52hubn3N224akg4QdfEqdyRlFc0tzpzR7
         4dTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        fh=YZzNdlerJOxSk5ef2BvdUhU7S4sBscOYNkmQ4wlwZIA=;
        b=BD7U2MNQygTb7BMXdmQcjmPdH41KYFyHlLJPVKClEhhbwB9qt69dJC4RVhlNW9oEH3
         y8FqTQiaUACy8IqULHcJX99zKqm2C36NoLyq42FmUODxB8VZbDvgLut3nDqROHLKhmF4
         1+7akbFUPjscSbpwc/QgXjqcg+cJvS4VqJ/lR4io+JpBUB6KVp2olPHCV58yYMv40f+k
         jZzOXkveRjJm4EtjXC6suEegduhGu7KCt3KhvD7GISHQ1+kZcNEd3XT3PTgVCXJ0x2H7
         c6kbA4QUQxh0EDHEO3u7GGQlPHwdq4oJgLnZJMsGfYkL0fTMZxGa97pkE7ldna8zZ0I8
         NPKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769737958; x=1770342758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=EJoW4ptqlKRE/bzynH6spKEIJGvjsyCG2FDtjIFNau/xtaQeIOHj1hM2FY+PLnLZYk
         BsrWeGm62pdTgibGn24SM1s2C46Z0yzGuGe4UEDTgQhZuZf9zlJ/ux+nxrOBIOnNrEth
         UVq/LZLV2MjxR8u1E0bhCT+QZfJ3mx1TOpAXxeXUl8z2EqK1VCtK5AUe81b8qAS5lQNe
         Ryqc0E8J1wi1hzkxEm4P3Fsy5VYuzZgcXk2A7JI28wTR9lvdb1PWmPdVkOOGrPy2vIa6
         E6//hVahcMvSiha0+R1/KKIYKPjwpwi+m0lnzwKBe1aYkRlbq7wNxj0gO+XIaN1ViSnD
         t4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737958; x=1770342758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYrclzb/DI20ULzMRT5C3zx7BcemIpx5wfq90vBWrJQ=;
        b=D6GoVKiTPN4wjYb6UL31FpqCVOCZ2CWcQijAANrftzNuCSsfnRPneLSLsY4D0lbvKW
         FLoCXYYze6+cyKIO+QBHtNSjefaomJC/a354xQDaQ6/iM5xzM5VRRtNQRlct9n/10CMc
         3dGnLgfraYbgdNGnnL2TGda6f50NHfSl+m3ijUCk0MLATFDeeusTEmfp/10gaaF3zSVs
         fJRXfQCGY3wnIFj6zWhYxfwkK8K4fKB8t1VYtEF0t6miZDCQ265aMllq+WDnCA9Cu3CS
         dGBypuE/1ztA8TZncFdPSnV1HPV3SuqgPPAm97lKNKv4e5MAoiL45TFN+vCTHnY4BXLH
         U/vw==
X-Forwarded-Encrypted: i=1; AJvYcCV/WNUb1rawm6M79OKfEXdqGvJAbfzzS92++LWVeJP9+5mo7hkGBkUO9tiSo/GU//HPuH8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvzb1vebDyehQuizpghkw7N2PI1sMSA6mm06WswpWruoVtVovK
	JmdJQxgR9emQATI6+ZmTo+0b9YMyp8ioV0HPA2yylV+AP88ExXmAUCEvzfk7McbsZghn9fyJLYf
	zxlk+syZ+EwWw1ThWWLR25FQSf6GQbxg=
X-Gm-Gg: AZuq6aJmXnWvaE5j7G9OwrUSqgwonSoMYf+mWXIrxJDizta6ekRUqP8O6yIQldr/mfb
	qB2QzJkfRaXhU9fTeUfrkMyUp9eQ8zkqsle/PXzo4YPMU99GYWYpUDH16xr8+ma4+W4Si0P8GYY
	heuKkBWIM+vwhLCxMC9YKuRvC/v8png30Uurvw3PxsV64QmWHaqmEVkQfRQwANuDFFhG6JcFvyz
	LRXMmNKSJIjuxbbcI2vU/QaXDaB8uPIAAJv9x8al2x/5Ie6mZnc5rqTN8xnuHy7uXIjxNQ=
X-Received: by 2002:a17:90b:1c0e:b0:340:8d99:49d4 with SMTP id
 98e67ed59e1d1-354299f24a8mr4236387a91.1.1769737957855; Thu, 29 Jan 2026
 17:52:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 09:52:26 +0800
X-Gm-Features: AZwV_QiF2cDrLfRKNnjCIo-qh5cZKFulc8s1nwm3YFRDiF2SntZx7QwlcKkdk5I
Message-ID: <CAA+D8AM2d8m2eZnenH7gqOEUO1dLifFSNgizRRXwOiLX2vVdTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
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

On Fri, Jan 30, 2026 at 1:09=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 28, 2026 at 03:18:53PM +0800, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.=
c
> > index 7dacc06b2f02..b8fe242d53db 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component=
 *component,
> >  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
> >                               struct snd_soc_pcm_runtime *rtd)
> >  {
> > -     struct snd_card *card =3D rtd->card->snd_card;
> > +     struct device *dev =3D component->dev;
> > +     struct fsl_asrc *asrc =3D dev_get_drvdata(dev);
> > +     struct fsl_asrc_pair *pair;
> >       struct snd_pcm *pcm =3D rtd->pcm;
> > +     struct dma_chan *chan;
> >       int ret;
> >
> > -     ret =3D dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32))=
;
> > -     if (ret) {
> > -             dev_err(card->dev, "failed to set DMA mask\n");
> > -             return ret;
> > +     pair =3D kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL=
);
>
> prefer use size_add(sizeof(*pair), asrc->pair_priv_size), which did
> overflow check.

Ok, will update it.

>
> > +     if (!pair)
> > +             return -ENOMEM;
> > +
> > +     pair->asrc =3D asrc;
> > +     pair->private =3D (void *)pair + sizeof(struct fsl_asrc_pair);
> > +
> > +     /* Request a dummy pair, which will be released later.
> > +      * Request pair function needs channel num as input, for this
> > +      * dummy pair, we just request "1" channel temporarily.
> > +      */
> > +     ret =3D asrc->request_pair(1, pair);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to request asrc pair\n");
> > +             goto req_pair_err;
> >       }
> >
> > -     return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> > -                                         card->dev, FSL_ASRC_DMABUF_SI=
ZE);
> > +     /* Request a dummy dma channel, which will be released later. */
> > +     chan =3D asrc->get_dma_channel(pair, IN);
>
> Is it possible get real dma chan from fsl_asrc?

This is real dma chan, may be I should remove "dummy".

>
> > +     if (!chan) {
> > +             dev_err(dev, "failed to get dma channel\n");
> > +             ret =3D -EINVAL;
> > +             goto dma_chan_err;
> > +     }
> > +
> > +     ret =3D snd_pcm_set_fixed_buffer_all(pcm,
> > +                                        SNDRV_DMA_TYPE_DEV,
> > +                                        chan->device->dev,
> > +                                        FSL_ASRC_DMABUF_SIZE);
>
> Here you assume chan->device->dev never change when it did DMA transfer.

Yes, this refers to the generic code in ALSA.

best regards
Shengjiu Wang

>
> Frank
> > +
> > +     dma_release_channel(chan);
> > +
> > +dma_chan_err:
> > +     asrc->release_pair(pair);
> > +
> > +req_pair_err:
> > +     kfree(pair);
> > +
> > +     return ret;
> >  }
> >
> >  struct snd_soc_component_driver fsl_asrc_component =3D {
> > --
> > 2.34.1
> >
