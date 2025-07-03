Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68B02EA149
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555441; cv=none; b=Lyhsh/aehj1sSzZOcUQi1MoN7IveD1ypgCVgpgtdFic7spFAxU+1Wd8oTxNkVbtC1x2AYu9/VyC5uTl49vdeInc8szyODi/XQpwIc3u/sQtsp9yfb3Yop2Fhp1MXR4aeO/8tNDp5HsxTBhXSjUioo7WqFrhXlmEiTag+gA6TKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555441; c=relaxed/simple;
	bh=HcpB7WcJRiu1n3uBKLFMvcSjTuFp3XqHuTv/XQqwXIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EupZuB2gjQUWSUuf4mY4hpPsEevNlVqMxurisuJefef+ZLJhtey5iGUWu5cCAIsQUzDZBn8XHqJkTNdnlg+8IpteBEtDGgBJ1E4W7c2PlM33gcBc1YWVVjnWNoPB3JB9bSfjCsVLqQVvvhGwN4Hn1gkiHk5+Vdes5zBaU26I960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGTOLJSf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGTOLJSf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so11583884a12.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555438; x=1752160238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=QGTOLJSf+eks0mmdco3z/kcBaLks0G55cL8oUvHfT0pro7fr/wGYKuBMVwA18lOXMN
         53025cQ7GPb++7wiR02cb/U5xemH9Do3z9zH4gNOn9fzJgVd2ohl5Wf8xq/Ul4msmJr2
         zeAl8VuzPnALT6LO7r/bpeNpgRt9tZOAJSAzV16TD/zQP/4fprjtHNqtDLjAD1KfSZnn
         sJAd33IC8e+FTNxcuUw1ucx0TXXCWuNTlRgumCN6elQu2Ch6dl9LKTceO7lwY2kNOxJi
         FG+8BNAOgmvca47dPE4xHR07gY7pWXvzo/eHt0mo2+8F7PERJ4fZvhQdq+bY62XfytNl
         jpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555438; x=1752160238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=QvrKb88ERBkLjrzvm9Fz1wcPE6ZMv5j5Xw8CRhKmGiaCC1iHfCfdGUUWtDvpcox9os
         ox7OiYC5n+AZCq/3qU0tZHMczy0WEkU7sgp6Qm//eVqlzc+qdl/PDuoOYpU9K++Ze8Ux
         XpRvHTMd8/1I4S7s9N8IKm3lFcbXtDN9Bjuc5naU3JjdJA6DutpFUaXr3cOP5LM7MPIL
         8ki2vo4bHZ227S01Io92qkDlztBUu99/UBxcYh/H0IcoSAjJd4IKgxHpOQR6+apk499Q
         vtOc9tXj+hiXtV7wFVVitl0dJUct/KcbzppmaWRMTQpuO3AoH7eXJ4iVUZhBUFdw+KZo
         bnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK8K00ZoYjt0CRDVnVnytMhXsbWfYitZiHLsWX4FaYgDpwcWH7yysxG5aqRXsSGIw+L50=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzfOX0pl2otGVLyOOtxMALteNCfmmzq0giQefRCbLaG45e8DHC
	2X6komZ8v8Aj5BD+4rLyrDnlh9uXvpZ14U/862mc2oJcYW28jZuC0buP/ZDNjCe8zF8=
X-Gm-Gg: ASbGncuEDTw4E9+sVC1eua5bXiqV+iqNjFY0po9OoCdfqmcI82Aemi2p+6tk3JhZ1Oh
	PFKP3GcvnsbSSyXOfZi17y/wl71DZpYy2Yp27y1r7EfWl+CuMWbelZ9oLLX+ELLn31IeEI483Bb
	KvQaYO/BkTuKSmwOgtq0fBWgxs6ZzCXETHR0KeBLT4Rd7P4Cw11LwzLiLX6tVK5q1wgCmyzoIBj
	tlLUi1XekRTmN4QpmljPEOEgjHkBxlGWh5L8+gw4WeHuZMPXrmqTNaeUG8gTRV3nEuPmJeyOxxk
	Y8gPb2EzzpfbALx9JASDF2vUNYJeOrdmWVGCxygDJVXRKXcs+ldjO+RanqdhLPhSTxjg7A==
X-Google-Smtp-Source: AGHT+IHFWA0SjfKo8Q9HvR8gkZ0iZby8sEu/tE1InGy6IA+SPlppSiNPUeimMeEYtk+3MIxhso8xqw==
X-Received: by 2002:a17:907:3e0b:b0:ae3:bb0a:1cc2 with SMTP id a640c23a62f3a-ae3c2aaedd7mr750188166b.19.1751555438164;
        Thu, 03 Jul 2025 08:10:38 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b369sm1274968066b.3.2025.07.03.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:10:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:10:35 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Message-ID: <aGadazB4LbRvk1BM@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>

On 25-07-03 11:40:23, Peng Fan wrote:
> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
> register controls the selection of the clock feeding the display engine.
> 
> Add clock gate support for the two CSRs.
> 
> While at here, reorder imx95_bc_of_match.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
