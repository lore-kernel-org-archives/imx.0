Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C75194C95
	for <imx@lists.linux.dev>; Mon,  4 May 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877441; cv=none; b=UJAy9evoSUFDSozxaAMaDy3+DKF1cOzBNCkFxKutlD4ukQy0Ju/AXOI/ADH5Q+TonO5xGYWotmCh85M8sH1oz8WhO1xW/mNEJHgmln0jHUPSYr9BJA+4AxedAmaWFJb3fEEYwrWXJ6HJ2LF5Uda2b7YUnU7SiFzeLlNmggIvyew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877441; c=relaxed/simple;
	bh=8oCkiUNWGUjv8T4lNm2WKxxqF2Crlj0ofA034rWzhpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJcLgfLMwZsLUm8eDJ2YLv8kykDAKV7PJay6XBzVquPAC7fsX3f4u2GOYxHqvhbzMPhCnuTtTTeMtqQqXpnLPpwiqHKKOhh6car0XF4ZPTvi+HCbsWfMXm2E7NjMJYHDuZ1D0zFMzeqDpNyrVt84/3zJ2Q5vDNd1dcgDim1A5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+0na8Ek; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+0na8Ek"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-365312a27abso885781a91.3
        for <imx@lists.linux.dev>; Sun, 03 May 2026 23:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777877440; x=1778482240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGJ477HuI1WPg+LRgbwSNS5n5sfdYQDEeJHoHa7Wyzs=;
        b=o+0na8Ek6p3Bw/1t6dEx+lGCALF+seSrbAYtZGqljZELOXyRHRFiavkv0vRci/6EPn
         g4EoA9MDuHvfkwXc1cSZdxiolJPu/X548//lacbXDnkARBEP9fUxnKF+HUfcP5cZItvo
         FojalNpRJ6PeDa0YfcbJXRqJ+zpuNNqoHdXRsVxQtbcGgvltrITjfXYY1gSgjbOBaTAB
         wRKjIODc96TsonQQlHTurKFneg4L2brZddAuKn4euqa/JdR4riEIpyd5tFlMoBHdoCto
         vMg4eAobb+ghpjgpjlLDXz0wYPZPMczRtl3o32QtnrsIKmDvA9lL0NCtyG2ydOWUdO5x
         oiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877440; x=1778482240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGJ477HuI1WPg+LRgbwSNS5n5sfdYQDEeJHoHa7Wyzs=;
        b=DD4zhdMYcXOB1IscdMmmexP1Jw/wbMcGa/420ZhsETgynDijdN4/gxiW2nUP/wKykN
         cMDtetrhcfYU1wWXP0v6fTRDDTa7ABtgdJPekaAnzVaMCg2dPpffpGEk9/+yyuqnrD3k
         RMkBBZvaSJcNLQjAu36k4xq2M6M3zOibP9rCczQBzCz/ursr81V0sdCqQY+G7GvJqwx9
         VTaKdthvb4BkQ3NwbdzhUpFiALwoqTRklys0RsHtFV6pcUYg7E1b09XWZyl3NdwqdurO
         PvNPi+zqVo995DrmvpfpFLT+IP/2AgS4dOzwSUn5hDByRUGKMRPB8NHn0sRhi/c4rCmV
         bKpw==
X-Forwarded-Encrypted: i=1; AFNElJ/RuSRmPlO3kgYcuiv3zZItGgzk+Z+JIuaR1isKll1ZtXh22brGHNpD3gU0MIrjEIYK4mI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD9Y5sdhakGNRoPDh5bhDX+vDEDrg2iXGNOhe8X4ZXgibiYHis
	oJDhBVAVa877zGqr1gSZt36cbe8sCBhAklXceLZMlA5RIQEJBImCHy4+
X-Gm-Gg: AeBDiesjRGcHHJaDCLMyh0kCdMrldC5+kBi6wlNf8OaXzCvDOhbMLSrtlfvlZb74AX4
	mNic2WxjMVnnbEdBr827bO9zc6GgC6keMUlJrF0ixQoyAGHpGHdczJG0MpdFVzyXIYEZHDbMuF8
	mO4FuS+0O13BD8EVDaTobpfcRW38P1W5xCm5UwntoUqLASbR1/+2pg8T9FHeZp2HpDLlKk4P98p
	okkhCR/LJohOEEEcHMAgCHnBJHRl2rEEDcD/AyBVH+Zp9DxNg+GJ9d92J+Hvs8umlNtBymwusmr
	9EVaslEEKpRfIPyge1814wlhu4kif88mgdK0bJd7ChQ53RZ6hTX22No0xl4WJjHvY+kz5rnObsk
	yogkcUF2nx/jBznQi8nNg5GHavdP9i74U1C8MhwfxpvzfcLHoTOXCu6dqbrdIAsBv6eVmk5QpPg
	i4jxbtJBH5HmDOje/3a5+sBG3QGrc98Iuc/fSU799yfy+WevUVlPvLt0Vw9bYpuK3ylIO+WZbK
X-Received: by 2002:a17:90b:5808:b0:364:d994:da00 with SMTP id 98e67ed59e1d1-3650cf15bf5mr8689925a91.25.1777877439686;
        Sun, 03 May 2026 23:50:39 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f4859530sm3918712a91.10.2026.05.03.23.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:50:39 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	bhuvanchandra.dv@toradex.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	peng.fan@nxp.com,
	sherry.sun@nxp.com,
	shital.gandhi45@gmail.com,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
Date: Mon,  4 May 2026 12:19:41 +0530
Message-Id: <20260504064941.3460658-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026050410-frozen-fondue-5476@gregkh>
References: <2026050410-frozen-fondue-5476@gregkh>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, May 04, 2026 at 08:24:20AM +0200, Greg Kroah-Hartman wrote:
> > Any update on this? It has Frank's Reviewed-by but I don't see
> > it queued in tty-next or tty-testing yet.
>
> What is "this"?  I see no context here :(

Sorry for the missing context. The patch is:

  serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma

Fixes three error paths in lpuart_start_rx_dma() that leak ring->buf
and the DMA mapping. Sent April 20, Frank Li gave Reviewed-by on
April 21.

Lore: https://lore.kernel.org/linux-serial/20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com/

Happy to resend with Frank's Reviewed-by added if that helps.

Thanks,
Shital
