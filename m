Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAAE275117
	for <imx@lists.linux.dev>; Tue,  6 May 2025 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552514; cv=none; b=dOTkiuZfKYf5lR7UatkUNziIf1xzmIsZreP8SCXImBJ33W4aJKW8X4A/X4DjrwjU7uveGu95tsfyheiSwx7akbt2ScFPwMcjmM9tj3tImlTtFf0cfPBIZH/+Rmmo/+p3MHjX34coiDy7uVmZLRgxA8mHO3vHjIWxPo1lecKDH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552514; c=relaxed/simple;
	bh=yRbNgztRonQuiaVRF+GtZA9MZXlr0FC8Lulfmj90Y+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hehzo6I0OoM9MvOphvAnQVj5N+baO7VSgD14FyZxI8CKhbTj+XNxiiJhkcOzdvACyF9Kpux3x6z9OHOkmq5dC6NP0slvf8xcvq+eN3lRpFqEWHICbFNZNoWCPwNLggcaLEPank7T7+4XeYGB19mDjZz5GCSWFAD9pZaQzm/JyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0VqtDJS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0VqtDJS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso71742765ad.2
        for <imx@lists.linux.dev>; Tue, 06 May 2025 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552512; x=1747157312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=;
        b=N0VqtDJScllFf0sjcqgF0eE7OGWD0qO+SISV/S+2QJzIES0VdClHGjql3lU9LX/rWq
         1F5wTvANjeYzowr6908wPqjXPttcj0HYQZ4ctFGV2WcW3yKYhM2EOsl4Q9QdsA6rfiob
         8lwT3TupaPSrYhPVFb+OryzkSsHJNiC3LBOGd4ZtyDdDUAMJJQh5ChNPqetqI+hFzN3i
         7j2qcDi4J6bWsW66ZOs5ybDMDIJPI4riqiDcy73KhUO2Qy4Rpyfid4icXEh3r50oJ65N
         7Ris3q2Ty1ihGKWJBSHATK1nCuxnMFavenMf3Kz/9G5kBjSCZZXMJWp7CDSMApXMbdmJ
         KgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552512; x=1747157312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=;
        b=vePNFcUPiy+ITM9vpRphlvu3mPgrrPvag6iGOfoPvl6tbnh0vHFnfUVzB0RSfu7p/J
         QZ5rMIyLMmbDtkEdbEvyDbZi1gYEKZVsJpHVYX8DjB5XYa3p1pP826fLSufigdgkLUNp
         QTftUg8AeOvCatshxRMbgvTUw8PFVBuD9zzG3k/B4IW+K1Gi2cIn7CC//Dt/lHPVmZe7
         0rFynMXslnGYSVChH1Db4nA6/oAPe+gmMNfQTnda2YsD1zo8dNWuQpkIPSqjkbvo2WW/
         tylEvOz/zcns+5XMQGMXKlkSB9tKqEpC8iNmKH326V2lvk7GQWKGfGsSgv9nacnsyh3g
         UMzw==
X-Forwarded-Encrypted: i=1; AJvYcCXsPn+lqL0Wo6jxHAaBgZEZh/l9EjDloeX3N618R/YwxjpjF/+yQV1Q3kTskkVPuYaFdDI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7+0rW/3wSCsZSivtTdtnAlmHEduAEXTrX7SJ5Q6fquyjFIoj9
	wMoLMyRCTX7PLMI7nQBHjuV9LKfFvrBuLwv06OhxOMCLaVQ1VQI5/nDSRUsN0CI=
X-Gm-Gg: ASbGnctTf2KTPD9cfki6rpkIhSB60b5lxKmPCpfN2bspFORAAc7RdS7G8E7Kn5OySb0
	zi5hnGxbgCcxoirbznkRtCeHSI3ckjheOlf1mcuOrixxsrJkZUH1uVfNsXx5P1wXlta7bWIxxeB
	zxthiha2ONlBH+OAiMsFjFFQdiFEKxiaVvUNdCelctS+DISOGzqZbIkUA53M8Ia9SHWS8oNcnF4
	vCwKSgQkucjdzUqNQqJkjS4ZxsG94a10dUF4HFXD5EuOfZV4fZ42d/GDK0DNn9x1h9rgkJ1gc8X
	qwkIkerkOAivgAamG2f0m3TYEmzyma/NFmlQFs02TvWd
X-Google-Smtp-Source: AGHT+IEp4L7HwxTnZry2N9O3p9S78d/8SkvTPJNQn4jH71NKYa7pBIcfwdlj+kdoxFRV2WoW6lG3zQ==
X-Received: by 2002:a17:902:e5c8:b0:22e:421b:49b1 with SMTP id d9443c01a7336-22e5ecc5e65mr928185ad.48.1746552512052;
        Tue, 06 May 2025 10:28:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:18ea:e7ed:8d1e:88a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228b9asm76211715ad.172.2025.05.06.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:28:31 -0700 (PDT)
Date: Tue, 6 May 2025 11:28:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix two memory leaks in rproc_attach()
Message-ID: <aBpGvZ4U6VFpu1gl@p14s>
References: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430092043.1819308-1-xiaolei.wang@windriver.com>

On Wed, Apr 30, 2025 at 05:20:41PM +0800, Xiaolei Wang wrote:
> In the rproc_attach() function, if rproc_handle_resources() returns
> failure, the resources requested in imx_rproc_prepare() should be
> released, since almost the same thing is done in imx_rproc_prepare() and
> rproc_resource_cleanup(), Function rproc_resource_cleanup() is able
> to deal with empty lists so it is better to fix the "goto" statements
> in rproc_attach(). replace the "unprepare_device" goto statement with
> "clean_up_resources" and get rid of the "unprepare_device" label.
> and rproc->clean_table should also be released
> 
> Changes in v3:
>     Update patch1, replace the "unprepare_device" goto statement with
>     "clean_up_resources" and get rid of the "unprepare_device" label.
> 
> V2:
>     Updated the commit log of these two patches
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-2-xiaolei.wang@windriver.com/
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-3-xiaolei.wang@windriver.com/
> 
> V1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-1-xiaolei.wang@windriver.com/
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-2-xiaolei.wang@windriver.com/
> 
> Xiaolei Wang (2):
>   remoteproc: cleanup acquired resources when rproc_handle_resources()
>     fails in rproc_attach()
>   remoteproc: core: release rproc->clean_table after rproc_attach()
>     fails
> 
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

I have applied this patchset.

Thanks,
Mathieu

> -- 
> 2.25.1
> 
