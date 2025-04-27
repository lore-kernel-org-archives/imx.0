Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA773234989
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734581; cv=none; b=Ev9HSevFg88z8D1eB1yW/DHMOS91VVP5dXCs/ea7wx/ADfyAIwioH8BPV7NI1HOMNaDhwzCOuEeeVQTo7iBrbzHX+H6VGc5nmF8ClIag2+hO1oS0BSYf5nrFpdjIHrBGF6OoUCyjBErdjnzH9GT/RYDINAdX1Qau56N6DrD1nEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734581; c=relaxed/simple;
	bh=DtaW7OP2HYTPn66Jo2Rzozz1dqRdlYrtqq0+MD41MKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BLLIVNCptzXio1q4CCn2zqnH9p1CmM9m4RKXa7uUQzXlw+oT5mqg2SbZLsQWw9x4IAJeSfQ8epqmBiprgJKN+Lv1EeT6nU6u44mJq2bQtAP0UVobXnRsqa61m2X1bxjPTXnun9ZsmtSWGU0Bvj5txK1f+JKhG4VjrPJ7sToITeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jP8UuzDq; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jP8UuzDq"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so3454657a91.1
        for <imx@lists.linux.dev>; Sat, 26 Apr 2025 23:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734579; x=1746339379; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=;
        b=jP8UuzDqlAq4/7gDPV92JKkfsXpSbID9nDFTBLeh238rmCHbBsqTh4+qF0ah9mJS22
         gODSFwfo1EVEY1v4rnkX+MM90z+c6SCjc1nLeAwhlI9MDaWTq4f4x6KsqBj3XywFuep5
         m6z/7dTgTuguk2r+amoefSLxtAosEHVEFstk9Kp+5B11aNsXNf5YUWX9QdUGOS2UozFn
         p0TuN/kSZ4T1gM27TQBEtnQ1tITgmelDni97cJMDQsNLzbXLcPPDbtjwQIHbmx0K4r4I
         2Kku89hh2ssdWHi3lBoObo1dantvyalqWld8dYikgP5sYDsSse/cNvv0BDtMXShmKYQf
         169Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734579; x=1746339379;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVkOXl+FItqnBG4PWwNvXOPdmDOL8HuWkGunCwBr2+Y=;
        b=UByueBot+BeohZMqyTkVz/w+TWyTC3w21EOsQ6G5PQb7YQOWHe0JkPASBAC62vcvDH
         CHlCz7Jqhq+FbwqrdxXL6vBd51A61APBiJqJYyNGQRk52DO050qT6lEDdurCBbbRz+T7
         dK2+ygoS7oRQTXtFY4Bn5tquVxmeeGuUhEErrSxweX/yeh8dMd9TSfJNqOagq36ZB2Gl
         EBGRDevVDaPxZ4FgE29hqN62WqsSe/5dVXBtjAig6H7kLgzGIrjfvDdNgt/rBRoxeFGm
         Sx4TtrNMQjm9jWv+CDNNNnums4w2H2M6sRLZ3RmQ16DNrjKSJRSFf5xqkuwNf4RfBXGh
         pcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhxYNK1pZGWf1JYB1jk/piv+e0eQipA0G8mBsmaBcuomOGgxae1fmkjXnA6gR5qDjIUlU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya5Ss9ue4xQlTjoyTuAapAKBcP1a3dowXkCxXPPh4zmQi362qd
	6WCMBDdDkGX46D5goBtWq7flqwaAmi1GRvJdjfRg9F/j87u5v5vF
X-Gm-Gg: ASbGnctSWLv12Mwn4b/97xctUuEQToyA78T/34SU2qr98zZ1w12PG77kn2GGiaHGEkg
	t1Lj9iNLJZ+wQZXmzaBtbwNBgt8PYR2rMJrH9FleWBtnNrk41kvWE7LUECmQoHYW8Mr0wFzNP1Y
	gnNV6UmHLAStgUz5mxUuGNrgK9KJmAWIpjE7GGouQDzTjoAdHcv5heGx4XGH4O7tzuDP+JvEDrm
	3jZ17T7hv/Hv8x1KEv6qfDL8XHwgUspdMa8GCwxdT+HiYpV+298MA5WlXHX3nSQwskC3ngGo3/r
	toZyPVar4t+rvdvLHexHOyXRnX90eV2/H/I=
X-Google-Smtp-Source: AGHT+IGBhNvZrPFXBrP6EMdlDeC9iJtG6LNBbpfeI0Y349BALjf9LLYTf9Dnt8oACeh5pZIUz91ILQ==
X-Received: by 2002:a17:90b:3a0e:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-309f7ddd52dmr14596177a91.12.1745734578705;
        Sat, 26 Apr 2025 23:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:18 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v2 0/2] i2c: imx: adapting the mainline
Date: Sun, 27 Apr 2025 14:16:08 +0800
Message-Id: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjLDWgC/3XMywqDMBCF4VeRWXeKkzQqXfU9igvJjDpQLyRWL
 OK7N3Xf5X/gfDtECSoR7tkOQVaNOo0pzCUD3zdjJ6icGkxuXH4zhGo86rDhe+ZmEWQiLgrmqpQ
 K0mkO0up2gs86da9xmcLn9Ff6rX+plTBHIlu21Fpn2T26odHX1U8D1MdxfAGDSpRyrAAAAA==
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=1057;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=DtaW7OP2HYTPn66Jo2Rzozz1dqRdlYrtqq0+MD41MKA=;
 b=UQtKorS1lD5nKkZmkn2u6pSa0dlWJkQzqKzsVPpcbHAb8Slpn66/D3G0oDkLFVwsW3schQyFm
 P7g6OrbvRz9CPWLOHqVmAs8/0owueY6zScF+rcKWD8vSwBXI/eVJbrO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Since this patch[1], we have new callback function names.
Since this patch[2], we can use `guard` to call `spin_lock_irqsave`
and release this lock when it goes out of scope.

Link:
https://lore.kernel.org/all/20240706112116.24543-2-wsa+renesas@sang-engineering.com/ [1]
https://lore.kernel.org/all/20250227221924.265259-10-lyude@redhat.com/ [2]

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
Changes in v2:
- Add more details in the commit message
- Drop a useless variable
- Refactor the logic of i2c_imx_isr function
- Link to v1: https://lore.kernel.org/r/20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com

---
Troy Mitchell (2):
      i2c: imx: use guard to take spinlock
      i2c: imx: drop master prefix

 drivers/i2c/busses/i2c-imx.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-i2c-imx-update-d11d66dd87e8

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>

