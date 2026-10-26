Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009388;
	b=Itm9u5OBKLVcIvq0jpDr4/EExPwhUvcKUL08HygXPllOCFnX4ZcriVv93axSGzW+1ItM
	 a7LOB/5O7ex0KuHnEfaFnxl5m+euobZDF3jJ+y7v4dYra3Qn2MgjPsUuSPgKgIcQxrn6x
	 wYc2Q9V4AKQhKtxb1NQgXSZEr24cE6dIE2fNa/QzlUp9ujlt708Vv3wWNxMigQ1yEn+/F
	 Q8+DxruWG9+XSZa3YOvN2uD4OhGcpTjJiYnjXnd+GHDOVZybu7qU+VT1mCuTHKFwg6oso
	 RwJSNUtxNk71r5HSBrxf+4F0i72EnutXK2i4XgTS9lMneG4Y2zjIVV67LCI7/1pvKaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
	b=GFV1ED2g2cgzO4J0Cjt1RxPgAXHsN/x9dcQeNPp6wBjKk04yVDw5IlFzqNYoUHBSQqjK
	 SS09ypvKfNUm/1GOjha/UmUsKK5Urzf6q7F9WOF4jFsvSt7Hh1TaDu/4tib0hjT+iaO4e
	 7bvv/vO5QsGGzDJC+g0yRsrzKO1+lTIozOSJLDy5Q5OV7WHx5YHer6EgHvW/1xppTA+Bo
	 1gr3f9FzJJHrGMxy9BLbeDeF/laEYpLqA57jx6XnxHqCiFfnSXDEbQhryNYh9FE9YXS87
	 TKnBu8MRnyNCYtJyDpVwfKwhU7iGt16Nic7vutaPYfNW6igll/7umH6zZN5vHQIiCzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Rmz5jbeA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0147606A31B
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 10:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0147606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Rmz5jbeA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12231795e9.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009385; x=1793614185; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=Rmz5jbeAyIvy5VnmMI5c8ForG3djt0kS41hahRaVVoYjCoa5ZqTnBJqe2ljiubTldg
         Nhf+Oyxi1U+6KPFnOOng7pme+f8z8uEqYSQOVK9rQpiS5vBJVv8UaUH0faC3Yn+k2l8K
         SCQY3rDcT39nKa+BpnoudGG6ejnf1i0z38/Ee5yrSrkkjuwpfeUiJKWFfaymlBFU6htE
         KxtXlaED3wqWx9v/K4YiVmf1p9j1aS13Kbj04MZqgfqpGIEJWmLcekMPsapv3hDAtOvn
         4tXK6uUJNt/+8yuRt+L4aU3qdAtxJMPwErGt915E0DU/v0+sEkFqtlvIsXcg/rF0FPNf
         3LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009385; x=1793614185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HumEFrlMqHCto2ViTmw+G3OxsKbMuowdLIAMmEN3GFQ=;
        b=RxdEIMJ77zSUAqaF6RetojxPibQuNJSREywO4uBkEyhH4lQzbgZ1Le9I6bXYm1UV/C
         mpj0duq/c5OPscr9RH4/vBYUku5+Ic+9MpUjkZHtWFLN3YuDWqMp0Oha9hZFfUda+XPl
         gckG91iaFTCzZoQ7ObOIo7huhDQda2SpiAKjRRQ68ZISakg41aXNuhzlxPlYguh1Klnt
         5Lns64Rpb3c9L3FkR6NzRk0+LU5UNaq2BZyPqCoQJyiewhSojFyJz6UqFtkQ6Vgp7H2u
         mAZ6Z+jSlRJ2cvWS+cZFMECBU8wQhy2vi9OyvmVuLrVHB2zxaYBT3sD2/5U3zKkW9Xwh
         B7qA==
X-Forwarded-Encrypted: i=1; AKwUvBwbkckAh7aVr/bNwWcfJfIkdvA5/2B5o1GSeXeFEFhHUuL4s4j6XNVVnixp+GNQikCFOvg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJLG1RdpdW7h5ywXmtaGyNjNdP6Ta0ZGqhD129mzYf1PJGJxTcE
	Z+4fFS+Ngcst7lQeed1Ic59FJX7jSpQcieqaAV1UopFov5AjSwWUBqjUZj/f5UDxiAPdUhbCOly
	1KewcFts=
X-Gm-Gg: AYBFou1XYufgqN9Jgg/GAZJKBJSgeU5FTE87dVGVTyS7QkKYHT117+aYq6rhd+0F6S3
	5sH8wiiatmtUG1En5UbrRopyyrw3l6twlz5eEl8Np7OpEd1dvc5bDYicVyTHPzN/XLrXKLzmcXc
	FDx7Ixn7SsnIa+8IqVs74BcJb+7F3rxctBGcsTAY2EhLz2ildWpYQWSsuJaSfsAMH0d2MkBOOM1
	fjL/6koXjYcXipNJ1I0uwQBt+s/edtUXmP+Wnfm+EumXmk0Nnw/SEOA6MV7uA2yzmC66axVSEvk
	hFhylV1jg4gnHOs6P6bwPY8+34DhRhMLsaUVcLsopvjwEenCXwV5E5lMGR3eudmoQa2G64AIvyA
	t4bRLa2TH90+uPvfy/NKJvmNK5Qnv4pV3lCqmWRjHzreLlddFOHpjf58ZMdjcZmyLu8favQM9SU
	V2EFWW+yamnbH6vfMwBKdKBwGBLSw9o6ltbS88/4uI5KZdrPcmb0JYLm/tefe1hN6hR/Qs2mfpE
	TaqNBIVMevE6CWHQ2ioS6/pT7YCmeYmLKYpr5+INmynctsWD855P6dlASxOACl7bOO7uC6uARxW
	yUMRkxMRptU01UavPAhACeeogA4tKVp+KlCffJkyfA==
X-Received: by 2002:a05:600c:1d0f:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a35acc76d6mr115228495e9.32.1793009384948;
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm191748665e9.15.2026.10.26.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Mon, 26 Oct 2026 11:09:29 +0100
Message-ID: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=p8BCvf4WNLvDTsTcauj4vL9ILkW9KOR07cSl5g6yvHs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybbdZZQCmOQEwlRereTB+cpQErFhNTawdaYm 8GKarLnZ5OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m2wAKCRCPgPtYfRL+ TiTnB/9q/2uqQ7mxzRKdtOBIs8bbAq6IDNldcSzkBYE882FHSYLuF69QzQGYggbfdshBZF6KfEi 72spEUCb74/WTgDet3zcw610iMpBONFQx/bnX2ygNae5l3T8DwcJ/QLRfRstK9JJBodno+45XLP qFCvgs1ubvMdtdoBLpPTCAmEADK2B5fhqO3+LuR6opB9OseqLp4zSO4/4GF/YxM9aZoLnD0V0Zw aqqoMBTyaJNu773gIqT894WQGRijP+G+Q8hiA8RsiEbmHCXr2rSjjEE34SYCF7AQp7nQoeIZX/R 0YHk4Zo2OTearFppBqodw/347Sk1klnFu9Nxl5okTb67O2W6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

I'm currently working on remoteproc for ADI's ADSP SoC family (SC598 +
SC846 and others). On at least SC846 the memory of the remote processor
isn't directly accessible by the main cpu. (The memory is mapped into
the cpu's memory space, but cannot be accessed directly from non-secure
EL2.)

Instead of creating another near-copy of rproc_elf_load_segments() that
just differs by the memory access functions, generalize this function
and make the driver that already has such a copy benefit from it.

This is only compile tested.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  63 ++++++-----
 include/linux/remoteproc.h                 |   3 +
 3 files changed, 69 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

