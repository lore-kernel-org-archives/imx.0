Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687502;
	b=MOyr+y9OvfQR2hUgvB/OdAGLxsdt+/hVWyG6MEPD1u2pZqMFrZpI1eIVsWbUFnmNY/he
	 qqAjPqrFPJgxvTCy92rpurnl/Tw0YHyWin61v4xheod4uRfW46gCgx0uieBONX32CTU/5
	 D7UFSS8EumriJPrJZ5eZ4k8zdu+TM9+WUJ1Vc5wnpU1f5jeJyHRC/90rdHf6rVUtxhb3o
	 qnYDnxOQXp6yxaalIKERYgjaswtsG8mtHAHepuYVuuB0W9O8kmUVefG0RlM7ApoLq5l5s
	 NQTF4A5J4Oz/wlLs1K1yrvO/MZ+16eSZGRi7ogyECQci4YMj5evWSTjgvwYegcqyncQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
	b=Z6D8BGU9NjejM3ngNdV+qeFNiYy39Y/ODe/2yav+oR7GgwzkvG1ZIW1kQAIsRs0GYJ8l
	 svzS/xWlES3ouzTd9uQKXueGgeofxS9DTiZm3e1mpXeOfI3E4EjRv2TQwWdIYMoKmQIgF
	 BwGlE1PPREQgAhB9g/MYAXy/1/zfLFsgrpnPX19gPI+veP7uKbr8d1gvsynXB7Qzdo1p3
	 FL19o2P1wLdfEPaFGb/aH8hYsnu2MrUAfEf/IbZtQ1dBTsDjYRmXiAssSrzP5Tco0b7RF
	 chYrp0q8u93oXQIS0eRlsthbirDyazqnE5JiiAQEgUqVvYxglurvtCt1ph9/O6wxojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P488mz8t;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D5606A31B
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 16:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 415D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P488mz8t
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2323513c88.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687501; x=1793292301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
        b=P488mz8tSLNxr6LloB47VCrcrNh8PEfnt1Nlavrx8LFrOwCODkMSnoz81hMbnAK75+
         DZM7EfX18AA+6So4/02y3th13xljfwqU14R2MowLoX7S+QiDLOuwad9kB389ReZOSFho
         SdRrcmanBAr6b66IVU5TWe7I5MS7FYSV9k8fBRnEAJNIkb8FHyM9o0VgiovPwapiY2lG
         3Sh11//zfWFp5IKiyCBzRHH6yASj4H3rmsBzqNMz87fChkrruk9AIPFA8wa1FuddRETr
         0Es2svkAGBmMPyq9yCnuvecmNmlOrISi2v6cx44RDDyZLqSZDc/KQ6JwZgw6kC0CAHbM
         EWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687501; x=1793292301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
        b=vtPdJuTe8pWNP7i6f0h1FAMvSulouc1CBBgUZ6Xf7UQUVND9pAXYXJBI1OrCvIDrFv
         psr1VeGqFfkoR+iBBwyw0qdpRxSX/LEfHpBZH/XzBDyv/8C4BZ3+n1DjPGS/h4AJFQ64
         fAyvf0PtTjF4eE6A4HLQKnEuP1xPuXLd/xV7N2bL9z2ZHkU0CIvUe5lafPamsmZKHCUe
         J//2BoAkAWWfugPtWwisDmO8kFn2V1KJpHlYZ6bPJ1BUSBwCX6+MzeJDPsfWKXGjZjNP
         SqfM8iUSMeoYrcY11dFAF2rJ6gQ/n+I9GDswWkg3VfzLjXvoERXX1KzzVcuOtTSulYXJ
         lZ+g==
X-Forwarded-Encrypted: i=1; AKwUvByLPG3hiE/oLyj65hObwArrVpyK0vZGcWY66WVw2bdS8MOYOUdAxVZKt69+eylZ09zKjjU=@lists.linux.dev
X-Gm-Message-State: AFq9FYK2SHa7JyUYrhqQDvU2SWMYK68vNYpYhIUAyynW/S7znQ2VCSxz
	Hvi5s2kcg20SfFd367inBzgktjgJFY+WTVQ+QVfQe0MDGkOx59ChKAYq
X-Gm-Gg: AYBFou3iLllGuHbvcXA85/akoJEIwDScdPbejvhSN8S+xxVPEAY/dDsFie1XUjLw6Hu
	RDzEmCOXZgrdp44+aqEiVRGHucgOMebRYMDUernmcuqZtK+aLsadn8U23EIYq2qIqpqh1NhC5Mt
	5aLkvoHvgU1uF2voMojlk+jEYrXFbXT/fOv5Xq6wLfdUGRDobuSF3jmWiizmbpi29DeBPvrkTqw
	s9SMUbL3+HRLg5c9k82oCca8pftQNpkWwXbn/Aod57yrKOJUyBn5Ft1D7i6AxEjMeGe9zYM4GGc
	L7Y+cEWbutqCL+/BFbdfgvdu5+uDeMkE4PWFd6q/g0DXsJUonMYsMlmHk2Qn1fZ8FSPUP5cNusY
	Le8kfUQj7VJ7rnsJzNQk9/RXojN2wJqP2RHbypXQA2cwGN9hkGIOX6N6aB6hyr3qKW470TH4JNB
	UPpyf6cv0jFyIR93GzkjutmUuDa+9SybHCtS+I3vLMoHKxlBnhPM3zL1LDWBCmOKraAiTR1GZ9C
	spaVQ+jSnI5Jac0eh7BUElWVDa9N8l6k25hBjc7xfncs6SUs+YEvw0FzWlp5Iyb2Ls+VLiqlBem
	xjAB2ekbIzcg+Lf0qmmR/HiynRtjfRuKS4KzJpv5My+gkFwbu3mZtZbZBTHp546VZ6Nfov/IGUe
	XpFe7NqORJdY=
X-Received: by 2002:a05:7023:a8b:b0:143:72b1:9004 with SMTP id a92af1059eb24-190a87a3b70mr7623767c88.45.1792687501102;
        Thu, 22 Oct 2026 09:45:01 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm15841782c88.8.2026.10.22.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:00 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Date: Thu, 22 Oct 2026 22:14:50 +0530
Message-ID: <20261022164452.201416-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ato7b3ydggC9X0_-@ashevche-desk.local>
References: <20261021225450.628499-1-kapoorarnav43@gmail.com> <ato7b3ydggC9X0_-@ashevche-desk.local>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending as plain text, my earlier reply was rejected by one of the
lists.)

On Thu, Oct 22, 2026 at 07:35:59PM +0300, Andy Shevchenko wrote:
> I consider this change an unneeded churn until you come up with real life
> example of how MMIO fails

You and Frank are right. The regmap here is a plain
devm_regmap_init_mmio() without a clock, so the accesses can't return an
error, and the uninitialized-data case can't happen either. Please drop
this patch.

Thanks to both of you for the review. And Andy, thank you for going
through all of my patches today, the feedback has been very helpful.

Arnav
