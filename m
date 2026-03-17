Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9DE30E84E
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755231; cv=none; b=k+kpvenuePIfxM7Bs2A9HSuXXtR4/41nLhG4/kp5JINTt4MqU1yAoJEauC3b+uwJaOleqv/DDwa2xLDkUqMdCzCDBpluF3S3MzuUgn/ONpLfgxhYVxPBpEhHAqkkUXtZ83Sa9gsJZxmxc9CQ8tVEu4+vjIS95rOnnLTMATw9oQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755231; c=relaxed/simple;
	bh=/x9bu8KevwXQZUlu2VPi3Pigx2Icge0JmO4mg9haX+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sO/w5JrfH2lIvVFhx9W5L90E6h8ZsyqJH2+cg0VCdh3fz5NMfx3u5xi2ry/M18BSS5KpdPIsFW4XENVpg1Fyu+Z+3/VrhxJFSwEJDKrRu0oFknlNahFU5+kRLZPsIaNYSd9/eJCA4Kt7OjD/1u7ptarUyHQENtaD9M444Ze2i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAwMv8Ax; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAwMv8Ax"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824c9da9928so3676678b3a.3
        for <imx@lists.linux.dev>; Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773755229; x=1774360029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=jAwMv8AxsdFcewFx0MvBuihTb+GasnMTVryoBQooLZU393LG+BvWDFoyFITPeEpHDV
         0hzoBbb0yIxcpA9pKf8ZJAUcAl5EuvaQn8t8+PwA90pwdazgdZaliV+q7p/cBZ+ux7sN
         OUfSPmCNKoRxNVOfWJi2LRIPoho5CN4DW406vuQbf37W/Zlp12o5HGzhMkIOTPlEbcP0
         vtCMOg7ur2O6jNtPFP7jQmIAzTPUpu6jCYid2baH5CFC4GJZLOiti1rUW+7TiEQE5E3Y
         HuH22BuQLPGtmWs91fkSuXUk+RLQznv6dMRnTSBKkn7f4F72qFJfhN/cs9VQXHWqTcDJ
         uZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755229; x=1774360029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=AYhYmfO0YYjlJDbGWrXsh+8uYdwBRnQDUBf0itRYyoV2wg77PCY6lXReQdvaAX7g+i
         MzvzT5QhBOjS1yvbC58XEILP5Kld6oY529zenpYGzTOKxEH3Liegvq/VlZKldpdzSde1
         ftdf1MNWHlpIuHuiKHKkDKZzcd/FPdwsBcT3Gt4akcDG6NMtS9Zifg3xCB0lb5YLL2Ae
         r/J7CieC6cdBd8o5sBb3pA/X5FRo2rCZ/Dis2kweDxhp+QHyTZaOa07ML9jaJm/B/QGQ
         xY8VdFaHI12xBIQ4Q8bs6LRNYB1tpX8/keX82NZz65tXs34Tr//PIhpCTiW27wpsD90o
         TDSA==
X-Forwarded-Encrypted: i=1; AJvYcCVQAOlTlO7xTeW0ExT3GEWCdsuHmtqdg2vEro4NpjQf/pLz1vVUjfalh4KQfxXa3Al0ihM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFGtYYHIBiCpV7j3xJ00ztRlWfKtqweu/yCPhlvqiGWbZcSk5x
	o+JHDIfWIG+4kPfzVWhzBJ3rRMmGoOupRGOZk6TKnuNfNl9dPB8jYd4g
X-Gm-Gg: ATEYQzzLbQqvJjdBrayJZLDzk/iSiMWimaFqQKjmghWRi8cDVZ4VrwT/fS0611kcXZh
	AkqOoBBU2cfHUrx3EOhypWeTGyEhA6qd285OZQz3fwBU6Yj0R68zVB+ZMcXkTMLzWGmFLe20o1S
	Ehi+v1TUUF9RxD/SpXGHauF+tgCFQrO4UQQV3J7tquXkJFlCeT4zzAh9MRMJCoxwxfeqwe46mWi
	pLtHRNoCoaLqw7u1XBDe3belwnOqRM0Kkr8mVFt5UBvAliKgZns2q/8QeJjsUWPJ0NL2w4o5wOp
	k6XsJNOdB9qG0edNlcSvRR5FjMi+Nc9WErEzNmfpfUJllIn7JN6g4vQ45BBt17iYcvFQei8UbGO
	hjQLBZ0Y8p//Oo4BDbBPEaxO+K92FEm0tsIp3QTfg7EToX8NUeGXSIMiLrE/h2MZTGlV9kMSq+v
	Pnyl0zTFdSUjw6ehzVAV7MexL0NNBHDZRSYe6CLA==
X-Received: by 2002:a05:6a21:50a:b0:398:9f1d:8a03 with SMTP id adf61e73a8af0-398ecd9d561mr16769427637.61.1773755229144;
        Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
Received: from padmashree.. ([2401:4900:91ee:4baa:27e8:65bd:dbc5:b65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eba9e183sm11898643a12.14.2026.03.17.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:47:08 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de
Cc: padmashreess2006@gmail.com,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: media: imx: fixed a brace coding style issue
Date: Tue, 17 Mar 2026 19:14:47 +0530
Message-ID: <20260317134448.389123-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

