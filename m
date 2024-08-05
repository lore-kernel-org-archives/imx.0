Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EBB137C37
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722851476; cv=none; b=JJDheD/Dcl4f1AfDPZLlhnHb6zF91LrIkFZNgutZU/VLUVazsmLOqdfsln6HWnYnW2U70oOIDfejgrOmBiOrLWmGyQgpGLWWtjB6yKwVRECgn6mEAegdQIF68DfmYAk+93N9B7eJbMTm/AcCueI7QBhZwPHnPFgRsSSmf784rGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722851476; c=relaxed/simple;
	bh=1DdmIDNX40oefqLZN7mwnrF5H1Qqr5MKStNDlGHSnFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E4cdIEsGoCTgelUDamVLd3ljrBMUrRrZhj/64Tql3y/zq4YgKeRUwe2KbweAqHBZiFzZaVugBd7gnjfChGXKfPJiOGTsoaGoWwMKiejQpwrco3MN5CHnCW0GHmhlkIv4vpq965v8s9K2Wdi6/LGuSOA0Xxo4Bu3tQFvlTjB/gl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I226u35U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I226u35U"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42819654737so64107475e9.1
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722851473; x=1723456273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGEl9OcyFIEUiKWt6BYBFPfZdPeiHpKqScr5AJu2U+Q=;
        b=I226u35UAdtPCuVAdPE3H0ijDONjHauotglIgwRkK+qB4f11m0Manl5OPqBFKdZ6gz
         2QTTqnHnrJ6zZA2d2MlGKJzKddBR8L49UNJtczduFUdgs8WfMDeS/FeMxaRWZxABtPiL
         lxBFHdxLlAkvuXYqx4O/SHU9MOx3vRNzjTj/yMOvBJckJXs7n1Hs20Gq6vrHgxX+aswR
         U513/l9e0t+8LM8icNVeCuI1Ph7YFpiNJxJFZ7GWyLYvwgYUICh3ZlUMppuI8N8NUNmc
         bwR2XJhqWk7wvTxJ/qTx5BCa5IuWESaQ+Ob7H0p8WzvZAkSxxOntbn7WSmbDlqaQSQna
         Aodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722851473; x=1723456273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGEl9OcyFIEUiKWt6BYBFPfZdPeiHpKqScr5AJu2U+Q=;
        b=gaa20EaNFfx59OXEpXsqUc7rMdqD4Ng8htfCf5ajGvnoi4cMZMQcH7CC9ett2Nj1Kf
         rJ5mNy/s2/s81eZtqed0VWJvCwOnj5KVruodqhUspSzNjpjE6WxDExiotBqwbGJzojl9
         bqj8my+ngOFRZcVYEgAXO1W5gb0BHgIc4xSfox3B8JkLbqfR7dkHM3DbZ2JTPSxP/C3T
         2KW7RznVsYZFHkFLQwk1ozwxgzJUOAVp8llsud67oD1czR75gcLSM3wlY2ePJmjbXbjQ
         WvBhS6fVy7h2gIBm+3OG9WhDRsT0ENitWF6ACmQn4TBH3kl9F4cMjxtbon4BykQ/HT7Y
         3v0A==
X-Forwarded-Encrypted: i=1; AJvYcCVo1NU+Iz48SVn+c780so6t/woy+r98Ro8M81IiDjwpVXDVM07yrwoHaj1LtFEEDljDGCAJw3FwWMHxfFLBbDxLqEUQ
X-Gm-Message-State: AOJu0Yw6PymUz+0lnVqLjHHf+sZqFVjfpD+alIJM7kC8V2ukl91gBBWH
	Pz8V5zpgjUSTLiKElJKEU0rgxdqXRJuX8xQ+Ah5wtxGQQ8vUjtPL4/FwVDVleCM=
X-Google-Smtp-Source: AGHT+IF0/0e7Q5gjFEgw/SDz6NusS0BSYhN8JYkD3AR87M6IFblZNBUcltrTMziWayX52gKU2XuSMg==
X-Received: by 2002:a05:600c:1548:b0:426:640b:73d9 with SMTP id 5b1f17b1804b1-428e6b07c59mr78756645e9.10.1722851473073;
        Mon, 05 Aug 2024 02:51:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64006sm193582365e9.30.2024.08.05.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:51:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	haibo.chen@nxp.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] few small change for gpio-vf610
Date: Mon,  5 Aug 2024 11:51:11 +0200
Message-ID: <172285146797.64000.5150192348098375289.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801093028.732338-1-haibo.chen@nxp.com>
References: <20240801093028.732338-1-haibo.chen@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 01 Aug 2024 17:30:26 +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> V2:
> -add PATCH 1 to use u32 instead of unsigned long, to handle 32 pins
> -only one difference from V1, use u32 mask instead unsigned long.
> 
> Haibo Chen (2):
>   gpio: gpio-vf610: use u32 mask to handle 32 number gpios
>   gpio: vf610: add get_direction() support
> 
> [...]

Applied, thanks!

[1/2] gpio: gpio-vf610: use u32 mask to handle 32 number gpios
      commit: 3e7ebf271f935a316e9593d63f495498cde22f80
[2/2] gpio: vf610: add get_direction() support
      commit: 26b95b7b588d70b5075b597ff808543503d36ac6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
