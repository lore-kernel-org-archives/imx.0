Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BB7305E3B
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096342; cv=none; b=I3Ql1oqNJ7gs/9bNnwVUcTQVXkzxyj2g4zJ3Y1hSEJSNQp3NBh+TpS4z7bCCSLMm0GR0rR8tGBxKxszpVwOWVODjSisFgi80AJzJoMDUeHrMguP/n57Hpe9nG7Q2VEEzAmzsstqAMfmLnG6GQRa/YyvQnJNx85h/vtlVb1rzwt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096342; c=relaxed/simple;
	bh=BRys3ZutdevswohgMnBrm5EhSN86iKLozXVmHM3NKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO/NlWbSbSbw8txaveeqIqGCF1FkDGrbKl3RV+WLe7JdaEaq9lbnnyrQaftH7VHOr1iUE3ZpBQbbPS4QTxXy+96MAYA/SYZJIX/OU6F1fNn4oTEC0Td40tjC3Ta5g7GJkQft9yxiTsBdi0m5knb0Spi+Ih0EhP5t2wtv/pmdop0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=psT4arrr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="psT4arrr"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso3790911a12.1
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096339; x=1758701139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=psT4arrruVovnYQ4nLGrN4rfEst0oTLw4u4Sqi1GEs1KUX20VugwTRwQ/n2CBoXEqu
         AqjnsZ909l7gWu72LVM1yXyrjt+WOtNWbhT3FwBje+H3fVskRn3Ui0L8KahjW9OeESFa
         qdxQNNnpbECwPbECnSD70v97qQbdTGAXE8hV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096339; x=1758701139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=H0IPMGCNTCQuyLXnQNbfq73fwBFDqMYV9cmJy1d73rykS+jdVQN6yzS0Nf1Mfqq1Rl
         z7MWBh7vzfnfdAT3aYsvsNBR7zncB9x7D0nSXu3mnXL0P/rmQDQVxDS4JBR0RajjT1mC
         00zyuQMONaWG3sG9e79VVPgRMHYzyEziDKGeVBCdz+Zf01XnhJJhrNykhKKCVhw+vR8c
         MQjw26FYbCq/XXnEYfVReASQQivyPYz/ZhDXsboTGBlinQxZwh0Y066cpBLjcbXnEYs4
         PhEg9ZWsQWedZzUVjxVwPdM32zrH//7TG35++cG2L2roQmTR2MXTQMI22W9zcJT4n782
         4BeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpQDKZcEkyup7XQhqLQfTF8eN73kR8fkccqHL5wqrwsq6ODuNo/W+g06gRsKSX+Ow5bXY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx535TI5Waaa2wfNBvHc/sEgBA7QKx62SM3ejNSyaNUQrgzM71t
	Ci9kzD116ZmQM2t0e/uGwFNLk1n9nz2lYl0t3qB8KlHfzpdHoVWFkc+TEYRS5MXrKgg=
X-Gm-Gg: ASbGncsfwq+NzWTzywUGcUHri45zn2j20EGDJ2PvKqse5nobL259UuVF9fgpjK+pmvb
	gRlX/hzEfAbckVg4XhvxrI/tPXjdOcEZfOrnPWBz/RGj5o+fHITGGR6YLTrWM4HXMjxJRH+gskU
	gyxH0P2ZhyGKMTe6BiUc85KyTlhnCzyggF4aw8XPtman03eWEhfzwgYvkqap1tXgeLM8zE00+FE
	r7yBIjyltEfZpp0klvaCgtbWJvxK5Ok9N8chjFsdr+CmpqLQRyrkql1XyPmTloaw+aq1vb99CNS
	F1AGMMM28wX//LxXpl4u+OA/LaQ9DTAWiLq5h4tSoznWjiUJ7ZkyF670dk4eEkaF7EwRyxyABXz
	XmM6gGbqUfoVN9UpAomdJhwze7IgGuueLPHLuGr24rRUwLi09Qafulxs50/k=
X-Google-Smtp-Source: AGHT+IHQZ9rc3jl/nR/PWKeSWOjOjcRVyHb+GabJ2P0Cvoe8YSOsLplNCUEtCcN7qWi0RlLMh58DoQ==
X-Received: by 2002:a17:907:97ce:b0:b0a:aa7e:a193 with SMTP id a640c23a62f3a-b1bb559965emr139686566b.21.1758096339059;
        Wed, 17 Sep 2025 01:05:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Wed, 17 Sep 2025 10:05:06 +0200
Message-ID: <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v2)

Changes in v2:
- Add Reviewed-by tag of Frank Li.

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0

