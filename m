Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D22311C20
	for <imx@lists.linux.dev>; Fri, 12 Sep 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687761; cv=none; b=FJFWDS2l2c9BDCGZFwcN1tbI+nd4pQZQQAyb5ulkSOeFXBpQeE8+J8vd30BJTV5f08ATcRm6GueRzb0YjpWoBSU18Ys4e9KiqrH0CXh8nt8Dw6hvvgru6lwrpL7VdqhSbgvk6YhbJbP2x3DpFGCsWX1lW09hOUPTDs3QTvUDMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687761; c=relaxed/simple;
	bh=w0HNyCJgCIKMXof21vkl4pN3VquJKbWAGsmHF0hWEh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kPGyk7ZbBB6u7J5tublokHXkj+aTYvG1rdFuNI5dO+AvjyzAFV4lmzLUrE+iW7HTUdkD+Q3yWbvU8Oi9TaOgmMYKevVSOLsAdcnHrWJDV4vDKeweTKqKNMlH3T8F3Epn8iO6q3hVepy70yaMSTMsOQ7WuFpi/8SZJP3QAp2xAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXCrZOBi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXCrZOBi"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e7622483beso1089702f8f.3
        for <imx@lists.linux.dev>; Fri, 12 Sep 2025 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687758; x=1758292558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=;
        b=OXCrZOBi7QnRhrxuygk3MzAKztFmNEWm34rw6l/D0flNVdmUqBhcMYEWtaIuN1Q49T
         aYBT0S70ZR8AXTyJeMIib0egf7G+0R3F+LN3qZ8+KtFqeCJysoOhtG4v1R8XWoaHpVkr
         WLN85O9TIxTmaoNfWU5x/zChL8a7fUKnUUWHIFbq8XSY5CnKQSNRb35fNA6EW7+KuHdq
         n2iA5VDjNR+dk/Y3haB7gq7zY5eqcfWkL5EYjok0NTu76zTyw1JaA0PhZ+V38BU8Dgpk
         dLi5TsfiCsgeYCNnKtqqWXXofC9m+UwHyFsXrPflVJgodRZ50cZY4fyMFfLZL2e3Zkx+
         aoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687758; x=1758292558;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=;
        b=pEOJggTaMi/2Hxx+N+PP3S3nbYRSvPoaH7mkyhYTt9ahFEiLZeaFRIXi+dMhZvxdSi
         82R2mljtr434DMTtcZKV4HcuVyd3eQ7h9wia8q9SajXx0bLDllTxKcKz/dB45Qnzz6yT
         RKRYfDGmHqqUx9sZCIc+YPShh8FHEbsFerSsmuQ4v0Uz1txvcxkHLnBLvFhuZFi1ixBt
         WLhmpFO1FTuu/t++p28sNTQs1+UXHmnCWxnrOmJJW6KHp/RkrU1P/TDi+X273A2SJ4D/
         MebhDf/hx6c/sOuXCEqgZLXTDu7L4OafSEISIcRnteRtRdzEmKoWRV/29nr8pJL3CQq5
         zz3w==
X-Forwarded-Encrypted: i=1; AJvYcCVZuXjkQNFzrIGzI9KSs5J2lTyNPO+xAZCT3ohkd7DZGrQwmP/8mY8mJ8GQvf+TKGvGBF8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMt98E1k+CGWPqtGcc64NcI1uFAkoWaeGwNXjZH4bxsSfNWp+/
	Z3Zen/93vCs+R56wx5Ay0qpvK4k64j7q7uBeufbojZ9rvO5lxgsAeKB3u5xGameUxCY=
X-Gm-Gg: ASbGnctu1Dzu3VQ+u0cyjsslqczC6szGIj6ZUSS68cj9UEhY1Zny3JG93YIsriAGZFO
	svpNKmcDb3gZ75HPi+kmjT01t/JzDtk5fU+TLLI9tfKajeD4T0rwwR0B05TyRkg4edTeMCa8Ftg
	Q+dmrdOn0pcxGxeJmi0O88dphhd9QVxTiTn39PW8X8SEetsJL/F2jypjxD8adoWpYBhDX7/Xpwq
	7i1wWMdJWNs7xqZY3LMPXLfVcvh0PiJlvtXuPkd2b8cnRk2+/P4YGu1VZNWw5vhv9aAdgs4eMku
	E8vgBcPz7602mHxnWqruDLYAxCml/hmlRQi9ytZtjzcPmbaayHyUcENDEySwReiXZBJ8K9G8Yxy
	5E5a0fPlhsja6ayN2Id7ScTlN287D/6FCfQ==
X-Google-Smtp-Source: AGHT+IH67tRYiTRZR0HlitAXkPqySgTj0c7ALy1itAhNYgQLFYvaB09Ls5bZvLW8qeoaRRjgwtFi6g==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr3279136f8f.28.1757687757628;
        Fri, 12 Sep 2025 07:35:57 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607ccf9esm6659591f8f.40.2025.09.12.07.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:35:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: frank.li@nxp.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com>
References: <20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 0/2] clk: imx95-blk-ctl: Fix runtime PM issues
Message-Id: <175768775587.453341.7630569911585966967.b4-ty@linaro.org>
Date: Fri, 12 Sep 2025 17:35:55 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Mon, 04 Aug 2025 16:14:48 +0300, Laurentiu Palcu wrote:
> These 2 patches belonged to a larger patch-set I sent a couple of weeks
> ago([1]) but I decided to break that set into smaller sets, where
> possible, as they will be easier to respin, to address any issues, and
> will probably be merged faster than the other one.
> 
> Also, I addressed all the reviewers' comments received previously for
> these patches.
> 
> [...]

Applied, thanks!

[1/2] clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
      commit: aa1735d72bc085c4d107fb2017c597f83bb9490c
[2/2] clk: imx95-blk-ctl: Save/restore registers when RPM routines are called
      commit: 14be8b7b6cbc0a072c749e46e28d66e0ea6d0857

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

