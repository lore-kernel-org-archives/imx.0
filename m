Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B0A33A9D2
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119757; cv=pass; b=UKEvm43nHcQKFc4fbXUbYiaBxuqKcIuAKxA/QFGE5IKqRjqXDNlgkt4xZv2/rCr4iMbIHZHqDniQGCzaAx7jy9J98iETgHnleBp8KAtdq4mpYJEZFccjuV9v8qbF6ftGZlWcb039DGmHnXf90kkTijIwopdOT9odnXLvJ2lnCeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119757; c=relaxed/simple;
	bh=7Pxv2L8BpJWyfUqSmlz7ojW9DgUGKLJAcrIJ+nffUVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRw422i/O86mZYzx4t+858EEldxovdGw6lMqU3PAPxHrikbvcYu3AlQ4A1OUnSw1lBOPr0RzlaVwMnPAN9m8c00VWdoQiINZ7KWpznCtuo7TYuHYSv4hiH7Yll5CeVbHe7G9JGQsk7JCz8VWXpNkoU0dccSEz/aF+Q1jsJPbD+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w3CC9BYq; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3CC9BYq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b9fee282dso5300059e87.3
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 03:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770119753; cv=none;
        d=google.com; s=arc-20240605;
        b=kgfwY/wnxyb0o25tL7NsLV9khsC8uBVnXoSHi3x3IaeNG3xBmTRSS7Mvikbj0pLCT7
         5iWvYMhkYfQ62dgV/7HCv/89LZSI0X8K1fHpiHqWRtIsmecIUJKOBxIEJiEisSbRDaOm
         NQbk+0kmsRNVtu9Y67RtwsibiI6xTYluILm2/u18lufFk/Bio9IKEFvtKh88Ox3u0vSf
         Jh37DwxcnPDvw42eKmUUojMtd6A/GB4VrOpq9XgGulB31d1TzhRTCBPJgvikMc8LZwB8
         qROhzcuwxtlgj7wP6IgsBUNm8uImokE7gNowHiPMuSj5DE/7utibZsXJUHFBvtCu6ASY
         eyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MDE0sCrdONDLnFFACkETJtEg6lOLX5zuUsL6oiXslhA=;
        fh=RXyqRsgvGaJ6tkDnyYCXYS/jJsHMJUQP2qcxLZK+vkM=;
        b=P+G7rxf9oUvZV/I11UzjiwRmpT9pcaKoWMCx9o6kb5r3e6Lj3f/ZnvGjcCKCdvXMK0
         JuR7tldm9UMWZ/CjFNzgSmgYiKZOgO5u+KYTQqn3v3uXqdzCgf+qSMe4mV13UCmbN3Xs
         4EPWX1/6shd4nxu6F/GB7sGfcfgNCeid4Ew9hj2nMuCsOpxU255WdPCATd8E0+N66CzT
         OsnPbTXww6a0tsXIFCMcVcUlVuIy0tqIXxp4aPv9tTUBzj80dnI1nh6MfJ48RamMlJqW
         Cn9IBYmhtkmYOM2pO9TnJMDF7+FpsDqJJgfqAnY+/gFrT3ift2yOhkjpM81R1myknXOf
         JRAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770119753; x=1770724553; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MDE0sCrdONDLnFFACkETJtEg6lOLX5zuUsL6oiXslhA=;
        b=w3CC9BYqXQM8ptDqcKyZr+/EVh6KJGtVI1CpqxwqwMy2TKQESh+rwXePwpo5iwCUgv
         JLG6dLqxiCYYcKcU+uA1jGFtVMvMiik00PRITStT7lHfDocI155bZkT4voP5jB24niep
         EuXz0cx5MHzjWo1qWp4JzZn6Tifaoqou3bbxAkLCzdrvxYXLSsCF1c6b5SPxwX7xviXS
         J7LOqiQoa+3Cf2YHYDAvbEFbpJMLkUWlzQcbiex+67C/ULY4j2ZihpDs7iEXNK69Kk2r
         hKIx50rQHJccoKA6c7h24j09icXtVqfQk2ROQ76OxcyPmWBTVdascbqo34xjEfmYsgIc
         /gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770119753; x=1770724553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDE0sCrdONDLnFFACkETJtEg6lOLX5zuUsL6oiXslhA=;
        b=ePoLJeLCCZubwc3jtIQYRhEyCFtorMzUMdT7PatSG0uvB7+4Rv/JRRU7PidCtmIIs7
         38rmBfte2++a8Pp+6ME+nOBZyAaCkta+UNe9Ol9o0Nt2oTEshOPSJNE2Xfk3qtrvZhBD
         Q0iT8y7VtVykC0mGQFwqziGmxrMrxkC+uF4L/QpprPZ5fc7zapIqwuB17ofRNo/zIjaH
         BDaNdG/LBBq8mRRg+Oy5JRFTXQebCG1LAOHYXQQk/D5e8xQ519TQyNjWvYXuxfduBaYm
         ejL8yaKH+9YXmUVqWE1q6ZlzB5jAWe2hxaLISpJ/zWAujzwNutJSnbeRP+fUr8xucZIk
         s9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9uVuEWNqGHFimGIu6qK+tWc1rxyB06tbnU1EKEgZJ81y28+T9JLW17+d36YHLsWPeMjo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+KNCRwcy3ekxKa9KV6VEs28NmWmNB3DEHTBqebp6FU0Qf5uUI
	llG0/xKeBfHXjdHFm+7nHBvElp6RkTWvCk162jPV6nEVddhSdZ3B0YaRImKBY90CH2TFjcmQ1ep
	IFKBjYeVxjc6lh4tViX8XI5ndVMsv5Fy/bbUtdnEumA==
X-Gm-Gg: AZuq6aKJjq+c538g8vq1s/B5SeaTgs6NCQ2cWIm/3p+WLxzF5WHNnGCsKM1Ebw1Tyd4
	bSmWRAgYzqP5qKCsZeSTM5eGju115jnIDgep699U81nZBMqr6IN3iojmuz6l9AATTgyz7G2JBaX
	WjTnOhQxnRJyWlIX0ZrZ70K/IM0SizBypAft9zP/bfVzmg/mC8EgF8E9PgTXQDFv2VzckgembQq
	H9K49ZAuuiMSguRXBleu7MVjYVD5oYDA0denujajxfIVfE2fP2ywUfmtR/5b9l+9I9+1tOSBEfd
	C+jNV3M=
X-Received: by 2002:a05:6512:3f25:b0:59e:17b:f4ce with SMTP id
 2adb3069b0e04-59e1644a0f1mr5248014e87.50.1770119753362; Tue, 03 Feb 2026
 03:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203102903.2953660-1-ziniu.wang_1@nxp.com> <20260203102903.2953660-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20260203102903.2953660-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Feb 2026 12:55:17 +0100
X-Gm-Features: AZwV_Qhy5FVK3X1zDmepaoff3JHzpQHSqhwDgipwjkDYIj5M4Whz8OPbSR5lqkA
Message-ID: <CAPDyKFpu6BEqJCg+=E3VDH1DutEy0C-bobtvEXucRBd6JvRbVg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] block: decouple secure erase size limit from
 discard size limit
To: ziniu.wang_1@nxp.com
Cc: axboe@kernel.dk, hch@infradead.org, linux-block@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Feb 2026 at 11:27, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Secure erase should use max_secure_erase_sectors instead of being limited
> by max_discard_sectors. Separate the handling of REQ_OP_SECURE_ERASE from
> REQ_OP_DISCARD to allow each operation to use its own size limit.

I don't know this code well enough, but is this change really sufficient?

Don't we need to adjust blk_queue_get_max_sectors() as well?

Kind regards
Uffe

>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
>  block/blk-merge.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
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
> --
> 2.34.1
>
