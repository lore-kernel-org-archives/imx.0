Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7056754
	for <imx@lists.linux.dev>; Wed,  1 May 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714564519; cv=none; b=fDQzVfjd2xZYph2SskeNHeWb563AA97d6SdWqpvqDsqyHvjxpz7mpxtyh4aKeWNQowEsdhKRyTTvcAcG9W3HY6gsc8hNba+r3x9dZ/CRc2rQWc0H2TMmOwg3xMRF5cdeHXJHPwpK/+gr+eChtlwGKXVWYIhZ9u0TWEnH7oTVwcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714564519; c=relaxed/simple;
	bh=ChYfHk6ify+07TDm5jzBUraRqbH7mCQfzV+oNs2HYwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eb4rCOsx9nRbuQ89oyr8rd1b1yqZ6ldHmRVY8rXf8kNSHT0k74WH8nE9hL2o+BLGidc9WdmATBSX22LRlF4H4aFiheSK1RV4JpxN7sNvaG+eSnoWShEhj0vdE0iTKFrSZXz2DcawUgSQmBkCv+V8pKOHJwR8tFLRLHlEnq6atjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULoYSf+A; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULoYSf+A"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5724e69780bso7519171a12.0
        for <imx@lists.linux.dev>; Wed, 01 May 2024 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714564516; x=1715169316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7RQDoC29FuPtm118cUmiAZ7JuokdBHdX7p7hgBcheQ=;
        b=ULoYSf+A2eONFPteFP9n8B72uggaf0e4o88GVnb/JFrdUgdJJ8RBdz1AN7oXJnvQR0
         LH9M+lVLauFRaCyN72U86IoBvdQYysTU2MqoA5sbmqm1sxCTRfu9BBtiYkClY5IGMKZ6
         bSIWIGvUyPeVJ1BHwZsq3JHp/yYiL7TDkc3xkaKDWElW2T6k9Gn2UemazioSGHkxD3Rv
         ZBoFfLVyi7T9qu9QzBotziX+bpsAcS8tLhi9D798DFBZzPBjBpABxTSBQ5PmkIgE+SWL
         xh0KZqEqB5qTHzCgMheIsH7kfBoZvED4S54+kgFDnrXFv8rkVix8FFFoZr4crShhszFh
         iR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714564516; x=1715169316;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7RQDoC29FuPtm118cUmiAZ7JuokdBHdX7p7hgBcheQ=;
        b=Cu85hjtdv9dFOGbwRybdpAY4lddJGHt4tmMqUQSgwYq9Ul4IjE1UG5QVeWGqFhof7n
         GjEL650r2YcSQDOhGIxAVe5vskF1PBaI5oBdtQpTQNoo1ciBTeTcuNYNe/Zjv/tbYQ5P
         WrCVFdDUqYgJCD4WnIDuJ2cKTL33VQMhRlzD1IilkE1XAoPd6RPm7LZL6N0nBV0VbAlF
         5GBgRaO2i9pRnHwo+GSMEXsbFeckabOwgSnyUc2tshIOjffbv+YRaUV2HMwZJY3hGqc4
         CuticxHAzCezMOFZ0NPwi8vBGEmCSoJdlhmgfaF96P24181Ivn3TiKi/6WXZFoI/IutQ
         bv+A==
X-Gm-Message-State: AOJu0YwfIP6ywHdJZRb51+vFGEpJN26RjiJzG4gePWxc6nYW7fh0ZHqr
	6+4mGUyZrpR8xDx9/aKl0EQtzE1wrGJvBUJ4JlYMuQ5qeZvE5r8GpkmepFFL7/w=
X-Google-Smtp-Source: AGHT+IHlMLKY3jKZ2nU2LgHTYLCpY/A8uvXf+lbt008EwOuXxiPeBvOWntVRTIbpHf4u2k1V6tf/Aw==
X-Received: by 2002:a17:906:471a:b0:a58:8d65:65cf with SMTP id y26-20020a170906471a00b00a588d6565cfmr1587742ejq.19.1714564515992;
        Wed, 01 May 2024 04:55:15 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id js9-20020a17090797c900b00a5884e0ad1asm9508243ejc.33.2024.05.01.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:55:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, shengjiu.wang@nxp.com, linux-clk@vger.kernel.org, 
 naresh.kamboju@linaro.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240429214502.1363592-1-festevam@gmail.com>
References: <20240429214502.1363592-1-festevam@gmail.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
Message-Id: <171456451503.604561.10850984027278876629.b4-ty@linaro.org>
Date: Wed, 01 May 2024 14:55:15 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 18:45:02 -0300, Fabio Estevam wrote:
> Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the suspend/resume() functions are used at
> buid time or are simply dead code.
> 
> This fixes the following s390 allmodconfig build errors:
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
      commit: 57939f392371fc93c203b781807c951018c29606

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

