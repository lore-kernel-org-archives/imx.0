Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880513D529
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234347; cv=none; b=rht8LgX3L7OeMvjXbNkdFlb0YhXFOXO2ilPT4OppclDtj9UwYTfE/jFyNQOesMiBwRW/mYiIjlIPafGXikQ6wWeWUvlwF8J5hsJXnUfGyFXTTWuWeMOprxjCmJN0sb4oI7SAViSReLoCR4pTEq6s2CJlrLxILpFhAXAFc3QHOtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234347; c=relaxed/simple;
	bh=J6s9FmYbwu6rCJX6bvwxo/5qkXV+mK8snTTnxvMNwXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AuCujipgQN8/rM4N6e+wcrW5Uk+KC98yBweGw9gOw1vLcsG8uTKND2fJ62izbJ1c+Ln6mz8gbMPCVWCqsJPYtlrwRRlAqtUAIu/odJvV3GEv5knfbkNquvpvV+4aeu2i1rZFJeOe7lysOc5hMJIDduCI/o4DXDDLiRFVaEoZuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRwime/U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRwime/U"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-363bd55bcc2so3532775f8f.2
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719234344; x=1719839144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgg5zTIauTsPF3TmgnW+tc9VxrEyT7qeMnvZKfv7t60=;
        b=wRwime/UldS3pm916XBk+SEglwoV2OYHnI4amwISdu9Ya8QDJRuGZzHeu1//uwtwOO
         ts4KeOXo63Xkzt2sgbpN/a/nsyPot5lyMMRH8zv6yJ6REN6/imyuU66715Ql4tKiFKDx
         ru3ASYU4GDwcIW84BHDdBA/2SxsiPJwEcLyUYYXuouTnljMus7Dwi05YzrHeyBAru337
         BpCP1c1IrZIkuitjQ3GqM11Iti6UupbRs1o0pmowinWKsypLRB5BURQ7D8+0S2VWR8im
         C9tGnv8Mj7rllsQRiOJzYEwmBTaRCtv0oI7xkBUD4j9vqGRD4DF32Fn0PVQzQpGxZUWx
         cQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234344; x=1719839144;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgg5zTIauTsPF3TmgnW+tc9VxrEyT7qeMnvZKfv7t60=;
        b=gBeq1Zk1wHg7XRXT3Z8S9ha2Bv3qK1YZ02s72N/vO9Db3+PiZDkYgi4mgAuRqdst0J
         Qj9AGfCoBD6CcNK3siien2YLJAwi2YQ8DfJc8M0e/lKTNBAc93rq+dJOIhOZXA3iVE+G
         syA2xlUiuxfUeCGYRDm0PIRewH3iSdwfTariIHTaTR1wuG0qiqq+SVPWOVuhglpRPzIv
         woglXWgmptBwUWAkBhXCnCAffZDK8QjeTuzp1buo5rvLsb9Cj3Uy+6WcdSllgCGfieiw
         Zh7zhwWwDOZZy3vGnoXvEs19wmfCwlRD+GlLz1LeG6kaxhIlJ9zdD0sPIZghqoX14IrB
         Vjbw==
X-Gm-Message-State: AOJu0YznuGqD383tECYgLIsjDdr8F13BMBn2R1+T4EZx08ip+0lLCL/X
	GZQnmfKSpRHr7sQo9vblZST7YHTBo7xOatMuUK0t3By4+RYsPvinCV81SM2wVv8=
X-Google-Smtp-Source: AGHT+IHzHCAkqhDnextCQWEo9v/WpPPKLVyplH9dWufwCaoEQzUNTJUM0of/AP9vtdGv3PM0Y5Zfog==
X-Received: by 2002:adf:eec9:0:b0:362:c971:d97c with SMTP id ffacd0b85a97d-366e962cb55mr2719410f8f.63.1719234344223;
        Mon, 24 Jun 2024 06:05:44 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8f07sm10047839f8f.110.2024.06.24.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:05:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
In-Reply-To: <20240624024351.488492-1-peng.fan@oss.nxp.com>
References: <20240624024351.488492-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] clk: imx: composite-7ulp: Use NULL instead of 0
Message-Id: <171923434299.3353313.590319710383846542.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 16:05:42 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 24 Jun 2024 10:43:51 +0800, Peng Fan (OSS) wrote:
> Address the sparse warnings "
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse:
> Using plain integer as NULL pointer
> "
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: composite-7ulp: Use NULL instead of 0
      commit: 466da3d2d967ee87d82060df2bc9c6ad4fc4af49

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

