Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2F41F130D
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397588; cv=none; b=JQGjVinbGpQLuSTea7wB3q7/+GV/Dhs+s8NCIWcCH3eP6l/htOuDBO6lSFs3uYWoIbAztYZgQfgAPbJx654Ubk99mDQNpMZqdd7+3Xk+AGgh7ykNHiLijcjWhCwAR27Hz/7psdtpgV6Fuh2hKqskQ1dMrhs86qC2Zq0Nczad1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397588; c=relaxed/simple;
	bh=inKBaalPlXM5OmIu+SZhwPgtj6S4vH3/mZDzHKXn5A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3XInn5nLmUJAC1RNxlhjVCEZU7qQRVtaG8HBqbuA54C4TgCD565Opp5IN9wlbpQ0c4z4x9NvE3/ZcypAwHy0Ct3DFomLntWaC1Rj2Xill7NtdQTedEvPv0Oh2XS/FhMDiaULoxdnMtLZDvur8cNqAScWtg9oDjgGHDUh93YmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bAMH56Tn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bAMH56Tn"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cedf5fe237so1138334a12.3
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397584; x=1734002384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=;
        b=bAMH56TnzWdTz9LdNBEZpQcbnBeH5AfbAyUpJGHTmLfcaZu/dfu2Qt1a3XnmHdNHqS
         Kg3rDkZGAlOoqulyENcxi0uWBWWUuNjNOij3tF187oR2PItWQ7DR264ycq1/YRP/lZo7
         duBFd0g6piX873uTpwxZe77Ttd3DaXAP2d2LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397584; x=1734002384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=;
        b=lpjs1WI1fTVyactRl66CzR0LQBWLp5E6vmWRx1nZirrQgx/kvgw0noaeOMZX0w/GS3
         yV3RGAgSqxFc0rHou0t6RKWIpg0tMcDOjUZHTlnfh4K3mu1BtRKZ/V+nf1eWw0RlhGzk
         uC7blMZMqNLLO9M3DFtxOf71hZ7aYOBAN5bS7xaVL50VVcH0DArdt5UhEHAauudx81Fe
         PCeB+tYGGk1boMjufu1u0pwobSiXfgs0ywpG5z25etBRbSbNK3WaRExoV2gVgP4LQs0l
         Cgepbr6Kv/Bt1TDfIeJuQoGfrQABylvLeiy/aZ1e5BZmWP09fL/zfJiIxL3jWrZi2n9m
         aJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV15Muxx/k+2bn51gDY4P3+ZJ8hHiunRtKaoAgpePKMAduhok/JSkmRzNhZ4U2hmidQMoU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+vCYuasr9T+vJcmwjKFO89afhVg23Q39VwCsOAW7d6lf0O9i5
	5e1lHqC3KgBwCIGphjpsprqeCWUTAHzFfnYA+YK02wdE4o5Oxdt5lfIbiiX63Ds=
X-Gm-Gg: ASbGnctm5G4rQ1P+FnYzCJiPpKGM4ANNZ7nJTyTGzsz5+1NXtpTex4qWha/fGO6XZSC
	408T8zCIeNFyg7UkOQVs0s5ZHuOtx6gllXxSyqBRMXvSmlUCkVcXe+tblBOhjuBveZl23Wp7giv
	OtNInKFNpMM0trQYEdVkYhwk+0bfZW42yzHpTYO+Ir4x4cXdiSljo5PUmDhmASf7JCSiqztiIxR
	OZUC1qH56xsM6ZF/b3Eq0fIwVRwkgW/STEWZRtRA5PplhIgiYaJdb0oSvPhBFs7igOJ/K2T9+RQ
	F5MgIWPL0W4MBNESyUoauBy3TV2dtUNPVo8tF9J+DiocNA==
X-Google-Smtp-Source: AGHT+IG4SKCPLnpcJBbWDmV3TfYeNP6K/Uvezlg68+KTlNCXPIUvxOpsGINolLfffKcS2GXC8CUr7Q==
X-Received: by 2002:a17:906:2182:b0:aa6:1c4f:4642 with SMTP id a640c23a62f3a-aa61c4f48a7mr271020466b.53.1733397583627;
        Thu, 05 Dec 2024 03:19:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:43 -0800 (PST)
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
Subject: [PATCH v5 01/20] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu,  5 Dec 2024 12:17:36 +0100
Message-ID: <20241205111939.1796244-2-dario.binacchi@amarulasolutions.com>
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0

