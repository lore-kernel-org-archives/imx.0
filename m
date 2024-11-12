Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E4230994
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731437049; cv=none; b=joZ0WfqDTESkVT13aeqNAkYzAjfigHGksCxXFH0w92OZqjfnsB2V/yTTZv0A7cbkQLgo7yhr7UB2CuVdXTy2WyslfRHHVo/NTDjjy/p7kwd1abteLt9Ep5smydNkgKqZNo56GssY7YohnwAkD9C6AI5M1DTXS5AQPcJBW07XZNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731437049; c=relaxed/simple;
	bh=0t8sOmwlSOH1o1/6C/3qT6TANEqdqVcQQAurabnYBIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fk8gDQVosddSBaV981g5K9ZuqOG5yzZe7xN+tnkXA4Rl3922ALgRNAMeWUdv10Id+HFXRl/UsDAAI0Bei6xUf3qBBUlMw3D8CLSA/XrllRvVXxTp3rUIyMZDA1SK1v+kQWROVlUr3gwngslovQYlMbDx2gfSGOFgpnNWxu4iQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWj6E1tA; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWj6E1tA"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6eb0e90b729so25980867b3.1
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 10:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437047; x=1732041847; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tmlE3ocaQwI744iyoEKb0Mlm8+PfDOrWjfONTieFefw=;
        b=nWj6E1tAYZMkq7Q9Ii0EvfMjFG/DrmindD8vXB9BwXQCb6Lr96zciUdBvGjHrm7h46
         yxMOiTHLktapCV7EgOXV/OSJ7L2bArqpues0TUzd7qe6aTvTk27EImUBzaIUWyy453Ha
         lXcKBHRSP1G1GuOSEN2+dtzpKvrtIxz3GPhYrcfbAozqRRiWfXrGpMS0ZQDweuCtnt+2
         vZAMdqWEukivkgF/MwX3eZwr77LSD2CKoMgNwQmutBSgUfsAewTupwMM/p4+PXdx3lxy
         qQzQOJ3GcqKntG00IAulyuV0ErrQJBSagHfcKAKSfdMTncjBHmocPHCQA7D3HTOF473T
         hCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437047; x=1732041847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmlE3ocaQwI744iyoEKb0Mlm8+PfDOrWjfONTieFefw=;
        b=HmNdQLbaVDmpbGf/Pjc1cijTYY5TV7FrYwl8YxSbAqKep41AAmK1Vxce0RzO4v2Fcr
         kcCE8NTFV2KFUPAHLCunbhKUmZCa6pL5mt0L3OcIfB8YUHS7LvV2XE67ApHcEwIp2Bs2
         5VCUn1VfTykDqthmFWGOUV9fdv65/ZU0XeepJVXLWl7Bfoqx7+dbEY93no6cwPIJ0fe6
         EyZ0HUQyER3fWkkz1ovBxNGahKdTpLbwadmrtjGnOQVukb8bj/9NI4gJceqVjKZPRggk
         XRPYr3z4m/4ie3bAKGfJQZnJNFxrCzE6ilqmX2otRvTCIoIzfUC+nxB8Sp2DWm0FgVtY
         KPgw==
X-Forwarded-Encrypted: i=1; AJvYcCU0SejXNBCEIeIhbBq3A3eqqytiZ1B2SQpM8/BWCXi7LF4c8ZSSTqL4Jdo6cuavZMC+74o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK6X5utU2TM9ke1hQLdIChgqBHAOIE9tr2mOugK5gh+iMGkLGv
	KSLJ8rK0Qjl9S+VE3jTELcTacsoO1EiJJxjeqO9AachmkXLOWD+L2Mg85WDb36ldgIgcd8VUjhU
	Tn0o9rTFzAmBRgCPwdCUUzECnkG37H01ydk50dQ==
X-Google-Smtp-Source: AGHT+IFh1YSNqJrUyWFeYrySj4puHrtEywEG7OT7qiq8/ABi/USrmbl/pgQBx5lmlFIuZUP2a34Q11eyh0jgarstWi0=
X-Received: by 2002:a05:690c:998b:b0:6e3:3508:e32e with SMTP id
 00721157ae682-6eaddfb97a5mr155863057b3.41.1731437047401; Tue, 12 Nov 2024
 10:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
In-Reply-To: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:31 +0100
Message-ID: <CAPDyKFq9uQcDsMpYXKe=8f7AGybZaUsvMVU9RDxv2SZpYwbdgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: host: sdhci-esdhc-imx: implement emmc
 hardware reset
To: Josua Mayer <josua@solid-run.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov 2024 at 12:42, Josua Mayer <josua@solid-run.com> wrote:
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v3:
> - reused existing control register definition from sdhci-esdhc.h
>   (Reported-by: Bough Chen <haibo.chen@nxp.com>)
> - placed both control register mask definitions next to each other
> - fixed timeout write register name
> - Link to v2: https://lore.kernel.org/r/20241030-imx-emmc-reset-v2-0-b3a823393974@solid-run.com
>
> Changes in v2:
> - replaced udelay with usleep_range
>   (Reported-by: Adrian Hunter <adrian.hunter@intel.com>)
> - added comments for delay values
>   (Reported-by: Peng Fan <peng.fan@nxp.com>)
> - delay values based on JEDEC Standard No. 84-B51, 6.15.10 H/W Reset Operation,
>   on page 159
>   (Thanks to Bough Chen <haibo.chen@nxp.com>)
> - added a second patch demonstrating a cosmetic issue revealed by first
>   patch - it bothered me during development but is not important
> - Link to v1: https://lore.kernel.org/r/20241027-imx-emmc-reset-v1-1-d5d0c672864a@solid-run.com
>
> ---
> Josua Mayer (2):
>       mmc: host: sdhci-esdhc-imx: implement emmc hardware reset
>       mmc: host: sdhci-esdhc-imx: update esdhc sysctl dtocv bitmask
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)


The series applied for next, thanks!

Kind regards
Uffe
