Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1428D844
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349106; cv=none; b=R5PS8vuzF2ctCJw1X2eBpKoTe1Bb/ILAxmWcqoQdkUYHdzWrENdkvxzWiVc+ZMl/vq9d7M1Gd8Uu3UIrVTuIKSC2AZpa2JyGFxnDcS9QoYTC5EZbYUN7MzyiX8+ZtWfSw8X8ooYqNe9hWj8VrFx4j5XMtWW3wFgHGmbwIk2GBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349106; c=relaxed/simple;
	bh=plZ1Vm1sypuKeTUPV0wUpXS3wYOgw+xh2WcUDF5pNJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KRQmieUSZf77+6UHI02zFFHEp30SXq5mVbvAxHPuqxbMDORJ3Q0dCmVCBs0jxkJtaPQ4Pt7dNRtNlMeQ1FVlqZ/LvH+WiaW6B5DByO1F/U6RPR4TNCddKKeuJvdBXh/OCnc+lR7ypsWOm9/2rK8ZaUNQ2XHtPKRCW2c12F8Zmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yH2+xPTv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yH2+xPTv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a575a988f9so427755f8f.0
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349100; x=1753953900; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=yH2+xPTvYxp2gI9rgpKtbrREjCHfLIW0eDahQRrhvFZbBT6WE70LQhDRLTp5LL3S6/
         sMWKngNF6cmzZHTv4jV4L7ZNW7eQVkaTihZMQfeoykeFwM1Ls6iF7/8nGCt55cpLczZF
         G6KXcOMW4oXqu4zlCSNde+eTdHRIz4Qrddt1YsPy9Md2zBugr/npIxBw3SOAIZ45CLrC
         ume4hgshbazw8mpnRbgbIDLvVXhqCNmGdn64aZwRhkZ6sA0vml2nb7UJ/2Peeev2jKFI
         zJBRhfxKfadgji/IHFdAzW2hgJdMFOlJ+bfFjsHHl45NyZR2jGtvwVbHWKdh9rv2thLU
         fOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349100; x=1753953900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4qKUQTrFUgO06PuEy2CFUi9trDjc/5HjRv1X5gVEhM=;
        b=D/oKtwE2Sbei55JewKji9SyylsESAxtVOVtOHmrqN/cx4vfl2ezUo2mlqxtslajouG
         AEt5ybMs1mI2WeXdE7biRbK/dAWFSLTIC9lQr7eTRs1ApHIDiV4VKZ6w15IOtEBal6ll
         LuHRjc7Im6vevQmG1TNsOne28aHkVbN9rS7R1HIW9dx6BNNnwr/UByCa/obHcGa5TOUU
         8zbZNAyhhy8ajA+zYxggt/YSe8KTwz/gfk977ayUwFcWO0J1uFOwzxjWHuKEzBBh849S
         ghZPShR/MODg6kf3g3jeq5/NBcJZtonYay1Oz2vcCQubRCyjoYyugs+oWuIDYWlctPIk
         eO8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLlQnRPJkBmpe7fYZHFGdAjnlDHv1WU+E2BEaxgtWKioFPqAqRuUXltlOoRH7HoarJ7W4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIS8zvP3+omZz6mqoBkY8aPCkGJYsMP3ffETYLGRpU8jHr2kAZ
	jEApa/VyzfUolxpJQ83mRKIVPIVUU0bLEXn/IjO7YP28VwxNuLhhiLscbyZEQnH5r1c=
X-Gm-Gg: ASbGnctwREZdSIJLunWE/WSpKH4pZ5tabxC/kZTbcb8Ik079gux8WQuYB1/DMk9S4q9
	BzzTpBVFnYIcOZdH6+40hrcJCMij6wq3QyU1oj9F1+sqNGOp3dsTM9t+q6yeVODSbxBOnyDr/by
	pioFkVAU/qvXYJcKacRPfpWQiSbzDB7yyYVd9FMQdnvd39OPQBKJ41iygmT++7USwsKkxwiEzlZ
	MEFB1VObBxclu0eN75tN+ufGoCQPXzptVax4k+Gw2lm7LjEfZlyaawCSI688725cnmvH0Wo7kNj
	ZQTuDUbyP51BOpNh5xcVn+oPs3APH/B1cCIhu9o+yM0pJDe/1GMfIBvGtX5pzc4VOmG05rkU8Ko
	VlGPHmi4AKAIWiAB6
X-Google-Smtp-Source: AGHT+IFiU8ntOuIrsg7EJjoE+jgfBOjilWpCicMTZfx/w/wMWv+Cz6kJc3kzsI0KnGWbRP7+RQsGJQ==
X-Received: by 2002:a05:6000:2501:b0:3a4:dc42:a0c3 with SMTP id ffacd0b85a97d-3b768f2e43bmr4915869f8f.56.1753349099696;
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:41 +0200
Subject: [PATCH v3 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-13-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
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
 bh=V65C7Z+Y1YiPq0OHKNuy9LXqO2UhBPC3XEUxRkkrR4k=;
 b=kA0DAAoBEacuoBRx13IByyZiAGiB+9ShUR1OAFnIEDQG3sNgilmhY7Ygh6t/KE+2iWaFhFUfQ
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJogfvUAAoJEBGnLqAUcddyCt4P/19R
 usVp59cB9gmeC6caTopbcbPlDN95WhxRPi8vVSM0eahgEj4xziYJs019xI4Vc/dhRXH9v/sv4w5
 5V/98wav2sHArJ6Fwyy4TwBH2Fi70PGrZodDBC+XRwDmAFxjjdb5ZC70EkBefPFgqgWBJLHFbYK
 ERwWpuTdOjV3bR68Y+BCsI8vh9Of0hQhF4gyJj6bIdvXvlKGmd/OXIrHJqeatSdBYMWebikfG2h
 Ow7xy/+iqq+i6p4tWOubxuQ+yrYyiPvnsRIQt7j74iJO9N8kHSdgg/wuwIOdNANPFp3EsoYL0kK
 qa1Qg1hHn2GdMMp3oOXDTybNepcTiMtdkbI4jPFrei5Wi/pAZRaEfYoCaBoD1AkhZwRaNOHQQH0
 ljr1wEhPIjnp+8blcIaYZq8yVYvpNFc2j8IExWEsIXNTWECihGJxSYq27Kekunrv/FpYmZEsi+E
 grHegZHLUs5t0APfof6gAM5Dk+slyYb/GNzK8F6racQqxoEnZy+zBj52YU4q+yNxNcwylSh1b3V
 i3FtgIvC0j4c004+Y+yGAVzok9hidlMxP6cap3zpbStLEDVEte286WULSaZ0EbdfNkU66NC+ACK
 G3w6qEcvTn8zHUugxupweSvuC6MxhTVRA8uH4BAoi3nN2mf0gl1xU6dJWdB8ZlrrKBCQUuVoGsp
 K1qEy
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
index 965f0cceac56697bc4cdb851c8201db7508c042e..7010be8d1ace062fcf7743e539d2065d4aed856b 100644
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

