Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76E178CDE
	for <imx@lists.linux.dev>; Sun,  8 Sep 2024 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827160; cv=none; b=pf8RhuZyAQm0s3y4BSSYMD0dSWWgrcH8QZKGCjXkXfQKcwrK0SyiPaZHyg/fIU7JM7okX5psVlrkGzktgwrjFgLMChvk/yzc7dlM/KVZF479zt54I05rn/CXQ6vUYA1mBoiCLHL19pRbNOdjt2IMvdwHCf5+flH3X+7TkKyH84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827160; c=relaxed/simple;
	bh=OWhGxkM+E+3B9VGjjUmp41Zb5ilGs6qZIQWN5UYay3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvYxCjSIRu6u7opLxT+4gJ/ENKyXiVDyLGkaRPkB3vfvqC45iXmuQ58TdbA4R3c6/RAnD+wX56r5t+bQEDEGYv2d/fDnKpMSVDjYBI8lSQ5GaHxe13VRpO3W4mDccfq4+zvZUwkR++EpMCMSx/Zrp0IAMcEPUvoZCzT738k3PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gc4l9lJJ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gc4l9lJJ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c2561e8041so4044334a12.2
        for <imx@lists.linux.dev>; Sun, 08 Sep 2024 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725827157; x=1726431957; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKdWxgBubPsCeu89Q5OS2FOBwOKmd4HEM0yySNUBW9Q=;
        b=Gc4l9lJJwaruYGc0nyphzy0TBm8DJQd21f+MvVwGbXvoa1Shvjkdb2nPQfOnq5aNso
         UGIslI/40zOwlv82kKeMxZ3qrQKly8UVz+M4adcqF/rggFhWLHoSb5P9+J2pJ9TZDqJ4
         +bVfwg4o037DzoyEFqSr665GnoqjJ/rwXBwZA6YFGGwdgSB+T0oVse597DIrNNq7vCZj
         g6d1V/WSoif55jLXvy3uOvqlSEnOUmvTxYyUfIC85AbxyxooJFKZ0RioanroPgjmMKcc
         csvtc0EbqKjrTqviBYbJ6oD0S/ROQKKeJeQQ0dK2st0UmQAH8ueGW2EthbKCuRr1idL3
         5IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725827157; x=1726431957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKdWxgBubPsCeu89Q5OS2FOBwOKmd4HEM0yySNUBW9Q=;
        b=jX4QJ5PLBTyAfoQGh7zXrMifKxv25Z+V8vFPoGCETw9hZNnocoz4fYC9xhazKhmUNK
         6IRZ5+V4q4Ccjj8QLjrO0vKwlBYPxRjYwElUGwe3fHueIOudWOp9Y3ssAzY3FNiZ2Ku+
         t3svhCCW8esFdE4KvnVsmdYFZ1ZaG6OCy+v+GgH6rVf3YNlkgw2zeVCegZ5lWAsSVmjt
         HAbtYSalDY4TTYNyVerGDZZYal7o0cusJhnYxm7Si+k6jKe9qOGe9p466nkr8C0+ULlt
         n2Sx2u87a2MJcaaQsZyQxusXbji0Lt95VlYy7sb/AIEregqrowcWMq7+KKoj0RJH4VCg
         L20A==
X-Forwarded-Encrypted: i=1; AJvYcCWV0fjKWiibSB/wsIGY26S5hErDudCAAGg3teUFAaEZiy4CRCzLo9DMIn7cp7APuG3hsR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YymQvF/nZKOauKyJ0r3i1SQNV7YRdKMQqWcRxHm+k13JpFuUh4y
	3J4E8GICcDBi2YamAICQKKFqlEYSA7EsDL0FZbq6uJaahGTfq9ye+SZnM+fv0wBanBl8bdEE6iA
	y
X-Google-Smtp-Source: AGHT+IGwiL32zOZEhvp+wF8LdGQNAS8/J/6T/AW7OR7ZiyrV3rOdJR7rEG03ntO/Jtsx6id+rqF/vw==
X-Received: by 2002:a05:6402:4015:b0:5c3:cd88:a0a with SMTP id 4fb4d7f45d1cf-5c3e963621dmr3924299a12.18.1725827155919;
        Sun, 08 Sep 2024 13:25:55 -0700 (PDT)
Received: from linaro.org ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5217asm2190519a12.45.2024.09.08.13.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 13:25:55 -0700 (PDT)
Date: Sun, 8 Sep 2024 23:25:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.12
Message-ID: <Zt4IUQavM62F/kP8@linaro.org>
References: <20240904095710.2813541-1-abel.vesa@linaro.org>
 <a8400f018cc94177b6a91634fd977248.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8400f018cc94177b6a91634fd977248.sboyd@kernel.org>

On 24-09-05 11:25:37, Stephen Boyd wrote:
> Quoting Abel Vesa (2024-09-04 02:57:10)
> > The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> > 
> >   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.12
> > 
> > for you to fetch changes up to 32c055ef563c3a4a73a477839f591b1b170bde8e:
> > 
> >   clk: imx6ul: fix clock parent for IMX6UL_CLK_ENETx_REF_SEL (2024-09-04 12:39:38 +0300)
> > 
> > ----------------------------------------------------------------
> 
> Thanks. Pulled into clk-next. I also found the v6.11 PR for clk-imx in my
> repo for some reason :( Sorry about that! I've merged that into clk-next
> as well now so the next merge window will get two cycles worth.

No worries. Please let me know if you want the pull requests in more
earlier or something.
