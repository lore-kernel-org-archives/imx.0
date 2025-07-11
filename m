Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC021B9E5
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271963; cv=none; b=rFv/FiwkPblVRoKbYKMf+20YBmGXdJYPBs/WsSiun8b6NdSswp0XpWc+Dta82lLNTaV7rkbGR3dBMiuNmFtnglm48fDcH+U6fCISfDu6JGQ3VldmWQ18dPAj6IYSAL0emDw6tgVGomL0AQm1iya9uBzAEUe4Pm/XYvknhViMA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271963; c=relaxed/simple;
	bh=j1aeCEllDPAkyDpyRZWGkM8NtpEx56OXqtwil4CfQ3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA5JrPLmpZKJwkYsGoUoQAzt7SzIYD8CVEFzeByoBhDQ9PJXOXLsX33Nsd9guywBXI8OTch/FZrgqrRz9yv3Q8+78V7uRBd9We2eSs/ZOnnQej5VoGvdA9PtdRLJxoHia4omw1LYCxxSX06CNID9ka77jBeNvqZqnHj5T3PujGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHmUZLz9; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHmUZLz9"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e050bd078cso62356585a.3
        for <imx@lists.linux.dev>; Fri, 11 Jul 2025 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271961; x=1752876761; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H3rTJuQRKWnARVRuNlp/ecDlvgAUoyYM9idM5xq25UQ=;
        b=nHmUZLz9dA9UM18SSm5YSP3xh8RXSYz0TeG28HcQHVYAlaoZd9FXSKDZrvDDM8pMoG
         fPWZ1K6dbQG5Ipm3Yx8a4ygsFaYhWMz6AThSvmLwzTEvSR08q2v5aZgef7HOcyevxFTd
         ZhmADNDP/GV2xUyQr8tOTiSIt3Lz6gk2Rr8rG4vBea9X4yZN7BfWrWrayRZFdrjkJGwZ
         lCeHOe/zDLW+DZ/lIBmk8FQN60kwAJp7s6nZ8hs9cKJoEv6elJ6uCRj0SxPFWChD6be4
         wr0YXMEIOygV2DsMyASAPyjMsi3Acxah6bfl/R9hBjP5HzdYryqYoE9hwowNO0pYyb6l
         UABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271961; x=1752876761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3rTJuQRKWnARVRuNlp/ecDlvgAUoyYM9idM5xq25UQ=;
        b=TOTvX92hKe21fP0N+OtMis+ugVF3JE6UuLen5i2WyHbtr9I3uUGLM7HnRB4X1kHNAf
         0dFx4xVsW/uT0qvE7khmMYK9OoYL0jTJmFItouOvfKTmrgPtxwpH4duSfott2HuAjvGT
         M0FZadR4NwvuB1mKMcK8M7DXhPmj7sUO2gbJcOg+4HXG9VaaA5kP5itau4K70eoxf8VT
         rTbNlUwNtN8yd3GGKZgk2AGt4d5bBJ69dXLoGbGIsZy/Fs3pH3+kQxdtGYRWgTVZ4GH6
         JdzHxH8dgR/r2b8inxEDa6gk6ZQplBqnwM28l9yRSuX+7ax10bYZHk2evyJTPT76dnse
         27eg==
X-Forwarded-Encrypted: i=1; AJvYcCWnRG4/262K9BkJz3wwdrg3s7VkQK3Lt2F4tCR2TZaVu+Y3Q5FEhbVoVMm+2eoBPWrZk60=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNmstCTQvKxWW3uUd8MQbbFwJ78ZfhFtDYKFxc2KrwLC/oqtfO
	bDiuTeYe8oLpKjyxzcLlBJaaKZJqAEPMZzHwUYGBlYP75rXbEf+NyzN3
X-Gm-Gg: ASbGncuBOP4NLPPWPXn5+F2DDeJnAUU5o75iPe2FI3XhtXE0xVmHG/w4DGZrvzhfRO9
	nhMBn4ji5n9Mp/El6Mj+u5chN7Sj/WrzQq6FYD0Gj6JtNWJwtoQMIi5pgTw/KUopULhb8Xf+isg
	/xSV8FWFUm7dOuIr3ShPebDA6fKteFtlR1TOyJZEQnREo8Se4eBsBpm6aZcIR+oMB/HUjfPzLoW
	EHGsJGehXC+VZYypWRt+4fU4pEshrINO2P3V3BnWjNu8nFmEDjuhjdsw+MrA/jE6nJFw5TseVjZ
	U8Q1rjfzpEx6PHkCBxzN9QNLoH5eshYBwVDYaH/8aV+g1ELNZbv91dehVj4J+GcZS0M0Y1ms8OE
	ql7Z2qxsJDtdtbo5p+tLB7Pp5vZv9ayPuateEyv/a9EY4SARJxRlum3AD4p9dMdx6uHIWdb5RLe
	0JM5uFnHyHYgwE
X-Google-Smtp-Source: AGHT+IF8bfHLFaE/so1vau2El37QujHD18gZE7VogT8DXaFcCCFNNZlIE4JZh87T1EP17999R+OaNw==
X-Received: by 2002:a05:620a:2985:b0:7d5:d144:87dc with SMTP id af79cd13be357-7de07286387mr755691385a.43.1752271958083;
        Fri, 11 Jul 2025 15:12:38 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdbb2580fsm265906685a.1.2025.07.11.15.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:12:37 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id B6D71F40066;
	Fri, 11 Jul 2025 18:12:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 11 Jul 2025 18:12:36 -0400
X-ME-Sender: <xms:VIxxaGY93nSoBBDP4pJ6sGe_hZQNmEQ2kajN6-EkehDwYcPljhvVAA>
    <xme:VIxxaOZl98EUuqQRj668_VYPHmug9yW-No4DBQ8yv_g7gG6sN4m8VF1aru-l_-dO7
    gnDxIkNWCOkRsbA5g>
X-ME-Received: <xmr:VIxxaB3OV1v9ieDYRjVjeegiSEh0LcYMHoZolJJuIIhkRpHO1gHIonOAjiP9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigseifvghishhsshgthhhuhhdrnhgvthdprhgtphhtthhopehpvg
    htvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvggu
    hhgrthdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprh
    gtphhtthhopehvihgtvghnthhiuhdrghgrlhgrnhhophhulhhosehrvghmohhtvgdqthgv
    tghhrdgtohdruhhkpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehhrghnrdiguhesnhigphdrtghomhdprhgtphhtthhopehhrghisghordgthhgv
    nhesnhigphdrtghomhdprhgtphhtthhopeihohhgvghshhhgrghurhdrkeefsehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:VIxxaOYTC8XPYjociUNzD0wtW8abgp--rFJT1iPncq351S5xO72E5A>
    <xmx:VIxxaOlz2Lv4zXawcqYT8E-f2bQ88Kn5N_Tz5eQ5n78bNxEbyB_chA>
    <xmx:VIxxaNco0FNWuyniI8wr87p8XKHoG9BzKXVNazY5IDBrSXnV-aeHYA>
    <xmx:VIxxaM2UT-LfSYzCe69AOmSeSizggSqIdnebJtCAKm9emIOWRZ9JaQ>
    <xmx:VIxxaKluUDUJEb2NY7TYJq_nxNlO9-5tiYzavw5NYkjF3xRKdeXwFnGU>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 18:12:36 -0400 (EDT)
Date: Fri, 11 Jul 2025 15:12:35 -0700
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
Subject: Re: [PATCH v7 0/3] locking/mutex: Mark devm_mutex_init() as
 __must_check
Message-ID: <aHGMUxA8w3-ixLeA@tardis-2.local>
References: <20250617-must_check-devm_mutex_init-v7-0-d9e449f4d224@weissschuh.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617-must_check-devm_mutex_init-v7-0-d9e449f4d224@weissschuh.net>

On Tue, Jun 17, 2025 at 07:08:11PM +0200, Thomas Weiﬂschuh wrote:
> devm_mutex_init() can fail. Make sure everybody checks the return value.
> All patches should go through the mutex tree together.
> 
> It would be great if this could go in through a single tree at once.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Queued for v6.17, thank you all!

Regards,
Boqun
