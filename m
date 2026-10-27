Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118340;
	b=R1SCf/v5gsDYdSxmoXLDMlchBGXRrm7R4qT3eZbTT7a073AaSlo4F8HfO32RHO5iqzUq
	 6BtAaXNq8xiBVY2fyL5Bamp3tSmqlGvGtVxJWBTCNq8QC0TxrzIX6euvXpkZS/xqqWkfs
	 E62bWdJ9eKVuZ1kRsVRdu0TVu89EfQoq5aVy9EyLlNG/cDv0pXnNH2MBcew/wDK7Yvxvd
	 u/G9Qcm21oRyKyYgHegb71sjeDg1F7D6OZuSWxj2+MONcZbPUb9qEYUM6l72W2CJYO1lD
	 GfKy+ZL2HqyPtttgqeEQH35QQT1p3Ugi+ikKmpRvAgtoEnMl0yNjZZ6MMt9WRSy6JzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
	b=4yzDKBcv8BRcGjTdEk29cKuyVAKom8li8g5zRnUP/1TlJtDron9fbdDFqLNehiDAqQ2h
	 pEySrMhBISQo+Js9UuR9wAgLnzlOxjuIkzOgWhxZ53kI/E3y2BhZ3Ssy8lHxd2ARftz6I
	 5ApD5N7yRK9hcHpuejCkXAVEM64qUHomU8w7+QBIMJU0DOI7TL50NvGuhs38OJcaKXE+6
	 eZPRboJbz1wgg1x9R8ejIl+ILXWmnSS8NBPVUt4EV5pPYpN3/bDFg0QUrwgTMqqi7pIv9
	 F2aytioA0preIiNOb+8SRWQ2aPAZ0P1NlRmkzw1rvUAbR7R527VX/RLLnDQWBkqo8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KPkJu9b+;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE34606A31B
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 16:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE34606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KPkJu9b+
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so110205e9.1
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118337; x=1793723137; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=KPkJu9b+gCyP+eA9rA6So3lvfdJj3ibSxI1kk8rjb2vpL/ErKOhHvd/MsLGNvk4TFV
         1zz+DvXopuMndIcuaSzetruzJweNrpDSKmy/KB1GMJysxHJOKuCDU2EeQSn8ILVydwyO
         XQeGnTJcQquk2Z+SKrN22TtpG/ptLQ3ZJen8dXnAk7TOVIJQeE1rgna2dGXXYxHPIdpv
         WcKJnP6Oz/Qw/TyaLl8SJGKoQpNsY4xqGWIBQ4UOkw+nAe4Ndw9YLnx9oHOhV7ka/lNO
         y6Xp1dZTeVrRjGLb2ms2JbxT4XyiklO4WcG6VtyYAzRBk573688P5v7a8Uw8gAVY4ySM
         Dohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118337; x=1793723137;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=aB02qQJzsobV2wP9HkYy2IGWbUok3vyarhZdr9f13KPhQ47WmoS7xkfLGfx7+sXWyb
         rsUGAYGp9++AaGCUPOpFbjDzTavA4o2WZZeIRYytreToHLAZPpqYpA17Y1E622PG3PPQ
         eHKynFvS1noKTxHTT3qVFGOStm/+El36qsw3Mi4HDQETyBmj1FLPfePmTp1VUKkDmnz9
         3nTRJ8LiMTUfoisGSbhHo1QeqhnCKzo58SzvSmgvM6CiZjMf0nUkifLMcFw+jTBKycMp
         3Vl5a8e+DboTAwU4BUTAK14eR1DKyWdxC/oUFpyOZIdIaKleQtnNP9mMRPlyXjXu8rj3
         dkoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM6pIRgs5AiAWe/1V9nvmHz/c2DQtt9DFqC7ZLcVecmrWJBcSxqWviRRSoY/BMHneCoGc=@lists.linux.dev
X-Gm-Message-State: AFq9FYImpLCBAMNUqWAKrQHVVYgFo8Vx16jOAc1UAJdx0eiL7B7yV1vB
	UUtldy7hWOjHdxalbL1Hos/5v8oLrhGqyW8dlEq6dp616IYsyRVD99yO0YUD43izqWY=
X-Gm-Gg: AYBFou293P7RcKC6V09gW9gr70jmxzT9xNQzqSiIeoL1Wj2G1pehwPzhj7QJjsN2VyT
	tOEQOzDtgnihxdhR1tHqXQavs3GLjF0D0ng/eW4lI5j37Ywt1y4YMmbvN1dB+KTcsQXdx98wqGs
	3shVjZOSXYDyQn6x7kG9dswv0+i3WW7lznoybbXfIFoakph5LrSHfSqNymYp39roSgEEska5sax
	Tj9x79ilBO2/WwgmMa42JYAyX6J1Lczlb/67VK75napC6xAO71AVLwR27uzQbTdbfwehKosRlHf
	EahJXcJHrC1FQ4Y9u/lbgVwa0EKsvOzQS4FcfI6J2D1kqDgBaNWjTs0Z5l7MsMefnCAxr0OU8nu
	1j485wdxwEwYfEpnbidU680A7ZzQkiMsI3vb5UfY76BaVvjO40rTWi3jIz4z0CkIlnw7LeMl96m
	DwdCpFIQ9dunElUX0riXs6oKQjtgQHKN9CobOR2nY2qj/kO8Tg8wW45ys1w50CffpqeR8qXpVs1
	ZYjphhXOmDet02s2Wb4qFK+sE1XXyXXVcVMD7KZH1Uszeo+rNZIMp87Ke5v+46rDQyndRBARNGx
	hfogBtlqZMD+zKmhYUCePoVjDyUnPM/QqN+cnG9sHC0=
X-Received: by 2002:a05:600c:530d:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a7c100c816mr76768845e9.10.1793118337316;
        Tue, 27 Oct 2026 09:25:37 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a9301b6968sm115485e9.8.2026.10.27.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:36 -0700 (PDT)
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
Subject: [PATCH v2 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Tue, 27 Oct 2026 17:25:19 +0100
Message-ID: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yA71phFGI7EdUzfKSsZthD23p/0J3Coj+je0F1nEXik=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NBvSK8H2PN79QFIb53PEqUXlq2S6UgvHblFM 3fLU/YgcDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQbwAKCRCPgPtYfRL+ TqKMCACZfihv0KZEC6jP+ubBQtpsGPs1Cf6qHCbCICL6ZJamGVN4AZzK7Qqj5eO8KnTW/f/teJC EAbMuo1qT1O8t8TbvCo33u6K9dWYBKEUN79V+IHZdXShryweitzNTku3wCE0jgiaCsPJ9noCEMl NxPZnk1/u53JitDtDs6J8ZkB8T+TrfQLZmx5M9w0dotwxiOfGKpnCI0ioe29b9eBeMFCCter2mZ zf8SkXj+ciGyNpIdhuJ5/joaOy0s/aHTVZjORONlyaCi4qUUuCr2lwThaWP9JWVQV1fs/Vmob6O 0hK5Q9FfzhkkaALPaBPjmNqM7T8cl4w23c2s6yIi0cpzg5zd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since (implicit) v1 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793008847.git.u.kleine-koenig@baylibre.com):

 - Add Reviewed-by: tags for Peng Fan
 - Fix checkpatch warnings pointed out by Mathieu

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

