Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E82E7659
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987254; cv=none; b=HM0tsvmfOxv1U6xGGV9SWDD4NUcUiXi/dSI62hXSHubl9oEbt/urQ4mjyvqMkptkxjp343zyApw0ognDwlX1u5BV3Up6/XRxW+7l3L/GBTwkjtHazo5Fb/LoOSNur52oHzEnR2ThLI0g09Ka9Ak8CukkszuhGBa64gkolsc8uPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987254; c=relaxed/simple;
	bh=d+pkakvHisIo5B7fnb5foS5HS7QjQMAp1P2iWKiGNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZT3ugwm39+f042O2T/xJxqFl5JyGqJ7+knQZ5iLS/EChLLS5qHtSnjj5iiiUSGcClTPlm26bHc9m1xpF/QBCG5+8tjlOznCxv9W7y4w7wwwVluuz9xnsE6E4jC3WrABoVR/er5rd2IQ+U731Yehb0JlpL/vI38pB/7MXVsyoSSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Opo00HLH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Opo00HLH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so2911080f8f.1
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987250; x=1755592050; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=Opo00HLHLKobHyrqp2wAv3bFuuXXSJRku0+0nW2r1DdTgbTJuVpSY1S94yrkhsf58n
         P/91pJb2CeWZTA8iWupUJfW8RKxUhQMzYtuPs+66IX5KWAV9lkANn8IJ0USubGUUf1E7
         JezJMK0Yrv8CYeHq7fSYCt9pe3121Sgk7qvHmm0Qxmq/brJbyLwP4fONWwLSTe0d0uh2
         nUMafZyKXojfcytrrIpP1RDm1M6Zeko/ZAV3jVYpjdNHhhA4uzyZxRbFWxsvYYR8tu3j
         Y+AQ9aK1y/Ne7mNIRyAO8hEsubV296td9fIEVOnlQoKl3acLlgx79FkUVur33CoU79KX
         hbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987250; x=1755592050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=nBuICY8G43mbqaKo+sD0TOYuX0/YTCQk3KpupCcU/ZTBDCcMxGk1JMirUOq/KFewCb
         TNgHER304XGPqaBpMHjlK16aCuSm04k4BhvJixDLvpjpQPPFR6HhAWGEnlgzeOqmwUq8
         0Bv/SJyvMjlOSeVYmr10ckiyyoGaKOx1bs3+fv/SebgoZAgL+pWCgmieDMwT0ZN3we4p
         nA3sTZvAOfYDrnnxP92sCOSfcnjANBd+UFSLR1tH1/R4rPuryASLMQ2HMbXVAMK0Ibip
         0gTMFwB9ISfsUW7GMKmMJNWC5oS4QT5mfk5rpw2B30dWkSYc4Cp5gQ5o6Z6D6VxzrdEf
         qSPg==
X-Forwarded-Encrypted: i=1; AJvYcCUGDOWVMkyzCC3xXhK/QlaQzbU4SxoXtut1z4no2lKerkaJh0nIgPT372fb/mUhkqIP76c=@lists.linux.dev
X-Gm-Message-State: AOJu0YysvjWz3zC3aFTefRcI4svwIFwzlylF43W726SFA9nmxLVM4pvl
	ZglQPuGvjA0FPhZ92YBePaH81zyzpFGtucShbvZpBqyj6AIAcMFu57jNeK39lXHA9HM=
X-Gm-Gg: ASbGnctzNP5o10b33SEQGM0myl1jBMxcZpfYCHsJ8E6zn7qpEgDUpCJKGSuMsFBTCPf
	Eh+t4PQ7O4om5bWAM594BHhMfINl0u83LRU7NRGdYzZ1BiMfc//4sFvD93xjLXwUQbEJ7vy+Q7T
	xZ33CEJffnu7ldDKXobb3r/VAZwyElM7+KVc4sBw4Eh14ZmP5zeYgJIPg6QwA+GHBQcXWe39Ksq
	L56l2f1HJCyOZwg+ep+q9FOdtwiZ8T4yyvecDnShQHW/wTbU05Joi9TRZvLVB5ZBhjjS2lsBY5Z
	nelnzEMxCiHyDCKRNYd7FaUm1tw6B0TMVR9wiIjS7RM4L2GegeHEK93jB4otXUZsbNLdTyzbek9
	qoJ7W4U0YMWuE/ZM=
X-Google-Smtp-Source: AGHT+IFshlOvFK729Q2HiNSttBuhYGO5t1MHAK8R1Tl8WnDbe/OVg6KL0Aon7hXzH1skJVAbXFREsA==
X-Received: by 2002:a5d:64ce:0:b0:3b7:8473:31bd with SMTP id ffacd0b85a97d-3b910f9ab5emr2145237f8f.0.1754987250520;
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:12 +0200
Subject: [PATCH v4 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-13-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZ/VR1c42/G4TctgjID2K26TyPL0+Vrg6x4
 9ryMo61KYWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 cvCLEACYvBW59+M3gJi5bBpvwd53LIDA7Fi09bh7cf6sZQwrhnc+q7Z7XDWdo3gOU7A4yZx8nrE
 lf5eZ6c3y4GemvfNQDbmd0gu0FBsb/49YwP4k87d87Cdt8fNQd/08Gh/u32vbVpO16l2Je9VuY8
 3WZS7KC5/KJQPKXbmxUpP5C2z8mULdzAb4PKQT3dZ3s7f2T+hMUUwinrZx5u1klaFQrlOXkNTTE
 ba1l7tJFuZ8cxCTDfvpt3YSkOLMkDNM5HWjtfxL/gfiQ11OM42MAVw/QrrA0hu0Ez37gjOlTBx8
 ZfQwmRq7Gx7f8H5yXUyG7PrHQL+qjkqv673/8cqJFGcqwAse7K8jlSiu5yAKyPafqYT3neO/k4u
 APj8e2LBEwVjTBl0IhJdS6/+3AlWncZFxd6E60ROpK0huq9Ds5Fv1bIjzPvmGW2GKpF9MFCbdd/
 LX+uj8t8HrERHsIxj8Mov/RLEFgf1ECdyKINeMXsW0lLsbYkkDL62TYt2+/nXHkr6BSKZ1JX3gQ
 HmqI5/Ni9xR1d9/yvtzD91OFmakZA9BucAoum0WdD/tWCaF24vSjO/wdUntMJqmkxYWMM4CY0ro
 B/bQkovAcHO+am85u11GmUCv0se9FwLnggtnVe9u5hXKsKp22bC+38tNUX6xqHYV+hSPyXCLYu8
 hN8vLrtlGpDakqA==
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

