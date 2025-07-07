Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853F21FF5C
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874264; cv=none; b=WYIMlvZPB9MKXFDhQ94whzgIlWFTj0KAvCg7E3z9Lw9Wp0COItw0n/6P/O5s2njhSIXjbaCuwdygLKr3+MGhfPP/hXtuncFd/+2BHoE/R3t0BSNq/OhY4p0stgEdPuOI4Hn8TTHWBE9t4VZDIXmcCv9evUmL+yqP3ve1DcDepRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874264; c=relaxed/simple;
	bh=a/aBuw6eSYxUiqduVM8v7MQHhm9JI8Hc4Nzy/q2H5zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vk51ZGD96OFmOoDvCpfWXZ8uzVl8HXXgQwPs88PddKNz0Bi/CD7Q40+t9qeFyKrSbzj0fKhRjkq2M/wu1oWMvuCgKd7EvEZzr1UZP9oAcmiBibmpxAn5xYWzLIuXMBGowg5ORIbw7nEfRCRhvyY25sKwiINN3lMYUSQPsMaoHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=azegFk9B; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="azegFk9B"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453643020bdso20546195e9.1
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874261; x=1752479061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=;
        b=azegFk9Bov4PJ4Wr8k1AtL7rYODPFH2pxvTMnEfI9nNn7yhslEGESW4/jbtJgxzCfH
         iEv4X2EMQpXp/qUUA/g2MEZ4XgpSdbDRy4IFhkC/8+0caVA+qUsyMjUMo4Fj2slM1HGg
         MNWgdmppdnOh0si2DVmZ6+FHkCHFhnN2W5da1Am7MB7TQ59wfPBf7Yk6aix+kwygddQa
         rhKSxLIFW18VgfEOC9/Dnb/8XY9KrAX6SpYZfjKSqrMmW0fsaxF9j3iDlfRQNsU21bpm
         7cDSivfHl72zQ0K5ekd3aBgqyc1d6mk/wr4/FoOAimkwolE6RHV2IlvuwDodwLENQHH1
         LTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874261; x=1752479061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ywzRjmVlyGLID/ZIJbfZI0O4b8LZWe/3Tlbj+llTQg=;
        b=Ja1P0f5ZMh6AZrRPAZ3ayGIc8qpWFc980EZuBGliFe0ftQQF5A5ZJsRRhgtCyuiLJV
         qeFhVgMuHZqkPjGC1hOgrM8QLCvqeVbry5ogI4XNuo+reGhyOmhxeaOFKUjuHSne9fsM
         8aAERYW7RkhQ8MK2LdNc3MWZklNfkHoQ9E/m+RRYKX/ebTLhYTgDj3GoEOu/rWlfUIOi
         bhVqIeB+iL9Tm7EpOeJPBqZX89IM7l5nn8+vOIW5ElHe/mfSi1MZR97sul+mYLvXERPh
         hPrXeRqzC2UQYUb/eVueu3exe5f87s94y1/jWvW0g8KJPre+YSETV7QKR9tVpWCMaPlE
         y0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ95x2ciM7A7joYIv6AKSs7Yr+gWJbdsbf+plhcALHnd8diT25C/HMta9CDh6A1D4EmXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdQW9OzdxWj4mkZ1PKqCNu0PdJfj5OzuY6ogPnXypVSaqhAC0B
	S4XG039YQHI02rwWjXEyM8X79z2eDU6PS7dr/Z9PjpB3T3AhCVHQOzh3pl8kFqruC3A=
X-Gm-Gg: ASbGncsz1BTR/jCAy+XZ6aXe3c2ycjaHKMEdCzwFUi1GmqjspC0wabKc6JIdghyBYV9
	2M3kATDzcm/0It/4zanJ/mAIMqoKJwdhd4VKDxkHGWMclscQXzQgnUNG7u1BrszShX29dJSlNjP
	+uZrHEnphrbdZteyv6++HCxg/+plrt1W0Yi5fJ1+tBiLAyckCPW6cJeW38Ne2AHjWXDaTQFeLIR
	DdL4JbhXTpFDqX/QvwQpyBbqjJ0HCDIanHJDuvpo7m8OsMicNDhlObJJjkefOYRDlWjzqSQHtDz
	NTXMA94kAOb8zwmL3645c/HwbNnte6M3vNwv/sZ7avVoW/1NVtwpu2aq6fe6a5M=
X-Google-Smtp-Source: AGHT+IHTukiObLm9v3Qws0DGAdo+R1EltNu3P4uRttEma+tA+Aqku3e4Jro5pb0JFOVJRpGK9M86QQ==
X-Received: by 2002:a05:600c:c109:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-454bc5c2fbcmr36096125e9.22.1751874260966;
        Mon, 07 Jul 2025 00:44:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628d60sm102884855e9.13.2025.07.07.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:44:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/8] gpio: move generic GPIO chip fields out of the top-level gpio_chip struct
Date: Mon,  7 Jul 2025 09:44:17 +0200
Message-ID: <175187425322.11592.10235201169353837001.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 02 Jul 2025 11:22:07 +0200, Bartosz Golaszewski wrote:
> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
> 
> [...]

Applied, thanks!

[1/8] gpio: generic: add new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/8595375e4fded27de24b189c692c2c50051a7b3b
[2/8] gpio: mxc: use lock guards for the generic GPIO chip lock
      https://git.kernel.org/brgl/linux/c/ba441322c7aac4735d78fc6781e497a01fb8eac7
[3/8] gpio: mxc: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/1f129b15c2dea84ce12ee3120c7fffdb7bfc7395
[4/8] gpio: clps711x: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/fd0f0d1a1e71d736deed3593470b3b03f8e76df7
[5/8] gpio: cadence: use lock guards
      https://git.kernel.org/brgl/linux/c/76045e90400b7ecc60a33526a505124b0cce1d7a
[6/8] gpio: cadence: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/47ecff3839cac71c6b7f89b7860f6f76a4c07b65
[7/8] gpio: 74xx-mmio: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/bd9a0dec2d49836e7d186642600e0f668fab33ed
[8/8] gpio: en7523: use new generic GPIO chip API
      https://git.kernel.org/brgl/linux/c/34c029c20300b9b3072f40875b899ef9c40e69cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
