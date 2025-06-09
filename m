Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437472580E7
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474151; cv=none; b=SznWw67GlN1cCNngMjnjOpgBR5azq4ME3ru4VdtNzDfAvaBcqHoZkJyNUnIPgYKPLv4xJxGO5Hfm65F3GIAmgrgRrsrqtbGufMMxEtoAWE71ERx7YSXqYB3KAlUWmpF8zrJLNTHdT5LGcwMmy5OMu7d9E85ei2fvsS3v2FX4VZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474151; c=relaxed/simple;
	bh=ExaMzXZlSuKQlxahihw/nEqvNxngY52zmmzw4dDOOOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Puu7g398bPUtSrCbxGJjBihiInSi1CByeGXzxl4tm7b31o6qq+ByPYtVhMuI698Z1whRa3zb+Uzev6ga1w2KRHUlA7z0sI4CgQ6RAPqmqCGcsDXDgXRtUywXiMXRsjmTIzggW8KLHqAKmSybBx2iJaYATgA3AhMoscjESbw3Kh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hw4pQVIy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hw4pQVIy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4530921461aso10306265e9.0
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749474147; x=1750078947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=hw4pQVIyiY8Ej98NvHa0lDcgKhHMX1PH+n4IFa3RQZ5HVX/02joQQgcYBEikr403do
         YfrigIM/dS6YzrRtHcsg/Nfs1krBWP1C1MMldAoRqyaBbYhUbzMo19Hs8c17pSc+TygP
         7JI8k+N5r5b/9n4cchU2YZbwxJUZTe2Rz8CJ89YSNbPLdpgs3RTZJYmrbt3nN/gMGrTq
         hwnwjrL0OvDBL1cZdSiPH/Kd/NA2J2wpBRDzZUm1ZgLCtEyz9ouFCsHCWDNtMf9nhZe9
         Jeju1zFGsLmql757Cz2k/0/hnsCEJMRAJZiIuu0CS9mo3127vWXdHwRGQts1CFcjBooV
         z4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474147; x=1750078947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=WJgL6Rz/zXAqvBsR5V2tNCA5YZJLLDqBYShNwh6aOgT0DaNKO5BG2w7SOSZ98pBhNN
         MD7n75IaCYgbtd4GrC7UNtZCEr4vewEgr9hGx5HN0CLeYQcCANWr1/YecmavbCLudlrJ
         hYcCfmQ0eS9btAwET+hcy8NB12Jg2bbO9sj+GhdG6uFZvoS0efWzlb/xWrgakgITKgQL
         WrwMiXzs4rz5hE0x+bJwjA7+XiN11w3MH+r5JET6E7IEJZRvxX/iCu1JjHxTa8WxRhO9
         l1xdbDhjvOpQRI94+u19NLKRC9gjX2AeOl9CTTFweJofYoDQR+3ndoYD9nUTWEHQtlJo
         n08w==
X-Forwarded-Encrypted: i=1; AJvYcCVOlYrZdgL1BPcpPek2qARKJMkSATq223lhUOHCUlMvDbttcEIRg0lw8McgYrgK06sihB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuzYaN0Xn/uSsFMSpwShxXtKDM2vZE2oZaHLJBn9vQ7DZuEoMg
	29Fim2H/HAPtRmShRndKY6QDqT1W52oYk2nHpZ2ycUxm8iqRHJUJD7ahVhVzBnRjOa0=
X-Gm-Gg: ASbGncvJB0YLsATsLrrkt0+QMa2T7la7+XwkKytwxSeBkZPkep/BTE7RfVO5+koP5Cg
	EwU+f1Va6L7/I22bx00/DkQ/vuy5l4/g4bi2YRJLpyqudCFg9AFeZrUeKHa3Q+8j6XXovvUFMWP
	TZciUQSEFfMM0vjjchokbEpPzG2RDwE3xu/kgZuUmoHYpfOw1rzagfqgFqdftnRSblMFGXiyrT2
	AKj/n8Jxvle3ooUvsc5MTacf9FMnECJOvwDrX4cDCr/5qZwlT8BGktyyVprJ4QBA9xEpMZg/mOY
	XIrADSFMFTo3WUXd5/tsbcdCA54JvxzIoGPax4QHK1xlxbCy90w=
X-Google-Smtp-Source: AGHT+IEC224y8+mr5qcnD9k9Q2VLvv7fn9ojcXNf/BK82QyxQgrEFMVWAZeFnV10+zDndt5WfXGhRg==
X-Received: by 2002:a05:600c:34ca:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-4531058ffa6mr39477275e9.3.1749474147101;
        Mon, 09 Jun 2025 06:02:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1008:ff30:c454:e59e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452137290b9sm110888675e9.34.2025.06.09.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
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
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
In-Reply-To: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
	(Doug Anderson's message of "Tue, 25 Feb 2025 08:04:57 -0800")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
	<CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 15:02:24 +0200
Message-ID: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-----------------------=
-------
>>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll snooze this for a bunch of weeks and check back to see if this
> can be landed in drm-misc-next every once in a while. If you notice
> that drm-misc-next has the necessary patches before I do then feel
> free to poke me and I'll commit it.

Hi Doug,

FYI, this is safe to take with v6.16-rc1.
Please let know in case you prefer a resend.

>
> -Doug

--=20
Jerome
