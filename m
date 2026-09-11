Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC93839AC
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103654; cv=pass; b=ZypywDhH0vOyq130ZdwyWqiC81lBPfD4TSWq4QGm1OrUuGrjOp/JSITNdl8gHQf3+yH5PTtvJ5J4+KnT0+b1Tp7q1CgpeUlt8+jKlolkmdUAZDRbRGPHb7BTXVyt5kcHrpkv9+ZtE00ImzK1i3YZidd1jgHuMYJcULRMm6kDlOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103654; c=relaxed/simple;
	bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKixsPWDc2USO9MWYzf38NHatBn2LckytTwBuTMPqn8TTrOuiVciZ3upEAOyntBFDHP2qnNU0wtgxUfFqme0HzYf2SFys7wwUBkz2x4SNag7/OsRl4g9pjxuPcwD0p1pnqM5V+v1M2uCusAxFelt98xeiM7xPTTINQHWWt2ntc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kATiUt2F; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kATiUt2F"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso3922675ad.0
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 22:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789103653; cv=none;
        d=google.com; s=arc-20260327;
        b=o8nO8Jp7c+V9DCZ/yD3U55APbMQcBWnBtFh8lc9/APLRBQTUJ5cdm5XUSfbZzy4Q6R
         Fz3XDmpeRaZVk/5LWjp8poK4u3iRuO7mdP/mKkI16J/F3F28CekdpHonpJjRh8FKwd9x
         cZXBS+sA94OkfGc6ndmQVbfBFu9FHL4F7QomRn/GDH4Til6f8taXL7I63UA2l0JwnwxC
         Zus9Yscm160LjiywDWlLSzQ9mpm+TbXL4DW8ASZUgx0HAvoKvRyt8DEkgaw7RJlRv4rq
         mGabhUE6ADXNsdAnX+TgRShR1mZ4Mxus6Qbfjaw4suowDK174fWvcqBP0ZHwqND7v3VQ
         hvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        fh=MI66Y7hEHRZCrXU/mgGVSzFI9IJM+3vzPmsLk4VIGjA=;
        b=fsO0o0FoUjVGd7bX5B7a5hJ7x5DzihrNpVr/eYR0mxXRNXqXF8WCAHAlmYpxJSCnT+
         pEe21xaAsnhj7ux4u/9AQEmte1nm7TwJCkt1+/ocCCTMvKCstJIkqRh1l2EWgkYIbs6+
         y9ePQk386baOBEpZPP3q/nniwCC553EYXMfA8J2mB0JUOxA0o+BjI1WPDuInC4jADflW
         0v+WT3jPWgdci/YiDGVKQsB96sWKY3/Wv9jhzZ50O7dpNICtLgoHNDROnfijdQmQ+CEz
         7STBlzrchHocuHvB+BGQwgXgdXodcYgnDqLWqS5M+5UUcp0Zl3V7WBmjfnNbf4gGToy8
         Zh6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103653; x=1789708453; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=kATiUt2F5HxcrF0VGRHFFdntPckIfiq5BBQF2gcTPdFsc2gxtuEguUMY10HT4EgEzc
         8oqTpyQ3A97aC1jWS1jhAFMUKom4X/9u164R/aWReBudpTKh+B4iqDV8Yz6cJkj6zcXK
         0J9FcsFKbsHRY+LBL255p9K/LFrxBEEz5ypZQzh8S7ghAyY6FZWpXinMnxO49YHh0ID9
         rvCPJcotVUJqHKVQmgAwRvlmoX2Xl9rni1Qsu0Qj2qCV0+ANRhiFmWI6TOIB5u2J2vXC
         hCftAPWZXVklqKQzftrOXXj9GdoyhSpN6X6BjThzAEqqlAuqQ5B3o+j9AYYD4JE2u3yl
         kb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103653; x=1789708453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2m1o0L17hiAg/ebV6tkp4vTmGCqvNCUxTgQkLD8Y+I=;
        b=Xt46z9ma1gFMWCUN1j73F1BKf4FMwQKM8EZX1m22BOBYXATTZ800qTlnl+5vWoZxQq
         LAThWq/Knc1Auus1aXqet8n2Tq3oaYbDvwlr+p96SLLm0cbGKLoreg6HyS/Mo5gW5zxl
         Bd/6CFhtHhxcpctxpF/F1R11DUZTqdYTChd+c7gYlurww8fsoPCtR4pANN9TsCFKe2sN
         /yJ067yJ84oHjoc/ga2XWZ2NZfx5FqtN1Rn2IhGPemMzo1/fwbluGYtA1r+j7wtg3J5L
         tJpYeR4xlgw2YnVUiCgcTRq7fEG4TJVMM0pGzJFgHyq7SacGeY5xpvmrwoaT1xGvavvo
         xV+A==
X-Forwarded-Encrypted: i=1; AKwUvBwa1rQN9C7u6JQhe6imPricReemt1lIj6JPQ6oQV3CtEkINBWtAhwkpAKUcRTP+IWHSbyk=@lists.linux.dev
X-Gm-Message-State: AFuF++kGaARJnzz3mInMwN3byhcC/LcVAffS5yRuDlYu+AABTY83exY8
	Rpzz/Y5aA1AsqK+RUn38EMD2za67b+eW+2YwKE33TorGG5paEVmu+UDdXDmV+5sdvNyg0jeuniV
	+wrYuT1lmOUHmXKagn5UzT535OqbN+OQ=
X-Gm-Gg: AYBFou0prq3gTL1toU9hLS5bBlvqlAcrCos1fJIQ/3u+vqiaLpLn96iRMTJ5Q6b/1JN
	HH0ewQ4cncdHPjGgkgsQSq428DfPWJ0Y0u4w5btGCItbE5ecrWPKSWALfoRqIrtqiQ0W9rc/qZM
	bKzYkD7SJ7807TswyBgXNiLuJQhbR5qx9P5kolqRIJI9EqPSk4VTv/ZAXE76YUDOV8Zj2ezho70
	byDuaeklipDJwzQsdmzAKbrav/z/oruSC+8sLxKOlLcq0qBb175KDTF2aITkMQ1H0R8ogoPxUWZ
	ZUHZI+c2cFNZUtu0AP5JTB6FviLmDeZNQWe4ibZweecH9pP0MqQd6VX6TqDfdISiq7h8oxymj1O
	G6hL8Bc0rsbtTNpnTIJrjQm7QFEFCyzD5Gc7vGZD1U3o3xO2bliXD7K6rPQBng2P8Bt4=
X-Received: by 2002:a17:903:2451:b0:2db:7269:38ef with SMTP id
 d9443c01a7336-2dd2a3362camr50043605ad.14.1789103652898; Thu, 10 Sep 2026
 22:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810093112.47807-1-phucduc.bui@gmail.com> <20260810093112.47807-2-phucduc.bui@gmail.com>
 <2026091054-preflight-capacity-e7e2@gregkh>
In-Reply-To: <2026091054-preflight-capacity-e7e2@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 12:14:01 +0700
X-Gm-Features: AcwNN1U4E0obWJZ95GdL5H5vM5ixf2nzVS2DjnR9WxfFgAkwdtRnN-OtjhWnZCA
Message-ID: <CAABR9nGc+ERL_AenTWzHZwxUeRB4KqyvMB5REOgGzko7X-+p8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for letting me know.

>
> This patch did not apply, please rebase and resend.
>

I have rebased the patch and resent it here:

https://lore.kernel.org/all/20260911051043.15962-1-phucduc.bui@gmail.com/

Best regards,
Phuc
