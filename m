Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92396277C81
	for <imx@lists.linux.dev>; Sun, 11 Oct 2026 01:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791682915; cv=pass; b=C3AHcXMzEUW3BEHZoV6ohSVW4XT3iAmL8kFw1Aol353ke8pV2YcpMdKXq7Qoy64DKukc4SP0JvTrfFo3z15n2qmGk/W/5/4qcIaDuHnhDuGpp+dpcWGHvdAu2RVrIynxop+2LgWzrUPDhxT15rMEfjn8pO0ZxcNvvKPKB8WBfMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791682915; c=relaxed/simple;
	bh=a+S6iXUXzShXzubhMagWvie9aXwYAtsnVpzohR+ZRkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nURWGah8iyzb7uOO+v07wdbWdXw6CYw6OcgcnZ9bNROl23/8WydNYZpPRtXwj7/NIgdLlIaU2yPISf3PjdZKVx7ImLJdcqkttDcgvK439DmGL9A9h8PGxdBWINp6oeIJrzPwq3yp6HM/jhSfOX6fUkeb9lbtoaw/J/HsZuMNpcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7NIojj7; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7NIojj7"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e49fbf92aaso4250055ad.0
        for <imx@lists.linux.dev>; Sat, 10 Oct 2026 18:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791682914; cv=none;
        d=google.com; s=arc-20260327;
        b=JrQ+6a0HoHOS3tVO+d8LInshNLmh2aK6BvDWQ5BCgwJyhi+1MEcgw3eC8+PdG0++eM
         XeG9XoCMnOqHTRFrXF0Rmw58I76l3xKIGyIVQ2SYAB6dArb6230v7RshpAOENXkp/Cin
         pgJUWZkyqCN/ZOTKE29hIrr4PX8O0fq1EjDToh/YjxJeKWWhQ4MSaHjqrX3D2Tn7/1y5
         Kx83HhFpZEPXXIaknXDFT16Btx/bmNY6mKTfjy8sk+soCVfg74suGPqdCK5JMeYke3a3
         FTKeHBXJ17viiv10r981zwHUH0gQiWbVSXbLZoja3I4NwmuzVTP13VnRUxW6ekbJUHyn
         SH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NiZf56Uim4TT6iXbRIM3U2wYf4exyklNf3pNuoRHTuI=;
        fh=rZAI5KCTM/F8NzXSDlQl6KTKIezdT4dpEbz43BAbVA0=;
        b=FTo0rF37yCYb0mHqfqYb9CDiB2f+h06UFn/dAMivHnB46TObj5+7MGO+pbh+fWff92
         3YJBBFrlRyE6jSNoUqNSa++e54sUXuUzgn/LrWwO3HnDWwWyX/0C0pMQIB2p2BTgNF70
         MHR7sKDDYfIm57NqYeXj7rulLhWeYIFMRe5nuP+Ko8ThteybsER5saJR7dNK8Hc/nSKU
         qfKbuNLVCNXdoCPoHCqbPiUo+cy7PxWkgDo7WOy2bNkbq2aioC5HSPRd0BVL+mterC4q
         NFNyIdQQAy72719WT33Bfl8jsCLRTHK4cg7TgKYTZFZglMeQ9YGUjKGf7x4I+SiAt9vE
         ybtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791682914; x=1792287714; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiZf56Uim4TT6iXbRIM3U2wYf4exyklNf3pNuoRHTuI=;
        b=W7NIojj74bmG7MJnhEYO1LeBR31g6XSu7n2btCnIOST5lFhgnAb7ROhiZVO06KMSfC
         L90NZrceXR71KyS+Tnmmno9Iq6KQQrrWkxfpRK61aGmrrzpMphG9XuVcI3Fvl1fA1+4k
         cVa6LpVsN0JU/GXWkmmSRphwqkxSEJE9qC5aBxdt1Xn11mYAdfBoKBtc9+jdTYtTzhpa
         u+Tpj5nOpZozMZF2MD/15CrVu64M6dmO0lp6Zc73LrXiWgqh5slR5Q4VV2TSMO90yntc
         ZCkjqhbgly0UgpNN5zLMgSVcKZxB5g6FRACD7V481d9If57fe3ESEtFxPSoSKQ/um9s1
         xMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791682914; x=1792287714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NiZf56Uim4TT6iXbRIM3U2wYf4exyklNf3pNuoRHTuI=;
        b=PO1EdZHxWhm7GXZEtBP5ZKYz795fBUF3l5vsXGZh8zrjQ+MZI9ttmiA+XvFv0WqMX3
         uH4d5Fe/SXfa9XImzqRf+EI2VCgoR/w8njOF9UaTZRgXT5MnQYOiBaMZuoYVEquv6QuO
         BqyYNucqBeS14+TsdKjtNFHMN4+shRvuja+ToV0gwFk/NlHBppgvTk/TpPKlyEVm7SL/
         iFt9bXGkG5cCXPsA0v+XEaCjkkDCm6oayfUsDT5xeQSNHZVphZvq1Zkp6ALpvMIMJq6Q
         GRuTJsFBnXO81D9QwMSshXm0YgLynDbPNEPatLWGjm9bTtP0eCWPoke49H2NcbTQIKtG
         IYCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmzKHg8tjnBVBGt7uJ72p+rY5jqAPC29iAUKslSGDDoKVEJNBvEFGuhCpvZmoUwY+6FzU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJt1pHJg3b9x7/YiE5YZay/YjuASUsftwxcooBLN+OAXvLxH5bm
	nfCDQJqUelC5/YYDYh5sUQv0CnfUc6GPNlsLf59glgKxelgfmj4QM5n1RwFnjTKc1fu7FVAspVK
	XyKHzENFmk0czfUUFb3qHF3f94Bf+qb4=
X-Gm-Gg: AYBFou2cA4qqvHHKiqn46nXs3iU3+hGi15euEoPOIKW5BpYFt2d2gWpja2kUn62uoI4
	8eNCj5y4MprWroxlZPXnuNlxd7JC2MAMai2LCFSfcC4ZekyGGADc0IiZPFDIT/vYs6hsGHUZyQ9
	e7j3lENPmmqpI6qynIFuLRPB4y6TblH8auQML5HeNwClsqWD8XeAnqVjBx6IbeBUGOcuxIrRiQe
	Klml2NwE49db4Y2PCYXJGYQPFRmYrNtxkRxObVVwTQP/3kQlLj2cLs9SLEy1oLvW5yrD5uCt/Qc
	14jiTnY8S3/PZncQTLx/PlRWQMI/aLihQ4WgLY6tnVtV4gHAyA9Q0J4oholBmqWBBxSBOckRBlt
	J9vgYrJucQCgHDoGx3FoOcR8t1NGunzcCNRCZ0cJQeGD9dlN3PWgo/9sBHEyWu2s/nqoMWXAnNs
	AL2n1F5C7CxFlMscQOPu072Jor
X-Received: by 2002:a17:902:dac3:b0:2dd:c100:7cb6 with SMTP id
 d9443c01a7336-2e842abe6e9mr47983795ad.50.1791682913773; Sat, 10 Oct 2026
 18:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <sashiko-outbox-164068@kernel.org>
In-Reply-To: <sashiko-outbox-164068@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 11 Oct 2026 08:41:41 +0700
X-Gm-Features: AclHuK-QjEu_VAQXcaV6bZOPL7kHjp0kHpv9N9xREPZm8mCCDGSnjyOHWmNvNow
Message-ID: <CAABR9nFB++tUxLm4M0cB_y9CXxA4QsXTUkS0wKGbd5F9LMrP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Does this error path leak the dmaengine_pcm_runtime_data (prtd) memory?
>

Yes, this leak is pre-existing.

Looking at it further, snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS, so
the second call in msiof_open() seems to be redundant. Removing it
would fix both the positive return value and the prtd leak:

-----------------------------------------------------------------------------------------
ret = snd_dmaengine_pcm_open(substream, chan);
if (ret < 0) {
        dma_release_channel(chan);
        return ret;
}

snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);

return 0;
-----------------------------------------------------------------------------------------

Morimoto-san, Mark, would this be acceptable? If so, I'll send it as
v2.

Best regards,
Phuc
