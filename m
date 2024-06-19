Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558FD26A
	for <imx@lists.linux.dev>; Wed, 19 Jun 2024 04:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718771271; cv=none; b=hk37zBrq+pawpjsgAI1ILyMKbtKaAAiY9H3CFCcUfXNnFqPCCI3dWTIKs5m3ThgyHCjFxsVADqXUDem5TtRkYFNRjKA+ZCmpleFxqpqLTkvQ/XdqMxz1hx4Db4iBWQA1cOGA6Uc4qzM8ZlonSmYGXUYENrCbtbmYIhOFgJLVp40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718771271; c=relaxed/simple;
	bh=JNNn2B9AEY5Fn0RAE7Nv+uvdYfJNN5JRmicXvo3cqmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svGvIMwj1u/kOFa5QDDSFWPficgN2vejR4KyyOJeevl4Z/YzH6TVoxMmovi8gv9R0LoVtM8kUnQrsIJKlPNU6JLHqUEMF/rEO6diFllXhWcMk4DS4C5XnvxFE/DeTjA3V+RShx/YiX72Xn8CjeaFikBqYV8QTqXfoWASSYU5dKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WaB7iWkk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WaB7iWkk"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso404000e87.1
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 21:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718771267; x=1719376067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/U+cxAMgDXTuaBoZjBUZI7zxhscWza7MiDHr3eL9Des=;
        b=WaB7iWkk0XxUsrchKyqxk6ZbS3cRrvQPHBFgZgA7c9DFPFOZq3dJBtCNMwJb/uvqNn
         fhE6lFOQbkAB0u476pwHGvq+Nxk1DHaFxI7b2leogJFCFf0hKeAwWuTdD6QD6Sfeil9Y
         K0kIR5F5S5088GkM8bZmD5iFVy1qht8nYr+iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718771267; x=1719376067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/U+cxAMgDXTuaBoZjBUZI7zxhscWza7MiDHr3eL9Des=;
        b=knmZrbIAITXW9ZlNc708NDENpioJ9JTfpALckYi87mv9fo5Ic6/JsV/pB79HJe4EDS
         HtxX/VKddPJunGq6KXjOddcI3c7AxxGYYbh+QWchVexcz8jDcRndTktDUyOCUgneRsmk
         rBF45336QnZCjAxGKC2/d65GLQTlGDml7UuiPK06LvsfMnVxcldyHCur7ursRUUWeYaS
         WfDl5ApEWV1XY9gCo7sTaJXqD2QVk+60CAfSO5JxafVTEwGBbcjdK/lANRefWKGyx4/F
         TfQs3uDc5XSyaZ0I2XZ5hXCsxQIQJWwpInv9rf7b1nbttFCpPeS7OQtptKlbeU5Pdekj
         9HcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkHXgvTkZlYwOyt8iCc95YAaM/o3E5ZYI/4QQ6SLlysst+VxzZXajdmtwTQb/LgmsOzATBB290KLfqeG9tbtdcbdbw
X-Gm-Message-State: AOJu0Yz8OjDidF9m3xOxtb+9WxCeiV0yXl2O0RSHBrRQaLnQiogN8Wdx
	RKFH8IgIdBXpx7anQ+JxIBY42lAxgt2dXA7tgOZ/XSaS5S7f2pkdUttQu7a0LAQT8aaQasEsUF4
	UHFjn
X-Google-Smtp-Source: AGHT+IHF7I1Cmc1ftLtkjQLLOenuSsBMwyPB+PzC8ds4kxmbwWN0SKkP+RXUmoe36TRZkoPuRn6nTg==
X-Received: by 2002:a05:6512:39c8:b0:52c:ccf3:f20a with SMTP id 2adb3069b0e04-52cccf3f4f7mr82042e87.23.1718771267284;
        Tue, 18 Jun 2024 21:27:47 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888629sm1661402e87.294.2024.06.18.21.27.46
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 21:27:47 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cc671f170so401612e87.1
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 21:27:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoeZ7xSJ1nD4n+81doI0N/KSxzlWso9xyMO6bval5dkmyQRZfWrT18O+WJIui94G7niL3llHmQ7bXqK0DkO++HUzeS
X-Received: by 2002:a17:907:2087:b0:a6f:53eb:dbe0 with SMTP id
 a640c23a62f3a-a6f9506f6f4mr245886666b.26.1718770776170; Tue, 18 Jun 2024
 21:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com> <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
 <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
In-Reply-To: <036bf0d7f657cae444d20ea6d279b47e3bf0164e.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Jun 2024 13:19:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Message-ID: <CAAFQd5DfbqOkZzPfCNRMGeMgv2NfM6WENWXeLUNsuMgkzeBQKw@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: Nicolas Dufresne <nicolas@ndufresne.ca>, m.szyprowski@samsung.com, 
	hverkuil-cisco@xs4all.nl
Cc: TaoJiang <tao.jiang_2@nxp.com>, mchehab@kernel.org, shawnguo@kernel.org, 
	robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com, 
	eagle.zhou@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Ming Qian <ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 1:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le mardi 18 juin 2024 =C3=A0 16:47 +0900, Tomasz Figa a =C3=A9crit :
> > Hi TaoJiang,
> >
> > On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> =
wrote:
> > >
> > > From: Ming Qian <ming.qian@nxp.com>
> > >
> > > When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> > > whether the dma buffer is coherent or synchronized.
> > >
> > > The videobuf2-core will skip cache syncs as it think the DMA exporter
> > > should take care of cache syncs
> > >
> > > But in fact it's likely that the client doesn't
> > > synchronize the dma buf before qbuf() or after dqbuf(). and it's
> > > difficult to find this type of error directly.
> > >
> > > I think it's helpful that videobuf2-core can call
> > > dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> > > cache syncs.
> > >
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> > > ---
> > >  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++=
++
> > >  1 file changed, 22 insertions(+)
> > >
> >
> > Sorry, that patch is incorrect. I believe you're misunderstanding the
> > way DMA-buf buffers should be managed in the userspace. It's the
> > userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
> > signal start and end of CPU access to the kernel and imply necessary
> > cache synchronization.
> >
> > [1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls
> >
> > So, really sorry, but it's a NAK.
>
>
>
> This patch *could* make sense if it was inside UVC Driver as an example, =
as this
> driver can import dmabuf, to CPU memcpy, and does omits the required sync=
 calls
> (unless that got added recently, I can easily have missed it).

Yeah, currently V4L2 drivers don't call the in-kernel
dma_buf_{begin,end}_cpu_access() when they need to access the buffers
from the CPU, while my quick grep [1] reveals that we have 68 files
retrieving plane vaddr by calling vb2_plane_vaddr() (not necessarily a
100% guarantee of CPU access being done, but rather likely so).

I also repeated the same thing with VB2_DMABUF [2] and tried to
attribute both lists to specific drivers (by retaining the path until
the first - or _ [3]; which seemed to be relatively accurate), leading
to the following drivers that claim support for DMABUF while also
retrieving plane vaddr (without proper synchronization - no drivers
currently call any begin/end CPU access):

 i2c/video
 pci/bt8xx/bttv
 pci/cobalt/cobalt
 pci/cx18/cx18
 pci/tw5864/tw5864
 pci/tw686x/tw686x
 platform/allegro
 platform/amphion/vpu
 platform/chips
 platform/intel/pxa
 platform/marvell/mcam
 platform/mediatek/jpeg/mtk
 platform/mediatek/vcodec/decoder/mtk
 platform/mediatek/vcodec/encoder/mtk
 platform/nuvoton/npcm
 platform/nvidia/tegra
 platform/nxp/imx
 platform/renesas/rcar
 platform/renesas/vsp1/vsp1
 platform/rockchip/rkisp1/rkisp1
 platform/samsung/exynos4
 platform/samsung/s5p
 platform/st/sti/delta/delta
 platform/st/sti/hva/hva
 platform/verisilicon/hantro
 usb/au0828/au0828
 usb/cx231xx/cx231xx
 usb/dvb
 usb/em28xx/em28xx
 usb/gspca/gspca.c
 usb/hackrf/hackrf.c
 usb/stk1160/stk1160
 usb/uvc/uvc

which means we potentially have ~30 drivers which likely don't handle
imported DMABUFs correctly (there is still a chance that DMABUF is
advertised for one queue, while vaddr is used for another).

I think we have two options:
1) add vb2_{begin/end}_cpu_access() helpers, carefully audit each
driver and add calls to those
2) take a heavy gun approach and just call vb2_begin_cpu_access()
whenever vb2_plane_vaddr() is called and then vb2_end_cpu_access()
whenever vb2_buffer_done() is called (if begin was called before).

The latter has the disadvantage of drivers not having control over the
timing of the cache sync, so could end up with less than optimal
performance. Also there could be some more complex cases, where the
driver needs to mix DMA and CPU accesses to the buffer, so the fixed
sequence just wouldn't work for them. (But then they just wouldn't
work today either.)

Hans, Marek, do you have any thoughts? (I'd personally just go with 2
and if any driver in the future needs something else, they could call
begin/end CPU access manually.)

[1] git grep vb2_plane_vaddr | cut -d":" -f 1 | sort | uniq
[2] git grep VB2_DMABUF | cut -d":" -f 1 | sort | uniq
[3] by running [1] and [2] through | cut -d"-" -f 1 | cut -d"_" -f 1 | uniq

Best,
Tomasz

>
> But generally speaking, bracketing all driver with CPU access synchroniza=
tion
> does not make sense indeed, so I second the rejection.
>
> Nicolas
>
> >
> > Best regards,
> > Tomasz
> >
> > > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/driver=
s/media/common/videobuf2/videobuf2-core.c
> > > index 358f1fe42975..4734ff9cf3ce 100644
> > > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > > @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buf=
fer *vb)
> > >         vb->synced =3D 1;
> > >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> > >                 call_void_memop(vb, prepare, vb->planes[plane].mem_pr=
iv);
> > > +
> > > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > > +               return;
> > > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > > +
> > > +               if (!dbuf)
> > > +                       continue;
> > > +
> > > +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> > > +       }
> > >  }
> > >
> > >  /*
> > > @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buff=
er *vb)
> > >         vb->synced =3D 0;
> > >         for (plane =3D 0; plane < vb->num_planes; ++plane)
> > >                 call_void_memop(vb, finish, vb->planes[plane].mem_pri=
v);
> > > +
> > > +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> > > +               return;
> > > +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > > +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> > > +
> > > +               if (!dbuf)
> > > +                       continue;
> > > +
> > > +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir=
);
> > > +       }
> > >  }
> > >
> > >  /*
> > > --
> > > 2.43.0-rc1
> > >
>
