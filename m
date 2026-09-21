Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B2C3346A0
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961849; cv=none; b=Sjxr3lTecAPmL55KCUhSTXYutD1HpkPi843AQlzVicZVnTK4zcjf3DFJMk+d1XZV6pr4kfEqL1D4GXyVt5B4OMtzwj/m6lYN87TdygSIequy85eiK5y4buaEkypUDUFn5lYNoGa0QPA0Xdscdk4MJ7zQYh+PMc3kqoZHvjHvEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961849; c=relaxed/simple;
	bh=x/6QvB9InBIhpi7aIvuJrdQOgjAvdt+ushjxl3YRC1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaqK9sHd/nlfnWphprln09ZvCZSpTH8uz8p89q7fXn3X980Wk7skypEBbEfZ4oJhwXRCVzqribhIDxmYDh2YQKxOUOn0V8UJmNhTvqBTYe3cjXQEBM+2cUQjG7gvO24/1CwmwLrPA7n8OH+hu6TjtXXeqgGCCbcLxipvKEklrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DESuYW1a; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DESuYW1a"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4c9d14b8so752115ad.0
        for <imx@lists.linux.dev>; Sun, 20 Sep 2026 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961848; x=1790566648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=;
        b=DESuYW1afrI7eq1RAne7Zz/YJu4TZdsKgL/o5D8f81QIBw4Qsu8JYapbttVHZqQKpu
         YMJA5+rLUSSqAekmm/dJUxNrEzwE4yQgMScqx3JNiOAqACZHfcizDQsghiMj65tPEu4i
         SFEroudjfFY5FGopmsxIyEYYplBaGZm0xhaV4/XoiK2ro4CuGLkYUmbhtsi2+W50OiiG
         EC0AW0gkN+LvkMzdRWe1rKHi1m+/Q2u8+gE9o9LpFdN6TRxi3xMU7ccu5IJYWQ0Gv9pj
         Qsre0o3LN15AW086MJ10Pg/3lqGAwPklmel3xR0LG6hy33mce/LbYS5//DLZ9gYnFa1G
         PoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961848; x=1790566648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOn5aDKklfWuyRcWQiw2HtX9kHA+GiSG8zyirY1ZU/0=;
        b=GHTvc9WoPbBUV4ZojE/GqgLO7k/Mh42KvoyGjATuWm+QX9rsYCwU+ftU1y8XExx3gL
         9NdGr8G6LU/IRMA+CZpEfBkaqb2ESalsEWQcWgE5wIzoX4tos55bWTCZQlTmrXa3mHQy
         PjS4PeyQl/Fu9sAXvXBIRw5sxFVpYK84n2xnPV7LIMY3bKtpyf1Ge+QDKfFovvdJESPE
         wMFahDqazfdGYT/gk6MdyM/LF8P3AGStbSb6kvLHjBxOrHlwIHUeWR37Qr/Q9D99cFol
         xJEfrLrHSHlP7TLRzyfOEwJ6fRmdbj4pfvfkdEFlKI7yxTFXIllSHIyvOOgorA2A50b/
         ToJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU90SHioE+tTy6oE1vkcfQUHQ6gWUxiR1pMMXAJoEfs/C6qViLHBwLZiK9qsT8+fGb+gg=@lists.linux.dev
X-Gm-Message-State: AFuF++lQa9V9UvVBqT5fDwAqMZowiWb2Ocy8p54l1sikBG+bUha5hNn/
	mQ1o5Pp0DjGbggBIKDjoirEcMlV5Fm7mYVL2U9JJBAlhcDG+OzezlfdE
X-Gm-Gg: AYBFou1eMLXZiHq+5IkUuxyc12RY8qKp15gxDOvOgsd/9ifCALrEPOPFbyFZfLPZb22
	m2gzO1WU5shlLRaf4DZ3vyktcV8UZehHwvmniHXJHQczFGWr6PoeV9wHVw0AseJxSt8orlPJbwM
	vG/52gwBmyTDxunkGJ3Zm5ADgTvAogPODy10n6j13oS3qy2wPxN8AEpCoMSo4g2LPyqzLw7I2bV
	95IS96a7X0rk2wvzHJGG/M+wDpM96NvIcqlXROqCX8NsajSPPF6fm/+r+QGsrT+Rd2zZyqXNWS2
	HqXBR7BFwxsn3sUOWW+pLTdeaKtjndsDZFCWRvMOJ8nxVZ1OQ0vWMC15L1JVaX6aQnTY4/vjMM8
	KpN0iwI0Ki/ZR73W+mw5snfzwS2hJ6M9H5+u8sTXV/q/V88ObQWZ/1DdlDMTfejIIEfXuQ63WV6
	M75giKloTPvLVlzziN0Ar0B8mSMqbPbFrEwIfdGrSZ9IqBM0FiQKURx9Pv8IQrB9MP2vzvVDGRv
	Xo4WJyZLHFNOT48essfnEVNC2wQaq4ecIAmPLD6dIDsfhTFVaGN3xxROdJzpsZbTCsldPqa3gV5
	9OD9qFNTFOSXww==
X-Received: by 2002:a17:903:2447:b0:2dd:7370:e19e with SMTP id d9443c01a7336-2ddb2233bc1mr94006865ad.16.1789961847686;
        Sun, 20 Sep 2026 20:37:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] pmdomain: imx: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:05 +0700
Message-ID: <20260921033708.14433-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series replaces open-coded pm_runtime_get_sync() and
pm_runtime_put_noidle() error handling with
pm_runtime_resume_and_get() in the i.MX power domain drivers.

No functional change.

Found by manual code inspection.

Best regards,
Phuc

bui duc phuc (3):
  pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
  pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
  pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()

 drivers/pmdomain/imx/gpcv2.c          | 16 +++-------------
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
 drivers/pmdomain/imx/imx93-blk-ctrl.c |  3 +--
 3 files changed, 9 insertions(+), 25 deletions(-)

-- 
2.43.0

