Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7D375F88
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422382; cv=none; b=blwpLvD3nCZE0NFncEniqzN5f2fmuNBoAoOALCmCzmlYi/tSc08ULSmoAiOY/DlH/MWJmLgnDmVwLaGXfuoDXTi1rK3DO5ayjRqaaY9kFGPJ7IF4ft+pqGzHLe4E0gBQk3/8OP/TocDSsGZneTLL8hl6E5nCd0WrtE7LDZ3SQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422382; c=relaxed/simple;
	bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJRuKq25E7rFR1hx3ezaO9KARf/yBDLXz7QMGX0TpD/29t20Js+nXlOnYqs/rgO5KHwXXnfBEMg6PAhMusXW5/z+KxxhsLE59+wU0FiQxv7m7Xatck4CCgzKnawUV8MInnLKbT0EgQNtKl04k8QM55lRNNrIE3qMR++aEXH3UXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGuj5q/V; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGuj5q/V"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48584dc164fso1136f8f.0
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422379; x=1789027179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=KGuj5q/VLaYEqMzA30YxN5boqzfygmc25fpAh2D9bnDCXMD0ritV79CLUlMZBi0N4g
         7tnbftmKaMMdYKGnfodRMzLqG85OH71P29S6lShMMfMbbAFPpPOL29HdaMj2p2F+4hEq
         0PCOHJNqgFIr8QcIGnXPZ+Dwygpf+9EV76broSBQZUaCbvUBxzDN9XINR1HVLoCoiSKq
         vb90eFdCc1AW+HNTHmAgEIFkKL2PLHGRGGQ/7oOwkpQ0epMveF1HdSaldb3shxwLY7f9
         oraohwStAJZYZ98UY6JwN6ohfO/JULEimhsGdQs/ezu1uyYSbkKqQfYZIYZWeZbXsjZU
         Pm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422379; x=1789027179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyV9BSPjMnPGkLtAXxZ0BHhZYYFuPfmyciIi8M78Li4=;
        b=d+dcFveLCvnKwTcElPISWxt/nbdEt7TZAJzpsdSNVxNmqNQC668ZEkgRg55AMyHvPp
         KPJypNrD+aJHEAfN9gK0G3cVCXtn+JLQqEXlVY/X6Nn0kaBd9CC2bMtUSyWJ/usimrRV
         q8b+zF1ijA+B+rSKygzW8LbKoPkLySqalqJ1LFfjeRhuCducUv+Mos6J66FWHkKZmZY2
         f/8pHE2jAeN2n7FfM9SSS+wsI7fK67MmDSHaPzBHk5LPLTGA0Ilt73OY9UlC1Wj1kaUP
         Z0BMj9yNKQNIIwlFhNasISoJnGb8Jx+qybSvgDrA4nipJGPwRlzR+BWCvou9o3xg46gb
         3NBA==
X-Forwarded-Encrypted: i=1; AKwUvBx0fN6TS4bFDoltQd4HPlMCCIEhatcNMmYRRty0WcbjdW/LumvMNDKVt7D3HyKcrw5mL0g=@lists.linux.dev
X-Gm-Message-State: AFuF++nHDz4JeBqwKrSwEgOmZupKvcoiGiBYzRCmBvRqruzKRzjl1gEU
	WCVhs1SDN6c2kYWxN6RaYFG/OPHbOOwa6/s/u8x9amubG7E5vk/UtKx010+jmZwt
X-Gm-Gg: AYBFou1aHxYZAZMP0nXZwuEnS5dYXzEFcLtruCDde1eLa3+I9A9N8PF8ucitSxD/wB2
	jS/f/xy0x3n0wXGUGQOpXDGQ+DX4MeTDjkC5HE6Lhizp8rINgU6EdEmJxNQrS+rFgb/sKDS3HjW
	j1ZA05i8bzW0sD1QlSTMWycEfcQOh1B1S0yciJs7/VCUiLTd897gXmAr9pZZOl/l6fJMCi4QXV4
	y6Z5HV/+X11DYuaSYIn5Wr7vI1QnfYTvasoieTtaUHvluHxvp6qPoh085qTwGfcG11o3s0KhgwC
	W1Yl1ZA0Bx4KOe89OVf4sqjPKOkNELlPmcteHgIMgbhvZJyMTpetQlpewvMqBblIJZr2M/twqw1
	LR7rQFfLD5YJqBxTDqDCHv5UrApk3AgOgYsMfeuRf2lkACmiE48vhZaPk6t3nn95rnFet+N/Exh
	g6Ytw8b/0M4vwU7moMrYc5HhboqpgMdgv1a4RXamWqqnDCwEk64Y+sEXuQXLwdp1zRaQErt5CtX
	AT9Uu0=
X-Received: by 2002:adf:e18e:0:b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-48488f0f80dmr20736014f8f.13.1788422378643;
        Thu, 03 Sep 2026 00:59:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12914843f8f.6.2026.09.03.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:59:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Thu,  3 Sep 2026 09:59:34 +0200
Message-ID: <20260903075936.2089280-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903074348.8F2DF1F000E9@smtp.kernel.org>
References: <20260903073143.2068494-2-mehmet.fide@gmail.com> <20260903074348.8F2DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Critical]
> This is a pre-existing issue, but can an unvalidated pin_id derived from the
> device tree cause an out-of-bounds access on ipctl->pin_regs here?

Same finding as on v2 and v3, same answer: yes, the parser trusts the
fsl,pins value, this series does not touch it, and I will send a
separate bounds check for imx_pinctrl_parse_pin_mmio() and
imx_pinctrl_parse_pin_scu() once this series is in.

Mehmet
