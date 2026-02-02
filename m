Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927635EDB3
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770037692; cv=none; b=QIpw2ZxcHBWWI9hLDNHONGzKZtRiKy+IcSbHZbDViQi7g9saXjq7kFPFHjIo0VSaM03dH4tU71s3Ymlp/cYD6YlDs5gq5xiFZOgCCRaNbC+t6Q0twVQq9tHI5+i5WQlRnldP69Yh7IltStI5kMDzl2jI8KY1sna76N2uwU0PmTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770037692; c=relaxed/simple;
	bh=zt9DR77wzlilHy+G4PnOiXCK9LPBeXZsCAt1vj+ySS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnXQ5a40HkU1eFd1wLQheqVowC2i+3u2MV5UqYtH6JQgVJXCfLJn04YiqFZOKfSJAT6EZE1fCahnP7hIYV27piXpnAxR8nHscir0GRRa5haXjmemnTrNR7RhWKBGZjQ+dEvcv7OZofPfo7of04YVc3svwfbI0X4+BwNbPcNP0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAukYfgY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAukYfgY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so47200975e9.1
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770037689; x=1770642489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=us8rkbaDqiFPo9bSgIdnDClrOWuVChIefeA+LRaKMx4=;
        b=TAukYfgYELnT6tCwzMJEWo0/f/k1TKdtDbssAB6fQa5R0zZNS6oZTvEqkw1O0rTIO+
         vrTDDK1wvXhF4wpQGj19tAPLiHttjBNFLTUNsU+BmIYjr02KJDU3qVgXVD6Wf4k0EHuH
         p7r4g84/Q3n9jFwQSpGWX8JCfx6iDylhdvPFr1XN/jRbpiXrB0MZ3XW16WUPWHRtKWD8
         lQTs1Jl41u1gOhruZjouvNHKC6LG3tOTWQtFFR6H6Z3le0ob4BHcRW49A2fjuJL1JcxV
         QK5Gl9VRAIYz0R8mNX61cVZwvKcSQCNQ/n13vmu4H38sGNkeRxGKAhdUxA7alTs/YgMk
         j40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037689; x=1770642489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us8rkbaDqiFPo9bSgIdnDClrOWuVChIefeA+LRaKMx4=;
        b=B/l65Sw45GJF9VEpi8mtGhT+0R7QYfC03Wpg1ps0PqiW1ufJeZvA5q2NG+vk1lXZOc
         sTH/J5EN+bfjdZK/J68hlSV7dI0dPUf5+yhFRh9RXSAGDEF8CuK89ipmV84SCi3dGYKl
         F+dIP6OeWh1t26xXujulUmt+4i+CBVO+buMy1ojz7Ne79H3z7R1HurlBgZtMdQ0RJ+13
         D5t3NkRt8Fl9z9E5FGLf+qaGXRGPykyp1hXpX2I48YA1BfHkbyThfhFm2lpWB9bw2J/8
         ahyVNUcbavVNFRkpaQjoYdHb2vcWXbUtkewbYnQ+EchUMa9rt9QPkOt36pKuZ1TczOJN
         kz8w==
X-Forwarded-Encrypted: i=1; AJvYcCXN2OCEXwzl2hF0r6RGDZK9A24FmspNwGhwnZkug+MJMRNyAGOdLU3Dd0AyIBM8Al3ucCY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQIQbA/QA9pc8xo4ryH8k6p3h/XPXgJ2JAMTBzBoAXYPHgZo2c
	690SYyVHHT2xor086FJTVudifWJ6+ar9U/oLjDjP3EYRQFqTTUIHLSp8YPSGPgbaA3A=
X-Gm-Gg: AZuq6aKa8hgxFIOhDx5F1eXd0msc813qMw0iAMhrWmEEYjkuXdEHZ7NORo4YczUD5hF
	kSoZdYMaaUPoz8qCexNJ+Bb97DmiI5sL0KduRqGY5oRdAlHLuKmxmYvlXje6NfZEtOn1Ai9Dg00
	yyFnJPTAg0AQ158/IGBnmwmUUuJl/lN2vUVwukxwzxfvZOvHWDW7GvOD1GK3fKSywawQfLmmBAj
	18NT6wAvoBsWQvMbO7wGrrhgnEBM0uyn/c4v/8l5H35dc90YcPvCl8BSA9rdm49+c+vjKrjxsQY
	e3YL1cuMUCNJyimghLWmqTsKb4ehApv1lYRyXf+rz5Lq4dN3V4eQhxD47jXjJ5zu9YFDpf4zuYM
	/p1vw6D0XjAQU7+o9smuvR2YRIkxHWVzC+hgm1ZEukeGWF+25Lox/z/UJdzWZORS6pkMy4dJPTb
	UWfl8wsvp8x5iqdUqhmZckroDBpPRVXQ==
X-Received: by 2002:a05:600c:310f:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-482db49243dmr160135245e9.30.1770037688901;
        Mon, 02 Feb 2026 05:08:08 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:fad5:23a2:cd9e:d80e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066aaf235sm438299775e9.0.2026.02.02.05.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:08:08 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] PCI: s32g: Fix ports parsing
Date: Mon,  2 Feb 2026 14:07:56 +0100
Message-ID: <20260202130756.1421488-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No error return is missing after the loop resulting in removing the
ports from the list.

Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 47745749f75c..767f5a622441 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
 			goto err_port;
 	}
 
+	return 0;
+
 err_port:
 	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
 		list_del(&port->list);
-- 
2.43.0

