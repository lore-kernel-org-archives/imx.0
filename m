Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F93E201025
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331937; cv=none; b=DiFtgZ5e0i8aJu37Am0ZxKiTtXEVfAPVqvbWJYEIqcTgISfmSVr5jLizOmQiz0Um4o1szsPWI4nOHJDTlpUyTGOu0zdQvg5LvSEEcR95KYABpgNAs/Fj/HwDglCM4Z+fi1v73LjYvFOJbrv/dytfcjL+EOxj9geGrRevTjn8YXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331937; c=relaxed/simple;
	bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6jfeZNqowcFV9Wj7COT7rzFLULxjNBToPeKArLjD2kYOOk8IMTPgRni3UugTq3kMvy3WPue0Ew4AJk7mvX5QWTMpoxORc3h0l4gdU9qPIC2S87c5pQmWZivJ29RPUBpoyNF1eFMxJq+6Tlutmp6g1WLUhum5GR/OTxsmoIhZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMk9s5i7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMk9s5i7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49954b88fffso4736365e9.0
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 23:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331920; x=1788936720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=hMk9s5i7QQztFqUxRJNQ+ymsUqrBh/g4SkrEICH9ut9RT1MN85jwYFWUSwH9IfwECx
         jLR2STzYG+eAel2B8y07LFzH2QtRNzoJiF7/ScGcC+GudJ4JTzm0KEp7jW4Kfklzh+DO
         nYt+W67RL7BgJeZ0wQQAp0v4HeLTHJwehbEiON2iww41+2e0S0aR3X0VLyXLNB3kVuPp
         JiDVz/HMYDl/PRTxbm4qih5ESNVzw87xoPG2oWwZ4Ij3lTprLjyA+Gy3sIumW+mj58Rt
         bpvMWxqSWIpgSMmoaYbD0BbdWwuwlzMZV+15BLOTfcuL/xqSBNbvRRZfbnm0yJ7nA0y+
         b3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331920; x=1788936720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=iGm2XifIh1K0sXE9uVErpKn4SEIVDSuBI5qaMdf/ELqXP/aCtfbxYG32MqidGkJsXx
         63O2Ot08MZ6gsH7R0cgF043KgIpzVQZtzZ+Q5qfCQsIEQxpNoVKYukB+UFFouod5Qqe5
         FQ8wCLoQIxlgoRmCJViMM0Dmx94k8RRsZ+dL7vC4FpKuc3NsKcnNkYM85DXZCUKmfhi7
         7IkLItBwR+QESaiat/Wi62jglx6qxZUAZJulPHaYa1267YuhDR9aNF5Wewg1YrGcfuS5
         fkSaFBjUPp6L3YmE1k4ug2DS3+b11kS6rRbFzBSbupsGuD90KyNmNLkbXskUR2c1aHq4
         yhpw==
X-Forwarded-Encrypted: i=1; AHgh+RqnQj2QuasMhfyJiM5NhTZVJbLVr0JcQidoigJkC1C9lHmSExu439Q6ZwCbYu4LNehqyCI=@lists.linux.dev
X-Gm-Message-State: AFuF++mLFWISeI4FK4SS3pDZjJDE753m8RYunNJe/ISTjtq5Cw/yk5la
	TgHN/I0cgiDqJU5eFiQOR7niNlYez4suNiSNcpBgQ6BP6HwKl9KdKe/pAKCOFLzt
X-Gm-Gg: AR+sD11Be04BX48oQmMfSMd1I3xHS6pfvgiDRTAjaWZnLj+lpt1lSjwZJalhnEbp3Ox
	MfamcjvTPAIqdUqhpQoqoKL7tZbuewRICTs6bWbsi0BTsTddA1iEwtMjR8scmA0in4NfcyMwvbR
	g3cDBsaNKwVfQgZUgz4j1Wm6MEFvG3vBLrzkRiuOAgTHO52Zq875Pi28ImnRFmOqT1hJ4e01Uw4
	2pF1xmLgeDO27/yp9GB962Bvip+7F027k7fYRSjlVJENBH9G6f6VF7Bqm2ZfB3qYDi3alpuQe0S
	pS+c2xLDbjWW4yRVilNrnutItZcPxlLAmJxjh4Kzqtp14gB2L0GsTjuhlkS5KZShkOyl+BzUdjb
	mLUxjAN6OPZY8jjHKHFlS7BRgtLzPlETI1BUE1HqnLHgo2ZgtpT4azjrylDdA1AkGN7VihgQKgl
	+7RcYDvJ4UfQoXTJyh92WixWiTzB+KAE8fxDZuyq3ZBjx2qYQcwlT0nWvd2uXY7Mo1hA==
X-Received: by 2002:a05:600c:a0b:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49ce5818612mr34637765e9.9.1788331920540;
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:51:59 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:51:57 +0200
Message-ID: <20260902065158.3617522-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902063739.A89F01F000E9@smtp.kernel.org>
References: <20260902063739.A89F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Is it safe to extract a parameter from the incoming *config pointer?
>
> Looking at imx_pinconf_group_dbg_show() in the same file, config is passed
> to imx_pinconf_get() uninitialized:
[...]
> This appears to permanently trap all subsequent loop iterations into falsely
> triggering the generic decoding path instead of returning raw registers.

Correct, the group dump reuses an uninitialized config across the loop
and my decode turns that into a sticky misread. In v2 the debugfs dumps
will read the raw register through their own helper, so they never go
through pin_config_get() and never depend on *config coming in.

> [Severity: High]
> This is a pre-existing issue, but does this correctly handle generic queries
> on SoCs that lack the requested masks?

Also correct. Once the dumps no longer use pin_config_get(), nothing
needs the raw fallback there anymore, so v2 makes the callback answer
only the parameters the SoC declares and return -ENOTSUPP for anything
else, instead of handing raw register bits to a generic caller.

Thanks,
Mehmet
