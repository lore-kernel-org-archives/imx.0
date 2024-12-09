Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512441990AE
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733776853; cv=none; b=h47h3jwX0fzsnTpPbS64PauFiWf84OuHfQ4o/cEjzmXHTb74ljmdymIeZiwDq9u+KGcSXKfVeZo9V9hS5gNCYKn6MACWkVtgEx7MhHStDpKZxXNHo0HnK67KGC1vm74jJ6Xkv5veXjgtn3+d7PjrxL1yWauD71Lhr54RfPgKmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733776853; c=relaxed/simple;
	bh=z+rwLsBU8NtdupPaTVRW/Vrsq6bafaM9niLnhsxb0lo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LEZPGe1zzE2Iwq21kEJOAC/bdDc4g9KOQRhY+X7fEEyZ+QhH1PaquefDIHVSnF2Wu2uE0sojZ+W/Enh3BkSXLXKBECMmPKUKioLIQPfm2vju0b1o9xKVIgYIJmstLJJw4eJBx9xs5/1v7QypBoqbdxf/aqt88+fDyZibnC0APrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kq5sBRwE; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq5sBRwE"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fc93152edcso3825631a12.0
        for <imx@lists.linux.dev>; Mon, 09 Dec 2024 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733776851; x=1734381651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=;
        b=kq5sBRwE+a+VSlKUHsxdJYc30BgkY02VhteOidDxYBr4wUE52dQdbYsnqqdQ7VG87u
         IEELaCtFw7QLOqgaAMqHXMcKCqagP2Ursq1nLuENH8HofEmeu+RWoQKPPYhVH1RHvVL6
         3NArEvn+3hY6SphwI3YDnc97mD6oQ+N8g73ZrhDTOxDrnQdrwRm014oRap9n5Hwc4x0R
         0KLZqjuKvcjM1+AOGoxJWIP+LToAt7BOlJfJ09K/U1mibUaFvfhtpdOl0eanIaFuA3SN
         kteOIVBz41PY/tRRVZbNwgLTGH+GFmviGQrU6cxsZTDdU9e5rUbQvb6JnvwxeG8XbpPC
         YlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733776851; x=1734381651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXvsuXMERf6df08VQWVzjea3IcYfHYsxE45+1XCwwhA=;
        b=o9L0BoABvA1riVc7+X3uqV6SJ2B4FEA8PAwo9PwanyAQOAMvum5aCEjCHnKlr3LHqF
         msCN9Hf8JHTi3qN3/v2Pn/i40w7w65IaPpxZHPF/jhuH0Kk9Qz+9ZFAKPog1i13FpLRx
         SdoVMcr1/q1spNLRo9clQfTY7qpeRkRbIkziAK5SPN+AiWC6ET2og6BTgi/6MM6KLkVD
         nBO6Lys7lqnyp6yz5DfHneboOjHeMw7wh9zkMnhl95+nlxH/Dqe54U3Yss+NIcXq2Igh
         jICqy4obVFvIRgDIweW0JzpzoVaOzxD6h7+NE4Q0pqG/1TtoVcQCTS1aW4/s0my6+Gcp
         HumQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1N24un3LhmQpqldIQ+rK7SHGzK74hFgc4AcoaC+LYG+tQ6rpFTf2PTxOi4NLqcSgz55A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5OUt+BOIintjREIbfusb5mIopvoF/jf0X5XphvPQlDtzWqk/l
	jJlsVKTWLud3lELPGFTHVbASXw0liu7HifV6JoCh3wKMwMkixE7t
X-Gm-Gg: ASbGncs39GE6K0CWzPZU+Qq1LS7ebMoHadd8mTdEi7M3DvqWzoVRsUHNzkW7i4FTNXx
	u1E0wfj4j6rCqAuXHOtM41AZZ4EqN6XOVlTxpwjHSXc44UDPoW9eJv2gx54ko/z275uQMxjw1DA
	Cu6FnT+nGYW1s0mp91sdomyAgd6/eQaALAMD8o3Qes0RSHzVmszDmEzoFAy5bu3Dn/mq2e5qqOk
	JxTTd5weV0rIX/rtiVAC/ozHuXGp2b0PTY9sB6/SeU1/ZBNbTIwh5jrNIHgPP3j4i4=
X-Google-Smtp-Source: AGHT+IFc2Lceg6DjJ7cqQKBERaygfwtBeBltRK5cwNCLJrhI05ONbYSi9ksuO0DeTsh5Sp/KeBQ1Aw==
X-Received: by 2002:a05:6a20:729c:b0:1db:e327:dd82 with SMTP id adf61e73a8af0-1e1b43c4e93mr1397192637.5.1733776851595;
        Mon, 09 Dec 2024 12:40:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7c4:c4a9:e35:ccbf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd5207528csm1707219a12.36.2024.12.09.12.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 12:40:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
Date: Mon,  9 Dec 2024 17:40:02 -0300
Message-Id: <20241209204003.1295503-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The AUO G084SN05 V9 is a 8.4" 800x600 LVDS display.

Add a compatible entry for this LVDS display model.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 5af2d6930075..fcb5834f799a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -42,6 +42,8 @@ properties:
           # Admatec 9904379 10.1" 1024x600 LVDS panel
           - admatec,9904379
           - auo,b101ew05
+          # AUO G084SN05 V9 8.4" 800x600 LVDS panel
+          - auo,g084sn05
           # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
           - chunghwa,claa070wp03xg
           # EDT ETML0700Z9NDHA 7.0" WSVGA (1024x600) color TFT LCD LVDS panel
-- 
2.34.1

