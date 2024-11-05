Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE20188734
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730799089; cv=none; b=ZR981y2LxvEp19mPkrswL/m3wSzWWoBlikYDgQ08fmubRcJmpTj2Y1y76ChnAgJK7pQYoI9fpGvnNthskDAyC5td6P4tNRrgUWs+Jc/KiKYyB+UjpK/PHQ405ZLAGxlZEJk8JNTbDJE4V0aycfBfpgCTAHTAyu0snQVLJSDINjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730799089; c=relaxed/simple;
	bh=E8Wrg5ayvZa1X7I9VwxQLW/VIUYRWfbletUtBdxrlJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QaIWKeSFDFUkESsbEdMi1mUxfKQhdDH9zATP+1Lwyl+IRxA9MNjA6WX2Q6puLLoQs2KKj6w+mnoaQ3MAsG+77o304GMSyG0AQ0avayLPETJiiXrK9+g++mr8zejdbYeG/6oxPVf0p7teYc7KAgcqvTyf1VSXzdyHjRrRVR1pd10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF2GNjOW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF2GNjOW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso4411276f8f.1
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 01:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730799086; x=1731403886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFdwTboQaaHQXvZmov57W+9Fn/ofMcP+vE6kpCz8Qe8=;
        b=ZF2GNjOWNlw0iiYaYn3FKzlhewPxGU4SPiwRnSyI77GH/2gdgwno79bT07FuRcuUGs
         CW+3uNmA1pwjfHoQi5LBIMoO4KZUALb7pioXOiBxrPF3CfAXR6PnXj/q6kmuJAWKmjsm
         o89dw604QE+LRzFTv3fTB6XF62EUDp/6LHdSfvA4O2eTfxMqoHCvOeFQFrjWlFtVwSVc
         S5fkUzEgGu9+sXUUAxMBH0N5LAPZlLYCGhprxwKMRosyrbHZT5NGQO0tgA87GCuamfBQ
         r0CUcPulzgv3IsLZom3jQ5BPbo7fvh98d3+J9Z7QlHIIkQOu09GKeEBMWmXjvr8vYyXU
         kgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730799086; x=1731403886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFdwTboQaaHQXvZmov57W+9Fn/ofMcP+vE6kpCz8Qe8=;
        b=TeYEZo1t2nl1GZM+2uZCIUKsBPT55cRAaNLtRpdNeit6CNcNyEAmTn6M8PRSSBTUrq
         xvQwh0L4MGdBWDngMKqtopauKK7lZggDnBA/vfc6qeCq6Fp7DuOSTM5h9N8JdpJc/e30
         IOjNhBaKUM5hY0L9mQYNBIRm4wpSv5jinQs0A27Gwg57Qo02kruC7j1bqe+ta6F7ifHb
         mHUhCkNuKCJAbkAQchOjAijrHC9BjWF2qKi6Z9iB90re+uWNUfCkSRbqiJvqEMMePUOp
         7IKA9kGmEcyD8VcjZlnMxGHVJPjgjFmhmnMEai0fSRbOyykbAkDiPxwFewCsDI4vXkUH
         5uCg==
X-Forwarded-Encrypted: i=1; AJvYcCUECgFYkXWikcd2hvaMGu/AbLRnkrFs98PW80cKkUvNScYUkgDFXJv4AoR+UcnGGsINtzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaM+NM0fKT7YcM4E6yOL5TtF3nkXUvxzD9ChKmobQ8v5WO8Lrl
	1ER41A7EUw2syi0b8LvXQ2cit/sdt/Rye3Cf80oSmFxRhxFZy+lW
X-Google-Smtp-Source: AGHT+IH6je/LDrue/yuovRF9FeVPclDA2R/0NSV0hMzJV0D9BP4i35BRYIEX4yarF0FD4RamSioAGw==
X-Received: by 2002:a5d:6c69:0:b0:37d:7e71:67a0 with SMTP id ffacd0b85a97d-381c7a46788mr17773422f8f.9.1730799085944;
        Tue, 05 Nov 2024 01:31:25 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d42adsm15458080f8f.40.2024.11.05.01.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:31:25 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: enetc: Fix spelling mistake "referencce" -> "reference"
Date: Tue,  5 Nov 2024 09:31:25 +0000
Message-Id: <20241105093125.1087202-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/freescale/enetc/enetc4_pf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 31dbe89dd3a9..fc41078c4f5d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -632,7 +632,7 @@ static int enetc4_pf_netdev_create(struct enetc_si *si)
 	priv = netdev_priv(ndev);
 	priv->ref_clk = devm_clk_get_optional(dev, "ref");
 	if (IS_ERR(priv->ref_clk)) {
-		dev_err(dev, "Get referencce clock failed\n");
+		dev_err(dev, "Get reference clock failed\n");
 		err = PTR_ERR(priv->ref_clk);
 		goto err_clk_get;
 	}
-- 
2.39.5

