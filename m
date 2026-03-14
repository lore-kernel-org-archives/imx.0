Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA623817E
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773446992; cv=none; b=PbhOjzBGiZsRi4qdYZiu9BQ6MolDtBfHB4vhfjsRx6v0vfdI0k15uOERtmBu0TJgHODrBtfXZNoZ1VE7HrFUPzGR9cD+5RzgHvQix1mwCaXW6IIA+0RHRwZwM69+dwbS36tELqROO75v3HoUytGIaJoCVA+7DyNOEDWu/Pkn3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773446992; c=relaxed/simple;
	bh=+dGmrcuiiuuV1a5p0Ly1Q66s4c6kjuU3qUogVTsRx/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btIgyj1rhMIO8HK10SnkbO8MUEboAJXwcdlP0/hsFqRAP+sCHiQ348STci6OC+1gtjAGUX+ThXM+QNiyW00subyxUXRRVKiBGDjQoin53BxyQvJo+kS3sqe+cUx0k9cjnZ94ein5ULYlCsSexpqecnKltwbuhfJ2VZ7JoGB3lVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=tXWLHgbi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="tXWLHgbi"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso1167310a91.0
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1773446988; x=1774051788; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1K2wFHnPv60zEHnUhHNmA3kV7XBCekNFy/nqC8VtDo=;
        b=tXWLHgbiBxCRn1vqO78uwZZxGjxCxPG7Jkg3LrbvW/IrzrPnzGq/Jt+V/D7bdLIaGM
         TtiQOXqCbJrrQxbS5Y3r3/zghdDxmuXOlz13m8txxJlrOVeVT1KyTD25zWhi7YKZlH7Z
         AWjkIHZujWJwyXJyh3x82sNZZVybBVCkzHgFjKPnJxMDakJc4xBXWxouEHmF2uiEnLVp
         7STzNymQph7JRvfK7ojFb9JBu/fM210+CWrDvEEdPetqO0VyogCaNIenjbgB43T/R1rQ
         y2mIFUM7r92GmULsMSJkcKp5fYq0sbAEoYZq5e14nGQ30vHM66avxSLMiCq/2DGIWJwU
         kXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773446988; x=1774051788;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1K2wFHnPv60zEHnUhHNmA3kV7XBCekNFy/nqC8VtDo=;
        b=Jcchx83Oxko4ZvVizJ9Ls4pKXoBdvOXMaJ8wa/xkQ3gapKUM6P3EI6+qtNpXkoSwRA
         yf+CUbqQVNpmWGHOndKBijAyeGsiLTBS8YgyQbP9a/ST34mKi8CMyIXK2bVlc7SvXHbr
         ZDd1vXOCem89VA1gaC0RckeX/uXfNOgMkESE+/Bv27JyqQQWCL+pqS8LSXnIAXqL4DDp
         KXgbGzY0UGCu4gyNlLhuHH9oZFCo5dr0sF87yPgIndG8VHy+E+4osoIFhqbKENqG9NUv
         ZYgqqA3MWhn9ukWt1ScDAywWfmeyITZg0MChBaSZ8aYTHpTA9RLL4tYSZwnxD2BIPLGZ
         pZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCWY/jYo3Ou6n9Y0wqZsrtFulkojxIcodeV4Daayr0fItqHvGIwuozk3F7UMpkJZCwXNsIg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZOUspMKEgMNE/MuQl/a2PtegMTuuUNPCAFbIJNrlQ93vjLaVU
	5N+UB6whYT1gCuimlCK/xNOWtsHMRFt5pSGWmhGW+6AxJTAcohVa1iT/ncrF4DuF8/0=
X-Gm-Gg: ATEYQzw4gCOAXykGJZawp81DLGzwRJ40/HnjIPug1dgvHq171pVCsqmkREB4ulyg7rB
	yRP9e+7CxyJotDe+KM/HV6Ro5kVbTA0L3Lp7ayWHQHYw0G0iD9gYbxxT3mphLbcwYZ5hWEb5K0a
	qJTJwtwRlXjFRImlji++zt/fNFBry4yOfjAOwNopYteLDVYnIPxXkaov6d3BJ0Eaa/NoI9+gO4R
	kn/UxHcaKTejwVf/V9mncQWe3ntVHdVWzQYB1zEGICHEpviKep32KeFrRbsCswfu6mxp82o1RPP
	9dkqSCq5gOB7ptafxYLCnOzyiRkuESRDT5A4RUCWk4yFd4aEJzqogTS3i2Ea2EXkX+Rls6dMLG8
	BYjgrJaeDD9BQVHMGLxc+dXz1inlcj8HTptAWqW7kYtZ2NKjgglHMi77fj6kGAob1+8iv5KBHby
	JQTRh3
X-Received: by 2002:a17:90b:4ace:b0:359:8ca0:308d with SMTP id 98e67ed59e1d1-35a22053554mr4077220a91.14.1773446988255;
        Fri, 13 Mar 2026 17:09:48 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359fe40bed5sm10347528a91.5.2026.03.13.17.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:09:47 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:09:46 -0700
From: Joe Damato <joe@dama.to>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH net-next] net: enetc: remove stray semicolon
Message-ID: <abSnSjp7cIj/qWGG@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Wei Fang <wei.fang@nxp.com>,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
References: <20260313112454.427191-1-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313112454.427191-1-wei.fang@nxp.com>

On Fri, Mar 13, 2026 at 07:24:54PM +0800, Wei Fang wrote:
> Remove stray semicolon from ntmp_table_name().
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/ntmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Hm, I'm not sure, but I suspect this might be rejected due to the note about
cleanup in the docs, which generally seems to discourage this sort of thing:

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#clean-up-patches
