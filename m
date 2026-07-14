Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C019CCF5
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783988670; cv=none; b=VYjsAq0JQTMd+sbj8BhUar07b6OwJWU3+vXWuHel07Qle2+X+y8ZOVCVX6V5wTVo9BBBs86Cneo4u8+oBNeS58FiydoFK14lrBebJS44whbL6AmmSnOmF5X+Lh7XYB9/6gkYZFwiNlvgKcn3pHSG46wC+y/vho/y7lfnSJ3fNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783988670; c=relaxed/simple;
	bh=DahsozGJhtrX2M1ALPwSJqOC4jAE0W3BpmRPgHqXack=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq4AK0ugRnPQznng6KQ5RGA6wlj57PRCtKkNiCbZcNSk8ZK0/2hjVYea87ycSrHw8DzmG5irlQzqCpeO6l5eWR5d7REXveP7IEevNVkxThxrhcGksGkAh0REpDjFJG+G+N1W77JeiyzAm5BFy57EGT82Lury3pUrPZ/KykxmcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsA7x3K5; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsA7x3K5"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso1178794e0c.0
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 17:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988668; x=1784593468; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWMXzoVTprF/il3pTv3YOw63QQxuiitP828mB0/xOY0=;
        b=LsA7x3K5KGakzzmx0shXRglI32s4DyOSb64bz5CCmXoUSeR4vBAkhcfnofIWgW2kHh
         KM9aUOCnGtdZy6dKdq55lxWuFgENCsudd3KyrkqeziI8in+5RKtpKrOzqQ4eCRlTxDIQ
         idGATJOmOcjv6Ly68cE7fBOpG6iSgbGfkDjZn8Gm3U8poU8wvt7jfNhv2RTOatlvaXth
         fup+7pjl/oMnklrGzutVSdH/caDe7HhkNfEEtLb3Y/vYW4x+OTuyS4foIN0K8TwhpqtR
         e2gux5QOSSY2PtVCAJfrAfzYEIZx0iyKS6Sh7kDeS7AJvHXiatjFpkRDvgeMTjwljWrb
         jmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988668; x=1784593468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWMXzoVTprF/il3pTv3YOw63QQxuiitP828mB0/xOY0=;
        b=d070CDiBDEQqBvLpVECT03fMuxdj7JZN2P5tyb97njbG8oMUCA4Dd1y+7sT6vK5nD4
         8JEUQ61A63g8FK8TkvhSnp6RQWqszHdJ8ZwfeptE0m6yfOIYC8FMEomj/x2Oq+64BT9E
         fRouTXopGrPvfdXEJZ16Dj7fPu5vZ54/SJS/bn0znAxmAu9C58dkZGQSDx71Mcylb5SM
         V92ULUI6rPZgqYnTgu7EKyhDE/PCrMMxIHFf3FHxwlTEgPIJvFEZpsYCnPqiipuHdfUI
         ng2p9S9nElgMolWh/XT4K5tGBYUXJTvPu2oUKCN/xNnvmaUsf1HumGVORT/iCLocFE/D
         8IzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj2YTd2SHXiASg3C09AfCPtKvsfp0AsroAIUCLHLF5ANSWVOEh8Dsun3kWI/f7UT4KHmw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHixjlB+JXgWlJGoN++z7bEeDcQQi/W9tUMTwVOq0YnuXvw8YS
	WeDxISQ//DR/nm7AZG49hWBhTiCN3IYYW1rv3g+v5yMxxtan+I9peg2z
X-Gm-Gg: AfdE7cmL1Ye/pADvSen6V6OD8s01Y2OOau6jM7q9Wpe8obXJovDmEZ6hvPMXkOlUkiY
	t/pljX/H4MJkPCCWDyKuKqZn1WkAmIHfHTb91dDDofDCR37JCGEQnUoDNpx1ayRQxqcbKzAlolx
	oG1QecHjpOp0K7vlqpP1V4qTkGiFP2xA51RgGxtrYEyP+xxpHlWjO037/ICYpQgvW4Ado8i//zo
	G8t1gNVjskDZ/NsHEjGA2fE0G3V+xgrG9snahFY95PHgh16LhSIZ+ThU00lCRJ6lgGiPo5oB8Id
	+sEqSqZncOIoNm7+VXWugjFzaxseNeJoyXnHYWM+yKySzfApRYd77pzUyvj2AU0BwMrZ7zVWAFd
	vjBgLfb+96KAB7sZ1n1+uOsJ7rARG6wnviA81IOzVt742ocZWzH3op80qkaaQiUjP1fGjwnC02d
	in5WjAN3/Gt7bnhG6l4CaOgoMYDHNGbjYrpz2UpJNbCpGdlAPlWEm34dLbq+rTsmuR/mQMwaVD
X-Received: by 2002:a05:6122:6d19:b0:5c0:fb8d:998b with SMTP id 71dfb90a1353d-5c0fb8d9f40mr2719123e0c.7.1783988668344;
        Mon, 13 Jul 2026 17:24:28 -0700 (PDT)
Received: from sam-fedora (bras-base-mtrlpq0776w-grc-33-70-24-179-211.dsl.bell.ca. [70.24.179.211])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm9916940e0c.7.2026.07.13.17.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:24:27 -0700 (PDT)
Date: Mon, 13 Jul 2026 20:24:17 -0400
From: Samuel Kayode <samkay014@gmail.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Sebastian Reichel <sre@kernel.org>,
	"open list:NXP PF1550 PMIC MFD DRIVER" <imx@lists.linux.dev>,
	"open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 28/43] power: supply: pf1550-charger: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <alWBsRvgtGIbFSHb@sam-fedora>
References: <20260709033428.362970-1-panchuang@vivo.com>
 <20260709033428.362970-29-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709033428.362970-29-panchuang@vivo.com>

On Thu, Jul 09, 2026 at 11:34:07AM +0800, Pan Chuang wrote:
> The devm_request_threaded_irq() and devm_request_irq() now automatically
> log detailed error messages on failure. This eliminates the need for
> driver-specific dev_err() and dev_err_probe() calls that previously
> printed generic messages.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/power/supply/pf1550-charger.c | 3 +--

Reviewed-by: Samuel Kayode <samkay014@gmail.com>

Thanks,
Sam
