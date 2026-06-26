Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C6339DBCB
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 02:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782442739; cv=none; b=O8vmj0q7rotAbZ3znecijhCRfXvTb+yGyeUEPkoHMOfYIc71iHowjiSpgeuKCz+6YvgN9iPJAC3SnIcSzhxrQ1MMJB6yOeD9lfibFR81j2/GibiSZaVZMnxQoaAQa1iJxqbulqFPxYk6jLaeBvi0G4Or+DV+H17MUlrDwW/lqcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782442739; c=relaxed/simple;
	bh=aG0d86+VStYCLhrRw4TkiqCfZ90Xd/Y/zoM5y23rOFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SVMO5tA4Rf1b/+jvqd6WM6TpH9dBoHieZjGLE3h8k2LQ3LmtTmeJmCI0+wqT8LXX7BgsOzzv6YgN4iPMoGHZWU2Z/s96SpdlhcUC57SQAr3oSgBx2vD2h0ZDJrYsBp1YY50pRMWPP4AzHAC5n7HWTnWHunp6gjqHlzJ93nWnHvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxPDUpNN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxPDUpNN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c7ebfb63c6so3630445ad.3
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 19:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782442738; x=1783047538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVsjU9yKl2cJB/WfxCzz06jvF+n5PC9ZLu0AFLXamVs=;
        b=IxPDUpNNKIsmwTWNMW0hzsigCCPv7UTcCLaBwtUMkFtl+JF3srec91ZSQQgSXMrFIR
         B6foxnUeGZlLpM/gzt9a1XW9jkSbY87ii3X9lF2U74IZ7jA8ZNIpkZEFEDyf0V8NVZQF
         4WO+KnLJhFqXrWSzm0d1qSaA2yjsQ/IEHvjZnKoMT/M02oxHmg0q2efdzxNeJ42x2zqD
         ktW7XR3FNjdMWyKpEahPl5k7L+Oawc0fX9Z1ZF1MF8kEj5LiNpOYHfccRa03uYdwb3MI
         J8nrodLKrGlmz5QACCfw1Qei8BA48XzBasavHytsq7f4IkqujBiO+8nB8xUjqk0VcUmj
         MafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782442738; x=1783047538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVsjU9yKl2cJB/WfxCzz06jvF+n5PC9ZLu0AFLXamVs=;
        b=K9ubp8hsZK9cA93PmHD3zcthk9aG97T4iBt66BOYqYBj6qT4r68al/WLO5/2jlv1Sq
         pa+PWe4mLIP7/xESc9x31+ViaI4akKt3b6mkcg3SGREaqKVxw/40TzRFnU+L6SXQ7nV2
         1MqNX2L2noNeAEBNwof76VfiAhsHpeMwBRqchiQQKheQghEA7l1FKwcpBmeZBJrXQE3B
         EsC8wFFAQcNFM2/fHmwgDMC5dF4kGqs8PKlWV1V+netNG4Qdqwckd2kZ0geOpMFbNmb+
         /Tb+hXZji3zrBtdYWYdIsLPO+QxYW3FkksLagwnbwd/K1XnKFvopmuooXw2TwSCKQr8n
         n4GA==
X-Forwarded-Encrypted: i=1; AHgh+Rov7Ei6x1TSyYcqQGEuBhix1oLzgAZBAR7LKe2UJihovklqCyKUw1DJL5jvdOOoXLMEhvs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzytckmTv4La8rg6oIkqO4JqX3BQH94LWaFeJ9VOtASxGBYnMwi
	CeJpGN2TjAgTK9u35iYG1WpaKLwYIiO46p/TZIlx28BqZxJqoQY/pfV9
X-Gm-Gg: AfdE7cmA2BDd4Gi1Ea2dXh31CnOUIt1WXKzBvHwNI8FN+zYc1f4WUj9fN6FIjZrRzNe
	MjeUAdE033Y+pog5j8tUu5eEQV0PgJnO/tJ5kVAs4AQkyDhCKtDLuN3GjeA4FE8BSjiZG8rFsR5
	BwogT/G/Yh2hth7jtsX6ofBF0F9uHzEM/oMLuDhfRnUtUHclubuzyH7VUkJ4DZSGQbTi70TjLjY
	n3vYbveqj6MYbzN9zzSU3urWfzo6bdwpZGthsg4+//5gNRNXdWBPaYtU6aevkxR2ARWr2HUIf/w
	mKFvpzMLwl5ebD0Zf39QUnLV/98eG3yDWLaFJ0U03RtcfV7Dc9Jiy1aG5BLjEKiizhVMqVeO6Me
	yTHNpw+ooMgs9HL85uFbItflD2K+EmORFhmKa7v6lMeNG4K4N4ztWqKQyTyp/e+wMdG3Udq+Agd
	HTDA+Fp+LqRsE=
X-Received: by 2002:a17:903:46c8:b0:2c7:d071:3ef1 with SMTP id d9443c01a7336-2c7fca19129mr53387105ad.19.1782442737717;
        Thu, 25 Jun 2026 19:58:57 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm31252535ad.29.2026.06.25.19.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:58:57 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v3 0/2] Fix slave mode corner issues
Date: Fri, 26 Jun 2026 10:58:44 +0800
Message-Id: <20260626025846.106157-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aj1UR5ddawsdMbZC@SMW015318>
References: <aj1UR5ddawsdMbZC@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in the i2c-imx slave mode.

Patch 1 clears the slave pointer on registration failure to allow
subsequent re-registration.

Patch 2 cancels the hrtimer before clearing the slave pointer during
unregistration, preventing a potential use-after-free / NULL pointer
dereference.

Changes in v3:
- Split the original patch into two separate patches as suggested by
  Frank Li.
- v2: https://lore.kernel.org/imx/
  20260625160219.55116-1-liem16213@gmail.com/

Liem (2):
  i2c: imx: Clear slave pointer on registration error
  i2c: imx: Cancel hrtimer before clearing slave pointer

 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1

