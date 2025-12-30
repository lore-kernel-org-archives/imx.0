Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DEA239072
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101993; cv=none; b=n86XLnoFsEHK4C1YibXYl/OAMZR4UbpVKn2ABzKuMeHGXm7r0jReRDgYOdwz/OfQ13NsXbACvtsN/re/0p2FPOjBsmotSlT9h79SM1j3Bl5jCal2gORLocux/8H1w7uF3urO3IYLyor5IQuj32939E3cXQexCzawWNmemL++3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101993; c=relaxed/simple;
	bh=OlkCqn8fXbP0BKS1z87/ZV5T/EiSvUw1/xi0wc+ejKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsVElfviLME3s4/dqhMK5xBZjCnNWK9y4usy6l9/HQ3RFLIekeQ5D/OMuqjYgSbeWv52KbuogXlzSr78jPntSNG07N9OTrUn+BHpS1yG4LQvmW2/OuRsCXhv/Br4RMeET+oJuaiFPXfZ8pQ9D2fzwiqypCKmB+kKmAuJS4wbees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nTR5HHuj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nTR5HHuj"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59445ee9738so7891497e87.3
        for <imx@lists.linux.dev>; Tue, 30 Dec 2025 05:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767101989; x=1767706789; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=;
        b=nTR5HHujqDqRX2X0oTDE+vqP5Rd1wJ21DNEE7yAc4Vw1hdJT2imFNkrbMBSMd+CUSh
         G9jXMH4n7BziMtfZ55nWbtS3jo8RSFpgoh7vQCio9IZxRdd/fnkmWmj1FVpeb3YRSHHC
         g3cLjXBEHIhrcbpOtMR3zSNju7eiOrPK9wcILFXQQ8qB4htf6Dg/MXbF7DHXhIakNd+H
         V0HFOzWZvfhG0hBhEiH8bRlLDVL1euIt53VuO982JBeEh79bHfiIGFzFNWQbl/gdSw8x
         mmVpjYQadbFsmtQ4CXNORQJF/oNb2bSpMb7m1uQF3o8Or44fhrtxASKI9DYnGerFNGaT
         tHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101989; x=1767706789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=;
        b=stlM0bPOr01C8v32Ag8QpKdXoQYA7Ye31Mh3fDdX1FZmpIJL+0P852Hbeug9QIcQsX
         gOM/Q2+O6kAVFfAXPPIWl9OsIk4z+0Z1yRz0/A7GC9F280okYzbF4FrFaTok7mTdeORb
         UexnNn50XtVCWGXnasPVXMKAsnLLMsa/TJ7+KlIBZ5bEe+O6kexz4YsqKzduyfemcgyK
         nJT5eo0NTF9fgDYA3c/BhfO2bDHw62+iItwuPFDyxENGh+Mm7M5Zmchl/Gm3ZWSsWRro
         329ZXhX2oq9CLOOIkTPQLWpPbyyQ8OA7cQ5idFIYRb8E4gBdfxyeRdqeH3tW1OwvqNGT
         EPDg==
X-Forwarded-Encrypted: i=1; AJvYcCWP/5UHz1BgsQ/Re33PW9JgAqfAA4Jdn2a+6BMaZor7svxOs/0oObWPrmoTB8ToFXdYujI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRI1cSKPf5zInzU+PGFnyicXQQZCqzVnIpCOLJxbXZlcwsUJWK
	rld7AOMXS+HWdPs8IOBnhreJfwr2yt/LlAnuim6G6YmaW4N+5hAUGr48Wr74niONOz927Vp06kN
	e1IdSXiDZJKVD7PGJl5r2OFlwKUQtTyKwyiKSpBwr8Q==
X-Gm-Gg: AY/fxX4kcZT9HG/OzDRAvaWikyj/mVQNqmKc6W47aAbZev2vNa78rUNh/B8MQTNUjBH
	YAVqEutYCt+mOVw6vihtxf6W9ytW36cRmWOFE+3nTLhovfPs2yVSY1xdPHOrcc11SmxJUG9H+TO
	6kOzSmh8ADjFUIU5hWAUxbusnIpBKRHnMHNhGW5ooSQkcevwR/Hk44NkHXwMcJts3P5kJjQ+Pha
	GBegN48q4r7Rl9kiVGX66GkLu8ya73dxND3IKNytM3bqu1R51LUVb0f4xWwwHsE+gSFQWqW
X-Google-Smtp-Source: AGHT+IFc2q13TthZOLNMt7KlXgzpHYzWQ4Oc1qku0cPr+yLi0Y1e7lT6nY190irxS/Myr4DyEyhRfiOI15TA9SqTEa4=
X-Received: by 2002:a05:6512:b20:b0:594:2870:9774 with SMTP id
 2adb3069b0e04-59a17d670f6mr11077610e87.38.1767101988845; Tue, 30 Dec 2025
 05:39:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-2-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-2-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 14:39:12 +0100
X-Gm-Features: AQt7F2p9Tp60FXm9JL954U-IrjyLLANKEoHVrFFumJZKPA0geVKKGoJbY19yu5A
Message-ID: <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> Adding a reference count to the v4l2_m2m_dev structure allow safely
> sharing it across multiple hardware nodes. This can be used to prevent
> running jobs concurrently on m2m cores that have some internal resource
> sharing.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

I certainly don't have the complete picture for how this needs to work.

However, I was thinking that rather than using a kref and having to
share two specific functions to update it (v4l2_m2m_get|put), couldn't
we just use a device-link instead?

Kind regards
Uffe

> ---
> v4
> - Add my Signed-off-by
>
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 23 +++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           | 21 +++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index fec93c1a9231..ae0de54d4c3e 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -90,6 +90,7 @@ static const char * const m2m_entity_name[] = {
>   * @job_work:          worker to run queued jobs.
>   * @job_queue_flags:   flags of the queue status, %QUEUE_PAUSED.
>   * @m2m_ops:           driver callbacks
> + * @kref:              device reference count
>   */
>  struct v4l2_m2m_dev {
>         struct v4l2_m2m_ctx     *curr_ctx;
> @@ -109,6 +110,8 @@ struct v4l2_m2m_dev {
>         unsigned long           job_queue_flags;
>
>         const struct v4l2_m2m_ops *m2m_ops;
> +
> +       struct kref kref;
>  };
>
>  static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
> @@ -1200,6 +1203,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
>         INIT_LIST_HEAD(&m2m_dev->job_queue);
>         spin_lock_init(&m2m_dev->job_spinlock);
>         INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
> +       kref_init(&m2m_dev->kref);
>
>         return m2m_dev;
>  }
> @@ -1211,6 +1215,25 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_release);
>
> +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev)
> +{
> +       kref_get(&m2m_dev->kref);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_get);
> +
> +static void v4l2_m2m_release_from_kref(struct kref *kref)
> +{
> +       struct v4l2_m2m_dev *m2m_dev = container_of(kref, struct v4l2_m2m_dev, kref);
> +
> +       v4l2_m2m_release(m2m_dev);
> +}
> +
> +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev)
> +{
> +       kref_put(&m2m_dev->kref, v4l2_m2m_release_from_kref);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_put);
> +
>  struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
>                 void *drv_priv,
>                 int (*queue_init)(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq))
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index bf6a09a04dcf..ca295c660c7f 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -547,6 +547,27 @@ v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
>   */
>  void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
>
> +/**
> + * v4l2_m2m_get() - take a reference to the m2m_dev structure
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * This is used to share the M2M device across multiple devices. This
> + * can be used to avoid scheduling two hardware nodes concurrently.
> + */
> +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev);
> +
> +/**
> + * v4l2_m2m_put() - remove a reference to the m2m_dev structure
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Once the M2M device have no more references, v4l2_m2m_realse() will be
> + * called automatically. Users of this method should never call
> + * v4l2_m2m_release() directly. See v4l2_m2m_get() for more details.
> + */
> +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev);
> +
>  /**
>   * v4l2_m2m_ctx_init() - allocate and initialize a m2m context
>   *
> --
> 2.52.0
>
