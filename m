Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32922157F
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739453762; cv=none; b=De8HOc3JCOPwQpZtRmU8Wjvm2uv4l2AK8iEHQinjna8i6w4N90pAqG5//UMUP+vBZ03bRoPVuxsWg5B9ymdjBIGeYO0JoFsMo7EID5+LG12x1AG03vlZhEWGAl1QcRed5hSSbdRXl/uuE3hvz8ejjkcEyY4YslGgoQyYPlmAk0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739453762; c=relaxed/simple;
	bh=yVvqosbfBaZN59lYnyfV7wTLt5V4gEraGzYMEdvy9dQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZuWkd3NciHORxjbvyJ3Fq8QseBfv3e+h2s+JpQVSTDrw/46DyH38xqB0of+6ABswVfpKbFnF2m/cJCfhZzPLorEB4mUuiKJYWzqsBv8JLJXgQkvuXkps8rBIe0NhnY1bEUC9h8TuZABUZ+oedbrn1p/KPXo+YgiVzKbFjKBkIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dElAPZHH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dElAPZHH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4395a917f33so11128225e9.1
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739453759; x=1740058559; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=dElAPZHHtWsafAMPvVhA613tryhuB1bQNIbc+lZvJznGPVoQQWtIcMGgbN4RXN2omj
         pb6W4TThVE1jnSkK7syn7NQt9WWbz2NxkeM1XvxM/OGpXiz6vxCm6PIZu0PIsYUJL4qN
         pe+kGt4EdMxjGn1kBGH/Y7tBeUjtcn1AwGyV9vQY0l96nNFM6czG6HVcNq9cbc6dJRMi
         Ci77NY2N8bj9Zc6ZR+dS4nqNhLiyXFwtey4EXae057qicTz3x2C75PknzroS67dyFIrn
         5cZPK715JAX1Gq47OT/6lXnHg/yLkrogQldBjLuYZW3ktmgQjlq4ezJu93pAOKX+nMWF
         2usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453759; x=1740058559;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=CCYAcLLZ5xeJQe8bKYLxJOLPMU3QiwMSW8FdC8V+QWJmBnEZu0sXP7HGCedCx2rvUf
         YEmjoEE092genVZbsC8rgAKb7z0cqb4yIV/Vr8vx42cT7vHvJTZfunX+RE1WW1Ia4IrN
         lBJKBOnVShhKoaz1N/zjqrHIqKhJeX8qwdUAml2+Gje+22LUIaVlyshH27QwWjqhNoqr
         vTzXho02XwhMa6ZGXsKj+m/39uB4g3OlKa4AiyYXH34yo/IQd0KbJfadnT2rTL4MiV5j
         k3bORNLa1WenuYhLahjElIJInXmfxtKIcGZS5qpL/qI0u6zgGKJsRC8OOPR74WsfauFV
         vxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz9rMqOCmvXrHHSbriVMSOWCu1b/tNrv1lNUPzHLO3H5SkVLIx1qzg7YuT39G+FE/IaLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLhfKWYuK6TteoPJDPLhOen6khYfOIRbe5wlNIvAXdhr+KHUrD
	98Ldy9NbUcwNdYJ6WLtz09bwuAlEvWa032F6gaWlcdA6E8WBZzmjkdzfjRguKfI=
X-Gm-Gg: ASbGncuVCDEVGCCxqJZwQgjTKtjE2byT5U334ZMR4lgbJBSz/wXh36SsGHfXp/6/8yG
	VothJElU1KhYUMG/gtBb5YMg2VoTISF69tNFTt9FGZ1OMs0IvArFZ+9s52yZMExsrdixcOz6TO3
	wa4hL5zsLhK4xrxbybF98fZ8z43VeBBfuHrOsADF9ijMC9Zga4z+6kNKKLF3AYxUlafNFQfP1du
	qzON7kcQaW8nBLV8fn4mNGH0hbJk4dYlZObaYFe0z8OhCZJ1GspVAjXToopoXmxELRqpCbGG86X
	Oz+1FgoBjP7DSw==
X-Google-Smtp-Source: AGHT+IFlyyROQN/jp5N25OPHAwGGncnJ/FLwqH6qkR/P/8dmal2Zk5G/l0wZieziiMnBJNT5H1Y22g==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-43960e81b92mr29235125e9.6.1739453758160;
        Thu, 13 Feb 2025 05:35:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm49618825e9.16.2025.02.13.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:35:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael J
 . Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Doug Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "Dave
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory Clement"
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  "Michael Turquette" <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  "Peng Fan" <peng.fan@nxp.com>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Kevin Hilman" <khilman@baylibre.com>,  "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 13 Feb 2025 13:26:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 14:35:56 +0100
Message-ID: <1j1pw20xxf.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 13 Feb 2025 at 13:26, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>>
>>  I also think this is more readeable and maintainable than a bunch of
>>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>>  also would have several pitfall, such as picking the value of the first config
>>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>>  with menuconfig.
>
> I still think you should just drop the 'imply' line, all it does it
> force reviewers to double-check that you didn't make a mistake
> here, so it's a waste of time.

Arnd, you've made you preference clear and this note has been added
specifically for this reason, and transparency. 

I've exposed a technical reason for my choice. Going with the 'default'
approach makes things more difficult in the long run for those
maintaining this platform, me included.

The trouble of having to coordinate changes in 2 different subsystems to
have an appropriate configuration and the pitfalls of using 'default'
outweigh the extra review trouble of using 'imply' ... especially when
the pitfall mentioned in documentation is explicitly addressed in the
description.

If there something wrong with 'imply' existing and being used, maybe the
Documentation should be updated to reflect this, or the support be
removed entirely.

ATM, it exists and it makes things a lot easier for me to support and
maintain this device.

This all started with a maintainer request to move some resets away
from clock. More requests have been added along the way, making things
more generic. I'm more than happy to have contributed my effort and
time on this and I don't think anybody's time has been wasted so far.

>
>     Arnd

-- 
Jerome
