Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C653296D23
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722644; cv=none; b=c9rsRsyOCB8aIhzN75qN6ktBKdTnxriRv8MoZxA4xI7iPCdnjVmMLBBrtCNfiRqZOPQNU/LtDlxEqoUzZtb0HP+P0Fj6aFy9SwD/qJ2NzdotzGuFNf760rFjpFpIR4U66OfE9rKySlJ3y1JX5kJ/ISb/oV4TC+WAAzvpYwi7H9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722644; c=relaxed/simple;
	bh=U9q3F6WYr0uTgYuQABRm79Mx6T785oqOsPiGWvuy+s4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hSysqoPC8nEchAgFO0l2AJASMKZUi12p4N0zVdqTvcYvt1y8fadKZrNF4AUL9ru7IWLFQdB7Nm2yKgDgK1N5eg2ZqLncV3ZIXRq2EFwlIT6HouiyBHKBzniqjK9r3t+Z4g4vzK0pxXpjZHXgU7SzIMf7xwQ33xgYMdBID2AKGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Wzgs7+mg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Wzgs7+mg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso39591425e9.1
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744722640; x=1745327440; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=Wzgs7+mgDDuvraN3IXNn3ORUU4ZqBA0WNnS4LNE07JGAKykkf8icBcKkd4GBbItN/Z
         a06ZW4jowjqoUZLDUKgwYWXwNpF7ha7pSXrsjNa9Nkdlt5VHd5ymHvH7CEE1n+p6YELQ
         TM8uhAsekd7tdV2ODm+ST+pWr8+r1SRHGBbCuucrrH3R3mlxJKyqy9QIAfvlwYwnoZTD
         ftX222c5FH33FjLW86BgUH1f7AeWr64UkGrV4FDvrTsOrm7sxV2SO6ISRt0fRHRNF3KF
         e+PoYXemCpQz93/iimvoHLXcXM+pDOJbQWdUyX0rYI6o4s94WqSIcw3NuKV6DJFG2Uc0
         pTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722640; x=1745327440;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=IT5WDQJ2Fh9RQuGVRundlGX6UkMahpWCtW1ynO8za7AtlSo/MnQ7mIfR9MdPQq3y1X
         4S8ki9Mt9fRDLY6nHNHclSZ4WmB5y2yj3U3lRpyZj7AACOPXNxoHmxeMuqD6oMCC0H9z
         9BbXb02rL8xDCy3vFcQ6PAPU0NZ9jqKs7MoSAvjmpI8XwAtqXAtYrIW4CLsy+GUez5CH
         v6P4hi5rRqhzKKaw2W7JAwr++lVUKliAr4ovxzXAr004q+qAalEBD/v85k+OShhIQM1c
         A/4mzK6RNXl1FEjgdGeaIJj0VOv5do2hdVO8eZ80PU7j3NX3GfAJ6mnLkAEKK/aLAgWZ
         GPNg==
X-Forwarded-Encrypted: i=1; AJvYcCW3x+x9eKGLCgs9GyyRG8iwwsi3gcEm2i+Rp9TrZ8RVNsDZOEmerGj/Cs83436esfmKNp4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ2Gqy99dAIxyGcSaKnQfjhO//D46IG6uv43jSPrCtqHsS4RJ0
	Z+DGNH+kcYNZmb+LALhi/SaDo9W7ptMWYpn6Pe2hc5qhCmTra112Jn0VKxxH7qM=
X-Gm-Gg: ASbGncts+rVrKCMdvwppXktUgTdBpA+7TKPORcFxwte1CevKWDlovfogUYUj23XU5GJ
	WgKHOJfwf5k/ztAkoYVJ9deZwXZcB4uLsJlpzmN9Vf+8cCrLbtgBGgiepbo/mhPaT4VWHlhlwuv
	yc/DpDJrDM4mFpoLj+CyRn1KzmwL6s2FgMH4Jhn3+CYxOGkllexP+e9lO0Tb/P/Zz/I+cVNKJue
	P0x7T1lE8f1P9T8Lx7o3yD+yvIqgPr0U1LddBOSaqYaCnA0X5AGEC/iabFz3Toc1thyFLFaIGss
	hDntjTuc3jloGEyN6xzgI+ir5KGqBEXzYYps5cM=
X-Google-Smtp-Source: AGHT+IGLzdEuk1QDPXYsF98Ye9BX9xDuqaq1bbiDW34OCl+7dp6Go4ivXszBVPBh1MuXNgGiw13DfA==
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-43f4aafa80dmr77256645e9.17.1744722640535;
        Tue, 15 Apr 2025 06:10:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2c46sm208119145e9.13.2025.04.15.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025041508-remix-plasma-cd47@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 15 Apr 2025 14:59:30 +0200")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
	<1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
	<2025041508-remix-plasma-cd47@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 15:10:38 +0200
Message-ID: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
>> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> 
>> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> >> Add helper functions to create a device on the auxiliary bus.
>> >> 
>> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> >> the same code repeated in the different drivers.
>> >> 
>> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> >> Cc: Arnd Bergmann <arnd@arndb.de>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Hey Greg,
>> 
>> Do you need me to do something else on this topic ?
>
> I don't know what tree it is going through, do you?  If you want me to
> take in the driver-core tree, just let me know.

For patch #1, I think driver-core would be appropriate, unless there is
something more specific for the auxiliary device support ?

I'll wait for this sink into an rc1, then resubmit the different driver
changes to the appropriate tree, no rush.

>
> thanks,
>
> greg k-h

-- 
Jerome
