Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515D1D1F57
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802077; cv=none; b=JWHX4WcMnJ20TnTUPaCj1gzoR4FoOOj8EW1Bn0eNLS8Z/Tx0BzqrkGLEWgVo7ysu/8Ly0+s0Q8VAUzgvTWjmHev1pF31+Pm/57IRxt+iXuFtl4GNFETDggZ8Qet7a7og+AAGl+4XxuZV7j/7gVegfq4a6tZaCWldzLhKnS+l0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802077; c=relaxed/simple;
	bh=t5ej7ZMTDzTltNF7X963OJIQrTWEDlW49GE1prreceg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lmO5SnLiE0fNIF9t1XGXkEqv8J25IDFnh70ZN5oFfVsKv3DEwFYWV2LEPwD926n7nXd5+pY4KmPFPDKEgIjWc5245EyHPd+Snne5+CS4cvydRyN93La41XHbrt/bo8FjrxbkOnx15G0JUbsJ8pkGyszjBhhk4M5kTC/rJfIC2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=khUJmyAv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khUJmyAv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43163667f0eso44607155e9.0
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802074; x=1731406874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=;
        b=khUJmyAvAWNXxWnO8noRkEBtDmblSD1L1/jDzglXz8QINVnMuQ4ERkqRk3VMADkH3O
         2A2JrIRbQBZ4qV/oU0LFjD4kN+pyShFcr+YY9bgocWvd2eK0QCeUVqsXosf1pMfWhjRy
         PjywwBrO3yabZkuLrynAP9lTafqtk3WTiwRueC2rG10qeDGPlNB/0GloSzMh6diLcwcw
         N3hEIAvhndkhIDTk0UcJEKYt/GG+pOaAUrcfa5FiD6uaV1BC2YUY9cLkxjZirFMBnpeH
         n8+TP6Nr3+jxjRGwdtdYcw8KtHkdkA9c0TfapxnW7hNZfIwtmLNxozSHQWSNhdUANWbm
         IV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802074; x=1731406874;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=;
        b=TBMj/VaMLzxIevJUgpz+CdykoUJLfWPksezox+tvn26PeFAPXShq0AMAt/19IRY83E
         EOy1qXXCCjlDkFI6fcmRKoI+PBfT7b16dOAuII7nTAikWnd8ummltxbJgEHxh6JDM7ly
         kv/3WC7/pVt7ukK/pwhEtaeawZTIU5N2qo1NwNdKrElvVE4Tvw3/Mt8d4u1OmmRRJx91
         NZ6JOcvDd39ttRPlH3QZ4atXUooTdvDcCh8RiUugkvYdSs//AS6ve7WlGOly/o1G3OP2
         kiZa7Tl9r5oG5nndBD5IHVLTqy7dmrcUrnSaI9jGXtexw6H3hYgxYr8jZKDskFVI5TvE
         ioKg==
X-Forwarded-Encrypted: i=1; AJvYcCXsR5aZGgogNfM99G1SocPz6XkCVQHMTJiIaORz6whVVct4z3cN2Pp79VqXQui0P4nr1ic=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDK5l3wGigoUAeVdSWZyp8tctaJ2k3jCM9t4Sgo5Ojg6hb40OL
	NoOWlcO60bO8HUZDK6ygfUQmYAb/fLi9adaupvT9Le3GAVeutc/6w2XSnstWjCufNLwi0Zh4QDD
	x
X-Google-Smtp-Source: AGHT+IE2n92iA9zFLecVDleLRsQnsU2LzZqCh08NUKJAXXircidE3s23XD0vusQDwPGzqgQof5ziDA==
X-Received: by 2002:a05:600c:4fd3:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4328325118emr131647305e9.19.1730802074391;
        Tue, 05 Nov 2024 02:21:14 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm182319745e9.3.2024.11.05.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:21:13 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Carlos Song <carlos.song@nxp.com>
In-Reply-To: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
Subject: Re: [PATCH v3 0/5] clk: imx: scu and fracn pll update
Message-Id: <173080207299.1891569.12565190669016776250.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:21:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Sun, 27 Oct 2024 20:00:06 +0800, Peng Fan (OSS) wrote:
> Patch 1 is to resubmit [1] with comments addressed.
> Patch 2 and Patch 3 are for i.MX93 Fracn PLL fix.
> Patch 4 is for clk scu fix
> Patch 5 is for hdmi. Fix tag not needed.
> 
> Detailed information is in commit log of each patch.
> 
> [...]

Applied, thanks!

[1/5] clk: imx: lpcg-scu: SW workaround for errata (e10858)
      commit: 5ee063fac85656bea9cfe3570af147ba1701ba18
[2/5] clk: imx: fracn-gppll: correct PLL initialization flow
      commit: 557be501c38e1864b948fc6ccdf4b035d610a2ea
[3/5] clk: imx: fracn-gppll: fix pll power up
      commit: ff4279618f0aec350b0fb41b2b35841324fbd96e
[4/5] clk: imx: clk-scu: fix clk enable state save and restore
      commit: e81361f6cf9bf4a1848b0813bc4becb2250870b8
[5/5] clk: imx: lpcg-scu: Skip HDMI LPCG clock save/restore
      commit: 92888f39193419c117e282cce7fd762ba78784a4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

