Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5D43C079
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136435; cv=pass; b=so85AvtQ7X4huPbjLBRIdnubxcFFYXSGy8rWdCUwdGuOq9VlHGDcX2do/c49N9lnXwLpafJZ36MNVcL+YC6CgAgkzypEJFgRDYUzCSweRP79Ph9ml0uFz2wlpZFHGU9EYh8AupkiiIhMcpa5E1AGSwWfyHZDKrrFasU/sDXBRNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136435; c=relaxed/simple;
	bh=m7zCkjHGgtakiwRzW+QIVzzzjc1V8GHmFb2HxrY9JaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUDL9URLKpjqW1c4u9SCvEpshrpPuZcyPHrY283H3apnrHBGZESgaxj7eJqPZinn0ikpzUvaGgky/tZoh3vhzvhMifXNqyuXXlxys4mEDOIQ3bb4oXqJD5O5fyU4jW5Ju6GJAVBMHYqONUe+HzurgVCFidUUSnGLlub6WiWLNvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMUPx6b2; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMUPx6b2"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-886e61fa30fso2334880b3a.1
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 00:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136431; cv=none;
        d=google.com; s=arc-20260327;
        b=gciAmsZF9OS5U/5xpVuHpp1q1qdu6VLA8M5x/w2NQcjCdX7LvqZlg/1wqN815KCrZr
         zGIGHDyfrX1Ry9TEagyyIY8VNd78YDfOFlrtajk4GXRurvrTKdr1EpowiRjJRusoYDBB
         xDmZfBK/brNlH5EEsPKbh0ilM0sHEbBuKhq89aOuVGCCrS607fEZKwuK+aDiA3oBV2u8
         P42anbaoMSTjdrquamRloLX0e7vRHJWeeRWPU2wJhTSX34W9jcxlB8IlF6EjpU5emqkN
         mPKX3ThVTXnR3JFVXKahDbmduq/lQCs7hFcvZg927KtJATJlbMnJoYfFeY5JIvKjQOCv
         6ATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b8NMSYdDGPDxBRgu8DCGU6lZZMQyQu68uXVZZRycBjo=;
        fh=brwc+gCWPvu6a4XKmh9zBKe+0FPgQPwkrPKabf7H9mU=;
        b=XosjB6CVy+ShhlnzgZ7HHNOBucAM0U9hm6wxJJrzcxBEKrTfpllDZNjnKG28ZLLWPP
         7FCc7aTBzEA0DJdoUwHwydI7BAhp/cknqxiL78J7WrayT2XM4JNdsaqFdcYngLoV+hRv
         7d0Aeo6O1CzcGkZhRS+kR5vgrjsVgvW8yqq1X7pi8gkmnOXavXXu2YyL9wk/bBPpm+wd
         QrheQSFc9+PW0jEg10jzR+FLM0JB85pEvX74NcFjloKVgVbloFDNE2ATUzAhmXEDBbFD
         IHfh8V0tyEfJQyKmgsZ0cuxhOCe1u1pMGEKViC6BgM1DA++JoSrC3sRt39ULEQjXx64G
         b+NA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792136431; x=1792741231; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8NMSYdDGPDxBRgu8DCGU6lZZMQyQu68uXVZZRycBjo=;
        b=dMUPx6b2xp+8oJywm1/bUgeYfL/aS7G8Tau4X0hXqS22cA4Jb9zy1+GbzSPnzBSKjs
         TD3lKy2PwIG7jbwx5+c7xbYL+tBI8vcC4pLD5cRcurfu/x3NchyAN4dixtHjBHPuoJKx
         s2cdznUl9fExq1RePa9Ri32MPUV0hnJaByuCvGeBUZHFka9thwXxfrsfyhr5WQGM8FH6
         lOWS0UwrdBRT/9cPkTOdmn9WGC89lbhLKNGdrELf0Z9iQCLp5BT3p6gldPKwFJXTxe37
         /jlYsHm+geS77hYqWdIkaMw2bMPUTlPF0i376PFfOTlbWUA51nXwvOTWRbNa8SSazI3B
         WB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792136431; x=1792741231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b8NMSYdDGPDxBRgu8DCGU6lZZMQyQu68uXVZZRycBjo=;
        b=kD6bnF+Z4vaFfA/w2p7ZNzOoW07SScfrXXUGOVgqrDOIfyNjwRTYUq9WKDkbuCZs1s
         0xgHQlmJtVVJHPsLcokSfL/1pudNquKkK+7CHTBdql1ppJeNqlODkXLzxYSOvMHMnrp2
         EY4PL2WaHKPQZ7SqzW5eZGQqIcLNEJ7vr4MpyiUiccqdNom4WR9XzCBp6QZLwtrtEup5
         c4Zj70v3loVb0Bvtpvv9eNEllb92HSiSD/oTESds2xGUQptD/Wa3BE39sTUbeBqS1GHQ
         K5Mr/iSJ8PzC5Ey3M6thQtpy0u+MXpV/VSS6GT0nJ1rVuF+EaIpaBBh7QRHryo5v9DTa
         UIgg==
X-Gm-Message-State: AFq9FYJBOD8xFRbm5J1TuH1PzAauyK7N0yW5QKKhzstA4hcxbk5/XKi/
	Xwn+TMUqth9vvbK6/BZE6vSVGw0fSuEOQET5hZpo8oyvy99TEKbtcLikPrOUV6U9Ac7W7DpqBeu
	vbXyJvFZ26wmzekPN2d9tt8a16s/0Esk=
X-Gm-Gg: AYBFou0fWjAFIzHQYzDetWa6j2sq/dlUyM2oumAW1vOTlGveeDPRVI4MYOhsTPnlTSc
	2d+8qX9T8D/ktkRghPD5ASXyj3awZJCo9FEg2Dr3qIGf/o/pKu0FOH8H/+xz5FoYji7K6BcPUEP
	FMnaCkYM96DamzQFTjW0SFXXbjM41E4tLzLMgWgfwTecQvq6xDRo3ZA7Ahxmvlmk0+0cKKRmAd6
	jeGHaB7zZer1hY2e4KNUREwLDlgOkONI9Wr6Q+rS/iLN6PM9zVTCT/GKPXhJLTvJZdJsKnAQXbq
	DEXKeAUkWbqOzJX6h/EkbcIXVLmEvDAauEmejRCxoP4+9/mor1cqEUZgYiDBV5KjvIHW+wMXH3B
	Jm/Ff61mrtIH5mpDr2ZQh5/LQSYydpdY+oJk6fGp+Q/DtxkfzxIVkAVOt8+kiC6ptYPiAQ6RQsa
	7XKA==
X-Received: by 2002:a05:6a00:3cca:b0:892:66a1:a175 with SMTP id
 d2e1a72fcca58-897c7fbecc9mr17391884b3a.52.1792136430813; Fri, 16 Oct 2026
 00:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261015014324.5569-2-phucduc.bui@gmail.com>
 <sashiko-outbox-173760@kernel.org>
In-Reply-To: <sashiko-outbox-173760@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 14:40:19 +0700
X-Gm-Features: AclHuK9I0k_EslrVU0Wzr7YjeZNixROziAKG65dmi8STJ8wv0r855tk6_aLjH0s
Message-ID: <CAABR9nHmXxqZeDwgtWdRQjvmLDf7NivNkcAKOo64MKotykBopw@mail.gmail.com>
Subject: Re: [PATCH v2 01/25] ASoC: amd: acp: Fix .close() being skipped on rollback
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Is there a memory leak in acp3x_dma_close() related to this subsystem?
>
> Looking at sound/soc/amd/raven/acp3x-pcm-dma.c, the stream instance
> structure is allocated on every stream open:
>
> sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_open() {
>     ...
>         i2s_data = kzalloc_obj(*i2s_data);
>         if (!i2s_data)
>                 return -EINVAL;
>     ...
> }
>
> However, when the stream is closed, acp3x_dma_close() returns without calling
> kfree() to free the allocated stream instance structure:
>
> sound/soc/amd/raven/acp3x-pcm-dma.c:acp3x_dma_close() {
>     ...
>         return 0;
> }
>
> Could this lead to a memory leak of the i2s_data structure on every stream
> closure, allowing a user to drain system memory by repeatedly opening and
> closing the device?


This appears to be a pre-existing issue unrelated to the current patch.

However, after reviewing the code, I agree with Sashiko's finding.
I could not find any place where the i2s_data structure is freed after
being allocated in .open().

I'll prepare a separate patch to address this issue.
