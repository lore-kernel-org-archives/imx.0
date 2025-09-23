Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D428A3EF
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758622063; cv=none; b=HURbLX+X55jcqg0cs0odeSJIGsA3C+zg+EMUp784nuAawkSPWwrB6CKz5xZe+byVe0V8XCMQFIgSG1HOXn0vIVXjibBEde/K75ecKtaF0Gmqrw/Ewatz9xZaCYTLlYNbyAIKHXq2uBzAZFD43roLG8lOCOs1Dr+mChAugBhJKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758622063; c=relaxed/simple;
	bh=bQOqaLJR5zKAy/fphonDt42OLEIusrKcvB8c/rOq52M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJ0n/s2UpWip0KpvaC4Z5plqB2WrMLljmeiAsHtQjCJuhg4z1MT0/8JwLZ81nsEDs7+h7gLgCpTSfoPrDr57EEBYJKXzhQikZnOst+Xa7nElv3CON9oHMX2lWP0Wjn7+oa/B8TWVdNQpF9Wpsn75ggB5gsNHjaTP4s+mMkjtbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRx+ODRW; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRx+ODRW"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-ea5c1a18acfso5197344276.0
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758622061; x=1759226861; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=;
        b=iRx+ODRWEQ70g1nVX5jXHmt7uy06j2ZKpNdnBynlAESnrs/6ATdptHrXg2d1WdlOOx
         lb52gwCsrQrNB1STxwJABJDPcBa5kVDvLzWgfAiWsZmxnEMx+zK19f2w8KInfmAFfY2S
         XivM8cbQwhKXH//UbzCISF58rOcWy5I3Jy/YoWVs980AQu0T71BzlsywIfsYDQlYFZKY
         3gX7UpQano9CvaLxzKAGNIED1UNRa8FCL0J7mjzQ/0MFZf+rBMQqa+vUNO1bxM3+8+y4
         G/6K6WUx4UXNkqZ1WEo5o2GQJBxCRoC/P55xZBHF0umVHnot0cLp4a9msjbTj62SKGCu
         nuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622061; x=1759226861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=;
        b=hi+0gtIp/HpNxBMVOVHbs/vzpmL3vm4yMht5wHgqmIkiUu0HdmQP9RWQBkZRD5elrD
         1gA5B8/g3SGjEBv+YuYL4QAKW6NvXhVLOG+SaF9XjEmt79HHYJodrsUSM4A73RCvtYbP
         S4c1sAwGKeiCw1S/aiPOLwsGdiNp/WH3oduXmrsYOTeURn87gEBBRqhnpSRxSkF/5gQ5
         yWG+cWSEJofdbzmNkqyBjNU1QoHvT3I0Zt9o0vTKQdhOHZZ3J1p8HNL8KZ0etJQB+RUQ
         Luox8cMHZ8L7juXIujSrf6vozHaRbSCGtsqsBYazqivD5gpJX9v3GOToMpiZTGdPEcjU
         xB8w==
X-Forwarded-Encrypted: i=1; AJvYcCVZAChIP3w9D36uUMsGgmZCZAJckxZZ1R2R5s0zIc/lgG5faHnH8NLv29MnPrauEt80/9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ8l8U6qGvQ/FytWMb/qqX3bvNIEPitKTTsWmLYTN/7CmWY+Py
	Mva9+onm4cqSz81gUr/O7Ip3LiYpKP/fop5kqI73hR/dYNlFgOhiW3Rxo5ggecl1ltmpSEbS/r9
	N31ZWHhCOBik9YvaSUtNm7ChlysRnUKE/UxKeYJ7tBw==
X-Gm-Gg: ASbGnctwh2vfpsPoWAgxJrAG3htmoq86mnwEhtn4zSRXpGjjO3qGjh+TwLzHC/xxRbs
	2vYnOU9FftR7bSTU1e6IsID+AvyrCdbfFy7T3kEvhEbH4ls4xg13Bk3JZ9709FKoM+tA94Hy4YN
	bD0zUsWuVmw9Tqnjn8FzziqQFVHmQbr/Td4Smbeu1YyViK5osTY4g5QFVo9/JSPHAI6GWrjd618
	+SInzNPd8vtdiSHPKpQgRik2eo=
X-Google-Smtp-Source: AGHT+IFhxlf86kDMDK+HylKCRC/N5p3zMoJoowC3FVqGT2cdilfpDV8hTWNbOBBgYUOugMrwO5a4530QKfNhuWHjCzs=
X-Received: by 2002:a05:690e:1585:10b0:635:4ecf:bdcd with SMTP id
 956f58d0204a3-6360465937bmr1446230d50.47.1758622060562; Tue, 23 Sep 2025
 03:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
In-Reply-To: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 12:07:02 +0200
X-Gm-Features: AS18NWDUj1MIxdJxsyJdieUpTgmYfT34J9KGqEYqJqgWA33koJyrgJvf8IadiiQ
Message-ID: <CAPDyKFqQgS9j4uGkTL_taPTL96su1tqpyoek1cpZgTiaaBMpCA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: "Rafael J. Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 04:21, Peng Fan <peng.fan@nxp.com> wrote:
>
> To i.MX95, USB2 and USB3 are in HSIOMIX domain, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. So when in system-suspend state, USB2/USB3 could wakeup
> the system even the USB2/USB3 HSIOMIX power domain is turned off. This
> means USB2/USB3 has out-of-band wakeup capability to wakeup system from
> suspended state.
>
> Without this patchset, if USB2/USB3 are configured with wakeup enabled,
> the HSIOMIX power domain will not be turned off. This leads to more
> power consumed in system suspend state.
>
> This patchset introduces device_set_out_band_wakeup and
> device_out_band_wakeup two APIs to set out-of-band and query the flag.
> In genpd_finish_suspend, there is a check, if out-of-band is set,
> it will continue to turn off the power domain. In genpd resume flow,
> there is a similar check to turn on the power domain.
>
> Patch 1,2 introduces device_set_out_band_wakeup and
> device_out_band_wakeup
> Patch 3 and 4 are drivers changes to use device_out_band_wakeup
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> This is pick up of [1]
> This V2 patchset
> - includes usb driver changes to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Changes in v4:
> - Split device_set_out_band_wakeup API and pmdomain changes into patch 1
>   and 2 and clear the flag in device_prepare (from Ulf)
> - Add R-b in patch 2
> - Move the call of device_set_out_band_wakeup to system suspend
>   callback in patch 3 and 4. (from Ulf)
> - For patch 3,4, I still keep the Tags, since compared with V3, it is quite
>   small changes.
> - Link to v3: https://lore.kernel.org/r/20250902-pm-v3-0-ffadbb454cdc@nxp.com
>
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       PM: wakeup: Add out-of-band system wakeup support for devices
>       PM: domains: Allow power-off for out-of-band wakeup-capable devices
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/base/power/main.c          |  1 +
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c | 11 ++++++++++-
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  9 +++++++--
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  8 files changed, 44 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
> change-id: 20250919-pm-v4-1879568de500
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

Rafael, I intend to pick up this series via my pmdomain tree shortly,
unless you have some objections, of course.

Kind regards
Uffe
