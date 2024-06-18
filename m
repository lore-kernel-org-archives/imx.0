Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF813D272
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718697212; cv=none; b=Xia7+osCQP3dHT/HdyJx2e3p4M8IT+4QLlb7oicsReUozRxOSmL9OF6O9qLWh1dm+Mi07GyEG0V5k14C7FmZmC69+W9xwq2NBBNYpYR4QbJooNGxBhMf6v9HtkbiNfIILaRtVv1SAHxgWMjO44Gl1uNSocU8kB8y1LBAqveljHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718697212; c=relaxed/simple;
	bh=+i2usPNZNgsyG7GktfYMCH5Ks0ugtDc9juyqEc/9YzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMyDArWSRTrjmPkVzhX+Li+TvZBBU/Yz0fu0A1zgVLLmE886+GjnsG5voLjajEvA1iaH4JReWrikNi4mo2usaZ53pVLYkILyoUKsRp5bZ/Uxwt0fwPr7d7lZM3fna8gBaOOv+0nfmvoi1cI6JvEhCB1eNoGsubqq4rENGXRgUcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fm/B5zOh; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fm/B5zOh"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so3894954a12.0
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718697209; x=1719302009; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCxa0N6a/etTSTm358fxjAycnT2MNf/L62aewqr2SjQ=;
        b=fm/B5zOhASK1m9wC57XwKoaGgG7KFJKpBlyMFVvKoakbVkRZ1r4BJ068G2PAIlTSxe
         xHc3FyrBsJpc58VMthWB5I9nW+PdHy876RAWzimvj8UcSmVQRssCDPnYYWtt2WhZ0xB4
         2oJiG9CAqxRTw+AUPl3CxdNDTYo9A0g3rkvT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718697209; x=1719302009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCxa0N6a/etTSTm358fxjAycnT2MNf/L62aewqr2SjQ=;
        b=HXl5WNs1WwKWB6+vxFOqCUt+IoimRYYSkUepgkNHBvdaC8gXzkYCafxDrZx2a/uq78
         TYtwf6C+HYVL9Xdij8bOI3HjWYemrllYYFznc6zjI+SH1dtOyjLASqddGa48u7n1TmkQ
         X1D9+BT5HIgCgLJ0x8AZQEJVF24COO/rtPhRi89l9I/kvf3bs+WVT85+KCRiciKQQGBE
         rxX/KGc/pZ4JtUufPLFeeedsnjnIeTVvfN9lcOe8IRa1pJCht/nd8GxpIcQj6q8NNOCn
         5cmwsioLbJLQzVSwa2E/a55zdlWOfdrjKQicU6sSu1YhUSiKHaaNTuCLb4ghzcDlmjwY
         pXzA==
X-Forwarded-Encrypted: i=1; AJvYcCXmRe7bN2KuyfHQ+dXft9FCVZoeHzMRUgWsMQuEoMPpNjSeHmiPjFDQBtF/pnr4iALxHJF+8D72hw2UrNa9z+MQ5C/g
X-Gm-Message-State: AOJu0YzxebP0DVgQpMhgPs5o5dfLsAtoGgj+SZ4eTsC3VKuCUZX60pN4
	u3mS0Yfk01S0NBAqhA7t16/Wq3I5pGu6soFsKy7vLCtEoe0QHsD9mXCnFcikVVBwGoqzqVomJts
	5ABjC
X-Google-Smtp-Source: AGHT+IHvRSN87Hup4Kx8LZk4yKsXY7c8bQoYwRpzd4tz/xlAh22LrHmCgadnwwWoU0bmiIMYQCgwNA==
X-Received: by 2002:a50:9348:0:b0:57c:73a7:da08 with SMTP id 4fb4d7f45d1cf-57cbd67e4ebmr7843817a12.21.1718697209041;
        Tue, 18 Jun 2024 00:53:29 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da069sm7410175a12.21.2024.06.18.00.53.28
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:53:28 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4217d808034so45817275e9.3
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 00:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVl3h5fPD6legmujnxeE0DKp5uTYxbbPBEODXswLlezUAcgHxJhwesZlFp/SrdsI8hDTYa60GfDXQbYBPqfQJzal0If
X-Received: by 2002:a17:906:ca0d:b0:a6f:fbc:b3f3 with SMTP id
 a640c23a62f3a-a6f60dc89cbmr680235166b.47.1718696899670; Tue, 18 Jun 2024
 00:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
In-Reply-To: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 18 Jun 2024 16:47:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Message-ID: <CAAFQd5B_RTHsMwMdD59RAAyFne_0Ok_A4ExdkVOgi=G6-UGfRQ@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: sync caches for dmabuf memory
To: TaoJiang <tao.jiang_2@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
	shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, ming.qian@oss.nxp.com, 
	imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Ming Qian <ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi TaoJiang,

On Tue, Jun 18, 2024 at 4:30=E2=80=AFPM TaoJiang <tao.jiang_2@nxp.com> wrot=
e:
>
> From: Ming Qian <ming.qian@nxp.com>
>
> When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
> whether the dma buffer is coherent or synchronized.
>
> The videobuf2-core will skip cache syncs as it think the DMA exporter
> should take care of cache syncs
>
> But in fact it's likely that the client doesn't
> synchronize the dma buf before qbuf() or after dqbuf(). and it's
> difficult to find this type of error directly.
>
> I think it's helpful that videobuf2-core can call
> dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
> cache syncs.
>
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>

Sorry, that patch is incorrect. I believe you're misunderstanding the
way DMA-buf buffers should be managed in the userspace. It's the
userspace responsibility to call the DMA_BUF_IOCTL_SYNC ioctl [1] to
signal start and end of CPU access to the kernel and imply necessary
cache synchronization.

[1] https://docs.kernel.org/driver-api/dma-buf.html#dma-buffer-ioctls

So, really sorry, but it's a NAK.

Best regards,
Tomasz

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index 358f1fe42975..4734ff9cf3ce 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer =
*vb)
>         vb->synced =3D 1;
>         for (plane =3D 0; plane < vb->num_planes; ++plane)
>                 call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
> +
> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +               return;
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> +
> +               if (!dbuf)
> +                       continue;
> +
> +               dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> +       }
>  }
>
>  /*
> @@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *=
vb)
>         vb->synced =3D 0;
>         for (plane =3D 0; plane < vb->num_planes; ++plane)
>                 call_void_memop(vb, finish, vb->planes[plane].mem_priv);
> +
> +       if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +               return;
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               struct dma_buf *dbuf =3D vb->planes[plane].dbuf;
> +
> +               if (!dbuf)
> +                       continue;
> +
> +               dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
> +       }
>  }
>
>  /*
> --
> 2.43.0-rc1
>
