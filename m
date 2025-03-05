Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5381FC7FE
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215038; cv=none; b=u9pYDE0RruwkoIbqezOu8aMdV5dEwMfUGSar4lPi6BeVjCOPXLYj7GAH65pwZ0jkwUXLPZ7KtcujZYCc0FN4lqaiwsTeq71G2agUgDuIxWC8zKbT+pqzaBdJZ2oMyotfcd+Bxvif1iF044Cj84wVdOTR3EnLjBYZPnj0VDW+0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215038; c=relaxed/simple;
	bh=hINIG5kxOwV7liYzl/+ZFhE/Yh0+VkapvzoZ/yUMGP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to0XfuNNmhdUrq2o3rtGHzTkgCcBmCMIUH2jGEbE32or1qYprQ4gypVWcmqKhojb/bDYNJ5pwTGUg9aqNLX2dsXLt0FE82a0XFwFLtMSxLhJMHFzUIRjgjYs4OHM01cTbiD3SF0dN8iMD3AJWMvEzj/kZlGbReQcC/HQJsZvxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YT7b0Ju2; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YT7b0Ju2"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4750a85a0ddso38171cf.1
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 14:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=YT7b0Ju2R5Q5D1jDtvE+7MMM74hH+8XKhnrJPN/BekHJ9AF4KjkZs0A299rF7sGV61
         c5/3ZVjthA3l2FXt4RLReBS7B4k7RiAqU4eML9tpZ7RGXLs1UAteCF788FfgmEyfR0ZN
         GMObrWApb+VDFubyflLWu9RFlptbu7wekGEH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=WQEz4Qfn4uN8FPjxvaplB6zv43HGvqB3FzpOaihNd3U+IsPLSXHt6zEkYuPYew/0Ej
         XSoDHd2fZxUPNQlapZ1Cq9cn8qS2GRtpEbBXve5uUWtxS6XEDPeDqnmVH6OxwmEbFB6S
         1XKnfR8dh8TVeICCDBcrdT7OQxqu3zbKbuqd/LZDbEj5lailsMtTzatd9l7q543P+iS/
         4F79dxNLhwzKhW4oI7waL1KVTXDdXGQnl0zruKZuWpB8A4sVWHtV1hgwNuUNNS4lYJdi
         t+22ZZLZ064CdzlbazcdZZ0XQWfmJnIUeYfM0j4NYYUOD+r9a0MwkXDw9VvUUS0OO0/r
         EKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOFJxOf4norfZeoeLwufneugS2CX1zEgJ477h8BGJgwUabdIEF24UP4OiuKSRWCR4jOGw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf4fHX5OBro2nTuZqquWm1rHLY8MUjSo0ibrNUmo2m7dXtS8zr
	tu9WDQtjWhmnJ4sk0FWyS8eXmLmbF4qcNc49c0/fZBRdq5JopcgX0+OYODYSHFqXLQzPHQbwipE
	VETrTcEq3ZPNi7Q1Zbeaqe8DJXIXlkdss8oq4
X-Gm-Gg: ASbGncth+CHEWMUx9fgjAHW0AaA4K8B2684/CQdbhlGPmCYccpf91Dvp3ErQs0ZRkoR
	x3piQCFWpHyE+aA2mW7rXkWA4roubVjc8+Z8bBkiuXNCVI0UKeD8mtBVLDlI2Fakq21fTmreKpH
	9TaBitNOPC43cOKpRFYfP+QHI+//3cHkbaIpj4FrwRJ+VXdDWwHFeIzAT7TtU=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org, 
	mazziesaccount@gmail.com, thomas.richard@bootlin.com, lma@chromium.org, 
	bleung@chromium.org, support.opensource@diasemi.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andy@kernel.org, paul@crapouillou.net, alexander.usyskin@intel.com, 
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org, 
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.
