Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B421B908
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181558; cv=none; b=RkZ6IhN4kOIgmH0pFVkqMAXISNOc1GSYtBLeWMl51tQveWhrUyfrG/PUJMc32RU6lxK1fx2ZTRwKwXO4Y3ifKblKOq7IG29bwS5covcNVwhS1zoxREeqpKUy3gq8l5mqsXwGGU6Uhm1SXlsyCNAdFbXj/OE3CVZmtlRlXLAT+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181558; c=relaxed/simple;
	bh=327wkh+/VeSwFfG4Pq9N5mo4XYFue+NAe59l+/QO840=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7UJbw+UcvVCDKambv3tc9udceLWG1FexEWMSAuLVNsbMLjFvtTyZqYOY8fM5iaUp4lm5OLKNioLK7jTjHJLfiyEP41v4bAXTi8d318bgMP9elIF9keCnNvjGzYSk3fXQHCWBc8EJc2r2m928XKYukYxVPvwk7Uuy7wirPxhWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ih/6MYTG; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ih/6MYTG"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d20451c016so344905285a.1
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750181556; x=1750786356; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wNT96l/L1TKvL+hy9kvQ/IwQtkX/iGPMeGmWPo89yLM=;
        b=ih/6MYTGRrJxWCxZdRIMuDeKBjf//8ixH4pR/59/Frs2ASSQAITPC+KxJOt7+o0+O1
         s/uiegcTeeSlwYUCPdoRwWLLcIoVa06iUK3qbxT+rSfxem+JfJqB4M8PE+CxB1LXz7+J
         u11RYH8ruaY+oDMB0hJHUwnq7Q0+u9VNjA/raD/Qg3OQ6/1HncmzJGlHNYVizB+dswmU
         r4Hfu6m+NOn9lrzKxe5sgjXkfV2lS5hqKRW1oyCQ27KkhFDZ88s+ZfxuMi5gz0K9Hugy
         kLYDXD8L0OLhVJg7rWLDsrKq4H/Qw799XKIFRwz/SVg+1f7cJhdIdAJjisRVqxfNQIAJ
         P49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750181556; x=1750786356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNT96l/L1TKvL+hy9kvQ/IwQtkX/iGPMeGmWPo89yLM=;
        b=n9LerBdXgyL6ls5RehEEjEUk7Bh/LlMrtK3rGHqsSe0kV11ciZ6WyE/2dDAbKKO76g
         EqlVXiVXz11kPiK8gDq7jrPawia/Ji6ljgr1LvVVOU/CDGx2JF9jluDTlQYc/X2SZFg3
         B3bjsYoKW+cF48sAUAUdLxe1fE31/qkUb9xP3f+kh6iaEh5oH5sMemrlUVveKu5M2G60
         +Q/XdJi3umlBlTZjvKPkehnUNL0CviKEPIVNB8F+cdJeNNkYOMul6zYwSfisR01c0y75
         mfnsMkRt/sptghVAJnQBA3N4iPrmHWtAQLyLzOYik+vOI9K7LtLx8GZGahSmyjoKMfUN
         lxLg==
X-Forwarded-Encrypted: i=1; AJvYcCVfqfxwTFOqZJKcn0aSmI5FyLeBWt3t+8QdsltPAszMDqiIj6zAd2ZOhDjlcA/grb9zcqY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4pGF39mJn5CYlbvxGgQTpcKiu6VPzRzQMxofkdEemTYcKmnEF
	jKYfrR8e/gBW0ZSa0BwrlhUTkeP4EhwhDvPD680paYDKWDE/8ZMa8aNK
X-Gm-Gg: ASbGncs5CMM4hJrcDQ9KF2xoHHldQIwxNiw8mvGzImUprDjQuC2U2NfNvzvznTWdNMg
	uGHue+U833WtRakbkHrmivZD9qysPF/Ql+TSc3ij9iuFQZB2dadLxmFZKbprX4NVMM0KyOqVFR9
	DEEaMA+I9bDuSB8RwWpRsVV7QCapOqUEIeW+Q60BmJlEdZ/L/tNUs2IUg8SCXWMHYJMduF2SbyT
	sEKRFmBxWRkxQELyIgjl05BeCBhnVPYgjqkuHwopnk4dXY25wg2cTNXk1bMNG81/zHbMA/55hCa
	cIVrfDKwoRLO0X6OADeV8kWpnDt5ggjZSSD5wJJP6DvT72zCR89NBCdiL9U8L7ZmhYcSwSkAZVc
	TANgxt5HwKNUvaZcIlya+0vtIfVHCWlThSR1ArTBPkMTs/PWLBQ6s
X-Google-Smtp-Source: AGHT+IHv7jLpK3Ul34lwaxNAM1Cqm+lTjV5Yo9JWoxb+xmYRDOcjMKkdxHpcBnPucHEA9I6sn9hdTA==
X-Received: by 2002:a05:620a:17aa:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7d3c6d09a79mr2334127885a.55.1750181555789;
        Tue, 17 Jun 2025 10:32:35 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dce692sm676081185a.14.2025.06.17.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:32:35 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9BAF61200069;
	Tue, 17 Jun 2025 13:32:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 17 Jun 2025 13:32:34 -0400
X-ME-Sender: <xms:sqZRaIUQeoNORo-Sg8BO-h_Oq5tXXXNa0jYV79jBEOPSbRh4iD0qng>
    <xme:sqZRaMmiYn5tWOXttI6vFmUzqs3n0gy83wQ2OmhdxI_40PuO5PhSWCzYUTJcKId0V
    nm1c-2BamwASYhGZg>
X-ME-Received: <xmr:sqZRaMY97MSR3Ga5fRLYb3kdtLGPzG12DclM4qns-UHl6c244H7W8clnVpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtuden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefgleehteekgfduteejjeekhfejfedvieeftdfh
    hefggfehheeileeihfdtteehfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eplhhinhhugiesfigvihhsshhstghhuhhhrdhnvghtpdhrtghpthhtohepphgvthgvrhii
    sehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrd
    gtohhmpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthht
    ohepvhhitggvnhhtihhurdhgrghlrghnohhpuhhlohesrhgvmhhothgvqdhtvggthhdrtg
    hordhukhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    hhgrnhdrgihusehngihprdgtohhmpdhrtghpthhtohephhgrihgsohdrtghhvghnsehngi
    hprdgtohhmpdhrtghpthhtohephihoghgvshhhghgruhhrrdekfeesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:sqZRaHWdgQONcxQ7nHIQ13kUD8EY9n1tQ60GxOqsWbEHg_GHZE2wcg>
    <xmx:sqZRaCntxstgU_tCr0_Y4OkHisP-rVcSJqE96GTsvBb_0MRlkY9m-w>
    <xmx:sqZRaMdseC0jzyRASpIcQ8UsbYim0tpyIspQ38lf4acYWitFupoeTA>
    <xmx:sqZRaEGsEtpyVmd2Y7vb6YWJ1ZIGEX_fWt3ol1-bn_UKXGDzxVlTaA>
    <xmx:sqZRaImKUtP3CYHaC1GhcXMOwYaq6RMJE_sC5VPnyDEzXmC1HWMAftuX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 13:32:33 -0400 (EDT)
Date: Tue, 17 Jun 2025 10:32:33 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Will Deacon <will@kernel.org>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Andrew Davis <afd@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 3/3] locking/mutex: Mark devm_mutex_init() as
 __must_check
Message-ID: <aFGmsXTaVAgfRc_j@tardis.local>
References: <20250617-must_check-devm_mutex_init-v7-0-d9e449f4d224@weissschuh.net>
 <20250617-must_check-devm_mutex_init-v7-3-d9e449f4d224@weissschuh.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617-must_check-devm_mutex_init-v7-3-d9e449f4d224@weissschuh.net>

On Tue, Jun 17, 2025 at 07:08:14PM +0200, Thomas Weiﬂschuh wrote:
> devm_mutex_init() can fail. With CONFIG_DEBUG_MUTEXES=y the mutex will be
> marked as unusable and trigger errors on usage.
> Enforce all callers check the return value through the compiler.
> 
> As devm_mutex_init() itself is a macro, it can not be annotated
> directly. Annotate __devm_mutex_init() instead.
> Unfortunately __must_check/warn_unused_result don't propagate through
> statement expression. So move the statement expression into the argument
> list of the call to __devm_mutex_init() through a helper macro.
> 

Given it's Peter's suggestion [1] for __mutex_init_ret(), I think a

Suggested-by: Peter Zijlstra <peterz@infradead.org>

should be added here. No need for a new version just for that. If patch
#1 got some reviews, I would queue this in my lockdep-for-tip branch.
Hopefully these will land v6.17.

[1]: https://lore.kernel.org/all/20250204090106.GP7145@noisy.programming.kicks-ass.net/

Regards,
Boqun

> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/mutex.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index a039fa8c17807c700d3b61193feac0418cad1243..00afd341d293ddfcc0a427b576efdce044955e38 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -126,11 +126,11 @@ do {							\
>  
>  #ifdef CONFIG_DEBUG_MUTEXES
>  
> -int __devm_mutex_init(struct device *dev, struct mutex *lock);
> +int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock);
>  
>  #else
>  
> -static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
> +static inline int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock)
>  {
>  	/*
>  	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy() is just a nop so
> @@ -141,14 +141,17 @@ static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
>  
>  #endif
>  
> -#define devm_mutex_init(dev, mutex)			\
> +#define __mutex_init_ret(mutex)				\
>  ({							\
>  	typeof(mutex) mutex_ = (mutex);			\
>  							\
>  	mutex_init(mutex_);				\
> -	__devm_mutex_init(dev, mutex_);			\
> +	mutex_;						\
>  })
>  
> +#define devm_mutex_init(dev, mutex) \
> +	__devm_mutex_init(dev, __mutex_init_ret(mutex))
> +
>  /*
>   * See kernel/locking/mutex.c for detailed documentation of these APIs.
>   * Also see Documentation/locking/mutex-design.rst.
> 
> -- 
> 2.50.0
> 
