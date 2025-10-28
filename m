Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6717C21E
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 03:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761621402; cv=none; b=nFP1JouMMlKYls9u3Y6yOk3R2QpV5k9zC4K9RDDWbxQybf/FtY6x6fAuo+BtC44tERQ4oMN+DhjW5FDv+CeFFRttRocVlaYI+UGkPsPX+rf4z3lAXlrVqbWbEEVNaeUY6aByHx18QSqe+6KbXqKFSyjk2fprZlHNecNh3B4iyro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761621402; c=relaxed/simple;
	bh=cHHkD30AaxNGfUjFD9KtWlH0G5zDyjXDYQiWrVKJSIE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WHHU8SOlncODCgB/AFUeii+amY5X+Uw6z3ir8Sm1pwDE2zOGXTO/srsD7SFGvR/thAKi12qBvLMosSLsxL2ILkX/cMb9ihcP2ZcOYYcFTkExbNsQIn74cRTWp6G/UXaGi4hxg/bfZLYLNJI9VwnUHBIWs+QzVXmQfZNdv7tE+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NglHi4t3; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NglHi4t3"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a26b04bfc8so6029516b3a.2
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 20:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761621399; x=1762226199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7Dr88n0rsMeY0SbLXIpFyJggBzx8goTlgYQ7zbZXXM=;
        b=NglHi4t3S4ZPvzAASVOD7OG8TgtQBCRO7LJ0wEgegWLMur4IChiqg2zoDLb2DwxuqI
         ggQpyk0e8Jt0PKlQcKIHr3ioCbHukThESqw1+7YPYf6bnoIpHUoLWIxjOZej5OrD3Bfi
         cayj4fGgAC0EgUKzxuMXCtfNbtuDVsWZHJEFVp9BWxNtXios7ffEjoWPpjLJSICSng4e
         v1ZJebtAnMudu8OwrQf5gHkiZ86F3jJNoj+pQSkJpHOVCzscVblCvGQSKkVahhsqxZGf
         BhEFieNn2QO+mWO4xkKeEyI79LywfNw2ENczCTxPA/C3R3Pxhtujsjv9bpSHTnbC3ETJ
         srow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761621399; x=1762226199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Dr88n0rsMeY0SbLXIpFyJggBzx8goTlgYQ7zbZXXM=;
        b=WkdWk4adXSiIBS3eoXBfEs0A2UikXWHK3T5MGjDxS6XPWvGRnXP+pQMZcPqFB3Oh0U
         amcodN61h45dGvbG6f8wgZCSt2MlvSwIWvwCyj8PR/DXV5mepHnMoLRVShTKmZTbg6ds
         hatunm/KKOaRNWpjJLoe+KHQ6U/5/s7XH5V+QPcrivq2xYAAtLPKy4aoHsMZ9PXBIX0d
         KOt5N5kHJM7st1ioZPfflT12OtNSpAlSpkeFvkLJC8qbZnhAyXa0mMbrcWrRzAsFKNkL
         VoVgwnhb5xYGaJdu259wtUIz4ckn/iqCmToz05QNaKASXiLHv2ulWlJUYSZ30eltYdxY
         xf7w==
X-Forwarded-Encrypted: i=1; AJvYcCV0UtEQ4fga05RDidBKMaoD3gkQtbpvw40UNb2MIOENX42vUEPfzVIF+v1mfVZkzlv7Fng=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwCUSCNRYUV01AekRZtiDo0TTBR9/WONLBNZjZ4xdT+acorN6M
	PAnZrhK5aFQ/kLx4LZ0Q1F3NmJhJ62wRAkmpZbVwkwF+4JIm57J/VQI3
X-Gm-Gg: ASbGncujlwTldZWVpv0GSaGKApI8zRTssHLBn1CS04U4f5USyoPEDo7UQwC+eEF9pUX
	J3S+iIhF3LzEJmkYl8QkrqAqsoRZHF5SMMWFtDDj4NnwtImMDyqoXlnLhivU9L2eZ/lMbmGgrMm
	W/J0oIai7v6zAt5rmzbqHhvovUcYPpRPTNmXpDM2AcAp+5mUNz4WMfkwIQPteNpPZsJ4RGQBPfc
	TxFbUg8CkR3PzAoj9XQBMMRJrSCvBNB5RCkRtrQrOVwGJXiFypOoMPFZ16lXAvEoLyvEHsrmCPD
	rh3fSeUYfuPOqyKm8HjlOF2ycIwYiOq2MfTMe94Vq3mivCyjS0/2nYtQGqAnpaOOm95IRsFbkGn
	Rc7QIXm+4cwCXGoBI+x98tslWHr64Psn78Cuk+QGLQTVLNhrr4324KjuLzoFCobwKOTlJzERRRj
	VumFMeZL/9NLOk927cUJhpRg==
X-Google-Smtp-Source: AGHT+IGeeElAGdz52QvzDON6TZ6X2VN+9KdN3tRsb9MvpzKrX+azsLuImQoCuSHnyIB4CWg/XHY7mQ==
X-Received: by 2002:a05:6a00:c8d:b0:7a2:6b48:5359 with SMTP id d2e1a72fcca58-7a441c46a7cmr2594121b3a.24.1761621399271;
        Mon, 27 Oct 2025 20:16:39 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41408c4dfsm9818276b3a.65.2025.10.27.20.16.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 20:16:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] soc: imx: gpc: fix reference count leak in imx_gpc_remove
Date: Tue, 28 Oct 2025 11:16:20 +0800
Message-Id: <20251028031623.43284-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pmdomain/imx/gpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 33991f3c6b55..a34b260274f7 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -536,6 +536,8 @@ static void imx_gpc_remove(struct platform_device *pdev)
 			return;
 		}
 	}
+
+	of_node_put(pgc_node);
 }
 
 static struct platform_driver imx_gpc_driver = {
-- 
2.39.5 (Apple Git-154)

