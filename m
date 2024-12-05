Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2CA1F4725
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397603; cv=none; b=u5fQ8Z7OROxXtxIu2ENY7TIGEoW+pOlO8xwqEMFEFHTdDclg7HqbxtIDE+GdXeoFk9ioOcinfi8VDcEfK2Ul3P8Fhr0R+QGYULTCMq2TV2+Kh6fINk5kl9zWQBbDlx70RiOuugf67VO0KumsVGkCKuG4apS7um6gLaJXu6qVooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397603; c=relaxed/simple;
	bh=pfUlSptnbjn7DLvsRIow/u7XIOc91MQ2X6DWWwf8p8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlsy2rwk2m2TK9h7VsR8X3H+aGTZnQ8N3FPfyWIsWc2NydTtA41yefeq5alEAXrDMDGboZ1qLdE+ySBfJtlUXzVbsKlYCaa70ys7p9l5nvYwWToCTgYgc3kv8bmgug48ZMOZ5dMB4X4ndLYcu3+3RxqxP/sIVX16ooxrA1WtJLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=helSgWaZ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="helSgWaZ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso161658466b.1
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397600; x=1734002400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=;
        b=helSgWaZOD0LdojQ4lyLmQZAKoMhbbIQoFRiXaVX2WCDMZNjFSPJT7HO9evwUzNo7X
         7IWvBn6apl/vhUtbhBqjNuWBTJUUzbz3lSGkxYUiO6vY9YtXw6P9zP4/4m13m202oC8/
         0vBaBQGQKE3w/+TUEy1T7rC0jJbluCE5tQ22c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397600; x=1734002400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQV84YY3kxNcx24ekDyafnu8RIJlZ6f4/uTM5oPtiQA=;
        b=uujAF5XzJjbbxgN1qdUrgy4mvZ7uUFXkEnqboBRq+VzXMrkRc93HfdPyw5GabcRZ+6
         6tjwk64lbwgmIJ7tX7qw+quUuT/+AlFegC7SPl+J7Q6HAsp/9tAv3w0RvKc4dGVITvYi
         uWYJ087cacasY3+TUT9nXIA4rlXvI2ivJf6KRNCu2kYs3/VaFNtJ78lKXq770Ir0HTOL
         AUR2bYPfWXroJcAJBn+cAZCYK1Dd0CHw7B1M83kTW7BVvDYDjw3aXwx/+Pg1s6wyTS+v
         HedS19PdQPUR/Sqtm7Eh8YRckHrVcLh3ET16WwbotvMtae9/eq07MVUGKWvKOKcscSN5
         Foew==
X-Forwarded-Encrypted: i=1; AJvYcCWj/T1igtGZ0IBtuy++v8BagvkM4DlcOn37nqaIgITRt0/bxrARlKCv0zk2CoDB7X3Hl14=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWy37Fg5RMcZI8ks+stJ9BCNWeSV+iOvJg95BH153q/DKxg5HH
	N8saNVXKvwEKBZ1PLrmlJK6PzYLl4aer2ODBwgsXgkrAkE3NjfNfgrpCVZELlY4=
X-Gm-Gg: ASbGnctVAY6lV4qwKDeJrWkl8Klz6WwGyQ2dCkOdjL5VIOanj2rzTXTY1/XOyzrsM0K
	kg61gOTIqO9Wec6mqpFOkSB/YmomDwCVE3tNXcrF9WHQB/SCZLMF+PC38ywKttuz4WAsEKpEgvz
	+s+vQqwhsecLPwjRLYXjq0bwEZaMNEpUzU++cVeKZz2TGClJeNyaYbS1x4lQ/0yB+h20xt/fwYf
	xx9JgVG6TGnh8WFcswtiiUwHWH5QoL25VzbwgSLyLq23RIL6U43L23V306xudu6uFjL/LyfmUPO
	tEeF5d6JorIQNxwueSOU79XNHZaV/ArOjOdBrNm4lFyU8w==
X-Google-Smtp-Source: AGHT+IHYmzsfUE5nnaORiIrX4Eb1tu8QF4QuJLvLBDRHYiwoP2v5WElgFEFGC9Kt0r3kBSas5vWKow==
X-Received: by 2002:a17:906:308c:b0:aa6:2cad:2d61 with SMTP id a640c23a62f3a-aa62cad2dc3mr99811966b.19.1733397600072;
        Thu, 05 Dec 2024 03:20:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 12/20] dt-bindings: clock: imx8mp: add binding definitions for anatop
Date: Thu,  5 Dec 2024 12:17:47 +0100
Message-ID: <20241205111939.1796244-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 3235d7de3b62..c2acba5d4555 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -402,4 +402,74 @@
 
 #define IMX8MP_CLK_AUDIOMIX_END			59
 
+#define IMX8MP_ANATOP_CLK_DUMMY			0
+#define IMX8MP_ANATOP_CLK_24M			1
+#define IMX8MP_ANATOP_CLK_32K			2
+#define IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MP_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MP_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MP_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MP_ANATOP_VPU_PLL_REF_SEL		8
+#define IMX8MP_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MP_ANATOP_SYS_PLL1_REF_SEL		10
+#define IMX8MP_ANATOP_SYS_PLL2_REF_SEL		11
+#define IMX8MP_ANATOP_SYS_PLL3_REF_SEL		12
+#define IMX8MP_ANATOP_AUDIO_PLL1		13
+#define IMX8MP_ANATOP_AUDIO_PLL2		14
+#define IMX8MP_ANATOP_VIDEO_PLL			15
+#define IMX8MP_ANATOP_DRAM_PLL			16
+#define IMX8MP_ANATOP_GPU_PLL			17
+#define IMX8MP_ANATOP_VPU_PLL			18
+#define IMX8MP_ANATOP_ARM_PLL			19
+#define IMX8MP_ANATOP_SYS_PLL1			20
+#define IMX8MP_ANATOP_SYS_PLL2			21
+#define IMX8MP_ANATOP_SYS_PLL3			22
+#define IMX8MP_ANATOP_AUDIO_PLL1_BYPASS		23
+#define IMX8MP_ANATOP_AUDIO_PLL2_BYPASS		24
+#define IMX8MP_ANATOP_VIDEO_PLL_BYPASS		25
+#define IMX8MP_ANATOP_DRAM_PLL_BYPASS		26
+#define IMX8MP_ANATOP_GPU_PLL_BYPASS		27
+#define IMX8MP_ANATOP_VPU_PLL_BYPASS		28
+#define IMX8MP_ANATOP_ARM_PLL_BYPASS		29
+#define IMX8MP_ANATOP_SYS_PLL1_BYPASS		30
+#define IMX8MP_ANATOP_SYS_PLL2_BYPASS		31
+#define IMX8MP_ANATOP_SYS_PLL3_BYPASS		32
+#define IMX8MP_ANATOP_AUDIO_PLL1_OUT		33
+#define IMX8MP_ANATOP_AUDIO_PLL2_OUT		34
+#define IMX8MP_ANATOP_VIDEO_PLL_OUT		35
+#define IMX8MP_ANATOP_DRAM_PLL_OUT		36
+#define IMX8MP_ANATOP_GPU_PLL_OUT		37
+#define IMX8MP_ANATOP_VPU_PLL_OUT		38
+#define IMX8MP_ANATOP_ARM_PLL_OUT		39
+#define IMX8MP_ANATOP_SYS_PLL3_OUT		40
+#define IMX8MP_ANATOP_SYS_PLL1_OUT		41
+#define IMX8MP_ANATOP_SYS_PLL1_40M		42
+#define IMX8MP_ANATOP_SYS_PLL1_80M		43
+#define IMX8MP_ANATOP_SYS_PLL1_100M		44
+#define IMX8MP_ANATOP_SYS_PLL1_133M		45
+#define IMX8MP_ANATOP_SYS_PLL1_160M		46
+#define IMX8MP_ANATOP_SYS_PLL1_200M		47
+#define IMX8MP_ANATOP_SYS_PLL1_266M		48
+#define IMX8MP_ANATOP_SYS_PLL1_400M		49
+#define IMX8MP_ANATOP_SYS_PLL1_800M		50
+#define IMX8MP_ANATOP_SYS_PLL2_OUT		51
+#define IMX8MP_ANATOP_SYS_PLL2_50M		52
+#define IMX8MP_ANATOP_SYS_PLL2_100M		53
+#define IMX8MP_ANATOP_SYS_PLL2_125M		54
+#define IMX8MP_ANATOP_SYS_PLL2_166M		55
+#define IMX8MP_ANATOP_SYS_PLL2_200M		56
+#define IMX8MP_ANATOP_SYS_PLL2_250M		57
+#define IMX8MP_ANATOP_SYS_PLL2_333M		58
+#define IMX8MP_ANATOP_SYS_PLL2_500M		59
+#define IMX8MP_ANATOP_SYS_PLL2_1000M		60
+#define IMX8MP_ANATOP_CLK_CLKOUT1_SEL		61
+#define IMX8MP_ANATOP_CLK_CLKOUT1_DIV		62
+#define IMX8MP_ANATOP_CLK_CLKOUT1		63
+#define IMX8MP_ANATOP_CLK_CLKOUT2_SEL		64
+#define IMX8MP_ANATOP_CLK_CLKOUT2_DIV		65
+#define IMX8MP_ANATOP_CLK_CLKOUT2		66
+
+#define IMX8MP_ANATOP_CLK_END			67
+
 #endif
-- 
2.43.0

