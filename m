Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B9388394
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739186; cv=pass; b=TyejeKyaEg3cVNtPE7IJkbb2g5ybNGnhk3LdNrJWtEEyp364e4uxUUo5EXNHw2syZOeZlbkcpiSjK/2bQ+S30m1m8/Mwv/qv2XUUZImLRjzaG/6kAceuIM3ROmd5U/xIpbedG4LR3PzQK5fcLOt0cG8e7W3Tvfy6SxvVOozcCfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739186; c=relaxed/simple;
	bh=r2sqqQeNw+OErfLcyiJmI9dyJ7IG7egdlCrRZGp3Af8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk7miEv9ivpmiVVqCdgeHbPrKOA8DABr5nPvjeD2fdLiREoWvuAUbW9mRMZu3jiXzUns1lq/KRVYHh26+JAzU7RWXKDrPrSEMy4NNsFUVA7l0vskDfIYN3/wETuw6Q0HjDHRFG7U5FqeyTY3w4ocVlHvzvs9fso8EMyvZ7R1WGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngOQ1cDY; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngOQ1cDY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d53197d8b5so8223775ad.3
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787739184; cv=none;
        d=google.com; s=arc-20260327;
        b=Qjlh/Ap+fIoiwMuvJurob203fYS9d9OLshkCw6EymmJbIakOv8++0SxlrFrNjIOM19
         k4Akio7lmiHNDvG/8exUngzPnFU44cEe7vZQ5CkI4+FJHUAQNni0o9br+vIE8RmoNOEV
         wSxx9Vu6rucF6naa+fodRAG8Skgba1CRjlf4lwF6ul6SOOONwOk8cKhYbmUK/0I2E0Fh
         J0JCCvEIX3Wm1bugX4RslbpimKp8syq/G/EA+xHFxMCVrA7ciQLw0k43rlXPEgwftTvw
         RMve0T378nyRX/uIIqrEUvMtZ37Jbx9wqfBj8jxPaVB7WxAzBT/kKV5yMXXoj8VgrssK
         1X1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=svlYsr7Y694+G4Q58xTTovmhngPrt1vqEywYNBl8gZM=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=BNxEYWokekDZ/mL1bmkq6tlc9JgCYUTuHdppzwYyNU259Vi3hy5E5yMu021MvGHkY5
         X0PN3K67slzIZqfylIvhULjY6tVPCaQdvqcdW2VQHvNGBExDvwtSoVC0gbFUuse/2ju1
         5NDsAZl1URnhqKG4CiCcI8hq+77Nm9GUkZF4rUEW543blDuAYgnLPeunJDG8XF3B66dw
         SxwM54/M8focVykcW9qCSY0n3hw273obc5M7cqd0AaxxkVCQLIFALO0+q7C8BLfCDjAt
         OqL1fe9H9oVT+fk6YxyQo9FV4yt5Rwd8GxkF48oGdvjkpmBi+AAdiHUoC5RmkTGPrDX4
         iOkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787739184; x=1788343984; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svlYsr7Y694+G4Q58xTTovmhngPrt1vqEywYNBl8gZM=;
        b=ngOQ1cDYhxnMxHxJazUCXmEP47o/wi2AmAS1WfxHOYduf8pFMHkd8Ht3Q72rx1bzVV
         R4jiVLMka5zCo8v8AIiJeQd9+Mgb6RMU+s0ZWfUDNSn/tXtPtYMf2Du0SqcBljLZkeyY
         MC9HNYmEClR1lZQ7meVgH65gJlTG3rsnh/uJ1qrXdcEY5SOl6AfqPC/Y72MP15vspPj4
         wi8TKY5noSF1kbJcDL9WLk2XL3jjf4QduA6FwibkyROAZhgLmDgxiUnJB62Mi0y4uqEF
         yDxKVGwi+Rc31aoYuLSqcAxRM8qu6SwGex2nEqtueT3Kfepd8szr9h9Wbye21ndiukUd
         6r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739184; x=1788343984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=svlYsr7Y694+G4Q58xTTovmhngPrt1vqEywYNBl8gZM=;
        b=k4YPnWBRxSTJeZf4M+e6vxkDQcLdE4TJ9qZcNQKUDCi2dvDAU0UujdsQkpQepoD8ZB
         09xb92SBBsOyt3i5NEeFDXoZfaZgozfrK0xfhMyHC+iC3su4crHW0Q/QJixb85/I+M+W
         U7ei2E3JS8PxigqdrvJyrBrQdGToINR1wNUlGxdbwtf61/CHJnjQIv9c6vDEvzh3Qigu
         sf9HhqE/GcIOccrUbZZ+nD19l3UutDWKP8tkFElCzmBf69jk+ZnaY9RjwSE/Rn/uWa9/
         GPV9RHgIbzP12Ednk3g1F2D7jnyo5HkG3XkHsbC1//bDSDAJbMOlqdURcxiu2F4zJvs6
         zvTg==
X-Gm-Message-State: AFuF++n2zcBdXqjBowEc1sZ3Z0t9Po3EEMfeUO1p95SU7hkUbYhn2aqr
	a40HPSJZTo0NzN5Zn/QyXFXRGzk9+Jxg6UxfMFeHe3+fMOafdELg5g1A5qMGPAPHTmRXaPzP98h
	wx0YH4zGUIW6lYRkPQntIwR7jzw/jVPk=
X-Gm-Gg: AR+sD122iC/x70iU6HM4RUctwX+KcTeFCax4DS+vF8EFaWIs7YSGXuiC5LT2jsKw/9O
	gZq8KdOi8TQO23Y0ZDj6MuptGITGgWT8AATE6YfzMvAJEZ+j4l8TB0VvGpIr8PB7oj5rLHh2Vq6
	uUQheji/S5u0Mi9tEqLWyPTbn3GRk+fEw96als9Ozvy/SbolUBjmobJi4sz+b/5xta9j0gUisrF
	dFi5SY4W9mPG9UTUEBMP9ULBfnOIcrQrjO2yDLZqjQjQH/BvuFzIb5bKhiyneAJbxQJB0Bg2iVM
	dfyFnJ/ZWor8j3cIyfZeTv4LuckpIkAT/m/7m2Z9ck5V8dRV8M7ApyXSmCOs0FbdOja50FeoaSE
	WT9ciZe6ZdJVZB72iG5QbGtFrL0ZoxX4oBl70qt2zYAfa86a/BAiLUXArR7XcgEnotUQ=
X-Received: by 2002:a17:903:1246:b0:2d1:1f73:3667 with SMTP id
 d9443c01a7336-2d707a04385mr81721005ad.1.1787739184226; Wed, 26 Aug 2026
 03:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824100834.31655-1-phucduc.bui@gmail.com> <20260825100858.830171F00A3A@smtp.kernel.org>
In-Reply-To: <20260825100858.830171F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 26 Aug 2026 17:12:52 +0700
X-Gm-Features: AcwNN1V13UwPZmUVPYcB5HEYpY8toOyJ1ccp7thS4TvF6ntFH79Iy199cNLDsGI
Message-ID: <CAABR9nHbtDexQaUnyAcUBASphoOOncuohjp5exfmPsmidg9AZA@mail.gmail.com>
Subject: Re: [PATCH net] net: fec: only stop PTP if it was initialized
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> This is a pre-existing issue, but since this patch fixes the missing
> check in the probe error path, should we also add the same check to
> fec_drv_remove()?
>
> fec_drv_remove() calls fec_ptp_stop() unconditionally:
>
> fec_drv_remove()
>         ...
>         cancel_work_sync(&fep->tx_timeout_work);
>         fec_ptp_stop(pdev);
>         unregister_netdev(ndev);
>         ...
>

That makes sense. Checking fep->bufdesc_ex before calling
fec_ptp_stop() in fec_drv_remove()
is indeed necessary. I will update the patch and send v2.


> - [High] Use-after-free (UAF) due to improper work cancellation order in `fec_drv_remove()`.
> - [High] Use-after-free (UAF) due to improper timer cancellation order in `fec_ptp_stop()`.
> - [High] Unprotected hardware access leading to kernel panic on timer expiry with clocks disabled.
> --

These pre-existing issues are outside the scope of this patch.
Since I do not have the physical hardware to properly validate fixes
for these issues,
I think they would be better addressed separately by someone with
access to the relevant hardware.

For the work cancellation issue, a similar case was discussed here:

https://lore.kernel.org/all/20260728062730.2394873-1-satishkh@cisco.com/
