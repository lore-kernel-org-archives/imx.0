Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CD28C866
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549716; cv=none; b=r+xaM0V6fMiYjSFZh53Itk3AN1vur8F+zgM92w2upgNn+8UYAqVCnfjLWqswzEVUlRTSA/ki0Dol/f9WUnxyjZ4Xknd54CA3q3cfBmTwK+EZLndiZzGClVaTYlqlfWR1CFHgjnn9b+qU0jrgiAQX7UsZI0zhAre8avgnk90dEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549716; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyF3ThT0aRVtepB58GNJ2U7aAHJHzQQbBZXhOUr7bJEFzW5Te3Aw0BAE6+dx3HgRL8jetAAqKXNToVcgWZb+72XxvAF3s2DTCBdyi0O4K8HC0rv74WwoexZPxJlvPZiDryG6lz5ZEf0UuywrfnNve6w0sjzs2iefmkPF84yOCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=q1ECROEk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="q1ECROEk"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso6457552a12.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549713; x=1750154513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=q1ECROEkLS47bYWHM7x2fQQbNn0CeN7uWbPITLI1ca9pVxSXfI1ryO0ImBLq3dy8mW
         y7zqTAitywtD4f2jG+ohKdOD8r7N73v+lXByeyVXnyX/7iFNnzaXzWwEwc67m0fOuxKH
         FmjNx5XqXHqMSLnhg/cQnR3jQcVWypsg0W1xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549713; x=1750154513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=A1QBt7myv2H1zpJQY4sPbGo7OWPgrqd943U9KRhp7Q6MBS7uStt76lu/ZMwE+k9tSE
         Iratb21lBjYQVLf5fovJqOOF6olHSPIyowH/zEgq9UAKYF636V8V5XvEpfIQd0HJpWTn
         yAcwjJqoM2qjHU+weSy2a4ve9Tu1w8PFWVUzpacOWXv+cXiYN5H8ehk2WN8suQj5pXQH
         FSEEokl9XydDpJx1xryJKclgSly4dWoWyl/TxbmnR/EBefDTO7/C6OmbgZ9/2k8r/DtU
         OYXUbBOVtDBjzOiappK59Hko//xQHnixKo18jeJAU/P4vYxFd2fi4R2Ykkzy6fI4Ro23
         oYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgAs6fFv/G2IQ6V2uMEfAsX4aC3+NO6Ir1Xi99gFuagSN4IQlWM0CNQLgPKfS2xZla22o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIlaDD/Ht5IzMBI6pQOEeR1S07Xj+lHS5Hyk6a3OrGaQo7CtaV
	bw5eikV2XoE+rgJ6OB9m0vzMQmSX1RZX53FIRh2Xnky4QZ24GH95d8ro992kOwUSgV8gaUAHvHE
	teLms
X-Gm-Gg: ASbGncvbwFn76IHcI0vG9AgRbNw7027h+k24euc1ZdHN3XOUyJazOUnPoi/YtQiZWoo
	8crHifzzXq5CoVjRmxss39mZXY5OOegXHwpalwxTE81rKLu8Tf804i9mRcJkwPUzYnd5p8mFozn
	N2Cn4PyIDEuNFT3T9DQLE9k4xdPlSIySR0ZmYIzSAN+qI7cc5bnAvhCcAWnCZg0di5DVzTkJPnf
	8ksLdaxf7HfNhiJLXzOU/fI5YwGYJwsCUynB4FHsyEd+aniwwhjWmY6x9XMRNutWVBIRVgz4UHu
	oUtMTpTUSt/AvvSJwnKLMfnR+mjGuCtQz4JLIhawNQ5CE7tBJ+pLYDcM80u6OS2YXN748RHx2rH
	W7Bp/fyUo00+hZQ6N6NiYH/qIF2g=
X-Google-Smtp-Source: AGHT+IH2ogjmL19YKgDcUsr9qdGaloNFiPiqPmqMHmLp/CVdnSTRnMn5FSL3f6mAcCf4N7SCTwQtCA==
X-Received: by 2002:a05:6402:3590:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-60773eca93bmr16613922a12.3.1749549712993;
        Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Tue, 10 Jun 2025 12:00:18 +0200
Message-ID: <20250610100139.2476555-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0

