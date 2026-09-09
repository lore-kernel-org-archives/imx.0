Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8D35C694
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941301; cv=none; b=B/yEkzYn3TAdgKZ+nGz9PsOlZSYaDnToc6haWnFjdckvZRVACZ2ZXu3gjznhB9eGYGwsk/Hy24NJ2BBE66y84q4V/5J2VV/woJRetr2DKC6YHmL6LztFmytHhdJ32kIN5cPrLimvQV/JPA09gqBiFTSugHvSyT4t37Zcx8Zl3zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941301; c=relaxed/simple;
	bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6WJ5oMjYzDMN6hcYLufAmiJyeZV2Gn/xmyX38bq3vueJU3Y+WLTlHmKwaz5KLsedeFMWGT/tz2oUGE0ZmO4rtUj7LCd9wVgIIcDQLS3lTVRh/RNhVF4AgLt6svwIXFZqFSlTgxJMPKG9sh/Y4rP1HPvdQRyK7rx3sC+qDiuWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS9OJXd8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS9OJXd8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so51747825e9.2
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941298; x=1789546098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=JS9OJXd8UI3hFsbsM2uSN4ekaX+o4CSLJ7+2ggQv0J2EQLu3RN4Pur4QDT/REfBMyq
         WXEU0LKDsLKCJwYYRO15LABObVvlip/6khx5ZcNk4xLlhF5i6ZTsdfrQaeFrccJ0K9O5
         9gtgDdLPQIeSYLEpdYqu6mvs0bXrwnBUkHwaVLnln7Dj8IQsj4O+jzWw73//1jtKsKgn
         TPahfAV1RAtgtgunvlBKiyprrKwKgqq3F6mKeIFmpRwXGJUu6mC4EqsaNwkby9zqDjlI
         UhZX8Uhfktm9ZZFEw35ksOa6hML/x32s7hz6KiZ8N0V9OXCVlvWdOwZt2XOaPxX75at2
         23VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941298; x=1789546098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=BzvlGddnm99lXqsT/mHyUjEyrQYVr5+M5ULZ3rmZ4Ijedry5Z8js5Y9hcJPzgEQwid
         4G+FezFMCah7Mkl2KNbF15fG3rFNAVQcwAUG9mQcWAdnwoCh4/+hu1N5419dDV7iMrPy
         gTevDULxT+ufbLDbzFEq7SjZmtUQzTLoOtSTXpHn/a53dMQu38JxhXmG7HU519gKtIVQ
         JT9oNJosxZWsrOC22BwJERoywS3na3GGKk6U4YSTWY5/AS4AfPiAA56C10Y7Q1qcihb4
         Q89R+emy87uuBQt9KDZY05mDqcgzNVJo9R94FV+pEtCKKlJnlHoAKzhUoEG0VRF++YW7
         4LxA==
X-Forwarded-Encrypted: i=1; AKwUvBxM7ugA6qZel+rIDh+3/f+6jB6mMoETWhs68h1wgZoLxdgFMlqX0NnTl2vOcoZnqtthWIk=@lists.linux.dev
X-Gm-Message-State: AFuF++nG/4ySIi98ECeotW2WXd41WR1ls+90Y3DlCf/A/SsiEs836IUJ
	KPFkM7PcGysEi1RXiEKDUTXkwPdsIfs3e8qrh+buvY6wq18G8xm5wLcf
X-Gm-Gg: AYBFou0fnNn9o1VhL5N4gl5HsyVbSCf7B1d8msd4zPS5pNwLLpf8BXJR3hjy8Mu7n+I
	FMmtRyNcrEBXHOOHdcBVV0I8eAxFF7wZ/yqQe0uehG87fOiVXZmjPgJC1rqSbL6GO79OPAkWsZE
	sMnUjZoC85cCrDMzx7pXANxJf/PRy1+TniLvVWpPFSVNJBXxPegVgGBY7yqA0DT6hAseB1nxZA6
	t1TnXnfR9zvYPJYn5Wo9nk8dlwkPV5O3+9X6vG5GLlrCWcNdgjmYrhU+RULa6jf9YHenW+Ty+0M
	0mSsXN1pdh3u1R175jx0Tc6wsXEBg0ek6ExkXZaTfxqffUc5xhU++5MCDYLnOkKtlQfa8ez1MU/
	BgM8d4iii7pw1gsMrxD7ZDyrtr9qaExWnKX4ao8xL7xqZPtGXB0Mnqnq6cM0hJdaFgYk28OPElX
	OVF5zex5mun/OwAG6Ql8GacnezL4kMTn2EFFgJ6waH5ULWnZoE7SX7YZ/m/TQLPw1Ri4JF6hdZu
	rLB
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr338313485e9.4.1788941297583;
        Wed, 09 Sep 2026 01:08:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm46285355e9.3.2026.09.09.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Wed,  9 Sep 2026 10:08:15 +0200
Message-ID: <20260909080815.2297127-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
References: <20260903075940.2089367-3-mehmet.fide@gmail.com> <20260903081432.278721F00A3A@smtp.kernel.org> <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:30:18PM +0800, Bough Chen wrote:
> > Should the pre-existing setter stub also be updated to return -ENOTSUPP
> > to ensure consistent API behavior?
>
> I think Sashiko is correct, better to aligned here, but in a separate patch.

Agreed. v6 will start with a preparatory patch that makes both
CONFIG_PINCTRL=n stubs, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config(), return -ENOTSUPP. With CONFIG_PINCTRL=y a
chip without pin ranges already gets -ENOTSUPP from
gpiochip_generic_config(), so every caller of that path handles the
value today; the only other users of the stubs, gpio-by-pinctrl and
gpio-aspeed, are pinctrl-backed drivers. I will compile-test a
CONFIG_PINCTRL=n GPIOLIB build with the change.

> If changing the CONFIG_PINCTRL=n stub in include/linux/pinctrl/consumer.h
> to return -ENOTSUPP, then I think you can drop the explicit "#else return
> -ENOTSUPP" in gpiochip_generic_get_config()

Yes, the #else goes away in v6.

Thanks for the review,
Mehmet
