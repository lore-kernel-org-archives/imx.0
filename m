Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8B27E7FB
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396846; cv=none; b=sVGdLW9VnkQszwTxpZqKEV4kidnazcfEBiMa4Ic1AuFPeiNqamiIgWpPKoCOkFn2ajefJHDGJpCyRT1JjkEqjFmXB3NhAKgH3jbuDB26oRz4Gh7f/uKTyOldJDgoKVgxAPfx9EKxTkAJ0XVex5/3RzIddBrSS7Z1uRI6CDzs6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396846; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMjOHhwhhTFdr1RsyWjKzZa7AAI95rFHjkXbnXgOsEehM2U3GoKhz9+G/QM/2LX/7qDHNlJInxlKpyTQXEzFr6Qjkg/leLDhJ84uDeibVTswGbWEylxeIXmfm/puC8SnVP9BJNclgc7RLRWkFpWViEjESh09GgMq5e46v/TgzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2KpdhiUH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2KpdhiUH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b05ac1eso6097005e9.1
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396841; x=1757001641; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=2KpdhiUHI1FkefXCQxdmlLvT1bTGWe3GeCTzf33hsOkl8J+lR0o4eSkFPBIBJfxXgT
         4w6a6WY0wQvfK6gaoBcB5Vekfl1DtTunlf4UsrGnw+BouBRYC5ND1FgEofu1xB6s8ahg
         cdIkGxpxDMIkzx+6YTtcBX6KsuRTPjSWmh6oqb+A4WHvaoxvnMLNAONDfRGkWS7Rdtwu
         agxCvGm1/0opYbFF80jl/D5MCUCjPAXMO2tMruXRCZaKqoFoxzOJ4Uqn5RogGFHYQIy9
         X4dCzYNQ2vJ2ERhkBCjJtoxzfKMiObviqlokB4EdaCnhzN9xpBEGkZBVhoEGRIGkb2mQ
         MDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396841; x=1757001641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=dwRci0cN50zvLiPYoAaa5irN8+i4l8H+TR1wVdjJhnr9ZDuK68skF4QP7dQymRmNqU
         jj/spcI7I3raOx1UCAsEpu8mXn12AVWoJO4Xs0++RrggkKK60qb0Zhpd++Hj9aM6PArk
         lU8CMRSZK4LgVCV5LdFuW3ExTr/GPXIZlBbcKQ7hRKiAA4k9d44x4qyOomzkyDeKMu8M
         ddqvF/hZsc8FXlX1O8beZzXID0nZSo4cLR/pNsgn6ywl26NyVwTjSi/f/vUrcqhGIfmq
         re5T47Uxo8ar/UO85dfIDLH2nIrRPmjq0NBsIaJQ9ihuFbfxG8MakrTEsZd/LNY0iQgq
         NiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyHixs7kWvCZpku+LzbtcI3xAudi0WQmhwyPloYdu4n1Bdg5lN3LTkQEU6lII8dneWDdY=@lists.linux.dev
X-Gm-Message-State: AOJu0YykFZkUOFbbhxniS7q8n79KaK5dM1m+Jh39ISaa/UdNco9KIy5O
	SXd1xeb20s7k2b72RD6BSEcYtsER1X3xv569n4H+jXaMTBjE+Tpd3IRoASoyDzfdVow=
X-Gm-Gg: ASbGnctBjVXjYKI/XnLxlxCIKKCi6S3cKv8NXqhx3+N5tM04qkjKJOohKPvB49E74sU
	Mb5j7y8NdAE1roTDLmTez1X3Lgq7W1gWitLV1YqLWzMI5+NfMFxeNZhH0g1mmcH3t1ttx4++ZKF
	3pWnue0zWtjDuBlVgD0FHPp671nN+TQUFeU32MvUUqtxEYowsX73N5qBWvTuhYoqIAxb52ECYTf
	Qmi9kp81/q7bZR2gQ9o94qbdGFMO7YqK53oLXDKpxiWK37HccAw5Sg0Y+RavJdFxdZA64ip7l/n
	u0pcKXmGEE+UT32gwu7ranKzVwsO3W8vMgUZHsPLwCrrt6I12C+Wo4mj5ZczbuTE7/qMdmuqsWP
	tcQDh+USfaLdvAQ/87w==
X-Google-Smtp-Source: AGHT+IGBclbNO8WGRtJ0uIJ0ka2pGvDxULNrTlJVFv33q7V9H1vL8p1aMqaTfJLA+km5WeyuNutw9Q==
X-Received: by 2002:a05:600c:548d:b0:45b:6f48:9deb with SMTP id 5b1f17b1804b1-45b75858134mr40479305e9.28.1756396841346;
        Thu, 28 Aug 2025 09:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:21 +0200
Subject: [PATCH v6 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-13-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PIg19tb8c/EzOw0dn2/vV0Q2+khf5QKTgm
 oMVFo9hzQuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cmqpEACqff+3ib93FI87PuYM4exeofWP28ytmolqFv/JNDSfQlXfjFmYnRfKPTFyBA76ttfOjLm
 ASMPBrH6jm+gDbBK71pqHYmPLR2F3+VbGeBrBP4P+U4KIOoMivjWw3M4zYZw2pqshTxIuzIk8hp
 p7MU2ac3Y9n23iveKbzSAK+EoAmSxL2lQ15yc/7o8ph4+/jCy3aXmdAepBlD2zhWYVn/xEtcAcp
 XMTxIoIzyILFd7r5Z0RbiaGuyI1mT29BWNgpFIRDw954gCvFOYWUrbn2o/Lkg+Qctpz2A4FUeXI
 Diiu3zoutBbFXtO89+FSOyzdmqfSLbrt7rVfKtvvSp1/OoGcglsdJ9T5oWoGjckBb4Zc0Sbj1+U
 /4oXbRes08VCGwU5d0qXt2c2lxgrVlVnKODYUiEPU9qJkPSIX7Q9PAUOzdF6wmMNQBs3xWUDxDv
 PydivI+3iUC103HTAmcWHpervRU6SelZmt3njPpmXzohKb9EzGDwrif+F+FXALOTHaZUARsDhtf
 HPf1uVDdCvVnnIPhwwMrx5l+4F1B21FUAmCe4o6k2r6BZp5mZGL2FBpb+ZIiABfcTzIwxLGjOvn
 04jBAAR9bb5jV1pFoCEljbH/f0c2ullfdb+vvcTGt2JrOg45VcIDDclxo+6Iw2aCGRgUNKNCbPg
 KlIxSfNF/oUQW7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 96e40c2342bdedb8857629e503897f171a80e579..a5f69464827119dfe2a7781b558094b283fca215 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1

