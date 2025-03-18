Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87420E6FF
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309522; cv=none; b=GLJ5kzRiCDQ5zPphx4rVFgS1xw8yuZuIm4PAagIIuz6FYM7vJGPz421r/FYoBUg0NA92z6tU0gsHTfmEVcVcxur5xc2b0HZfjFWVvyIlFurgf9Apv2Tuw1qwzLdUrgQaVqyMJkEIKRjulGDM0OWPcJ5AF9e8QElTkiAFBQ9pK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309522; c=relaxed/simple;
	bh=93t4KyxAcUwbpTxvRYd/L3yrVfyxbH9hPjYa6eD1Myw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyFbj6AG0OgLirwFBRcyBgzPOxmeIWCDsAln6msgRqfXx/9BSsMSx73cD86Tfu/vKhb5KLJzsXtErvgBGrDz+YgxCOEG4zKaKqlB7ro5IKIrJrJjJrdqu6llcrQMh9KIY2dpY6RfBlk0jQfnEQ6PdtpWQvFIxf2BNDjUwZq+vUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeWsOxex; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeWsOxex"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso23094265e9.2
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742309519; x=1742914319; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmZFMU52ggHv/uxQXlUIKSkNor6eZqTTV/Z26Ntqf5U=;
        b=eeWsOxexeo6+IJ37xuXBi1Mfh5KoJuvTYrhcVCSzrUZ9EeXnnROIUbJ6VUxiscGzI3
         xShKaylGCX72YfV3/FjGi9QtLjEZFUn5Qob1n1AF1AmEqw+ebbwrjW5+Fu/04N2f5aIn
         A2M4qWFjsDklFbrUnb8UYR7c4YoSqZQyoZfnK1YPW6JN/iaAk/OXpUYmDGtMLb30V4wD
         nMcAjzHCADgr6PnbfVtE4VQ109ebPUMp4fqbBefiVN032JgWCaGd1aSmOtUCO79SMmDR
         gpilTTslcOz9t1l0YdZyoBFnD121wrHdutqZfW5/SqqNhdNPBSNe5apphY+QMtFPcxL2
         PopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309519; x=1742914319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmZFMU52ggHv/uxQXlUIKSkNor6eZqTTV/Z26Ntqf5U=;
        b=FF9TMPteYm8SO/XeZ9sqMzGSIWmAtHO4Na806P7XOuBTXDkS8sWzDWM86hR4+psBNu
         FrNYX+6SBuA5E5DSO2VUdXBf/dnfCmB/vNDQ/ctbwtKUquUXJsdKPGZdoeqAyYFAXsOV
         TSwNf5vwrWKyij85lNZfaSdom+g+vyGGvAazEdJfDr/9SZ/JEBjnsKJuJYNVw0ZNwort
         1mizjzxEtNOtae02rvAgmiRO4OqmSOAAldtT0Dki/FstZXwyzh5nQgO6ucNA6scUUei5
         ILS6KxUk8Nc/cJmiU3OdNwKUdEla8rKxZr7FZQzfBSQJNmeV5eqyTxRJz72MIzmJJQx5
         /GMg==
X-Forwarded-Encrypted: i=1; AJvYcCWtaTNL5L0wpkH1hVulChbzHhdM03j/xJGS8pEWRfyNHn/NeguMk6/yybyX3JncJb02aV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXGYOyYPLMBWWhT3Tq7/svLwUdRqnimCIkxxBoNl50OY0m2kxN
	GrjdYJutXV7Zly8veBDQJ/mGl8jACG/B4opY7WQ9NWTTK8wyHakD8aO3fA==
X-Gm-Gg: ASbGnctqNYGk0TmYRYIqTE4RF709MT3eqr2s7ifI6jrRHJyVHLm1UxxEUaMr5sY0Iwr
	nInyzLEQXBzi2TbhCjRN8dFAIXkeUnGqkiEwH3SYJ895hMYM7Pwmb6M6N+9O4K71p9ibOWmJQWU
	ptqx1YVgC2Ex7NdI3aChtngi+NOUY/FVsraKcTYH6UVVlo83R2lzoqJQKTnwXiRo5nFVMfYWrig
	ey0aUEF6W22tbJC/XBGEZ52DxioJy3Ue98hs5d+uflpTSGVRppAHd1kcHbYNUdR0fa4tajndZCe
	j+/uF1alLQI736CUzWlBXJfME43Oz8m6hp4bBOhclnuUyD8=
X-Google-Smtp-Source: AGHT+IGxWW2bln7EbsKSCI2v/veWnprS2ogGfQvgu/+i0PWPhdsfLcc2mml+LBsDf+xF/aKKiMurmQ==
X-Received: by 2002:a05:600c:6dcc:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43d3b9502d5mr18784485e9.6.1742309518667;
        Tue, 18 Mar 2025 07:51:58 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:c99:9d6f:1130:510f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm138937955e9.28.2025.03.18.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:51:58 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:51:49 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i3c: master: svc: Fix i3c_master_get_free_addr
 return check
Message-ID: <Z9mIUc6Ln59umJtT@qasdev.system>
References: <20250310023304.2335792-1-yschu@nuvoton.com>
 <174225158210.1593610.10018812780731849409.b4-ty@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174225158210.1593610.10018812780731849409.b4-ty@bootlin.com>

On Mon, Mar 17, 2025 at 11:46:29PM +0100, Alexandre Belloni wrote:
> On Mon, 10 Mar 2025 10:33:04 +0800, Stanley Chu wrote:
> > The return value of i3c_master_get_free_addr is assigned to a variable
> > with wrong type, so it can't be negative. Use a signed integer for the
> > return value. If the value is negative, break the process and propagate
> > the error code.
> > 
> > This commit also fixes the uninitialized symbol 'dyn_addr', reported
> > by Smatch static checker.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] i3c: master: svc: Fix i3c_master_get_free_addr return check
>       https://git.kernel.org/abelloni/c/d6cb667b8e15
> 
> Best regards,
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Alexandre,

I sent a fix for this issue on the 9th March, which is before the patch
Stanley sent which was sent on the 10th March.

You can view my orignal patch here:

https://lore.kernel.org/all/20250309164314.15039-1-qasdev00@gmail.com/

Thanks
Qasim
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
