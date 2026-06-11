Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7E32C94A
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149156; cv=none; b=PQi8yVQ/pxjc22LPNpJPjdr9Mp5jtX0rMfjzYmtvzcKBmkKhCH2NxN/vtw3e6LCPf8Z5e2wUVTp/GgXK1TcNm4Hp14iDsK5DPN7U3EgHDGsnhTAB7vyb7EuucX9HzgvM27VKxFE3mffz+vjgimjY49XtI4ATVz52mbjnEuJbTa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149156; c=relaxed/simple;
	bh=p6T47j0sgurR4ZBcE//kHSmTLcJbYcotQm4TC59HSdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J74eKWci0qy92luh8rOvpa0XZ2RMMYnXVSJtH+1iE1/pTYQdTc/Uxhx03yzAHSz0ZQ+/pfM+djcuPKnBtRhdNb4PYQixavcOrzcnjBfOUfHmbpp93WXEEKSg56hEHAGdYXjp32eosVsfTi49updkyOwLIz8c71HqIpNjTzdno1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDPgWEht; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDPgWEht"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423efd76c8so4844867b3a.0
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149155; x=1781753955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=qDPgWEhtSgXJlI+HE16inPBEwhLGuQQCTgZ981UbEEgvqPGDHU4soRCz33peBNMMsT
         7sqogCF84XLjjpxAPUv/c3eLfqq9QC80pkRukNzFx9iSsbVTHD862DQlLN+3j/44CaMy
         PWF3UhyCfU1Cqvjaq8VOdTnc9hO/G23t3ligx5pl0GhH7QsdpiaNnf36FcMyPJp7he47
         qmtU7GjZnod9uI4A4ljlMuHAXRibNURp0ijaJ/YbWF/nq7Y8alRowmvdMbDPUHfAW9G2
         8oMQs24WwPYhnt1l90CeAtgPsxdiSFdOnCJp+1G8fFMvbzOnA43/T+chIxYa5Tb0mJN+
         hN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149155; x=1781753955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyOCvdsh8YypBK5E0bOL+yIMik+oVX3UIIjhIbRiDp8=;
        b=Ey3rUs/V8EAfnsmEqwH8AwVSbpdp+j/113lrHAAmJWh8movialzGBXrwGPXVUzwC34
         SmCab1/qHiy3LgccLZwGd1R5zUfq/S5cq4VTNVqIiiuzeVJN4md1Qadfia/Ru+X46zEh
         0PM3AtU6v5l8k120z3QegzhsAHct06Pzzb9gtKp7sMGbbTi+dLodcf7BVW2nJiNBTgES
         senEe/4ZCX515+pKucKra6RZY10Zt3Mas96CAXb7HizshKulty8s0IkG+vdMoH5QEM7x
         NHwjRYZIArsedn4TGGvYj5F1g2J44MTotOyYQ3fcwl3ymmvAg27dXbmlSPtuBJAn2A7h
         gMAg==
X-Forwarded-Encrypted: i=1; AFNElJ/7zJiIaEI+Id/yWMGyMuKKVoxscEdicF6OU4sNLsUqRoyG0Phb7hrmUDfk0svMiRC79c4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOixdiIx3YWdnxfDemlbGY9kzCnmXwblYl7wckSTnAByvvyzbm
	7vkbwLW7R9d3vh/I+OOWI5uDN31PQWmmJbdepWbl3uvRfL42pfFLxlTL
X-Gm-Gg: Acq92OEsjkpn4LGsjIbZWWT7WOby65ch1wHmi7E9Fmu5z/+cxnx5/vxmJA7K0TJKOlF
	97hDFT3oqSfBLFFbAaAAEwaIw+/xoxoaHP6fyDYoKMA+PI0Bqvk1Fv0WE62Vm2B5YbWFnCdM/D0
	IAOPFnsGB1/eww0Ijp4XoiTJVQa0DFEnSSHWunAhgn5usMB3KD3Z3PGO/RqBe3hwqxwdSqyvqyp
	YVak0oGOrGMJncKGdBZs+u6OQnuQQw7xXvgN3RC0+moLOO1n9O8pY8eofmUHOmdx2ze3sDwElQa
	Um5bYB2ICQLgF0eQC7Re7qnv4IJSQQizOnSuNDDZBKNl8b1nr5oL10Xi5ZV5dye3B/6MkRYqpas
	MVzxt/6t3ORK5z6z1vnNi6/kSJQWtMGZTExe5LWSV6Y210WM6nwhUIBihPqZBJfLt6CcTfPpF7b
	StT0YUtacxUSjgQrztXwOrLqYsSu4OObxLLHrwm1eOp13IBH0ZRuZvA/4pKMMgHrglFkEYY4JYz
	OSp03xShFPWPviP7JGt2TBXtgy7N1jw8C85KCdc/HY6hlZ9uCISZhvg
X-Received: by 2002:a05:6a00:1905:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-84336bdb046mr915556b3a.39.1781149155261;
        Wed, 10 Jun 2026 20:39:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 1/6] serial: mxs-auart: fix cast type for of_device_get_match_data
Date: Wed, 10 Jun 2026 20:38:51 -0700
Message-ID: <20260611033856.6476-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_device_get_match_data returns const void*. Cast to unsigned long to
avoid implicit integer truncation warnings. All the data parameters are
correct anyway.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..de97c0f74e7d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
-- 
2.54.0

