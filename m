Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE912DF12F
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746959; cv=pass; b=AFlVBOncrGyUsbR6ed9j83clQnZ5ikUt8zxDiKh4SdoLcrEeLORi6a8DnZbCJkq1oGV1taHJhTUYQ+8oxbx8ng+xaC0iy3Yp64j4JsPBGL9p+B0aP49iqLABoeuawCaAKnZDCQsU2mJ3uygEyAlkH8yjtUngJ2fhEbGzp+E5euU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746959; c=relaxed/simple;
	bh=8S72JqxkYPUq9z1NSraK1E2YCrYZXXPbtGqTQ8XXHWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skTDG/cedVEgmbLvGWhuE9FXGlzhZR+MgU5OR4hU+PFjh+RGcaauCgqzhcV+XsBUYnrE75LRQWeqmFK2Ei0ImXrZ4jGdNetsPk+TvRBgZpJK++zGEWMc6gMVegxeD6tKkA+dAhSmDcL7B0dSMwxSnoLam+YR3j8B6TwUDc8OsnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIsQ7bOq; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIsQ7bOq"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2943199a12.2
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 19:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788746957; cv=none;
        d=google.com; s=arc-20260327;
        b=sImGtQfpkGdC8K4P1G1fOe7pak2EcBCy67PvBF7K9dakbfm/1n/i7F2Bz6LKyjGCUp
         eS769CB8uXzGY9VkGa+pSA+AxPi2BEDN57Qtf7cEpD0aA+MEbvCP/sKjwz/jsdTSQu76
         WH4nN/Uin7a1QO9BFTTw4FD6B6+HGcmec9K7OhMRP6JRRpiE5tpRkXqwwB8hEgs7xGb0
         mMsPK3enbuKN+29Abyw+/3k14cRmdGP0ZLjFTZ1eEWTB3bozVd6OXXSQEn7mr7/fH4VR
         enPRjLOl3KD8WgaUGMPHbs1R+BXnzWLxaYdLBYNh3+OFjwVw1dsIJQpDq6N2xyXKbNhh
         557g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=41ZPJes78E5JqYoluCCQhPdQKZKpfLEU7Pxen/KxT9c=;
        fh=YbRUKc2MOBuvx+VhA/JLOFmAAQDhT/YiU/O68TOY1rw=;
        b=p+nqhRgVKirt9AqB6gyy4UuIC0ehW6wrMqYBqi1ma9/LlHqyn40wFpeMhzFiYvOrtS
         NNlUe9y//plK/r6lhlroZY7671w26xYj9BBc56VTi8AaLQ8b1xkhXqpL8BM3VlbOdNVz
         9GJ9syoUI/rJ+AmasrWANnDjJvQIiYp5JBfP4cmbsZacAtcQ8NSXIYORKpT6L5LfDB/3
         TQ6OjRtu0B9xEaxuJdG1MC27PX1oaYdJenTVp/bbanAjeqOF8qndhSZdzYtlxijtq92R
         nSc4+uvJ0zq+OfTvm/p9+CM4FsawGthL1lTMKoSYLF7YrJHR+bTWg3n7cj5aginiWG+r
         VZ4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788746957; x=1789351757; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41ZPJes78E5JqYoluCCQhPdQKZKpfLEU7Pxen/KxT9c=;
        b=gIsQ7bOqQolXdKnf/+bReTVnmCZhJZKBJr/rRNmGmUm2iSB3mwJqiXQnC0aKY39WbJ
         PNhPl9ayqr5FW4bwFU0k0zfnnrOAM2vZps16i4eVOEkj1VVCmekVL+1632YckSvG3oHN
         J2XwTSTQD95yQQCgh61iKXR1xAUSQ1ngxRjiA5kMqqNac+829OO2sgQpcYbm759f8DmT
         sGmdHlPfmLgxwrWRtBaFciIGiGxvbHvT4MMWbgWijNie/GrlIMA0a+0L0U7ZFxpvyqxJ
         RrWJFxH4zioSS7A46PyeU2K7QSKsH0anANNz1H+fdUofsEg/2VBegxcsIJQSFhIgm+ho
         t0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746957; x=1789351757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41ZPJes78E5JqYoluCCQhPdQKZKpfLEU7Pxen/KxT9c=;
        b=eWfELoyFG2ZKoZYruOGeOzDTFQY4uneeXqmuINOwTa4iabsFY3wKwnYuYGFx97Qu8b
         BohO3rgv3pVuvWnpWHlPfXr90fYPxAu0q3F+9gZjZr9C/C+59b+G0AiujWUCs4RscNEs
         Jn3nZ6rPdLqZCB3gnP/W4ljSGI8mD1HZH6j4gmqpRPaTAtkPcVCRQ7T4igeYt821PKBf
         3NpZYqwPYApEf7KbqWTAV5sxW218gaKEUDWKL1F0lXzDVBHYW4J4ScbFgfCUwZ54wvo1
         R0mt3bcGmBULUOCgQYwBx7bNrxH2KtgoeJoQC/gcNKJdxCGDsyKS3BQS0k6p8H4e/a1j
         pe0A==
X-Forwarded-Encrypted: i=1; AKwUvBz0+Kj1EVn3ljnSEys3UxkLULCe/G+PXpjyevBUji1VQLJK6t3f9QyYHEF7JzSBSyIzKQ4=@lists.linux.dev
X-Gm-Message-State: AFuF++kvvrM0mOJD6OSWB0JlZhuuYcCFGOAJes2UYGvid8/xuhlDbBgB
	gcvb4GUbmX0vWGKQYVKqklJ/jndjlN0yt8nU+bRrU53sSbAMDxJkOI6jLVtUQAyB7oGw1JPYALW
	8dNHCWmycGydJTTYd2xg4AYpuq0nVgeg=
X-Gm-Gg: AYBFou3bA5ovD9OoZMQ8frattyzN9KEr4TIAikbOJDi7hzZGUlqgL+GRj2QMcO6YrBf
	omroEZg3TXUadIuilzGnsOSYGscc4/i0LU3ak0I4OEc1/KqTOX9mdtBo6hvfJJMEilqdbUD7dHB
	UAAj2cng02b19SbQSp7MAIYaytpJAYNmq0Dk/+92p2rmkgf1yKF86y05qTW1N2uqUD7CKIbK212
	3pb5vYdDe0jIgH8LhA5/1JHzktcDrfQ/vjFpg4kXm7nL6tTP7ivTWMY63nfIXR0n8t8H0rP8xbz
	rTCWHZFPq69zSF1+y8DDclSuWyZgljxRALYO8du+wu6/bOclBAZVbpg2GOc18Sn2Jzpa1I547wM
	EKfHz92HI7UGLRpQcgZocmqj6nsWYzHWVc6HkDtj9x3u6D0umdzjT28w0
X-Received: by 2002:a05:6a20:9c11:b0:3d2:3e73:29eb with SMTP id
 adf61e73a8af0-3da39bb596fmr30384101637.1.1788746957096; Sun, 06 Sep 2026
 19:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260906131711.247708-1-horms@kernel.org>
In-Reply-To: <20260906131711.247708-1-horms@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:09:05 +0700
X-Gm-Features: AcwNN1UpBlL5kLepkt3Zyceqrsy2K24obNL5eruf5Z7G_SgnSgff3Tb-QiV2bYg
Message-ID: <CAABR9nFYrmteCtb6E_txg13U31Bf50p0PUBvaOXi3gmT7Z+0RQ@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: Simon Horman <horms@kernel.org>
Cc: wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, 
	swboyd@chromium.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > -             if (irq < 0)
> > +             if (irq < 0 && irq != -ENXIO)
> > +                     return irq;
>
> [Severity: High]
> Does this direct return bypass the error handling cleanup at the end of
> fec_probe()?
>
> By returning directly instead of jumping to the failed_irq label, the driver
> bypasses fec_ptp_stop(). This leaves the fep->time_keep delayed work
> (scheduled earlier in fec_ptp_init()) active.
>
> It also bypasses free_netdev(ndev), which leaks the net_device structure.
>
> When the driver core cleans up devres allocations on probe failure, it unmaps
> fep->hwp. If the un-canceled delayed work subsequently fires, will it attempt
> to access the unmapped memory at fep->hwp and cause a kernel panic?
>


Yes, this was my mistake.

It should be:
+ ret = irq;
+ goto failed_irq;

instead of :
+ return irq;.

I will fix this in the next version.



> [Severity: High]
> Does this error return leave the devm-managed IRQ active while propagating an
> error back to the probe function?
>
> If ptp_clock_register() fails, fec_ptp_init() returns an error which
> propagates to fec_probe(), causing it to jump to failed_reset.
>
> The error path in fec_probe() manually frees ndev via free_netdev(ndev).
>
> However, the PPS interrupt was registered just prior using devm_request_irq(),
> so it remains active until fec_probe() returns and devres tears it down.
>
> If the PPS interrupt fires between the manual free of ndev and the devres
> cleanup, will fec_pps_interrupt() cast dev_id to ndev and attempt to
> dereference the already-freed ndev structure, causing a use-after-free crash?


This is a pre-existing issue:
https://lore.kernel.org/all/CAABR9nEkci1OFoHx2qmJWvKabUN=JSu5AcPynQ-tH02wxHEmOA@mail.gmail.com/

Previously, I suggested using request_irq() and free_irq() manually,
but that would add more code.
Another option is to replace alloc_etherdev_mqs() with
devm_alloc_etherdev_mqs(). With the LIFO cleanup order,
devm_request_irq() will be cleaned up before free_netdev(res->ndev),
which should resolve the issue.

Since this is a long-standing, pre-existing issue, I think it would be
better to handle it in a separate patch.
