Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321CE2459C5
	for <imx@lists.linux.dev>; Thu, 28 May 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962495; cv=none; b=svUQYGEV5UwKdNTMKX+O1nJYTTWuf7CfbPafwWMO6yDMbjqHVp+NWD1JGRVCPc6Tv1qZRhgDvjBAJrW9OkPTX9JLPDrxAs7W87oxNOIWk/SyPHssAoBYM8ZZovcVnV9340j+uPoYfqS+b3FFJ1riO3Rot3FDPRugYZgJUImNAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962495; c=relaxed/simple;
	bh=k0N8p7KR0KzYUnXDsGjczC4xqjOSgzs0rNd7EZRHBsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1fNu8Q5/8nm0FBpnygvQDPdqKpzMc3xHveIGJaVOUCypEuzR5cXiRS4gbx48TEKaftsyOiVnkgX+i4lv7wp8ZZB/ZNTz/f78MXENZWu4XtbHTc2QV0mwa3A3GzPD0vBJGyUCqHuXmivam0diPZNzMx09l5Aqwc/1sYA/xsYRWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCldcbVQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCldcbVQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d77f6092eso7168635f8f.2
        for <imx@lists.linux.dev>; Thu, 28 May 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779962492; x=1780567292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xKY9XqxsUJtupqvz5jn/1XVAIf4nDjsIGBJCahQiZy4=;
        b=FCldcbVQ350kr+PAlm8+ddoXP6FqEFCZof9QIe8eEE9+eq3K0bYlreQVKcpynO4QPv
         1i+3OULc0MwxDuXplVurDlu7za0U+wIkhGQNvKyBATD5Ej0PTHSy8lKVYh9sF9cfVOyY
         1qP1k7/6s52VLL1LPSKeY07/zyfXqL8kFJMEy1PjUti8qR/C7yPKUklYi+0dJtsh3FQ8
         w59f1S6mkmSPMJW0sd2wWuZKUC9MPhkZ/9rdkgAwCGDGCNG28nEN6e68F10PZLk8C3Y5
         7UjIHKE2kegyObT3igCyeO++Qy4RRAxkpZOKWlIUPMsC05OM6Ess92qGBOf/rvuoiUx3
         ZLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962492; x=1780567292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKY9XqxsUJtupqvz5jn/1XVAIf4nDjsIGBJCahQiZy4=;
        b=LnWsNtm18Am8IaawYX1wolw6nY0m+QKd5eFH+S6b6coFOD/T4XuozjFhjeZhIpquOG
         LUEiH7Xmg2hJB2ceYXZLOxP2WibYI+0wxlqeFuAR95uUNBxKo3LP95QbSGrYsAve4Llk
         A7nxB0taGenBK1HpHL34Fr5MINcT8iQ56oFuDXgytbXasKJMaJzTDYvllBEsfM55QivW
         ASapUaGGu3B3KEbwEQdeYJRS1cbm3GD1Wi6StFnnrNdLdjR8Vk1uVUWm6DwX8V0mfDt2
         /cYU1KWJF3fZ7A2rpMEQ19iMNOdVFiW5IgiXN9l+XXHPBVf6GH6YnS7CcmEb47cPpPfT
         4NLg==
X-Forwarded-Encrypted: i=1; AFNElJ89wq9en/ufo6a43SD3wLaxzp1xyo11XxU98ebfuaK/10m5EbfRzXguEqdMTO2lqqcFU3k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzakQQH6CedX5PB9jcaY2yXkKYg/cFJfafi9W/t9q9kTD2UT+49
	UW+hQWUBLw+qN/qk8+1ZYvtlFerwJuMDki8jIYlcoejw4ojHmQ3DpPlp
X-Gm-Gg: Acq92OFWTpjXkjxbpyZrPReX77E2OATZOQokOC841gAd2lX+8ldQ9rY4cDijvsFtPkU
	TA+IXsXV4251kTs8z+G6576NjL2gbms0j5xdO1/WsLMfBXPuhHXXt895v33rG5y/pNyGuUbGqXb
	AM7PU0LyQgB181TlaOsJn0pz1PpAFlQ60gv2hwbwGwFfZN7V2b3/sMsnYhVjLT2VOl2GbXiZv4E
	y24RwpcY4jgQSjy5smOdex9uxhA9ypmXJcOs87x+UTjcebyJaRO0aZSz9FZXfn9pC2oJzUbbDdb
	D7UpnXuy772Abz6U/tou8PAtboEEAvVUW/7OJAw4gZ16fgfDrVptBl1KcQLJKkYaLkvF9kSXmqN
	Jd+2N1auIUPeiGF4EsRUaf9mF82cf3Tuo5ypdxDPTOWGNBrSRPTT1S8He8D/rXqB1KE9AN3MZ8M
	OHO78RwknR9ARxUqZxuoChTQxZx69jgJNyRg==
X-Received: by 2002:a05:600c:8b77:b0:490:5368:743 with SMTP id 5b1f17b1804b1-49053680a94mr402588955e9.32.1779962492224;
        Thu, 28 May 2026 03:01:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235d43esm50997985e9.1.2026.05.28.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:01:30 -0700 (PDT)
Date: Thu, 28 May 2026 13:01:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, frank.li@nxp.com
Subject: Re: [PATCH -next] firmware: imx: Add missing return in error path to
 prevent use-after-free.
Message-ID: <ahgSdtiPwhSUGaIj@stanley.mountain>
References: <20260528091446.3331006-1-pankaj.gupta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528091446.3331006-1-pankaj.gupta@nxp.com>

On Thu, May 28, 2026 at 02:44:46PM +0530, Pankaj Gupta wrote:
> After freeing dev_ctx and setting *new_dev_ctx to NULL, the function
> continues execution and dereferences dev_ctx, leading to a potential
> use-after-free. Return immediately to avoid accessing freed memory.
> 
> This appears to have been lost during merge of the original fix.
> 
> Fixes: 3ae9dcce8400 ("firmware: drivers: imx: adds miscdev")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

I try not to be a whiner about patch attibution to me because I feel
like I get enough credit for stuff and don't need to complain about
small things.  But it's puzzling to see my Signed-off-by here and
normally someone would ask about it.

I did write a patch for this but you have modified the commit message
and added a blank line.
https://lore.kernel.org/all/agv_jhP-2CNTfQXk@stanley.mountain/
Potentially, you already had written this patch by the time I sent
mine because it was a static checker fix and a lot of people run static
checkers.

Normally these tags are in chronoligical order and a Signed-off-by would
mean I handled the patch.  It doesn't make sense for me to be the first
person to handle the patch if I didn't write it.

I suspect what happened is that actually I should get authorship credit
but when you modified the patch, the authorship was lost.  (I have
done this mistake unintentionally before.  More than once).  To give
authorship credit, the first line in the body of the email would be:

From: Dan Carpenter <error27@gmail.com>

But if you already had a patch written then just give me a
Reported-by tag instead.  Either way is fine.

Sorry again, for being a bit nit picky on this...

regards,
dan carpenter

