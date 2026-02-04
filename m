Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C6132571B
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215636; cv=pass; b=KcSmVUHKHBjHO7ZTaXKimUnErfPYl7c8VpdHtttya0QCWCevnU6hXUyyznw53xjByXKXVWLrscitUPxyfaFHrbeJEaKQ2b7O1NXKUqNrG1KYsgFIpX0KMY0+CqscPpuiwpWP8Nj52oqSizFzjIF15kayWMZrJfVeWKUZA8HACR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215636; c=relaxed/simple;
	bh=EYXRe70f0VhAsUwZXbYgNsIOmrBCn09wFHpU0kQzeaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5K0l5ViyOl79bvMo35b/rXe5/znwKIhR5MDcyOOlvPpVJxukfAaLtnviG+xElZdk3LmaiKww6WvSReEx8ePAkEAsmbybAwsNRvQpjoGALlCf/mZLBylNJrosnfwb9fpTGAQSMG/YcEqN4XoOJdFxkHhIwHNMgOPyBowNxQJpJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhRp5a1g; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhRp5a1g"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649dbff9727so1163044d50.3
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 06:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770215635; cv=none;
        d=google.com; s=arc-20240605;
        b=Rv73k3lYuoIo/N2uCR8iP4uFK1UITvYew0pjdaNhtQtBPFTSNNTiWTFaDsskeqFhUj
         w2IjhNqajnjAHLlR4gXynKWnm93JeNt0JauQQ6bvcnPyIBKs0w+ljeKI1BXRZGVxdpLN
         ZgrDeqqBbRF5+FikRHNN8OvVz+WbbeBMWPN/2vvstcw33p/E6DqASUrEc5V4mittV5zc
         SjqaD3jVleDgcim4+VoqGcfB32MLXPtE4EQxGByoOaWzNjn5TkhGcKOALrCIQURsZ8LU
         /P+EmCPLQbcQpo+MYdNdZhXd1V8zorQDkEIhwx/jEk+XLFmt1E4gDGeRmYkh9QRkpEUu
         pOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W8AAMIJsoWGn8x1NtmyKbgTrFaMWwEU1ewpQmfJpncU=;
        fh=C8gOe2VzGTUwWh8P0WZU0l6W7LYR8hUwipfnVF4PYqY=;
        b=NqcL2QfkLY+4xdGK1c7ei28depuUP+rvQ3g/SqchBa4gGCPc354c6LYhUdbnLZRReu
         Jon0bcXBYsw8eLNms4g5hPROeU5Gg77oi33/DtgVLQrsAenbEILMtbYq1uizxsMQxGyl
         7fRTj5z4945FdWLRyPT6Bb15CV15in1jBKtNkIH0EVmymud+QbVoxYTjUytKu1ThrioW
         wgfsdEFyVwDcQcjtsNIZhahl5+uJ0n7qHtjSDPi+xgIxuPxi4QTX0Eoaz/0Q+euoyxIZ
         lNnCDOjtvAuyf5JIImf3EqBB3JklV1+17ov5TaCP8AZEbeN2vHzrSL/VNeYbjBlgAck5
         gS8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770215635; x=1770820435; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W8AAMIJsoWGn8x1NtmyKbgTrFaMWwEU1ewpQmfJpncU=;
        b=nhRp5a1gSn2qzZpadzkNWqFTVkHjQWrsfYO1iz5MGIVDGc9TWU+vNePEX6EB22v+gJ
         kTvn/2B9Ec04zdyYmG0KFnHcSAq3i/eYHKScHyQK0Z9HrKczu+abtrPXJAEi8m3cctcw
         RYptPhrixFzXmOxhgNBKthNpygF5vgfWQOVkWK7rNRCSXjG0I78LGy+inZ6RnIfvO9UP
         qGifZscIJgy/tBl89KqCwWCzYy1t8CHbBqGqJnW12jCgGRDalIAJiUiJP6sWI/esrVDp
         JujIKm0h1f0yIuSzmMNQOdeVLCDEd+gNOyjdbl2mtGcBup7uwbHcQHmUiaNdNhMGcDXn
         a87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770215635; x=1770820435;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8AAMIJsoWGn8x1NtmyKbgTrFaMWwEU1ewpQmfJpncU=;
        b=Vi1nOI3QGkCGfWLEL2pZDBXldvTVbvwWJfj0SzoAhs+ELQOZHBRvdIS4w5kZ58IC1O
         MYBAQMCFAJZPKM2TfiwdH47Epu0whNSnhnBzWgL8Z/vh9SRDj/WwwokKiC7NCjaorpEB
         JZGz7Kf2mLjPV8ixggKahHsUWltoI11mz9OZgFtfb/gzlGPipI5Um1YWR04PTDf7Cm6B
         9LZfb1glceV284KxuAG1rfvjPHOxwBjpKSQmzX6mFsNDsJ576eDP6xVLmZt7MFqWLX0k
         qiaojRe5F+1BpqeP4b5yYNEcJmXuXZnVCfejDiE1BAUQfBJeXqBQ89T4Q1/ov0omGx27
         VMgA==
X-Forwarded-Encrypted: i=1; AJvYcCXKYPwxial3fz/a8JXaxaJ7FehSCENx1JqNi7UH2/38yNV4hOV6FXw6Tz/2KOFupfDphrE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb4V95EQJ99u8mkrkSi1FM9zGQB4oocrdTu25aQXDjcvXfhDjH
	y+ExrrjiOG4378ZuSkpNC9Y1PLkUBnCOKxNmrtCS8K99dK+HX67XlPopP5fFL8D0M0dytoJoVQs
	SHHF8COx3bZJc3R2eXc00jA+QoVgzQwCiRnSZtQlvqg==
X-Gm-Gg: AZuq6aLwW79Y9J+vVjc/X/5rl/lXSE21zRsmD0D0G7h77dXssCuhz7xbq0strLZ9yyT
	C+FRevBnhJhmhbGIIgGT9Uze4cP9Wfatv2qE6TNipi+u2Znvl347mFByV6Dw0vH3C9gxT2J/vec
	4O4v21ci9E8NqzY4UuwMifYt82FLkC4mu2KbXNEJoQUquEr7lO1HjFZmdiq4I9NemKI91I1h3CE
	TYtU5dPqU1PZago/cMZMt1/nQLwVYe4+gDUKEU+Op88qRzRU4LJx/y6FfX6fcCPkeh7b7kC
X-Received: by 2002:a05:690e:1205:b0:649:da44:78e5 with SMTP id
 956f58d0204a3-649db4e3aefmr2396467d50.95.1770215635430; Wed, 04 Feb 2026
 06:33:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204034003.2961402-1-ziniu.wang_1@nxp.com> <20260204034003.2961402-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20260204034003.2961402-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 15:33:17 +0100
X-Gm-Features: AZwV_QjdaIiuyJLYtm5HRUl8trj1dPtvjGw045l2G2FIxpBa3pt8KtgU9SUnB38
Message-ID: <CAPDyKFrnbvkp2_WP837-nsTZN5vatKifETihn-y+YQ1=DjbADQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] block: decouple secure erase size limit from
 discard size limit
To: ziniu.wang_1@nxp.com, axboe@kernel.dk
Cc: hch@infradead.org, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Feb 2026 at 04:37, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Secure erase should use max_secure_erase_sectors instead of being limited
> by max_discard_sectors. Separate the handling of REQ_OP_SECURE_ERASE from
> REQ_OP_DISCARD to allow each operation to use its own size limit.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

As I said before, I don't know this code in great detail, but FWIW,
feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Jens, please funnel the patch1 via your blk tree. I have already
picked the mmc patch (patch2) via my mmc tree.

Kind regards
Uffe

> ---
>  block/blk-merge.c | 21 +++++++++++++++++----
>  block/blk.h       |  6 +++++-
>  2 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index 0eb0aef97197..fcf09325b22e 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -158,8 +158,9 @@ static struct bio *bio_submit_split(struct bio *bio, int split_sectors)
>         return bio;
>  }
>
> -struct bio *bio_split_discard(struct bio *bio, const struct queue_limits *lim,
> -               unsigned *nsegs)
> +static struct bio *__bio_split_discard(struct bio *bio,
> +               const struct queue_limits *lim, unsigned *nsegs,
> +               unsigned int max_sectors)
>  {
>         unsigned int max_discard_sectors, granularity;
>         sector_t tmp;
> @@ -169,8 +170,7 @@ struct bio *bio_split_discard(struct bio *bio, const struct queue_limits *lim,
>
>         granularity = max(lim->discard_granularity >> 9, 1U);
>
> -       max_discard_sectors =
> -               min(lim->max_discard_sectors, bio_allowed_max_sectors(lim));
> +       max_discard_sectors = min(max_sectors, bio_allowed_max_sectors(lim));
>         max_discard_sectors -= max_discard_sectors % granularity;
>         if (unlikely(!max_discard_sectors))
>                 return bio;
> @@ -194,6 +194,19 @@ struct bio *bio_split_discard(struct bio *bio, const struct queue_limits *lim,
>         return bio_submit_split(bio, split_sectors);
>  }
>
> +struct bio *bio_split_discard(struct bio *bio, const struct queue_limits *lim,
> +               unsigned *nsegs)
> +{
> +       unsigned int max_sectors;
> +
> +       if (bio_op(bio) == REQ_OP_SECURE_ERASE)
> +               max_sectors = lim->max_secure_erase_sectors;
> +       else
> +               max_sectors = lim->max_discard_sectors;
> +
> +       return __bio_split_discard(bio, lim, nsegs, max_sectors);
> +}
> +
>  static inline unsigned int blk_boundary_sectors(const struct queue_limits *lim,
>                                                 bool is_atomic)
>  {
> diff --git a/block/blk.h b/block/blk.h
> index 886238cae5f1..a6b1de509733 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -208,10 +208,14 @@ static inline unsigned int blk_queue_get_max_sectors(struct request *rq)
>         struct request_queue *q = rq->q;
>         enum req_op op = req_op(rq);
>
> -       if (unlikely(op == REQ_OP_DISCARD || op == REQ_OP_SECURE_ERASE))
> +       if (unlikely(op == REQ_OP_DISCARD))
>                 return min(q->limits.max_discard_sectors,
>                            UINT_MAX >> SECTOR_SHIFT);
>
> +       if (unlikely(op == REQ_OP_SECURE_ERASE))
> +               return min(q->limits.max_secure_erase_sectors,
> +                          UINT_MAX >> SECTOR_SHIFT);
> +
>         if (unlikely(op == REQ_OP_WRITE_ZEROES))
>                 return q->limits.max_write_zeroes_sectors;
>
> --
> 2.34.1
>
